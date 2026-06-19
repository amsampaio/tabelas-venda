-- ============================================================
-- PRIMULA — Schema de produtos configuráveis
-- Famílias → Variantes/Modelos → Grupos de Opções → Opções
-- NOTA: As opções SÓ aparecem associadas a uma máquina (nunca sozinhas)
-- Executar DEPOIS de supabase_schema.sql
-- ============================================================


-- 1. FAMÍLIAS DE PRODUTO
--    Cada linha da lista principal (ex: "Perfect FL", "Flex DOB")
-- ============================================================
CREATE TABLE IF NOT EXISTS public.product_families (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  brand        TEXT NOT NULL DEFAULT 'PRIMULA',
  name         TEXT NOT NULL,
  description  TEXT,
  series       TEXT,                   -- ex: 'Mesas de Engomar DOB', 'Geradores de Vapor'
  sort_order   INTEGER DEFAULT 0,
  active       BOOLEAN NOT NULL DEFAULT TRUE,
  created_at   TIMESTAMPTZ DEFAULT NOW(),
  updated_at   TIMESTAMPTZ DEFAULT NOW()
);

DROP TRIGGER IF EXISTS product_families_updated_at ON public.product_families;
CREATE TRIGGER product_families_updated_at
  BEFORE UPDATE ON public.product_families
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


-- 2. VARIANTES / MODELOS
--    Ao clicar na família, o user escolhe o modelo (voltagem, tamanho, S/S+B)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.product_variants (
  id                         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  family_id                  UUID NOT NULL REFERENCES public.product_families(id) ON DELETE CASCADE,
  model                      TEXT NOT NULL,      -- ex: 'PU 6513 S+B'
  code                       TEXT NOT NULL,      -- ex: '102-04-000'
  description                TEXT,
  volt                       INTEGER,            -- 230 ou 400
  suction                    BOOLEAN DEFAULT TRUE,
  blowing                    BOOLEAN DEFAULT FALSE,
  heating_kw                 DECIMAL(6,3),
  cost_price                 DECIMAL(10,4) NOT NULL DEFAULT 0,
  sale_config_type           TEXT NOT NULL DEFAULT 'margin'
                               CHECK (sale_config_type IN ('margin','price')),
  sale_config_value          DECIMAL(10,4) NOT NULL DEFAULT 35.5,
  resale_config_type         TEXT NOT NULL DEFAULT 'percent_discount'
                               CHECK (resale_config_type IN ('percent_discount','value_discount')),
  resale_config_value        DECIMAL(10,4) NOT NULL DEFAULT 15,
  volume_resale_config_type  TEXT NOT NULL DEFAULT 'percent_discount'
                               CHECK (volume_resale_config_type IN ('percent_discount','value_discount')),
  volume_resale_config_value DECIMAL(10,4) NOT NULL DEFAULT 15,
  active                     BOOLEAN NOT NULL DEFAULT TRUE,
  created_at                 TIMESTAMPTZ DEFAULT NOW(),
  updated_at                 TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (code)
);

DROP TRIGGER IF EXISTS product_variants_updated_at ON public.product_variants;
CREATE TRIGGER product_variants_updated_at
  BEFORE UPDATE ON public.product_variants
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


-- 3. GRUPOS DE OPÇÕES
--    Cada família tem grupos: "Acessórios Extra", "Embalagem", "Consumíveis"
--    single_select = escolha exclusiva (ex: embalagem)
--    multi_select  = seleção múltipla (ex: acessórios)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.option_groups (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  family_id  UUID NOT NULL REFERENCES public.product_families(id) ON DELETE CASCADE,
  name       TEXT NOT NULL,
  type       TEXT NOT NULL DEFAULT 'multi_select'
               CHECK (type IN ('single_select','multi_select','info')),
  required   BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0,
  active     BOOLEAN NOT NULL DEFAULT TRUE
);


-- 4. OPÇÕES INDIVIDUAIS
--    Itens seleccionáveis dentro de cada grupo
--    NUNCA aparecem sozinhos — sempre associados a uma família/variante
-- ============================================================
CREATE TABLE IF NOT EXISTS public.options (
  id                         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  group_id                   UUID NOT NULL REFERENCES public.option_groups(id) ON DELETE CASCADE,
  model                      TEXT,
  code                       TEXT,
  description                TEXT NOT NULL,
  cost_price                 DECIMAL(10,4) NOT NULL DEFAULT 0,
  sale_config_type           TEXT NOT NULL DEFAULT 'margin'
                               CHECK (sale_config_type IN ('margin','price')),
  sale_config_value          DECIMAL(10,4) NOT NULL DEFAULT 35.5,
  resale_config_type         TEXT NOT NULL DEFAULT 'percent_discount'
                               CHECK (resale_config_type IN ('percent_discount','value_discount')),
  resale_config_value        DECIMAL(10,4) NOT NULL DEFAULT 15,
  volume_resale_config_type  TEXT NOT NULL DEFAULT 'percent_discount'
                               CHECK (volume_resale_config_type IN ('percent_discount','value_discount')),
  volume_resale_config_value DECIMAL(10,4) NOT NULL DEFAULT 15,
  notes                      TEXT,           -- ex: 'Só com sistema Vario'
  sort_order                 INTEGER DEFAULT 0,
  active                     BOOLEAN NOT NULL DEFAULT TRUE,
  created_at                 TIMESTAMPTZ DEFAULT NOW()
);


-- ============================================================
-- 5. VISTAS COM PREÇOS CALCULADOS
-- ============================================================

-- Vista de variantes com preços calculados (mesma lógica que products_with_prices)
CREATE OR REPLACE VIEW public.variants_with_prices AS
SELECT
  v.id,
  v.family_id,
  v.model,
  v.code,
  v.description,
  v.volt,
  v.suction,
  v.blowing,
  v.heating_kw,
  v.active,
  f.brand,
  f.name         AS family_name,
  f.series,
  f.sort_order   AS family_sort_order,
  v.cost_price,
  v.sale_config_type,
  v.sale_config_value,
  v.resale_config_type,
  v.resale_config_value,
  v.volume_resale_config_type,
  v.volume_resale_config_value,
  -- Preço de venda (margem sobre PV: custo ÷ (1 − margem%))
  CASE
    WHEN v.sale_config_type = 'margin'
      THEN ROUND(v.cost_price / NULLIF(1 - v.sale_config_value / 100, 0), 2)
    ELSE ROUND(v.sale_config_value, 2)
  END AS sale_price,
  -- Preço de revenda
  CASE
    WHEN v.resale_config_type = 'percent_discount'
      THEN ROUND(
        CASE WHEN v.sale_config_type = 'margin'
          THEN v.cost_price / NULLIF(1 - v.sale_config_value / 100, 0)
          ELSE v.sale_config_value END
        * (1 - v.resale_config_value / 100), 2)
    ELSE ROUND(
        CASE WHEN v.sale_config_type = 'margin'
          THEN v.cost_price / NULLIF(1 - v.sale_config_value / 100, 0)
          ELSE v.sale_config_value END
        - v.resale_config_value, 2)
  END AS resale_price,
  -- Preço de revenda volume
  CASE
    WHEN v.volume_resale_config_type = 'percent_discount'
      THEN ROUND(
        CASE WHEN v.sale_config_type = 'margin'
          THEN v.cost_price / NULLIF(1 - v.sale_config_value / 100, 0)
          ELSE v.sale_config_value END
        * (1 - v.volume_resale_config_value / 100), 2)
    ELSE ROUND(
        CASE WHEN v.sale_config_type = 'margin'
          THEN v.cost_price / NULLIF(1 - v.sale_config_value / 100, 0)
          ELSE v.sale_config_value END
        - v.volume_resale_config_value, 2)
  END AS volume_resale_price,
  v.created_at,
  v.updated_at
FROM public.product_variants v
JOIN public.product_families f ON f.id = v.family_id;


-- Vista de opções com preços calculados
CREATE OR REPLACE VIEW public.options_with_prices AS
SELECT
  o.id,
  o.group_id,
  o.model,
  o.code,
  o.description,
  o.notes,
  o.sort_order,
  o.active,
  o.cost_price,
  o.sale_config_type,
  o.sale_config_value,
  o.resale_config_type,
  o.resale_config_value,
  og.name       AS group_name,
  og.type       AS group_type,
  og.required   AS group_required,
  og.sort_order AS group_sort_order,
  og.family_id,
  -- Preço de venda
  CASE
    WHEN o.sale_config_type = 'margin'
      THEN ROUND(o.cost_price / NULLIF(1 - o.sale_config_value / 100, 0), 2)
    ELSE ROUND(o.sale_config_value, 2)
  END AS sale_price,
  -- Preço de revenda
  CASE
    WHEN o.resale_config_type = 'percent_discount'
      THEN ROUND(
        CASE WHEN o.sale_config_type = 'margin'
          THEN o.cost_price / NULLIF(1 - o.sale_config_value / 100, 0)
          ELSE o.sale_config_value END
        * (1 - o.resale_config_value / 100), 2)
    ELSE ROUND(
        CASE WHEN o.sale_config_type = 'margin'
          THEN o.cost_price / NULLIF(1 - o.sale_config_value / 100, 0)
          ELSE o.sale_config_value END
        - o.resale_config_value, 2)
  END AS resale_price,
  -- Preço de revenda volume
  CASE
    WHEN o.volume_resale_config_type = 'percent_discount'
      THEN ROUND(
        CASE WHEN o.sale_config_type = 'margin'
          THEN o.cost_price / NULLIF(1 - o.sale_config_value / 100, 0)
          ELSE o.sale_config_value END
        * (1 - o.volume_resale_config_value / 100), 2)
    ELSE ROUND(
        CASE WHEN o.sale_config_type = 'margin'
          THEN o.cost_price / NULLIF(1 - o.sale_config_value / 100, 0)
          ELSE o.sale_config_value END
        - o.volume_resale_config_value, 2)
  END AS volume_resale_price,
  o.created_at
FROM public.options o
JOIN public.option_groups og ON og.id = o.group_id;


-- ============================================================
-- 6. ROW LEVEL SECURITY
-- ============================================================

ALTER TABLE public.product_families  ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.product_variants  ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.option_groups     ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.options           ENABLE ROW LEVEL SECURITY;

-- Leitura: qualquer utilizador autenticado
DROP POLICY IF EXISTS "families_select"       ON public.product_families;
DROP POLICY IF EXISTS "variants_select"       ON public.product_variants;
DROP POLICY IF EXISTS "option_groups_select"  ON public.option_groups;
DROP POLICY IF EXISTS "options_select"        ON public.options;

CREATE POLICY "families_select"
  ON public.product_families FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "variants_select"
  ON public.product_variants FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "option_groups_select"
  ON public.option_groups    FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "options_select"
  ON public.options          FOR SELECT USING (auth.role() = 'authenticated');

-- Escrita: apenas super_admin
DROP POLICY IF EXISTS "families_admin"       ON public.product_families;
DROP POLICY IF EXISTS "variants_admin"       ON public.product_variants;
DROP POLICY IF EXISTS "option_groups_admin"  ON public.option_groups;
DROP POLICY IF EXISTS "options_admin"        ON public.options;

CREATE POLICY "families_admin"
  ON public.product_families FOR ALL USING (public.get_user_role() = 'super_admin');
CREATE POLICY "variants_admin"
  ON public.product_variants FOR ALL USING (public.get_user_role() = 'super_admin');
CREATE POLICY "option_groups_admin"
  ON public.option_groups    FOR ALL USING (public.get_user_role() = 'super_admin');
CREATE POLICY "options_admin"
  ON public.options          FOR ALL USING (public.get_user_role() = 'super_admin');
