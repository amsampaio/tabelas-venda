-- ============================================================
-- TABELAS VENDA — Schema Supabase
-- Executar no SQL Editor do projeto Supabase
-- ============================================================

-- 1. PERFIS DE UTILIZADOR
-- Cria automaticamente um perfil quando um user faz registo
CREATE TABLE IF NOT EXISTS public.profiles (
  id          UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  name        TEXT NOT NULL DEFAULT '',
  role        TEXT NOT NULL DEFAULT 'comercial'
                CHECK (role IN ('super_admin', 'full_access', 'comercial')),
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Trigger: cria perfil automaticamente no registo
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, name, role)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'name', NEW.email), 'comercial');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


-- 2. ARTIGOS
CREATE TABLE IF NOT EXISTS public.products (
  id                   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  brand                TEXT NOT NULL DEFAULT '',
  code                 TEXT NOT NULL,
  description          TEXT NOT NULL DEFAULT '',
  cost_price           DECIMAL(10,4) NOT NULL DEFAULT 0,

  -- Configuração preço de venda a cliente final
  -- 'margin'  → preço_venda = custo × (1 + valor/100)
  -- 'price'   → preço_venda = valor (direto)
  sale_config_type     TEXT NOT NULL DEFAULT 'margin'
                         CHECK (sale_config_type IN ('margin', 'price')),
  sale_config_value    DECIMAL(10,4) NOT NULL DEFAULT 0,

  -- Configuração preço de revenda
  -- 'percent_discount' → revenda = preço_venda × (1 − valor/100)
  -- 'value_discount'   → revenda = preço_venda − valor
  resale_config_type   TEXT NOT NULL DEFAULT 'percent_discount'
                         CHECK (resale_config_type IN ('percent_discount', 'value_discount')),
  resale_config_value  DECIMAL(10,4) NOT NULL DEFAULT 0,

  -- Configuração preço de revenda volume (mesma lógica, desconto diferente)
  volume_resale_config_type  TEXT NOT NULL DEFAULT 'percent_discount'
                               CHECK (volume_resale_config_type IN ('percent_discount', 'value_discount')),
  volume_resale_config_value DECIMAL(10,4) NOT NULL DEFAULT 0,

  active               BOOLEAN NOT NULL DEFAULT TRUE,
  created_at           TIMESTAMPTZ DEFAULT NOW(),
  updated_at           TIMESTAMPTZ DEFAULT NOW(),

  UNIQUE (code)
);

-- Trigger: atualiza updated_at automaticamente
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS products_updated_at ON public.products;
CREATE TRIGGER products_updated_at
  BEFORE UPDATE ON public.products
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


-- 3. VISTA COM PREÇOS CALCULADOS
-- Facilita queries na app sem lógica de cálculo no cliente
CREATE OR REPLACE VIEW public.products_with_prices AS
SELECT
  id,
  brand,
  code,
  description,
  active,

  -- Preço de custo (só visível para full_access / super_admin via RLS)
  cost_price,
  sale_config_type,
  sale_config_value,
  resale_config_type,
  resale_config_value,

  -- Preço de venda calculado
  -- Fórmula: margem sobre PV → custo ÷ (1 − margem%)
  CASE
    WHEN sale_config_type = 'margin'
      THEN ROUND(cost_price / NULLIF(1 - sale_config_value / 100, 0), 2)
    ELSE ROUND(sale_config_value, 2)
  END AS sale_price,

  -- Preço de revenda calculado
  CASE
    WHEN resale_config_type = 'percent_discount'
      THEN ROUND(
        CASE WHEN sale_config_type = 'margin'
          THEN cost_price / NULLIF(1 - sale_config_value / 100, 0)
          ELSE sale_config_value
        END * (1 - resale_config_value / 100),
      2)
    ELSE ROUND(
      CASE WHEN sale_config_type = 'margin'
        THEN cost_price / NULLIF(1 - sale_config_value / 100, 0)
        ELSE sale_config_value
      END - resale_config_value,
    2)
  END AS resale_price,

  -- Preço de revenda volume
  CASE
    WHEN volume_resale_config_type = 'percent_discount'
      THEN ROUND(
        CASE WHEN sale_config_type = 'margin'
          THEN cost_price / NULLIF(1 - sale_config_value / 100, 0)
          ELSE sale_config_value
        END * (1 - volume_resale_config_value / 100),
      2)
    ELSE ROUND(
      CASE WHEN sale_config_type = 'margin'
        THEN cost_price / NULLIF(1 - sale_config_value / 100, 0)
        ELSE sale_config_value
      END - volume_resale_config_value,
    2)
  END AS volume_resale_price_calc,

  created_at,
  updated_at
FROM public.products;


-- 4. ROW LEVEL SECURITY (RLS)

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;

-- Função auxiliar: obter role do user autenticado
CREATE OR REPLACE FUNCTION public.get_user_role()
RETURNS TEXT AS $$
  SELECT role FROM public.profiles WHERE id = auth.uid();
$$ LANGUAGE SQL SECURITY DEFINER STABLE;


-- PROFILES: cada user vê e edita só o seu perfil
--           super_admin vê e edita todos
DROP POLICY IF EXISTS "profiles_select"      ON public.profiles;
DROP POLICY IF EXISTS "profiles_update_own"  ON public.profiles;
DROP POLICY IF EXISTS "profiles_admin_all"   ON public.profiles;

CREATE POLICY "profiles_select" ON public.profiles
  FOR SELECT USING (
    id = auth.uid() OR public.get_user_role() = 'super_admin'
  );

CREATE POLICY "profiles_update_own" ON public.profiles
  FOR UPDATE USING (id = auth.uid())
  WITH CHECK (
    (id = auth.uid() AND public.get_user_role() != 'super_admin'
      AND (SELECT role FROM public.profiles WHERE id = auth.uid()) = role)
    OR public.get_user_role() = 'super_admin'
  );

CREATE POLICY "profiles_admin_all" ON public.profiles
  FOR ALL USING (public.get_user_role() = 'super_admin');


-- PRODUCTS: todos os users autenticados podem ler
--           só super_admin pode escrever
DROP POLICY IF EXISTS "products_select_authenticated" ON public.products;
DROP POLICY IF EXISTS "products_insert_admin"         ON public.products;
DROP POLICY IF EXISTS "products_update_admin"         ON public.products;
DROP POLICY IF EXISTS "products_delete_admin"         ON public.products;

CREATE POLICY "products_select_authenticated" ON public.products
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "products_insert_admin" ON public.products
  FOR INSERT WITH CHECK (public.get_user_role() = 'super_admin');

CREATE POLICY "products_update_admin" ON public.products
  FOR UPDATE USING (public.get_user_role() = 'super_admin');

CREATE POLICY "products_delete_admin" ON public.products
  FOR DELETE USING (public.get_user_role() = 'super_admin');


-- 5. DADOS DE EXEMPLO (remover em produção)
INSERT INTO public.products
  (brand, code, description, cost_price, sale_config_type, sale_config_value,
   resale_config_type, resale_config_value,
   volume_resale_config_type, volume_resale_config_value)
VALUES
  ('MarcaX', 'ART-001', 'Produto Exemplo A', 10.00, 'margin', 30, 'percent_discount', 15, 'percent_discount', 25),
  ('MarcaX', 'ART-002', 'Produto Exemplo B', 25.00, 'margin', 25, 'percent_discount', 20, 'percent_discount', 30),
  ('MarcaY', 'ART-003', 'Produto Exemplo C', 50.00, 'price',  75.00, 'value_discount', 10, 'value_discount', 15),
  ('MarcaY', 'ART-004', 'Produto Exemplo D', 8.00,  'margin', 40, 'percent_discount', 10, 'percent_discount', 15)
ON CONFLICT (code) DO NOTHING;
