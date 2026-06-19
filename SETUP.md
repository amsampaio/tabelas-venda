# Tabelas de Venda — Guia de Configuração

## Ficheiros

| Ficheiro | Descrição |
|---|---|
| `index.html` | App principal (Android + iOS) |
| `supabase_schema.sql` | Schema da base de dados |

---

## Passos de configuração

| # | O quê | Como |
|---|---|---|
| 1 | Criar projeto Supabase | [supabase.com](https://supabase.com) → **New Project** → nome `tabelas-venda`, região **West EU (Ireland)** |
| 2 | Criar tabelas | **SQL Editor** → **New query** → colar `supabase_schema.sql` → **Run ▶** |
| 3 | Obter Project URL | **Integrations → Data API** → secção Overview |
| 4 | Obter anon key | **Settings → API Keys** → copiar chave `anon / public` |
| 5 | Configurar app | No `index.html`, preencher `SUPABASE_URL` e `SUPABASE_KEY` no topo do `<script>` *(já feito)* |
| 6 | Publicar | GitHub → novo repo privado → upload `index.html` → **Settings → Pages** → branch `main` |
| 7 | Criar Super Admin | Supabase → **Authentication → Users → Invite user** → após login, correr no SQL Editor: `UPDATE public.profiles SET role='super_admin', name='Administrador' WHERE id=(SELECT id FROM auth.users WHERE email='SEU_EMAIL');` → logout/login |
| 8 | Criar comerciais | **Authentication → Users → Invite user** → na app ⚙ → **Utilizadores** → atribuir função |

---

## Adicionar ao ecrã inicial (como app)

| Plataforma | Como |
|---|---|
| Android (Chrome) | Menu ⋮ → **Adicionar ao ecrã inicial** |
| iOS (Safari) | Botão partilha □↑ → **Adicionar ao ecrã de início** |

---

## Lógica de preços

| Tipo | Fórmula |
|---|---|
| Venda — margem | Custo × (1 + margem%) |
| Venda — preço direto | Valor fixo definido |
| Revenda — desconto % | Venda × (1 − desconto%) |
| Revenda — desconto € | Venda − valor |
| Revenda volume | Preço fixo (opcional, substitui o calculado) |

---

## Visibilidade por perfil

| Perfil | Custo | Preço Venda | Revenda | Rev. Volume | PVP Acons. |
|---|:---:|:---:|:---:|:---:|:---:|
| Super Admin | ✓ | ✓ | ✓ | ✓ | ✓ |
| Acesso Total | ✓ | ✓ | ✓ | ✓ | ✓ |
| Comercial | — | ✓ | ✓ | ✓ | ✓ |

*PVP Aconselhado = preço de venda mostrado apenas no modo Revenda*
