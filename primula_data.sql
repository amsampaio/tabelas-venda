-- ============================================================
-- PRIMULA — Dados do catálogo 2022 (páginas 1-62)
-- Margem de venda: 35,5% | Revenda: 15% desconto | Volume: 15% desconto
-- NOTA: Verificar preços de custo com o PDF original
-- Executar DEPOIS de primula_schema.sql
-- ============================================================

DO $$
DECLARE
  fam UUID;
  g1  UUID;   -- Acessórios Extra
  g2  UUID;   -- Embalagem
  g3  UUID;   -- Consumíveis
  g4  UUID;   -- uso pontual
BEGIN

-- ============================================================
-- MESAS DE ENGOMAR DOB (frente única)
-- ============================================================

-- ---- 1. TAILOR (p.8-9) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Tailor', 'Mesa de engomar combinada DOB/FL com aquecimento, sucção e sopro. Transforma-se em 3 minutos entre superfície DOB e retangular FL.', 'Mesas DOB', 10)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'TAILOR DOB S+B', '102-38-006', 'Superfície DOB 110×38 cm, aquecimento+sucção+sopro', 230, TRUE, TRUE,  0.8, 395.00, 35.5, 15, 15),
  (fam, 'TAILOR FL S+B',  '102-38-007', 'Superfície FL 115×55 cm, aquecimento+sucção+sopro',  230, TRUE, TRUE,  1.0, 425.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'T/AMCR+F1',    '102-38-003', 'Braço giratório com canto e buck de manga sem aquecimento', 60.00,  35.5, 15, 15, 1),
  (g1, 'HANGER HOLDER','102-38-008', 'Suporte para acessórios e cabides',                          31.50,  35.5, 15, 15, 2),
  (g1, 'FINISHER',     '106-30-001', 'Finisher a vapor',                                          186.00, 35.5, 15, 15, 3),
  (g1, 'T/BL',         '102-38-009', 'Sistema de sopro (add-on)',                                  77.00,  35.5, 15, 15, 4),
  (g1, 'T/DOB',        '102-38-005', 'Superfície de engomar aquecida DOB',                        158.00, 35.5, 15, 15, 5),
  (g1, 'T/FL',         '102-38-004', 'Superfície de engomar aquecida retangular FL',              164.00, 35.5, 15, 15, 6);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'PKG-TAILOR',      'Caixa de cartão 120×48×92 cm',                  20.00, 35.5, 15, 15, 1);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER TAILOR',    '302-13-005', 'Capa Tailor & TV3811-KIT',                       20.00,  35.5, 15, 15, 1),
  (g3, 'COVER F1',        '304-01-001', 'Capa para Buck F1-KIT',                           9.00,  35.5, 15, 15, 2),
  (g3, 'COVER T/FL',      '302-38-006', 'Capa de tecido para TAILOR FL',                  13.50,  35.5, 15, 15, 3),
  (g3, 'MOLLETONE T/FL',  '302-38-007', 'Molleton para TAILOR FL',                        11.00,  35.5, 15, 15, 4);


-- ---- 2. ECO DOB (p.10-11) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Eco DOB', 'Mesa de engomar DOB compacta com aquecimento e sucção. Disponível com sopro (S+B).', 'Mesas DOB', 20)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'ECO DOB',     '102-26-000', 'Mesa DOB 3711 — sucção',          230, TRUE,  FALSE, 1.0, 491.00, 35.5, 15, 15),
  (fam, 'ECO DOB S+B', '102-26-004', 'Mesa DOB 3711 — sucção+sopro',    230, TRUE,  TRUE,  1.0, 625.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'ED/AMCR+F1/C',  '102-26-032', 'Braço giratório + buck de manga aquecido F1/C Ø85mm',        158.00, 35.5, 15, 15, 1),
  (g1, 'ED/VS',          '102-26-011', 'Sistema Vario',                                               121.00, 35.5, 15, 15, 2),
  (g1, 'ED/LT',          '102-26-033', 'Sistema de iluminação 28W (só com Vario)',                     55.00, 35.5, 15, 15, 3),
  (g1, 'GS',             '107-02-000', 'Suporte de ferro L1700/ST1700/ECO 1700',                       13.00, 35.5, 15, 15, 4),
  (g1, 'GSV 1800L',      '107-17-001', 'Suporte de ferro IT-1800L & ILE 1800L',                        22.00, 35.5, 15, 15, 5),
  (g1, 'GSV 1800S',      '107-17-000', 'Suporte de ferro IT-1800S & ILE 1800S',                        22.00, 35.5, 15, 15, 6),
  (g1, 'Braço Ø85mm',    '102-27-012', 'Braço giratório base Ø85mm',                                  126.00, 35.5, 15, 15, 7),
  (g1, 'Insonorização',  '192-26-049', 'Revestimento de insonorização extra',                          20.00, 35.5, 15, 15, 8);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'PKG-ECOD-S',   'Caixa de cartão (ECO DOB sucção)',     22.00, 35.5, 15, 15, 1),
  (g2, 'PKG-ECOD-SB',  'Caixa de cartão (ECO DOB S+B)',        22.00, 35.5, 15, 15, 2);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER 38',       '302-01-030', 'Capa de tecido ECO DOB 3711',              7.70, 35.5, 15, 15, 1),
  (g3, 'BLUE FOAM 38',   '302-01-029', 'Espuma Soft Blue 7mm ECO DOB 3711',        8.70, 35.5, 15, 15, 2),
  (g3, 'COVER F1/C',     '304-01-040', 'Capa de tecido para buck F1/C',            4.40, 35.5, 15, 15, 3),
  (g3, 'BLUE FOAM F1/C', '304-01-038', 'Espuma Soft Blue 7mm para buck F1/C',      4.90, 35.5, 15, 15, 4),
  (g3, 'Balancer',       '302-00-051', 'Balancim de ferro',                        23.60, 35.5, 15, 15, 5),
  (g3, 'Trolley',        '302-00-049', 'Carrinho para balancim',                   27.80, 35.5, 15, 15, 6);


-- ---- 3. FLEX DOB (p.12-13) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Flex DOB', 'Mesa de engomar DOB profissional com motor de alto desempenho. Disponível com ponta direita (/CA) e com/sem sopro.', 'Mesas DOB', 30)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX DOB',       '102-21-001', 'Mesa DOB 1242 — sucção 400V',         400, TRUE,  FALSE, 1.0,  720.00, 35.5, 15, 15),
  (fam, 'FLEX DOB',       '102-21-000', 'Mesa DOB 1242 — sucção 230V',         230, TRUE,  FALSE, 1.0,  740.00, 35.5, 15, 15),
  (fam, 'FLEX DOB S+B',   '102-21-003', 'Mesa DOB 1242 — S+B 400V',            400, TRUE,  TRUE,  1.0,  950.00, 35.5, 15, 15),
  (fam, 'FLEX DOB S+B',   '102-21-002', 'Mesa DOB 1242 — S+B 230V',            230, TRUE,  TRUE,  1.0,  970.00, 35.5, 15, 15),
  (fam, 'FLEX DOB/CA',    '102-21-016', 'Mesa DOB c/ ponta direita — S 400V',  400, TRUE,  FALSE, 1.0,  790.00, 35.5, 15, 15),
  (fam, 'FLEX DOB/CA',    '102-21-022', 'Mesa DOB c/ ponta direita — S 230V',  230, TRUE,  FALSE, 1.0,  810.00, 35.5, 15, 15),
  (fam, 'FLEX DOB/CA S+B','102-21-007', 'Mesa DOB c/ ponta direita — S+B 400V',400, TRUE,  TRUE,  1.0, 1015.00, 35.5, 15, 15),
  (fam, 'FLEX DOB/CA S+B','102-21-017', 'Mesa DOB c/ ponta direita — S+B 230V',230, TRUE,  TRUE,  1.0, 1040.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'FD/AMCR',      '102-21-010', 'Braço giratório Ø85mm',                                     131.00, 35.5, 15, 15, 1),
  (g1, 'F1/C',         '104-01-000', 'Buck de manga aquecido F1/C Ø85mm',                           98.00, 35.5, 15, 15, 2),
  (g1, 'FD/VS',        '102-21-013', 'Sistema Vario',                                              212.00, 35.5, 15, 15, 3),
  (g1, 'FD/LT',        '102-21-012', 'Sistema de iluminação 36W (só com Vario)',                    60.00, 35.5, 15, 15, 4),
  (g1, 'GS',           '107-02-000', 'Suporte de ferro ECO 1700/L1700/ST1700',                      13.00, 35.5, 15, 15, 5),
  (g1, 'GSV 1800L',    '107-17-001', 'Suporte de ferro IT-1800L & ILE 1800L',                       22.00, 35.5, 15, 15, 6),
  (g1, 'GSV 1800S',    '107-17-000', 'Suporte de ferro IT-1800S & ILE 1800S',                       22.00, 35.5, 15, 15, 7),
  (g1, 'Insonorização','192-21-082', 'Revestimento de insonorização',                                26.00, 35.5, 15, 15, 8),
  (g1, 'Ponta direita','102-21-CA',  'Modelo c/ ponta direita e base de ferro separada',             98.00, 35.5, 15, 15, 9);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'PKG-FLEXD', 'Caixa de cartão ×2', 30.00, 35.5, 15, 15, 1);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER 1242',    '302-21-072', 'Capa de tecido FLEX DOB 1242',             8.50, 35.5, 15, 15, 1),
  (g3, 'BLUE FOAM 1242','302-21-050', 'Espuma Soft Blue 7mm FLEX DOB 1242',        9.10, 35.5, 15, 15, 2),
  (g3, 'COVER F1/C',    '304-01-040', 'Capa de tecido para buck F1/C',             4.40, 35.5, 15, 15, 3),
  (g3, 'BLUE FOAM F1/C','304-01-038', 'Espuma Soft Blue 7mm para buck F1/C',       4.90, 35.5, 15, 15, 4),
  (g3, 'Balancer',      '302-00-051', 'Balancim de ferro',                         23.60, 35.5, 15, 15, 5),
  (g3, 'Trolley',       '302-00-049', 'Carrinho para balancim',                    27.80, 35.5, 15, 15, 6);


-- ---- 4. PERFECT DOB — PD (p.14-15) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Perfect DOB (PD)', 'Mesa DOB de gama superior com aquecimento de alta performance. Disponível com ponta direita (/CA), com/sem sopro.', 'Mesas DOB', 40)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PD',          '102-03-001', 'Perfect DOB — sucção 400V',          400, TRUE,  FALSE, 1.0,  930.00, 35.5, 15, 15),
  (fam, 'PD',          '102-03-018', 'Perfect DOB — sucção 230V',          230, TRUE,  FALSE, 1.0,  950.00, 35.5, 15, 15),
  (fam, 'PD S+B',      '102-03-000', 'Perfect DOB — S+B 400V',             400, TRUE,  TRUE,  1.0, 1120.00, 35.5, 15, 15),
  (fam, 'PD S+B',      '102-03-005', 'Perfect DOB — S+B 230V',             230, TRUE,  TRUE,  1.0, 1140.00, 35.5, 15, 15),
  (fam, 'PD/CA',       '102-03-023', 'Perfect DOB c/ ponta — S 400V',      400, TRUE,  FALSE, 1.0,  950.00, 35.5, 15, 15),
  (fam, 'PD/CA',       '102-03-007', 'Perfect DOB c/ ponta — S 230V',      230, TRUE,  FALSE, 1.0,  970.00, 35.5, 15, 15),
  (fam, 'PD/CA S+B',   '102-03-022', 'Perfect DOB c/ ponta — S+B 400V',    400, TRUE,  TRUE,  1.0, 1144.00, 35.5, 15, 15),
  (fam, 'PD/CA S+B',   '102-03-009', 'Perfect DOB c/ ponta — S+B 230V',    230, TRUE,  TRUE,  1.0, 1165.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'PD/AMCR',     '102-03-010', 'Braço giratório Ø85mm',                                     131.00, 35.5, 15, 15, 1),
  (g1, 'F1/C',        '104-01-000', 'Buck de manga aquecido F1/C Ø85mm',                           98.00, 35.5, 15, 15, 2),
  (g1, 'PD/VS',       '102-03-019', 'Sistema Vario',                                              212.00, 35.5, 15, 15, 3),
  (g1, 'PD/LT',       '102-02-012', 'Sistema de iluminação 36W (só com Vario)',                    55.00, 35.5, 15, 15, 4),
  (g1, 'GS',          '107-02-000', 'Suporte de ferro ECO 1700/L1700/ST1700',                      13.00, 35.5, 15, 15, 5),
  (g1, 'GSV 1800L',   '107-17-001', 'Suporte de ferro IT-1800L & ILE 1800L',                       22.00, 35.5, 15, 15, 6),
  (g1, 'GSV 1800S',   '107-17-000', 'Suporte de ferro IT-1800S & ILE 1800S',                       22.00, 35.5, 15, 15, 7),
  (g1, 'Insonorização','192-03-086','Revestimento de insonorização',                                26.00, 35.5, 15, 15, 8),
  (g1, 'Ponta direita','102-03-CA', 'Modelo c/ ponta direita',                                     95.00, 35.5, 15, 15, 9);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'PKG-PD', 'Caixa de madeira 190×77×115 cm', 150.00, 35.5, 15, 15, 1);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER (ant.2016)',  '302-02-079',   'Capa de tecido Perfect DOB (anterior a 2016)',  8.50, 35.5, 15, 15, 1),
  (g3, 'BLUE FOAM (ant.2016)','302-02-079-2','Espuma Soft Blue 7mm (ant.2016)',               9.10, 35.5, 15, 15, 2),
  (g3, 'COVER (des.2017)',  '302-21-072',   'Capa de tecido Perfect DOB (desde 2017)',        8.50, 35.5, 15, 15, 3),
  (g3, 'BLUE FOAM (des.2017)','302-21-050', 'Espuma Soft Blue 7mm (desde 2017)',              9.10, 35.5, 15, 15, 4),
  (g3, 'COVER F1/C',       '304-01-040',   'Capa de tecido para buck F1/C',                  4.40, 35.5, 15, 15, 5),
  (g3, 'BLUE FOAM F1/C',   '304-01-038',   'Espuma Soft Blue 7mm para buck F1/C',            4.90, 35.5, 15, 15, 6),
  (g3, 'Balancer',         '302-00-051',   'Balancim de ferro',                               23.60, 35.5, 15, 15, 7),
  (g3, 'Trolley',          '302-00-049',   'Carrinho para balancim',                          27.80, 35.5, 15, 15, 8);


-- ---- 5. PERFECT PDL (p.16-17) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Perfect PDL', 'Mesa de engomar DOB de topo com superfície extra-larga. Excelente para casacos e peças pesadas.', 'Mesas DOB', 50)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PDL',      '102-35-001', 'Perfect PDL — sucção 400V',  400, TRUE,  FALSE, 1.0, 1187.00, 35.5, 15, 15),
  (fam, 'PDL',      '102-35-004', 'Perfect PDL — sucção 230V',  230, TRUE,  FALSE, 1.0, 1210.00, 35.5, 15, 15),
  (fam, 'PDL S+B',  '102-35-002', 'Perfect PDL — S+B 400V',     400, TRUE,  TRUE,  1.0, 1365.00, 35.5, 15, 15),
  (fam, 'PDL S+B',  '102-35-003', 'Perfect PDL — S+B 230V',     230, TRUE,  TRUE,  1.0, 1386.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'PDL/AMCR',    '102-35-005', 'Braço giratório Ø85mm',                                          164.00, 35.5, 15, 15, 1),
  (g1, 'F1/C',        '104-01-000', 'Buck de manga aquecido F1/C Ø85mm',                               98.00, 35.5, 15, 15, 2),
  (g1, 'PDL/SP',      '102-35-006', 'Braço giratório de spotting com buck S/S',                       191.00, 35.5, 15, 15, 3),
  (g1, 'PDL/VS',      '102-35-014', 'Sistema Vario',                                                  212.00, 35.5, 15, 15, 4),
  (g1, 'PDL/LT',      '102-35-011', 'Sistema de iluminação 36W (só com Vario)',                        60.00, 35.5, 15, 15, 5),
  (g1, 'PDL/LT-NB',   '102-35-010', 'Sistema de iluminação 36W sem balancim',                         158.00, 35.5, 15, 15, 6),
  (g1, 'GS',          '107-02-000', 'Suporte de ferro ECO 1700/L1700/ST1700',                          13.00, 35.5, 15, 15, 7),
  (g1, 'GSV 1800L',   '107-17-001', 'Suporte de ferro IT-1800L & ILE 1800L',                           22.00, 35.5, 15, 15, 8),
  (g1, 'GSV 1800S',   '107-17-000', 'Suporte de ferro IT-1800S & ILE 1800S',                           22.00, 35.5, 15, 15, 9),
  (g1, 'PDL/TH',      '102-35-007', 'Suporte gancho para perna de calça',                              70.00, 35.5, 15, 15, 10),
  (g1, 'PDL/CH',      '102-35-008', 'Tubo giratório com corrente',                                     82.00, 35.5, 15, 15, 11),
  (g1, 'PDL/WH',      '102-35-009', 'Tubo giratório para cabides de arame',                            77.00, 35.5, 15, 15, 12),
  (g1, 'Insonorização','192-35-022', 'Revestimento de insonorização',                                  26.00, 35.5, 15, 15, 13);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'PKG-PDL', 'Caixa de madeira 190×82×115 cm', 150.00, 35.5, 15, 15, 1);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER PDL',      '302-35-012', 'Capa de tecido PDL',               9.90, 35.5, 15, 15, 1),
  (g3, 'BLUE FOAM PDL',  '302-35-013', 'Espuma Soft Blue 7mm PDL',        12.00, 35.5, 15, 15, 2),
  (g3, 'COVER F1/C',     '304-01-040', 'Capa de tecido para buck F1/C',    4.40, 35.5, 15, 15, 3),
  (g3, 'BLUE FOAM F1/C', '304-01-038', 'Espuma Soft Blue 7mm buck F1/C',   4.90, 35.5, 15, 15, 4),
  (g3, 'Balancer',       '302-00-051', 'Balancim de ferro',                23.60, 35.5, 15, 15, 5),
  (g3, 'Trolley',        '302-00-049', 'Carrinho para balancim',           27.80, 35.5, 15, 15, 6);


-- ============================================================
-- MESAS DE ENGOMAR FL (frente plana / retangular)
-- ============================================================

-- ---- 6. ECO FL (p.18-19) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Eco FL', 'Mesa de engomar retangular FL compacta. Ideal para peças planas — calças, camisas, lençóis.', 'Mesas FL', 60)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'ECO FL 1360', '102-27-000', 'Mesa FL 1360×385mm — sucção 230V', 230, TRUE, FALSE, 1.0, 546.00, 35.5, 15, 15),
  (fam, 'ECO FL 1165', '102-27-003', 'Mesa FL 1165×385mm — sucção 230V', 230, TRUE, FALSE, 1.0, 578.00, 35.5, 15, 15),
  (fam, 'ECO FL 7014', '102-27-016', 'Mesa FL 700×140mm — sucção 230V',  230, TRUE, FALSE, 1.0, 635.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'EFL/AMCR+F1/C', '102-27-010', 'Braço giratório + buck F1/C aquecido',                  158.00, 35.5, 15, 15, 1),
  (g1, 'EFL/AMCR+F6/C', '102-27-010-3','Braço giratório + buck peito F6/C aquecido',           202.00, 35.5, 15, 15, 2),
  (g1, 'EFL/VS',        '102-27-011', 'Sistema Vario',                                          121.00, 35.5, 15, 15, 3),
  (g1, 'EFL/LT',        '102-27-013', 'Sistema de iluminação 28W (só com Vario)',                55.00, 35.5, 15, 15, 4),
  (g1, 'GS',            '107-02-000', 'Suporte de ferro ECO 1700/L1700/ST1700',                  13.00, 35.5, 15, 15, 5),
  (g1, 'GSV 1800L',     '107-17-001', 'Suporte de ferro IT-1800L & ILE 1800L',                   22.00, 35.5, 15, 15, 6),
  (g1, 'GSV 1800S',     '107-17-000', 'Suporte de ferro IT-1800S & ILE 1800S',                   22.00, 35.5, 15, 15, 7),
  (g1, 'Braço Ø85mm',   '102-27-012', 'Braço giratório base Ø85mm',                             126.00, 35.5, 15, 15, 8),
  (g1, 'Insonorização', '192-27-045', 'Revestimento de insonorização extra',                     20.00, 35.5, 15, 15, 9);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'PKG-ECOFL', 'Caixa de cartão ×2', 25.00, 35.5, 15, 15, 1);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER 1365',    '302-27-017', 'Capa de tecido ECO FL 1360',             17.40, 35.5, 15, 15, 1),
  (g3, 'BLUE FOAM 1360','302-22-038', 'Espuma Soft Blue 7mm ECO FL 1360/1365',   13.00, 35.5, 15, 15, 2),
  (g3, 'COVER F1/C',    '304-01-040', 'Capa de tecido para buck F1/C',            4.40, 35.5, 15, 15, 3),
  (g3, 'BLUE FOAM F1/C','304-01-038', 'Espuma Soft Blue 7mm buck F1/C',           4.90, 35.5, 15, 15, 4),
  (g3, 'COVER F6/C',    '304-00-006', 'Capa de tecido para buck F6/C',            5.50, 35.5, 15, 15, 5),
  (g3, 'BLUE FOAM F6/C','304-00-006-1','Espuma Soft Blue 7mm buck F6/C',          6.00, 35.5, 15, 15, 6),
  (g3, 'Balancer',      '302-00-051', 'Balancim de ferro',                        23.60, 35.5, 15, 15, 7),
  (g3, 'Trolley',       '302-00-049', 'Carrinho para balancim',                   27.80, 35.5, 15, 15, 8);


-- ---- 7. FLEX FL (p.20-21) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Flex FL', 'Mesa de engomar FL profissional com motor de alto desempenho. Vários tamanhos de superfície e opção S+B.', 'Mesas FL', 70)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX FL 1365',     '102-22-001',   'FL 1365×550mm — S 400V',      400, TRUE,  FALSE, 1.0,  750.00, 35.5, 15, 15),
  (fam, 'FLEX FL 1365',     '102-22-000',   'FL 1365×550mm — S 230V',      230, TRUE,  FALSE, 1.0,  777.00, 35.5, 15, 15),
  (fam, 'FLEX FL 1365 S+B', '102-22-003',   'FL 1365×550mm — S+B 400V',    400, TRUE,  TRUE,  1.0,  950.00, 35.5, 15, 15),
  (fam, 'FLEX FL 1365 S+B', '102-22-002',   'FL 1365×550mm — S+B 230V',    230, TRUE,  TRUE,  1.0,  970.00, 35.5, 15, 15),
  (fam, 'FLEX FL 1165',     '102-24-001',   'FL 1165×550mm — S 400V',      400, TRUE,  FALSE, 1.0,  777.00, 35.5, 15, 15),
  (fam, 'FLEX FL 1165',     '102-22-006',   'FL 1165×550mm — S 230V',      230, TRUE,  FALSE, 1.0,  798.00, 35.5, 15, 15),
  (fam, 'FLEX FL 1165 S+B', '102-22-024',   'FL 1165×550mm — S+B 400V',    400, TRUE,  TRUE,  1.0,  960.00, 35.5, 15, 15),
  (fam, 'FLEX FL 1165 S+B', '102-22-023',   'FL 1165×550mm — S+B 230V',    230, TRUE,  TRUE,  1.0,  980.00, 35.5, 15, 15),
  (fam, 'FLEX FL 1565 S+B', '102-22-007',   'FL 1565×550mm — S+B 230V',    230, TRUE,  TRUE,  1.0, 1165.00, 35.5, 15, 15),
  (fam, 'FLEX FL 7014',     '102-22-020',   'FL 700×140mm — S 400V',       400, TRUE,  FALSE, 1.0,  840.00, 35.5, 15, 15),
  (fam, 'FLEX FL 7014',     '102-22-026',   'FL 700×140mm — S 230V',       230, TRUE,  FALSE, 1.0,  860.00, 35.5, 15, 15),
  (fam, 'FLEX FL 7014 S+B', '102-22-027',   'FL 700×140mm — S+B 400V',     400, TRUE,  TRUE,  1.0, 1020.00, 35.5, 15, 15),
  (fam, 'FLEX FL 7014 S+B', '102-22-002-1', 'FL 700×140mm — S+B 230V',     230, TRUE,  TRUE,  1.0, 1050.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'FL/AMCR',     '102-22-010', 'Braço giratório Ø85mm',                                    131.00, 35.5, 15, 15, 1),
  (g1, 'F1/C',        '104-01-000', 'Buck de manga aquecido F1/C Ø85mm',                          98.00, 35.5, 15, 15, 2),
  (g1, 'F6/C',        '104-06-000', 'Buck de peito aquecido F6/C',                               158.00, 35.5, 15, 15, 3),
  (g1, 'FL/VS',       '102-22-015', 'Sistema Vario',                                             212.00, 35.5, 15, 15, 4),
  (g1, 'FL/LT',       '102-22-012', 'Sistema de iluminação 36W (só com Vario)',                   55.00, 35.5, 15, 15, 5),
  (g1, 'GS',          '107-02-000', 'Suporte de ferro ECO 1700/L1700/ST1700',                     13.00, 35.5, 15, 15, 6),
  (g1, 'GSV 1800L',   '107-17-001', 'Suporte de ferro IT-1800L & ILE 1800L',                      22.00, 35.5, 15, 15, 7),
  (g1, 'GSV 1800S',   '107-17-000', 'Suporte de ferro IT-1800S & ILE 1800S',                      22.00, 35.5, 15, 15, 8),
  (g1, 'Insonorização','192-22-085','Revestimento de insonorização',                               26.00, 35.5, 15, 15, 9);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'PKG-FLEXFL', 'Caixa de cartão ×3', 32.00, 35.5, 15, 15, 1);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER 1365',    '302-27-017',  'Capa de tecido FL 1365',                17.40, 35.5, 15, 15, 1),
  (g3, 'BLUE FOAM 1365','302-22-038',  'Espuma Soft Blue 7mm FL 1365',           13.00, 35.5, 15, 15, 2),
  (g3, 'COVER F1/C',    '304-01-040',  'Capa de tecido para buck F1/C',           4.40, 35.5, 15, 15, 3),
  (g3, 'BLUE FOAM F1/C','304-01-038',  'Espuma Soft Blue 7mm buck F1/C',          4.90, 35.5, 15, 15, 4),
  (g3, 'COVER F6/C',    '304-00-006',  'Capa de tecido para buck F6/C',           5.50, 35.5, 15, 15, 5),
  (g3, 'BLUE FOAM F6/C','304-00-006-1','Espuma Soft Blue 7mm buck F6/C',          6.00, 35.5, 15, 15, 6),
  (g3, 'Balancer',      '302-00-051',  'Balancim de ferro',                       23.60, 35.5, 15, 15, 7),
  (g3, 'Trolley',       '302-00-049',  'Carrinho para balancim',                  27.80, 35.5, 15, 15, 8);


-- ---- 8. PERFECT FL — PU (p.22-23) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Perfect FL (PU)', 'Mesa de engomar FL de topo com aquecimento de alta performance. Três tamanhos de superfície (6513/6511/7014) com/sem sopro.', 'Mesas FL', 80)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PU 6513',     '102-04-001', 'FL 650×130mm — S 400V',     400, TRUE,  FALSE, 1.0,  940.00, 35.5, 15, 15),
  (fam, 'PU 6513',     '102-04-002', 'FL 650×130mm — S 230V',     230, TRUE,  FALSE, 1.0,  960.00, 35.5, 15, 15),
  (fam, 'PU 6513 S+B', '102-04-000', 'FL 650×130mm — S+B 400V',   400, TRUE,  TRUE,  1.0, 1134.00, 35.5, 15, 15),
  (fam, 'PU 6513 S+B', '102-04-004', 'FL 650×130mm — S+B 230V',   230, TRUE,  TRUE,  1.0, 1155.00, 35.5, 15, 15),
  (fam, 'PU 6511',     '102-17-001', 'FL 650×110mm — S 400V',     400, TRUE,  FALSE, 1.0,  960.00, 35.5, 15, 15),
  (fam, 'PU 6511',     '102-17-002', 'FL 650×110mm — S 230V',     230, TRUE,  FALSE, 1.0,  983.00, 35.5, 15, 15),
  (fam, 'PU 6511 S+B', '102-17-000', 'FL 650×110mm — S+B 400V',   400, TRUE,  TRUE,  1.0, 1155.00, 35.5, 15, 15),
  (fam, 'PU 6511 S+B', '102-17-003', 'FL 650×110mm — S+B 230V',   230, TRUE,  TRUE,  1.0, 1176.00, 35.5, 15, 15),
  (fam, 'PU 7014',     '102-04-005', 'FL 700×140mm — S 400V',     400, TRUE,  FALSE, 1.0, 1025.00, 35.5, 15, 15),
  (fam, 'PU 7014',     '102-04-006', 'FL 700×140mm — S 230V',     230, TRUE,  FALSE, 1.0, 1050.00, 35.5, 15, 15),
  (fam, 'PU 7014 S+B', '102-04-007', 'FL 700×140mm — S+B 400V',   400, TRUE,  TRUE,  1.0, 1225.00, 35.5, 15, 15),
  (fam, 'PU 7014 S+B', '102-04-008', 'FL 700×140mm — S+B 230V',   230, TRUE,  TRUE,  1.0, 1245.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'PU/AMCR',     '102-04-010', 'Braço giratório Ø85mm',                                    131.00, 35.5, 15, 15, 1),
  (g1, 'F1/C',        '104-01-000', 'Buck de manga aquecido F1/C Ø85mm',                          98.00, 35.5, 15, 15, 2),
  (g1, 'F6/C',        '104-06-000', 'Buck de peito aquecido F6/C',                               158.00, 35.5, 15, 15, 3),
  (g1, 'PU/VS',       '102-00-014', 'Sistema Vario',                                             212.00, 35.5, 15, 15, 4),
  (g1, 'PU/LT',       '102-02-012', 'Sistema de iluminação 36W (só com Vario)',                   55.00, 35.5, 15, 15, 5),
  (g1, 'GS',          '107-02-000', 'Suporte de ferro ECO 1700/L1700/ST1700',                     13.00, 35.5, 15, 15, 6),
  (g1, 'GSV 1800L',   '107-17-001', 'Suporte de ferro IT-1800L & ILE 1800L',                      22.00, 35.5, 15, 15, 7),
  (g1, 'GSV 1800S',   '107-17-000', 'Suporte de ferro IT-1800S & ILE 1800S',                      22.00, 35.5, 15, 15, 8),
  (g1, 'Insonorização','192-04-081','Revestimento de insonorização',                               42.00, 35.5, 15, 15, 9);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'PKG-PU', 'Caixa de cartão ×3', 40.00, 35.5, 15, 15, 1);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER 6513',    '302-22-039',  'Capa de tecido PU 6513',                17.40, 35.5, 15, 15, 1),
  (g3, 'BLUE FOAM 1365','302-22-038',  'Espuma Soft Blue 7mm PU',                13.00, 35.5, 15, 15, 2),
  (g3, 'COVER F1/C',    '304-01-040',  'Capa de tecido para buck F1/C',           4.40, 35.5, 15, 15, 3),
  (g3, 'BLUE FOAM F1/C','304-01-038',  'Espuma Soft Blue 7mm buck F1/C',          4.90, 35.5, 15, 15, 4),
  (g3, 'COVER F6/C',    '304-00-006',  'Capa de tecido para buck F6/C',           5.50, 35.5, 15, 15, 5),
  (g3, 'BLUE FOAM F6/C','304-00-006-1','Espuma Soft Blue 7mm buck F6/C',          6.00, 35.5, 15, 15, 6),
  (g3, 'Balancer',      '302-00-051',  'Balancim de ferro',                       23.60, 35.5, 15, 15, 7),
  (g3, 'Trolley',       '302-00-049',  'Carrinho para balancim',                  27.80, 35.5, 15, 15, 8);


-- ============================================================
-- MESAS ESPECIAIS / COMPLEMENTARES
-- ============================================================

-- ---- 9. TV 3811 (p.24) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'TV 3811', 'Mesa de engomar universal compacta para calças e peças pequenas. Superfície 385×110mm.', 'Mesas Especiais', 90)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'TV 3811 S',   '103-38-004', 'Mesa TV 3811 — sucção 230V',       230, TRUE,  FALSE, 0.5, 156.00, 35.5, 15, 15),
  (fam, 'TV 3811 B',   '103-38-005', 'Mesa TV 3811 — sopro 230V',         230, FALSE, TRUE,  0.5, 174.00, 35.5, 15, 15),
  (fam, 'TV 3811 S+B', '103-38-001', 'Mesa TV 3811 — sucção+sopro 230V', 230, TRUE,  TRUE,  0.5, 194.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis', 'multi_select', 1) RETURNING id INTO g1;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'COVER TAILOR', '302-13-005', 'Capa Tailor & TV3811-KIT', 20.00, 35.5, 15, 15, 1);


-- ---- 10. B 420 (p.24) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'B 420', 'Mesa de engomar para calças com superfície FL 420mm. Bomba de sucção incorporada.', 'Mesas Especiais', 100)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'B 420 A',      '103-42-005', 'Mesa B 420 — sucção, sem pés',              230, TRUE, FALSE, 0.5, 178.00, 35.5, 15, 15),
  (fam, 'B 420 A+H',    '103-42-000', 'Mesa B 420 — sucção, com pés',              230, TRUE, FALSE, 0.5, 291.00, 35.5, 15, 15),
  (fam, 'B 420 A+H+W',  '103-42-001', 'Mesa B 420 — sucção, com pés e rodas',      230, TRUE, FALSE, 0.5, 353.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis', 'multi_select', 1) RETURNING id INTO g1;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'COVER B420', '302-42-001', 'Capa de tecido B 420', 8.50, 35.5, 15, 15, 1),
  (g1, 'BLUE FOAM B420','302-42-002','Espuma Soft Blue 7mm B 420', 9.00, 35.5, 15, 15, 2);


-- ---- 11. SP/VR — Mesa para pernas de calças (p.25) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'SP/VR', 'Mesa vertical para engomar pernas de calças. Superfície tubular giratória.', 'Mesas Especiais', 110)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'SP/VR S',     '102-20-005', 'SP/VR — sucção 230V',                   230, TRUE,  FALSE, 1.0,  650.00, 35.5, 15, 15),
  (fam, 'SP/VR S+B',   '102-20-000', 'SP/VR — S+B 230V',                      230, TRUE,  TRUE,  1.0,  800.00, 35.5, 15, 15),
  (fam, 'SP/VR S+B',   '102-20-001', 'SP/VR — S+B 400V',                      400, TRUE,  TRUE,  1.0,  780.00, 35.5, 15, 15),
  (fam, 'SP/VR/H S+B', '102-20-002', 'SP/VR com rack de pendurar — S+B 230V', 230, TRUE,  TRUE,  1.0, 1020.00, 35.5, 15, 15),
  (fam, 'SP/VR/H S+B', '102-20-003', 'SP/VR com rack de pendurar — S+B 400V', 400, TRUE,  TRUE,  1.0,  990.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis', 'multi_select', 1) RETURNING id INTO g1;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'COVER SP/VR', '302-20-010', 'Capa de tecido SP/VR', 12.00, 35.5, 15, 15, 1),
  (g1, 'BLUE FOAM SP/VR','302-20-011','Espuma Soft Blue 7mm SP/VR', 13.00, 35.5, 15, 15, 2);


-- ---- 12. SU/VR — Mesa parte superior de calças (p.25) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'SU/VR', 'Mesa para engomar a parte superior (cintura/cós) das calças.', 'Mesas Especiais', 120)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'SU/VR S+B', '102-31-000', 'SU/VR — S+B 230V', 230, TRUE, TRUE, 1.0, 1200.00, 35.5, 15, 15),
  (fam, 'SU/VR S+B', '102-31-001', 'SU/VR — S+B 400V', 400, TRUE, TRUE, 1.0, 1170.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis', 'multi_select', 1) RETURNING id INTO g1;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'COVER SU/VR', '302-31-005', 'Capa de tecido SU/VR', 14.00, 35.5, 15, 15, 1);


-- ---- 13. OCTOPUS (p.27-28) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Octopus', 'Mesa de engomar rotativa com 8 braços. Alta produtividade para peças FL com/sem sopro.', 'Mesas Especiais', 130)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'OCTOPUS S+B', '102-36-002', 'Octopus — S+B 400V', 400, TRUE, TRUE, 2.0, 1720.00, 35.5, 15, 15),
  (fam, 'OCTOPUS S+B', '102-36-004', 'Octopus — S+B 230V', 230, TRUE, TRUE, 2.0, 1785.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select', 1)  RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select', 3)  RETURNING id INTO g3;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'OCT/LT-NB',     '102-36-007', 'Iluminação 36W sem balancim',               158.00, 35.5, 15, 15, 1),
  (g1, 'GS',            '107-02-000', 'Suporte de ferro ECO 1700/L1700/ST1700',      13.00, 35.5, 15, 15, 2),
  (g1, 'GSV 1800L',     '107-17-001', 'Suporte de ferro IT-1800L & ILE 1800L',       22.00, 35.5, 15, 15, 3),
  (g1, 'GSV 1800S',     '107-17-000', 'Suporte de ferro IT-1800S & ILE 1800S',       22.00, 35.5, 15, 15, 4),
  (g1, 'PFL/SP-S/F/O',  '102-06-011-5','Sistema de pulverização de água',           285.00, 35.5, 15, 15, 5),
  (g1, 'BS/FL',         '192-04-080', 'Suporte de ferro na chaminé (2.º ferro)',      33.00, 35.5, 15, 15, 6),
  (g1, 'PEDAL Extra',   '192-36-124', 'Pedais extra',                                70.00, 35.5, 15, 15, 7);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira (165×120×200 cm)', 220.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, 'COVER OCT',      '302-36-010', 'Capa de tecido Octopus (×8)', 80.00, 35.5, 15, 15, 1),
  (g3, 'BLUE FOAM OCT',  '302-36-011', 'Espuma Soft Blue 7mm Octopus (×8)', 90.00, 35.5, 15, 15, 2);


-- ---- 14. OCTOPUS FINISHER (p.29) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Octopus Finisher', 'Mesa rotativa Octopus com finisher integrado para acabamentos.', 'Mesas Especiais', 140)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'OCTOPUS/FIN S+B', '102-36-006', 'Octopus Finisher — S+B 400V', 400, TRUE, TRUE, 2.0, 1920.00, 35.5, 15, 15),
  (fam, 'OCTOPUS/FIN S+B', '102-36-005', 'Octopus Finisher — S+B 230V', 230, TRUE, TRUE, 2.0, 1990.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'OCT/LT-NB',    '102-36-007',   'Iluminação 36W sem balancim',               158.00, 35.5, 15, 15, 1),
  (g1, 'GS',           '107-02-000',   'Suporte de ferro ECO 1700/L1700/ST1700',      13.00, 35.5, 15, 15, 2),
  (g1, 'GSV 1800L',    '107-17-001',   'Suporte de ferro IT-1800L & ILE 1800L',       22.00, 35.5, 15, 15, 3),
  (g1, 'GSV 1800S',    '107-17-000',   'Suporte de ferro IT-1800S & ILE 1800S',       22.00, 35.5, 15, 15, 4),
  (g1, 'PFL/SP-S/F/O', '102-06-011-5', 'Sistema de pulverização de água destilada',  285.00, 35.5, 15, 15, 5),
  (g1, 'BS/FL',        '192-04-080',   'Suporte de ferro na chaminé (2.º ferro)',      33.00, 35.5, 15, 15, 6),
  (g1, 'PEDAL Extra',  '192-36-124',   'Pedais extra para braços giratórios frontais', 70.00, 35.5, 15, 15, 7);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira (165×120×200 cm)', 220.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ============================================================
-- MESAS DE REMATE (PFS/PFL) E ESPECIAIS COSTURA
-- ============================================================

-- ---- 15a. FLEX - FS — Mesas de Remate Finishing gama FLEX (p.36) ----
-- Nota: PDF chama "FLEX - FS" (sem P). Heating: 400W = 0.4kW
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'FLEX - FS', 'Mesa de remate Finishing gama FLEX. Almofada W400 Ø120mm. 400W aquecimento.', 'Mesas Costura', 150)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX - FS',      '102-28-015', 'Remate Finishing FLEX — S 400V',   400, TRUE, FALSE, 0.4, 1255.00, 35.5, 15, 15),
  (fam, 'FLEX - FS',      '102-28-014', 'Remate Finishing FLEX — S 230V',   230, TRUE, FALSE, 0.4, 1285.00, 35.5, 15, 15),
  (fam, 'FLEX - FS/S+B',  '102-28-001', 'Remate Finishing FLEX — S+B 400V', 400, TRUE, TRUE,  0.4, 1475.00, 35.5, 15, 15),
  (fam, 'FLEX - FS/S+B',  '102-28-006', 'Remate Finishing FLEX — S+B 230V', 230, TRUE, TRUE,  0.4, 1510.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select',  2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 3) RETURNING id INTO g3;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz',  NULL,          'Opção tensão 220V III 60Hz (3F s/ neutro)',               31.50, 35.5, 15, 15, 1),
  (g1, 'PFS/TSP',        '102-05-011',  'Suporte telescópico giratório para cabide',               65.00, 35.5, 15, 15, 2),
  (g1, 'PFS/AMCR-B',    '102-05-010',  'Braço giratório traseiro Ø85mm com canto p/ buck extra',  186.00, 35.5, 15, 15, 3),
  (g1, 'PFS/AMCR-F',    '102-05-009',  'Braço giratório frontal Ø85mm com canto p/ buck extra',   251.00, 35.5, 15, 15, 4),
  (g1, 'PFS/VS',         '102-05-012',  'Sistema Vario para ferros de vapor (seleção de suportes)', 212.00, 35.5, 15, 15, 5),
  (g1, 'PFS/LT',         '102-05-013',  'Iluminação 36W (só com sistema Vario)',                    60.00, 35.5, 15, 15, 6),
  (g1, 'GS',             '107-02-000',  'Suporte de ferro L1700, ST1700 e ECO 1700',                13.00, 35.5, 15, 15, 7),
  (g1, 'GSV 1800L',      '107-17-001',  'Suporte de ferro IT-1800L & ILE 1800L',                    22.00, 35.5, 15, 15, 8),
  (g1, 'GSV 1800S',      '107-17-000',  'Suporte de ferro IT-1800S & ILE 1800S',                    22.00, 35.5, 15, 15, 9);
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'COVER PFS',     '302-08-010', 'Capa de tecido PFS',        12.00, 35.5, 15, 15, 1),
  (g2, 'BLUE FOAM PFS', '302-08-011', 'Espuma Soft Blue 7mm PFS',  13.00, 35.5, 15, 15, 2),
  (g2, 'Balancer',      '302-00-051', 'Balancim de ferro',          23.60, 35.5, 15, 15, 3),
  (g2, 'Trolley',       '302-00-049', 'Carrinho para balancim',     27.80, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, NULL, '3 caixas cartão (136×86×35 + 65×50×102 + 150×46×23 cm)', 40.00, 35.5, 15, 15, 1),
  (g3, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 15b. PERFECT - PFS — Mesas de Remate Finishing gama PERFECT (p.36) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'PERFECT - PFS', 'Mesa de remate Finishing gama PERFECT. Almofada W400 Ø120mm. 400W aquecimento.', 'Mesas Costura', 155)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PERFECT - PFS',      '102-05-001', 'Remate Finishing PERFECT — S 400V',   400, TRUE, FALSE, 0.4, 1440.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFS',      '102-05-005', 'Remate Finishing PERFECT — S 230V',   230, TRUE, FALSE, 0.4, 1475.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFS/S+B',  '102-05-000', 'Remate Finishing PERFECT — S+B 400V', 400, TRUE, TRUE,  0.4, 1660.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFS/S+B',  '102-05-020', 'Remate Finishing PERFECT — S+B 230V', 230, TRUE, TRUE,  0.4, 1690.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select',  2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 3) RETURNING id INTO g3;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz',  NULL,          'Opção tensão 220V III 60Hz (3F s/ neutro)',               31.50, 35.5, 15, 15, 1),
  (g1, 'PFS/TSP',        '102-05-011',  'Suporte telescópico giratório para cabide',               65.00, 35.5, 15, 15, 2),
  (g1, 'PFS/AMCR-B',    '102-05-010',  'Braço giratório traseiro Ø85mm com canto p/ buck extra',  186.00, 35.5, 15, 15, 3),
  (g1, 'PFS/AMCR-F',    '102-05-009',  'Braço giratório frontal Ø85mm com canto p/ buck extra',   251.00, 35.5, 15, 15, 4),
  (g1, 'PFS/VS',         '102-05-012',  'Sistema Vario para ferros de vapor (seleção de suportes)', 212.00, 35.5, 15, 15, 5),
  (g1, 'PFS/LT',         '102-05-013',  'Iluminação 36W (só com sistema Vario)',                    60.00, 35.5, 15, 15, 6),
  (g1, 'GS',             '107-02-000',  'Suporte de ferro L1700, ST1700 e ECO 1700',                13.00, 35.5, 15, 15, 7),
  (g1, 'GSV 1800L',      '107-17-001',  'Suporte de ferro IT-1800L & ILE 1800L',                    22.00, 35.5, 15, 15, 8),
  (g1, 'GSV 1800S',      '107-17-000',  'Suporte de ferro IT-1800S & ILE 1800S',                    22.00, 35.5, 15, 15, 9);
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'COVER PFS',     '302-08-010', 'Capa de tecido PFS',        12.00, 35.5, 15, 15, 1),
  (g2, 'BLUE FOAM PFS', '302-08-011', 'Espuma Soft Blue 7mm PFS',  13.00, 35.5, 15, 15, 2),
  (g2, 'Balancer',      '302-00-051', 'Balancim de ferro',          23.60, 35.5, 15, 15, 3),
  (g2, 'Trolley',       '302-00-049', 'Carrinho para balancim',     27.80, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, NULL, '3 caixas cartão (136×86×35 + 65×50×102 + 150×46×23 cm)', 40.00, 35.5, 15, 15, 1),
  (g3, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 16a. FLEX - FL — Mesas de Remate Lining gama FLEX (p.37) ----
-- Nota: PDF chama "FLEX - FL" (sem P). Heating: 800W = 0.8kW
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'FLEX - FL', 'Mesa de remate Lining (forro) gama FLEX. Almofada W800 840×450mm. 800W aquecimento.', 'Mesas Costura', 160)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX - FL',      '102-29-003', 'Remate Lining FLEX — S 400V',   400, TRUE, FALSE, 0.8, 1530.00, 35.5, 15, 15),
  (fam, 'FLEX - FL',      '102-29-007', 'Remate Lining FLEX — S 230V',   230, TRUE, FALSE, 0.8, 1560.00, 35.5, 15, 15),
  (fam, 'FLEX - FL/S+B',  '102-29-002', 'Remate Lining FLEX — S+B 400V', 400, TRUE, TRUE,  0.8, 1760.00, 35.5, 15, 15),
  (fam, 'FLEX - FL/S+B',  '102-29-012', 'Remate Lining FLEX — S+B 230V', 230, TRUE, TRUE,  0.8, 1790.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select',  2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 3) RETURNING id INTO g3;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL,           'Opção tensão 220V III 60Hz (3F s/ neutro)',              31.50, 35.5, 15, 15, 1),
  (g1, 'PFL/SP-S',      '102-06-011',   'Sistema pulverização água destilada c/ pistola (completo)', 284.00, 35.5, 15, 15, 2),
  (g1, 'PFL/SP-N',      '102-06-011-1', 'Sistema pulverização água destilada s/ pistola',          196.00, 35.5, 15, 15, 3),
  (g1, 'PFL/TWR',       '102-06-012',   'Suporte lateral para montagem buck de ombros',            212.00, 35.5, 15, 15, 4),
  (g1, 'GS',            '107-02-000',   'Suporte de ferro L1700, ST1700 e ECO 1700',                13.00, 35.5, 15, 15, 5),
  (g1, 'GSV 1800L',     '107-17-001',   'Suporte de ferro IT-1800L & ILE 1800L',                    22.00, 35.5, 15, 15, 6),
  (g1, 'GSV 1800S',     '107-17-000',   'Suporte de ferro IT-1800S & ILE 1800S',                    22.00, 35.5, 15, 15, 7);
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'COVER PFL',     '302-06-010', 'Capa de tecido PFL',        12.00, 35.5, 15, 15, 1),
  (g2, 'BLUE FOAM PFL', '302-06-011', 'Espuma Soft Blue 7mm PFL',  13.00, 35.5, 15, 15, 2),
  (g2, 'Balancer',      '302-00-051', 'Balancim de ferro',          23.60, 35.5, 15, 15, 3),
  (g2, 'Trolley',       '302-00-049', 'Carrinho para balancim',     27.80, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, NULL, '3 caixas cartão (136×86×35 + 65×50×102 + 150×46×23 cm)', 40.00, 35.5, 15, 15, 1),
  (g3, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 16b. PERFECT - PFL — Mesas de Remate Lining gama PERFECT (p.37-39) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'PERFECT - PFL', 'Mesa de remate Lining (forro) gama PERFECT. Almofada W800 840×450mm. 800W aquecimento.', 'Mesas Costura', 165)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PERFECT - PFL',      '102-06-014', 'Remate Lining PERFECT — S 400V',   400, TRUE, FALSE, 0.8, 1750.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFL',      '102-06-004', 'Remate Lining PERFECT — S 230V',   230, TRUE, FALSE, 0.8, 1780.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFL/S+B',  '102-06-002', 'Remate Lining PERFECT — S+B 400V', 400, TRUE, TRUE,  0.8, 1985.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFL/S+B',  '102-06-005', 'Remate Lining PERFECT — S+B 230V', 230, TRUE, TRUE,  0.8, 2020.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Consumíveis',      'multi_select',  2) RETURNING id INTO g2;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 3) RETURNING id INTO g3;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL,           'Opção tensão 220V III 60Hz (3F s/ neutro)',              31.50, 35.5, 15, 15, 1),
  (g1, 'PFL/SP-S',      '102-06-011',   'Sistema pulverização água destilada c/ pistola (completo)', 284.00, 35.5, 15, 15, 2),
  (g1, 'PFL/SP-N',      '102-06-011-1', 'Sistema pulverização água destilada s/ pistola',          196.00, 35.5, 15, 15, 3),
  (g1, 'PFL/TWR',       '102-06-012',   'Suporte lateral para montagem buck de ombros',            212.00, 35.5, 15, 15, 4),
  (g1, 'GS',            '107-02-000',   'Suporte de ferro L1700, ST1700 e ECO 1700',                13.00, 35.5, 15, 15, 5),
  (g1, 'GSV 1800L',     '107-17-001',   'Suporte de ferro IT-1800L & ILE 1800L',                    22.00, 35.5, 15, 15, 6),
  (g1, 'GSV 1800S',     '107-17-000',   'Suporte de ferro IT-1800S & ILE 1800S',                    22.00, 35.5, 15, 15, 7);
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, 'COVER PFL',     '302-06-010', 'Capa de tecido PFL',        12.00, 35.5, 15, 15, 1),
  (g2, 'BLUE FOAM PFL', '302-06-011', 'Espuma Soft Blue 7mm PFL',  13.00, 35.5, 15, 15, 2),
  (g2, 'Balancer',      '302-00-051', 'Balancim de ferro',          23.60, 35.5, 15, 15, 3),
  (g2, 'Trolley',       '302-00-049', 'Carrinho para balancim',     27.80, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g3, NULL, '3 caixas cartão (136×86×35 + 65×50×102 + 150×46×23 cm)', 40.00, 35.5, 15, 15, 1),
  (g3, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 17. FLEX PFP-AIR — Abertura de costura calças (p.40) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'FLEX PFP-AIR', 'Máquina de abertura de costura de calças com jato de ar e almofada tubular W700 Ø120mm. 0.7kW.', 'Mesas Costura', 170)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX PFP-AIR',     '102-39-001', 'Mesa abertura costura calças — S 400V',    400, TRUE, FALSE, 0.7, 1490.00, 35.5, 15, 15),
  (fam, 'FLEX PFP-AIR',     '102-39-002', 'Mesa abertura costura calças — S 230V',    230, TRUE, FALSE, 0.7, 1520.00, 35.5, 15, 15),
  (fam, 'FLEX PFP-AIR S+B', '102-39-003', 'Mesa abertura costura calças — S+B 400V',  400, TRUE, TRUE,  0.7, 1755.00, 35.5, 15, 15),
  (fam, 'FLEX PFP-AIR S+B', '102-39-004', 'Mesa abertura costura calças — S+B 230V',  230, TRUE, TRUE,  0.7, 1785.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;

INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'Double Leg Buck', NULL, 'Buck duplo de pernas (extra)',          491.00, 35.5, 15, 15, 1),
  (g1, '220V III 60Hz',   NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 2);

INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 18a. FLEX - EXS — Abertura costura manga exterior (p.41) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'FLEX - EXS', 'Máquina de abertura de costura da manga exterior. 2×250W, Ø120mm.', 'Mesas Costura', 180)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX - EXS',     '102-26-001', 'Abertura manga exterior — S 400V',    400, TRUE, FALSE, 0.5, 1475.00, 35.5, 15, 15),
  (fam, 'FLEX - EXS',     '102-23-011', 'Abertura manga exterior — S 230V',    230, TRUE, FALSE, 0.5, 1507.00, 35.5, 15, 15),
  (fam, 'FLEX - EXS/S+B', '102-27-001', 'Abertura manga exterior — S+B 400V',  400, TRUE, TRUE,  0.5, 1585.00, 35.5, 15, 15),
  (fam, 'FLEX - EXS/S+B', '102-23-012', 'Abertura manga exterior — S+B 230V',  230, TRUE, TRUE,  0.5, 1620.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 18b. PERFECT - EXS — Abertura costura manga exterior (p.41) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'PERFECT - EXS', 'Máquina de abertura de costura da manga exterior gama superior. 2×250W, Ø120mm.', 'Mesas Costura', 185)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PERFECT - EXS',     '102-07-000', 'Abertura manga exterior Perfect — S 400V',    400, TRUE, FALSE, 0.5, 1700.00, 35.5, 15, 15),
  (fam, 'PERFECT - EXS',     '102-07-004', 'Abertura manga exterior Perfect — S 230V',    230, TRUE, FALSE, 0.5, 1730.00, 35.5, 15, 15),
  (fam, 'PERFECT-EXS/S+B',   '102-07-002', 'Abertura manga exterior Perfect — S+B 400V',  400, TRUE, TRUE,  0.5, 1810.00, 35.5, 15, 15),
  (fam, 'PERFECT-EXS/S+B',   '102-07-005', 'Abertura manga exterior Perfect — S+B 230V',  230, TRUE, TRUE,  0.5, 1850.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 19a. FLEX - INS — Abertura costura manga interior (p.42) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'FLEX - INS', 'Máquina de abertura de costura da manga interior. 2×250W, Ø120mm.', 'Mesas Costura', 190)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX - INS',     '102-23-000', 'Abertura manga interior — S 400V',    400, TRUE, FALSE, 0.5, 1475.00, 35.5, 15, 15),
  (fam, 'FLEX - INS',     '102-23-009', 'Abertura manga interior — S 230V',    230, TRUE, FALSE, 0.5, 1505.00, 35.5, 15, 15),
  (fam, 'FLEX - INS/S+B', '102-23-001', 'Abertura manga interior — S+B 400V',  400, TRUE, TRUE,  0.5, 1585.00, 35.5, 15, 15),
  (fam, 'FLEX - INS/S+B', '102-23-010', 'Abertura manga interior — S+B 230V',  230, TRUE, TRUE,  0.5, 1620.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 19b. PERFECT - INS — Abertura costura manga interior (p.42) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'PERFECT - INS', 'Máquina de abertura de costura da manga interior gama superior. 2×250W, Ø120mm.', 'Mesas Costura', 195)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PERFECT - INS',     '102-08-000', 'Abertura manga interior Perfect — S 400V',    400, TRUE, FALSE, 0.5, 1700.00, 35.5, 15, 15),
  (fam, 'PERFECT - INS',     '102-08-003', 'Abertura manga interior Perfect — S 230V',    230, TRUE, FALSE, 0.5, 1730.00, 35.5, 15, 15),
  (fam, 'PERFECT-INS/S+B',   '102-08-002', 'Abertura manga interior Perfect — S+B 400V',  400, TRUE, TRUE,  0.5, 1810.00, 35.5, 15, 15),
  (fam, 'PERFECT-INS/S+B',   '102-08-004', 'Abertura manga interior Perfect — S+B 230V',  230, TRUE, TRUE,  0.5, 1850.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 20a. FLEX - PFJ — Abertura costura casaco (p.43) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'FLEX - PFJ', 'Máquina de abertura de costura de casacos/jaquetas. 3×400W, 1.2kW. Só sucção (sem sopro).', 'Mesas Costura', 200)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX - PFJ', '102-30-000', 'Abertura costura casaco — S 400V', 400, TRUE, FALSE, 1.2, 1690.00, 35.5, 15, 15),
  (fam, 'FLEX - PFJ', '102-30-004', 'Abertura costura casaco — S 230V', 230, TRUE, FALSE, 1.2, 1730.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 20b. PERFECT - PFJ — Abertura costura casaco (p.43) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'PERFECT - PFJ', 'Máquina de abertura de costura de casacos/jaquetas gama superior. 3×400W, 1.2kW. Só sucção.', 'Mesas Costura', 205)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PERFECT - PFJ', '102-09-000', 'Abertura costura casaco Perfect — S 400V', 400, TRUE, FALSE, 1.2, 1920.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFJ', '102-09-003', 'Abertura costura casaco Perfect — S 230V', 230, TRUE, FALSE, 1.2, 1955.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 21a. FLEX - PFP — Abertura costura calças (p.44) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'FLEX - PFP', 'Máquina de abertura de costura de calças gama FLEX. 0.7kW. Almofada tubular W700 Ø120mm.', 'Mesas Costura', 210)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX - PFP',      '102-23-006', 'Abertura costura calças FLEX — S 400V',   400, TRUE, FALSE, 0.7, 1365.00, 35.5, 15, 15),
  (fam, 'FLEX - PFP',      '102-23-013', 'Abertura costura calças FLEX — S 230V',   230, TRUE, FALSE, 0.7, 1400.00, 35.5, 15, 15),
  (fam, 'FLEX - PFP S+B',  '102-23-014', 'Abertura costura calças FLEX — S+B 400V', 400, TRUE, TRUE,  0.7, 1630.00, 35.5, 15, 15),
  (fam, 'FLEX - PFP S+B',  '102-23-015', 'Abertura costura calças FLEX — S+B 230V', 230, TRUE, TRUE,  0.7, 1650.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'Double Leg Buck', NULL, 'Almofada dupla perna (Double Leg Buck)',   382.00, 35.5, 15, 15, 1),
  (g1, '220V III 60Hz',   NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 2);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 21b. PERFECT - PFP — Abertura costura calças (p.44) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'PERFECT - PFP', 'Máquina de abertura de costura de calças gama PERFECT. 0.7kW. Almofada tubular W700 Ø120mm.', 'Mesas Costura', 215)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PERFECT - PFP',      '102-10-000', 'Abertura costura calças PERFECT — S 400V',   400, TRUE, FALSE, 0.7, 1585.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFP',      '102-10-003', 'Abertura costura calças PERFECT — S 230V',   230, TRUE, FALSE, 0.7, 1615.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFP S+B',  '102-10-004', 'Abertura costura calças PERFECT — S+B 400V', 400, TRUE, TRUE,  0.7, 1810.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFP S+B',  '102-10-005', 'Abertura costura calças PERFECT — S+B 230V', 230, TRUE, TRUE,  0.7, 1835.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'Double Leg Buck', NULL, 'Almofada dupla perna (Double Leg Buck)',   382.00, 35.5, 15, 15, 1),
  (g1, '220V III 60Hz',   NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 2);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 22a. FLEX - PFTU — Acabamento calças (p.45) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'FLEX - PFTU', 'Máquina para acabamento e engomagem da parte superior das calças gama FLEX. 1kW.', 'Mesas Costura', 220)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'FLEX - PFTU',      '102-11-011', 'Acabamento calças FLEX — S 400V',   400, TRUE, FALSE, 1.0, 1455.00, 35.5, 15, 15),
  (fam, 'FLEX - PFTU',      '102-11-007', 'Acabamento calças FLEX — S 230V',   230, TRUE, FALSE, 1.0, 1485.00, 35.5, 15, 15),
  (fam, 'FLEX - PFTU/S+B',  '102-11-003', 'Acabamento calças FLEX — S+B 400V', 400, TRUE, TRUE,  1.0, 1705.00, 35.5, 15, 15),
  (fam, 'FLEX - PFTU/S+B',  '102-11-009', 'Acabamento calças FLEX — S+B 230V', 230, TRUE, TRUE,  1.0, 1730.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 22b. PERFECT - PFTU — Acabamento calças (p.45) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'PERFECT - PFTU', 'Máquina para acabamento e engomagem da parte superior das calças gama PERFECT. 1kW.', 'Mesas Costura', 225)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'PERFECT - PFTU',     '102-11-004', 'Acabamento calças PERFECT — S 400V',   400, TRUE, FALSE, 1.0, 1680.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFTU',     '102-11-005', 'Acabamento calças PERFECT — S 230V',   230, TRUE, FALSE, 1.0, 1710.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFTU/S+B', '102-11-000', 'Acabamento calças PERFECT — S+B 400V', 400, TRUE, TRUE,  1.0, 2010.00, 35.5, 15, 15),
  (fam, 'PERFECT - PFTU/S+B', '102-11-008', 'Acabamento calças PERFECT — S+B 230V', 230, TRUE, TRUE,  1.0, 2040.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 31.50, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 150.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ============================================================
-- MESAS PARA SUTIÃS / LINGERIE
-- ============================================================

-- ---- 23. ECO FL BRA (p.46) — só 230V, sucção, embalagem incluída no preço ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Eco FL BRA', 'Mesa de engomar FL para sutiãs e lingerie. Superfície em forma de copo. 230V-1ph. Embalagem incluída.', 'Mesas Lingerie', 230)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'ECO FL BRA',   '102-27-006', 'Eco FL BRA — S 230V (embalagem incluída)',         230, TRUE, FALSE, 0.5,  826.00, 35.5, 15, 15),
  (fam, 'ECO FL BRA+',  '102-27-007', 'Eco FL BRA versão superior — S 230V (embalagem incluída)', 230, TRUE, FALSE, 0.5, 1010.00, 35.5, 15, 15);


-- ---- 24. ECO BRA (p.47) — só 230V, sucção, embalagem incluída no preço ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Eco BRA', 'Mesa de engomar para sutiãs e lingerie. 230V-1ph. Embalagem incluída no preço.', 'Mesas Lingerie', 240)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'ECO BRA', '102-27-008', 'Eco BRA — S 230V (embalagem incluída)', 230, TRUE, FALSE, 0.5, 945.00, 35.5, 15, 15);


-- ============================================================
-- MESAS PARA CORTINADOS / DECORAÇÃO
-- ============================================================

-- ---- 25. MOTO DECO 3000 (p.48) ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Moto Deco 3000', 'Mesa de engomar motorizada para cortinados. Superfície 300×55cm, altura 85cm. 2 motores 2×0.55kW sucção, 2kW aquecimento.', 'Decoração', 250)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Moto Deco 3000',   '102-34-000', 'Moto Deco 3000 — S 400V',              400, TRUE, FALSE, 2.0, 5670.00, 35.5, 15, 15),
  (fam, 'Moto Deco 3000',   '102-34-001', 'Moto Deco 3000 — S 230V',              230, TRUE, FALSE, 2.0, 5830.00, 35.5, 15, 15),
  (fam, 'Moto Deco 3000/2', '102-34-003', 'Moto Deco 3000/2 — S 400V (2 postos)', 400, TRUE, FALSE, 2.0, 6660.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz', NULL, 'Opção tensão 220V III 60Hz (3F s/ neutro)', 105.00, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira', 350.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 26. DECO PLUS (p.49-50) ----
-- Modelos grandes (3070/2570/2070): 2 motores 2×0.75HP sucção, 2kW aquecimento
-- Modelos compactos (150/180): 1 motor sucção, 1.5kW aquecimento
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Deco Plus', 'Mesa de engomar para cortinados e têxteis-lar com motor e painel de controlo.', 'Decoração', 260)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Deco Plus 3070', '102-12-000', 'Deco Plus 3070 — S 400V, 2×0.75HP, 2kW', 400, TRUE, FALSE, 2.0, 2780.00, 35.5, 15, 15),
  (fam, 'Deco Plus 3070', '102-12-006', 'Deco Plus 3070 — S 230V, 2×0.75HP, 2kW', 230, TRUE, FALSE, 2.0, 2890.00, 35.5, 15, 15),
  (fam, 'Deco Plus 2570', '102-12-004', 'Deco Plus 2570 — S 400V, 2×0.75HP, 2kW', 400, TRUE, FALSE, 2.0, 2345.00, 35.5, 15, 15),
  (fam, 'Deco Plus 2570', '102-12-012', 'Deco Plus 2570 — S 230V, 2×0.75HP, 2kW', 230, TRUE, FALSE, 2.0, 2455.00, 35.5, 15, 15),
  (fam, 'Deco Plus 2070', '102-12-013', 'Deco Plus 2070 — S 400V, 2×0.75HP, 2kW', 400, TRUE, FALSE, 2.0, 1800.00, 35.5, 15, 15),
  (fam, 'Deco Plus 2070', '102-12-014', 'Deco Plus 2070 — S 230V, 2×0.75HP, 2kW', 230, TRUE, FALSE, 2.0, 1835.00, 35.5, 15, 15),
  (fam, 'Deco Plus 150',  '102-12-001', 'Deco Plus 150 — S 400V, 1.5kW',          400, TRUE, FALSE, 1.5, 1705.00, 35.5, 15, 15),
  (fam, 'Deco Plus 150',  '102-12-002', 'Deco Plus 150 — S 230V, 1.5kW',          230, TRUE, FALSE, 1.5, 1740.00, 35.5, 15, 15),
  (fam, 'Deco Plus 180',  '102-12-007', 'Deco Plus 180 — S 400V, 1.5kW',          400, TRUE, FALSE, 1.5, 1850.00, 35.5, 15, 15),
  (fam, 'Deco Plus 180',  '102-12-009', 'Deco Plus 180 — S 230V, 1.5kW',          230, TRUE, FALSE, 1.5, 1885.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, '220V III 60Hz (só 3070)', NULL, 'Opção tensão 220V III 60Hz para Deco Plus 3070 (3F s/ neutro)', 105.00, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira (modelos 2070/2570/3070)', 220.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Caixa de madeira (modelos 150/180)',        140.00, 35.5, 15, 15, 2),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 3);


-- ---- 27. VL 2 — Cabine de limpeza (p.50) ----
-- Inclui: pistola de ar c/ regulação, sistema Vario, iluminação, suporte de manchas
-- Acessório extra: pistola de pulverização de líquido de limpeza
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'VL 2', 'Cabine de limpeza para remoção de manchas em todo o tipo de tecidos. Dois motores 2×0.50HP sucção. 230V-1ph.', 'Decoração', 270)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'VL2', '101-00-007', 'Cabine de limpeza VL 2 — 230V, 2×0.50HP', 230, TRUE, FALSE, 0.0, 1235.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, NULL, 'Pistola de pulverização de líquido de limpeza', 0.00, 35.5, 15, 15, 1);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira (120×71×162 cm)', 90.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ============================================================
-- GERADORES DE VAPOR (p.51-62)
-- ============================================================

-- ---- 28. MAGIC INOX (p.51 + p.60) ----
-- 103-11-001: com ferro ECO 1700 incluso, 1kW, 2kg/h, €192
-- 103-11-006: com Steamer (vaporizador de cabide), 1kW, 2kg/h, €315
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Magic Inox', 'Gerador de vapor compacto inox, 230V-1ph, 1kW, 2kg/h. Caldeira pressurizada profissional.', 'Geradores de Vapor', 280)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Magic Inox',         '103-11-001', 'Magic Inox com ferro ECO 1700 — 230V, 1kW, 2kg/h', 230, FALSE, FALSE, 1.0,  192.00, 35.5, 15, 15),
  (fam, 'Magic Inox Steamer', '103-11-006', 'Magic Inox com vaporizador de cabide — 230V, 1kW, 2kg/h', 230, FALSE, FALSE, 1.0, 315.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'BASE FOR ECO DOB',   '192-26-050', 'Base para Magic Inox na mesa ECO DOB',      27.30, 35.5, 15, 15, 1),
  (g1, 'INOX SIDE IRON REST','193-11-023', 'Suporte de ferro inox lateral (Magic Inox)',  7.70, 35.5, 15, 15, 2),
  (g1, 'HANDLE',             '303-11-013', 'Pega para caldeira Magic Inox',               4.40, 35.5, 15, 15, 3),
  (g1, 'TROLLEY',            '103-11-003', 'Carrinho para Magic Inox',                   60.00, 35.5, 15, 15, 4),
  (g1, 'AD/5/E',             '108-01-003', 'Adaptador de vapor para 2.ª saída',          82.00, 35.5, 15, 15, 5),
  (g1, 'B/180',              '303-01-000', 'Garrafa 1.8L c/ válvula para encher caldeiras', 3.90, 35.5, 15, 15, 6),
  (g1, 'TFA 1700/1800L',     '107-00-031', 'Sola teflon para ferros 1700 e 1800IL',       9.00, 35.5, 15, 15, 7),
  (g1, 'FINISHER',           '106-30-001', 'Vaporizador finisher',                       186.00, 35.5, 15, 15, 8),
  (g1, 'PA',                 '106-13-000', 'Pistola de vapor c/ acessórios e ficha 4P',  37.80, 35.5, 15, 15, 9),
  (g1, 'BRA 500',            '200-00-003', 'Escova de vapor finisher c/ ficha 4P',       118.00, 35.5, 15, 15, 10),
  (g1, 'ECO 1700',           '106-11-002', 'Ferro de vapor ECO 1700 c/ ficha',            71.00, 35.5, 15, 15, 11),
  (g1, 'Silicon iron rest',  '107-01-002', 'Suporte de ferro em silicone (M/V e M.I.)',    9.50, 35.5, 15, 15, 12);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Cartão (Magic Inox) — 50×40×24 cm',            9.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Cartão (Magic Inox com trolley) — 104×41×44 cm', 15.00, 35.5, 15, 15, 2);


-- ---- 29. ATMOS (p.52 + p.61) ----
-- 103-15-001: com ferro ECO 1700, 1.5kW, 2kg/h, €315
-- 103-15-004: ATMOS Steamer com pistola de vapor, 1.5kW, 2kg/h, €315
-- 103-15-003: ATMOS Steamer com finisher, 1.5kW, 2kg/h, €443
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Atmos', 'Gerador de vapor profissional com caldeira pressurizada, 230V-1ph, 1.5kW, 2kg/h, 4 bar.', 'Geradores de Vapor', 290)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Atmos',                 '103-15-001', 'Atmos com ferro ECO 1700 — 230V, 1.5kW, 2kg/h',    230, FALSE, FALSE, 1.5, 315.00, 35.5, 15, 15),
  (fam, 'Atmos Steamer c/ Pistola','103-15-004','Atmos Steamer com pistola de vapor — 230V, 1.5kW', 230, FALSE, FALSE, 1.5, 315.00, 35.5, 15, 15),
  (fam, 'Atmos Steamer c/ Finisher','103-15-003','Atmos Steamer com finisher — 230V, 1.5kW',        230, FALSE, FALSE, 1.5, 443.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'BASE FOR ECO DOB', '192-26-050', 'Base para Atmos na mesa ECO DOB',           27.30, 35.5, 15, 15, 1),
  (g1, 'TROLLEY',          '103-11-003', 'Carrinho para Atmos',                        60.00, 35.5, 15, 15, 2),
  (g1, 'AD/5E',            '108-01-003', 'Adaptador de vapor para 2.ª saída',          82.00, 35.5, 15, 15, 3),
  (g1, 'B/180',            '303-01-000', 'Garrafa 1.8L c/ válvula para encher caldeiras', 3.90, 35.5, 15, 15, 4),
  (g1, 'TFA 1700/1800L',   '107-00-031', 'Sola teflon para ferros 1700 e 1800IL',       9.00, 35.5, 15, 15, 5),
  (g1, 'FINISHER',         '106-30-001', 'Vaporizador finisher',                       186.00, 35.5, 15, 15, 6),
  (g1, 'PA',               '106-13-000', 'Pistola de vapor c/ acessórios e ficha 4P',  37.80, 35.5, 15, 15, 7),
  (g1, 'BRA 500',          '200-00-003', 'Escova de vapor finisher c/ ficha 4P',       118.00, 35.5, 15, 15, 8),
  (g1, 'Ferro MINI',       '106-20-002', 'Ferro de vapor MINI com ficha 4P',           163.00, 35.5, 15, 15, 9),
  (g1, 'Antiscal 1kgr',    '200-06-135', 'Anticalcário (polímero solúvel em água)',      6.60, 35.5, 15, 15, 10),
  (g1, 'Blow-off Tank 8L', '303-03-039', 'Depósito de água 8L para vaporização',       17.90, 35.5, 15, 15, 11),
  (g1, 'ECO 1700',         '106-11-002', 'Ferro de vapor ECO 1700 c/ ficha',            71.00, 35.5, 15, 15, 12);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Cartão (Atmos p.52) — 50×30×40 cm',             8.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Cartão Atmos com trolley (p.52) — 104×42×44 cm', 15.00, 35.5, 15, 15, 2),
  (g2, NULL, 'Cartão (Atmos Steamer p.61) — 60×40×40 cm',     10.00, 35.5, 15, 15, 3);


-- ---- 30. STEAM TECH 1500 (p.53 + p.62) ----
-- 103-10-001: sem ferro, 1.5kW, 2kg/h, €485
-- 103-10-002: com ferro ECO1700, 1.5kW, 2kg/h, €525
-- 103-10-007: Steamer com pistola, 1.5kW, 2kg/h, €404
-- 103-10-008: Steamer com pistola, 2.5kW, 3.2kg/h, €467
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Steam Tech 1500', 'Gerador de vapor de alta pressão, 230V-1ph, 1500W (opção 2500W). Bomba automática. 3-4h autonomia.', 'Geradores de Vapor', 300)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Steam Tech 1500',               '103-10-001', 'Steam Tech 1500 sem ferro — 230V, 1.5kW, 2kg/h',            230, FALSE, FALSE, 1.5, 485.00, 35.5, 15, 15),
  (fam, 'Steam Tech 1500 c/ ECO1700',    '103-10-002', 'Steam Tech 1500 com ferro ECO1700 — 230V, 1.5kW, 2kg/h',    230, FALSE, FALSE, 1.5, 525.00, 35.5, 15, 15),
  (fam, 'Steam Tech 1500 Steamer 1.5kW', '103-10-007', 'Steam Tech 1500 Steamer c/ pistola — 230V, 1.5kW, 2kg/h',  230, FALSE, FALSE, 1.5, 404.00, 35.5, 15, 15),
  (fam, 'Steam Tech 1500 Steamer 2.5kW', '103-10-008', 'Steam Tech 1500 Steamer c/ pistola — 230V, 2.5kW, 3.2kg/h',230, FALSE, FALSE, 2.5, 467.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'AD/5/E',          '108-01-003', 'Adaptador de vapor para 2.ª saída',         82.00, 35.5, 15, 15, 1),
  (g1, 'TFA 1700/1800L',  '107-00-031', 'Sola teflon para ferros 1700 e 1800IL',      9.00, 35.5, 15, 15, 2),
  (g1, 'FINISHER',        '106-30-001', 'Vaporizador finisher',                      186.00, 35.5, 15, 15, 3),
  (g1, 'PA',              '106-13-000', 'Pistola de vapor c/ acessórios e ficha 4P', 38.00, 35.5, 15, 15, 4),
  (g1, 'BRA 500',         '200-00-003', 'Escova de vapor finisher c/ ficha 4P',      118.00, 35.5, 15, 15, 5),
  (g1, 'Blow-off Tank 10L','303-03-039','Depósito de água 10L para vaporização',      17.90, 35.5, 15, 15, 6),
  (g1, 'Antiscal 1kgr',   '200-06-135', 'Anticalcário (polímero solúvel em água)',    6.60, 35.5, 15, 15, 7),
  (g1, 'Ferro MINI',      '106-20-002', 'Ferro de vapor MINI com ficha 4P',          163.00, 35.5, 15, 15, 8),
  (g1, 'Blow-off Tank 8L','303-03-039', 'Depósito de água 8L para vaporização (Steamer)', 17.90, 35.5, 15, 15, 9),
  (g1, 'ECO 1700',        '106-11-002', 'Ferro de vapor ECO 1700 c/ ficha',           71.00, 35.5, 15, 15, 10);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Cartão (p.53) — 104×41×44 cm', 15.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Cartão (p.62) — 100×40×40 cm', 15.00, 35.5, 15, 15, 2),
  (g2, NULL, 'Palete — consultar preço',       0.00, 35.5, 15, 15, 3);


-- ---- 31. ECOVAPOR (p.54) — caldeira 8.5L, 3.5 bar ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Ecovapor', 'Gerador de vapor económico, caldeira 8.5L, 3.5 bar (4.5 bar disponível). Todos os modelos 230V ou 400V.', 'Geradores de Vapor', 310)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Ecovapor 1-2.5', '103-06-004', 'Ecovapor 1-2.5 — 230V, 2.5kW, 3.25kg/h, 1 saída', 230, FALSE, FALSE, 2.5,  675.00, 35.5, 15, 15),
  (fam, 'Ecovapor 1-4',   '103-06-003', 'Ecovapor 1-4   — 230V, 4kW,   5.2kg/h,  1 saída',  230, FALSE, FALSE, 4.0,  690.00, 35.5, 15, 15),
  (fam, 'Ecovapor 2-4',   '103-06-001', 'Ecovapor 2-4   — 230V, 4kW,   5.2kg/h,  2 saídas', 230, FALSE, FALSE, 4.0,  710.00, 35.5, 15, 15),
  (fam, 'Ecovapor 2-4',   '103-06-002', 'Ecovapor 2-4   — 400V, 4kW,   5.2kg/h,  2 saídas', 400, FALSE, FALSE, 4.0,  725.00, 35.5, 15, 15),
  (fam, 'Ecovapor 2-6',   '103-06-007', 'Ecovapor 2-6   — 400V, 6kW,   7.8kg/h,  2 saídas', 400, FALSE, FALSE, 6.0,  755.00, 35.5, 15, 15),
  (fam, 'Ecovapor 3-6',   '103-06-011', 'Ecovapor 3-6   — 400V, 6kW,   7.8kg/h,  3 saídas', 400, FALSE, FALSE, 6.0,  870.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'FLOATING SYSTEM KIT', '303-03-041-1', 'Kit float para ligação direta à rede de água', 32.50, 35.5, 15, 15, 1),
  (g1, 'BLOW-OFF TANK 10L',   '303-03-039',   'Depósito de água 10L para vaporização',         17.90, 35.5, 15, 15, 2),
  (g1, 'ANTISCAL 1Kg',        '200-06-135',   'Anticalcário (polímero solúvel em água)',         6.60, 35.5, 15, 15, 3),
  (g1, '4.5 bar upgrade',     NULL,            'Upgrade para 4.5 bar de pressão (por encomenda)', 49.00, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Cartão — 65×50×102 cm', 15.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete (máx. 8 unid.) — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 32. VAPORMAT (p.55) — caldeira 8.5L, 3.5 bar ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Vapormat', 'Gerador de vapor com suporte integrado, caldeira 8.5L, 3.5 bar (4.5 bar disponível).', 'Geradores de Vapor', 320)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Vapormat 1-2.5', '103-03-000', 'Vapormat 1-2.5 — 230V, 2.5kW, 3.25kg/h, 1 saída', 230, FALSE, FALSE, 2.5,  730.00, 35.5, 15, 15),
  (fam, 'Vapormat 1-4',   '103-03-001', 'Vapormat 1-4   — 230V, 4kW,   5.2kg/h,  1 saída',  230, FALSE, FALSE, 4.0,  740.00, 35.5, 15, 15),
  (fam, 'Vapormat 2-4',   '103-03-003', 'Vapormat 2-4   — 230V, 4kW,   5.2kg/h,  2 saídas', 230, FALSE, FALSE, 4.0,  765.00, 35.5, 15, 15),
  (fam, 'Vapormat 2-4',   '103-03-004', 'Vapormat 2-4   — 400V, 4kW,   5.2kg/h,  2 saídas', 400, FALSE, FALSE, 4.0,  780.00, 35.5, 15, 15),
  (fam, 'Vapormat 2-6',   '103-03-005', 'Vapormat 2-6   — 400V, 6kW,   7.8kg/h,  2 saídas', 400, FALSE, FALSE, 6.0,  815.00, 35.5, 15, 15),
  (fam, 'Vapormat 3-6',   '103-03-006', 'Vapormat 3-6   — 400V, 6kW,   7.8kg/h,  3 saídas', 400, FALSE, FALSE, 6.0,  930.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'FLOATING SYSTEM KIT', '303-03-041-1', 'Kit float para ligação direta à rede de água', 32.50, 35.5, 15, 15, 1),
  (g1, 'BLOW-OFF TANK 10L',   '303-03-039',   'Depósito de água 10L para vaporização',         17.90, 35.5, 15, 15, 2),
  (g1, 'ANTISCAL 1Kg',        '200-06-135',   'Anticalcário (polímero solúvel em água)',         6.60, 35.5, 15, 15, 3),
  (g1, '4.5 bar upgrade',     NULL,            'Upgrade para 4.5 bar de pressão (por encomenda)', 49.00, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Cartão — 65×50×102 cm', 15.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 33. ECOVAPOR-F FRONT (p.56) — caldeira 8.5L, 3.5 bar, instalação frontal ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Ecovapor-F', 'Gerador de vapor frontal para instalação sob bancada. Caldeira 8.5L, 3.5 bar (4.5 bar disponível).', 'Geradores de Vapor', 330)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Ecovapor-F 1-2.5', '103-14-002', 'Ecovapor-F 1-2.5 — 230V, 2.5kW, 3.25kg/h, 1 saída', 230, FALSE, FALSE, 2.5,  710.00, 35.5, 15, 15),
  (fam, 'Ecovapor-F 1-4',   '103-14-003', 'Ecovapor-F 1-4   — 230V, 4kW,   5.2kg/h,  1 saída',  230, FALSE, FALSE, 4.0,  720.00, 35.5, 15, 15),
  (fam, 'Ecovapor-F 2-4',   '103-14-001', 'Ecovapor-F 2-4   — 230V, 4kW,   5.2kg/h,  2 saídas', 230, FALSE, FALSE, 4.0,  740.00, 35.5, 15, 15),
  (fam, 'Ecovapor-F 2-4',   '103-14-004', 'Ecovapor-F 2-4   — 400V, 4kW,   5.2kg/h,  2 saídas', 400, FALSE, FALSE, 4.0,  755.00, 35.5, 15, 15),
  (fam, 'Ecovapor-F 2-6',   '103-14-005', 'Ecovapor-F 2-6   — 400V, 6kW,   7.8kg/h,  2 saídas', 400, FALSE, FALSE, 6.0,  790.00, 35.5, 15, 15),
  (fam, 'Ecovapor-F 3-6',   '103-14-006', 'Ecovapor-F 3-6   — 400V, 6kW,   7.8kg/h,  3 saídas', 400, FALSE, FALSE, 6.0,  910.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'BLOW-OFF TANK 10L', '303-03-039', 'Depósito de água 10L para vaporização',         17.90, 35.5, 15, 15, 1),
  (g1, 'ANTISCAL 1Kg',      '200-06-135', 'Anticalcário (polímero solúvel em água)',         6.60, 35.5, 15, 15, 2),
  (g1, '4.5 bar upgrade',   NULL,          'Upgrade para 4.5 bar de pressão (por encomenda)', 49.00, 35.5, 15, 15, 3);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Cartão — 65×50×102 cm', 15.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 34. STEAMY (p.57) — caldeira 8.5L, 3.5 bar, com PSH/V e PA ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'Steamy', 'Gerador de vapor industrial de alta capacidade. Caldeira 8.5L, 3.5 bar. Inclui vaporizador com câmara de vapor para vapor seco.', 'Geradores de Vapor', 340)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'Steamy 2-6', '103-07-002', 'Steamy 2-6 — 230V, 6kW, 7.8kg/h, 2 saídas (1 pistola + 1 ferro)', 230, FALSE, FALSE, 6.0,  1580.00, 35.5, 15, 15),
  (fam, 'Steamy 2-6', '103-07-004', 'Steamy 2-6 — 400V, 6kW, 7.8kg/h, 2 saídas (1 pistola + 1 ferro)', 400, FALSE, FALSE, 6.0,  1640.00, 35.5, 15, 15),
  (fam, 'Steamy 2-9', '103-07-001', 'Steamy 2-9 — 400V, 10.5kW, 13.6kg/h, 2 saídas (1 pistola + 1 ferro)', 400, FALSE, FALSE, 10.5, 1690.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'PSH/V',              '106-13-003',   'Pistola de vapor c/ câmara de vapor (vapor seco)', 191.00, 35.5, 15, 15, 1),
  (g1, 'PA',                 '106-13-000',   'Pistola de vapor c/ acessórios e ficha 4P',          38.00, 35.5, 15, 15, 2),
  (g1, 'FLOATING SYSTEM KIT','303-03-041-1', 'Kit float para ligação direta à rede de água',       32.50, 35.5, 15, 15, 3),
  (g1, 'ANTISCAL 1Kg',       '200-06-135',   'Anticalcário (polímero solúvel em água)',              6.60, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Cartão — 65×50×102 cm', 15.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Palete — consultar preço', 0.00, 35.5, 15, 15, 2);


-- ---- 35. SG 15 (p.58) — caldeira 50L, 3.5 bar, bomba de água integrada, 400V ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'SG 15', 'Gerador de vapor industrial. Caldeira 50L, 3.5 bar (4.5 bar disponível). Bomba de água integrada. Fornece até 4 ferros.', 'Geradores de Vapor', 350)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'SG 15', '103-04-000', 'SG 15 — 400V, 10kW, 25.4kg/h, bomba integrada', 400, FALSE, FALSE, 10.0, 1000.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'E/T7515',    '103-04-010', 'Depósito inox 75L c/ float e material ligação', 305.00, 35.5, 15, 15, 1),
  (g1, 'K6/2',       '108-00-000', 'Unidade condensadora de vapor p/ ferros',        126.00, 35.5, 15, 15, 2),
  (g1, 'AD/5',       '108-01-000', 'Condensador de vapor pequeno p/ ferros',          82.00, 35.5, 15, 15, 3),
  (g1, 'STEAM LINE', NULL,         'Rede de vapor — consultar preço',                  0.00, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira só SG15 — 89×64×78 cm', 70.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Caixa de madeira SG15 + E/T7515 — 120×65×100 cm', 80.00, 35.5, 15, 15, 2),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 3);


-- ---- 36. SG 39 / SG 48 (p.59) — caldeira 50L, 6 bar industrial ----
INSERT INTO product_families (brand, name, description, series, sort_order)
VALUES ('PRIMULA', 'SG 39 / SG 48', 'Geradores de vapor industriais de alta capacidade. Caldeira 50L, 6 bar. Dois programas de produção de vapor.', 'Geradores de Vapor', 360)
RETURNING id INTO fam;

INSERT INTO product_variants (family_id, model, code, description, volt, suction, blowing, heating_kw, cost_price, sale_config_value, resale_config_value, volume_resale_config_value)
VALUES
  (fam, 'SG 39', '103-05-000', 'SG 39 — 400V, 2×19.5kW, 26-52kg/h', 400, FALSE, FALSE, 39.0, 2780.00, 35.5, 15, 15),
  (fam, 'SG 48', '103-08-000', 'SG 48 — 400V, 2×24kW,   32-64kg/h', 400, FALSE, FALSE, 48.0, 3000.00, 35.5, 15, 15);

INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Acessórios Extra', 'multi_select',  1) RETURNING id INTO g1;
INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Embalagem',        'single_select', 2) RETURNING id INTO g2;
INSERT INTO options (group_id, model, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g1, 'E/T7515',    '103-04-010', 'Depósito inox 75L c/ float e material ligação', 305.00, 35.5, 15, 15, 1),
  (g1, 'K6/2',       '108-00-000', 'Unidade condensadora de vapor p/ ferros',        126.00, 35.5, 15, 15, 2),
  (g1, 'AD/5',       '108-01-000', 'Condensador de vapor pequeno p/ ferros',          82.00, 35.5, 15, 15, 3),
  (g1, 'STEAM LINE', NULL,         'Rede de vapor — consultar preço',                  0.00, 35.5, 15, 15, 4);
INSERT INTO options (group_id, code, description, cost_price, sale_config_value, resale_config_value, volume_resale_config_value, sort_order) VALUES
  (g2, NULL, 'Caixa de madeira só SG39 — 74×74×112 cm', 70.00, 35.5, 15, 15, 1),
  (g2, NULL, 'Caixa de madeira SG39 + E/T7539 — 110×72×112 cm', 80.00, 35.5, 15, 15, 2),
  (g2, NULL, 'Caixa de madeira só SG48 — 74×74×112 cm', 70.00, 35.5, 15, 15, 3),
  (g2, NULL, 'Caixa de madeira SG48 + E/T7548 — 110×72×112 cm', 80.00, 35.5, 15, 15, 4),
  (g2, NULL, 'Palete ISPM (tratamento calor/fumigação) — consultar preço', 0.00, 35.5, 15, 15, 5);

END $$;
