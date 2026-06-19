-- Brother machine families
DELETE FROM product_families WHERE brand = 'BROTHER';

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'SL777B', 'Máquina de Costura Ponto Corrido 1 agulha', 10)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'SL777B-32-32', 'SL777B-32-32', 'Máquina de Costura Ponto Corrido 1 agulha', 1085.0000, 'margin', 35.3011, 'percent_discount', 19.4991, 'percent_discount', 19.4991),
    (fam, 'SL777B-32-48', 'SL777B-32-48', 'Máquina de Costura Ponto Corrido 1 agulha', 1085.0000, 'margin', 35.3011, 'percent_discount', 19.4991, 'percent_discount', 19.4991),
    (fam, 'SL777B-32-64', 'SL777B-32-64', 'Máquina de Costura Ponto Corrido 1 agulha', 1085.0000, 'margin', 35.3011, 'percent_discount', 19.4991, 'percent_discount', 19.4991);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, Drop Feed, sem corte de linha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Com corte vertical lateral', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Velocidade máx. de costura 4500 rpm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento máx. do ponto: 4,0 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Altura do calcador 6 mm - levantamento de joelho 13 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Para materiais médios', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, '(Servo motor não incluido)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'SL777B-32-32', 'Cabeça', 'Cabeça', 802.0000, 'price', 1234.0000, 'percent_discount', 19.5300, 'percent_discount', 19.5300, 1),
    (g_ver, 'SL777B-32-32', 'Completa', 'Completa', 1085.0000, 'price', 1677.0000, 'percent_discount', 19.4991, 'percent_discount', 19.4991, 2),
    (g_ver, 'SL777B-32-48', 'Cabeça', 'Cabeça', 802.0000, 'price', 1234.0000, 'percent_discount', 19.5300, 'percent_discount', 19.5300, 3),
    (g_ver, 'SL777B-32-48', 'Completa', 'Completa', 1085.0000, 'price', 1677.0000, 'percent_discount', 19.4991, 'percent_discount', 19.4991, 4),
    (g_ver, 'SL777B-32-64', 'Cabeça', 'Cabeça', 802.0000, 'price', 1234.0000, 'percent_discount', 19.5300, 'percent_discount', 19.5300, 5),
    (g_ver, 'SL777B-32-64', 'Completa', 'Completa', 1085.0000, 'price', 1677.0000, 'percent_discount', 19.4991, 'percent_discount', 19.4991, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000608', 'N40000608', 'CA-E-BI/SL1110 Tampo ECO 105x55x4', 48.0000, 'price', 74.0000, 'percent_discount', 20.2703, 'percent_discount', 20.2703, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385 Bancada Versão Superior C/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'ZFUPMXASU275', 'ZFUPMXASU275', 'PMX-ASU27-5 220V Servo motor Powermax', 140.0000, 'price', 216.0000, 'percent_discount', 16.6667, 'percent_discount', 16.6667, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 1),
    (g_opt, 'ZT72280G2', 'ZT72280G2', 'FIR1148.2T37 RPM2800 CLUTCH MOTOR', 162.0000, 'price', 250.0000, 'percent_discount', 6.0000, 'percent_discount', 6.0000, 2),
    (g_opt, 'N10006079', 'N10006079', 'BZ-10x6x1100/LR V-Belt DIN2215', 10.0000, 'price', 16.0000, 'percent_discount', 25.0000, 'percent_discount', 25.0000, 3),
    (g_opt, 'N40000175', 'N40000175', 'CA-2702.T.B Com bobine e cabos para 3PH', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 4),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 5),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 59.6774, 'percent_discount', 59.6774, 6);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'S7780A', 'Máquina de Costura 1 agulha c/ Direct Drive e corte lateral', 20)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'S7780A-503-32-32', 'S7780A-503-32-32', 'Máquina de Costura 1 agulha c/ Direct Drive e corte lateral', 2439.0000, 'margin', 34.9947, 'percent_discount', 19.4829, 'percent_discount', 19.4829),
    (fam, 'S7780A-503-32-64', 'S7780A-503-32-64', 'Máquina de Costura 1 agulha c/ Direct Drive e corte lateral', 2439.0000, 'margin', 34.9947, 'percent_discount', 19.4829, 'percent_discount', 19.4829);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, Direct Drive, Sistema de Alimentação Eletrónico', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'DIGIFLEX FEED diretamente ligado ao motor de passo,', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'corte de linha, remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Com corte vertical lateral - Abertura larga de desperdício', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Máx. espessura do material: 4,0mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Velocidade máx. de costura: 4500 r.p.m', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Comprimento máx. do ponto: 4,0', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Altura do calcador: 5 mm - levantamento de joelho 13 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Pontos perfeitos, Eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Luz integrada', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'S7780A-503-32-32', 'Cabeça + Caixa', 'Cabeça + Caixa', 2245.0000, 'price', 3454.0000, 'percent_discount', 19.5136, 'percent_discount', 19.5136, 1),
    (g_ver, 'S7780A-503-32-32', 'Completa', 'Completa', 2439.0000, 'price', 3752.0000, 'percent_discount', 19.4829, 'percent_discount', 19.4829, 2),
    (g_ver, 'S7780A-503-32-64', 'Cabeça + Caixa', 'Cabeça + Caixa', 2245.0000, 'price', 3454.0000, 'percent_discount', 19.5136, 'percent_discount', 19.5136, 3),
    (g_ver, 'S7780A-503-32-64', 'Completa', 'Completa', 2439.0000, 'price', 3752.0000, 'percent_discount', 19.4829, 'percent_discount', 19.4829, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001213', 'N40001213', 'CA-E-BI/S7250A TAMPO 105x55x4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385 Bancada Versão Superios C/vareta ROD +PEDAL S424. Altura Adjustavel', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BS7780A6230S64242L', 'BS7780A6230S64242L', 'S7780A-503-32-64', 2439.0000, 'price', 3753.0000, 'percent_discount', 19.5044, 'percent_discount', 19.5044, 1),
    (g_opt, 'N40001229', 'N40001229', '1PF-8ML1', 101.0000, 'price', 156.0000, 'percent_discount', 19.8718, 'percent_discount', 19.8718, 2),
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 3),
    (g_opt, 'N40001214', 'N40001214', 'CA-E-BI/S7250A Tampo 120x60x4', 75.0000, 'price', 116.0000, 'percent_discount', 19.8276, 'percent_discount', 19.8276, 4),
    (g_opt, 'N40001169', 'N40001169', 'CA-E-BI/S7250A TAMPO ECO 105x55x4', 48.0000, 'price', 74.0000, 'percent_discount', 20.2703, 'percent_discount', 20.2703, 5),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 54.9020, 'percent_discount', 54.9020, 6),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 54.0323, 'percent_discount', 54.0323, 7),
    (g_opt, 'N40000800', 'N40000800', 'Dispositivo para segurar a linha superior', 10.0000, 'price', 16.0000, 'percent_discount', 25.0000, 'percent_discount', 25.0000, 8),
    (g_opt, 'N40002254', 'N40002254', 'UG-LUCK-S7780A DISPOSITIVO DE VÁCUO', 414.0000, 'price', 637.0000, 'percent_discount', 19.4662, 'percent_discount', 19.4662, 9),
    (g_opt, 'SB7924001', 'SB7924001', 'Interruptor manual adicional', 37.1000, 'price', 58.0000, 'percent_discount', 20.6897, 'percent_discount', 20.6897, 10);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'S6280A', 'Máquina de Costura Ponto Corrido 1 agulha Direct Drive', 30)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'S-6280A-813 II', 'S-6280A-813 II', 'Máquina de Costura Ponto Corrido 1 agulha Direct Drive', 573.0000, 'margin', 34.9603, 'percent_discount', 19.4098, 'percent_discount', 19.4098),
    (fam, 'S-6280A-815 II', 'S-6280A-815 II', 'Máquina de Costura Ponto Corrido 1 agulha Direct Drive', 573.0000, 'margin', 34.9603, 'percent_discount', 19.4098, 'percent_discount', 19.4098);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, Drop Feed, Direct Drive, com corte de linha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Tira linhas, remate automático. Painel de controlo Integrado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Velocidade máx. de costura 4000 - 5000 rpm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento máx. do ponto 4,2 - 5,0 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Altura do calcador 6 mm - Levantador de joelho 13 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Costura perfeita e eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Luz integrada', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Calcador Integrado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'S-6280A-813 II', 'Cabeça + Caixa', 'Cabeça + Caixa', 470.0000, 'price', 723.0000, 'percent_discount', 19.5021, 'percent_discount', 19.5021, 1),
    (g_ver, 'S-6280A-813 II', 'Completa', 'Completa', 573.0000, 'price', 881.0000, 'percent_discount', 19.4098, 'percent_discount', 19.4098, 2),
    (g_ver, 'S-6280A-815 II', 'Cabeça + Caixa', 'Cabeça + Caixa', 470.0000, 'price', 723.0000, 'percent_discount', 19.5021, 'percent_discount', 19.5021, 3),
    (g_ver, 'S-6280A-815 II', 'Completa', 'Completa', 573.0000, 'price', 881.0000, 'percent_discount', 19.4098, 'percent_discount', 19.4098, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'D00006174', 'D00006174', 'DO-Tampo S6280A 120x60x5', 25.0000, 'price', 39.0000, 'percent_discount', 20.5128, 'percent_discount', 20.5128, 1),
    (g_ban, 'D00006199', 'D00006199', 'DO-Bancada C/RODAS Ajustável', 33.0000, 'price', 51.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 2),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 3);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40002399', 'N40002399', 'CA-E-BI/S6280A.TAMPO ECO 105X55X4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'S7180A', 'Máquina de Costura Ponto Corrido Direct Drive', 40)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'S-7180A-813P II', 'S-7180A-813P II', 'Máquina de Costura Ponto Corrido Direct Drive', 653.0000, 'margin', 34.9602, 'percent_discount', 19.4223, 'percent_discount', 19.4223),
    (fam, 'S-7180A-815P II', 'S-7180A-815P II', 'Máquina de Costura Ponto Corrido Direct Drive', 653.0000, 'margin', 34.9602, 'percent_discount', 19.4223, 'percent_discount', 19.4223);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, Drop Feed, Direct Drive, com corte de linha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Tira linhas, remate automático. Painel de controlo Integrado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 4000 - 5000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento máximo do ponto 4,2 - 5,0 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Altura do calcador 6 mm - Levantador de joelho 13 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Costura perfeita e eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Luz integrada', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Calcador Integrado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Corte de linha curto', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'S-7180A-813P II', 'Cabeça + Caixa', 'Cabeça + Caixa', 550.0000, 'price', 846.0000, 'percent_discount', 19.5035, 'percent_discount', 19.5035, 1),
    (g_ver, 'S-7180A-813P II', 'Completa', 'Completa', 653.0000, 'price', 1004.0000, 'percent_discount', 19.4223, 'percent_discount', 19.4223, 2),
    (g_ver, 'S-7180A-815P II', 'Cabeça + Caixa', 'Cabeça + Caixa', 550.0000, 'price', 846.0000, 'percent_discount', 19.5035, 'percent_discount', 19.5035, 3),
    (g_ver, 'S-7180A-815P II', 'Completa', 'Completa', 653.0000, 'price', 1004.0000, 'percent_discount', 19.4223, 'percent_discount', 19.4223, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'D00006173', 'D00006173', 'DO-Tampo S7180A 120x60x5', 25.0000, 'price', 39.0000, 'percent_discount', 20.5128, 'percent_discount', 20.5128, 1),
    (g_ban, 'D00006199', 'D00006199', 'DO-Bancada C/RODAS Ajustável', 33.0000, 'price', 51.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 2),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 3);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40002240', 'N40002240', 'CA-E-BI/S7180A.TAMPO ECO 105X55X4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'S7250A', '700 STANDARD  Máquina de Costura Ponto Corrido, Corte de linha', 50)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'S7250A-703 STANDARD', 'S7250A-703 STANDARD', '700 STANDARD  Máquina de Costura Ponto Corrido, Corte de linha', 889.0000, 'margin', 34.9671, 'percent_discount', 19.3855, 'percent_discount', 19.3855),
    (fam, 'S7250A-705 STANDARD', 'S7250A-705 STANDARD', '700 STANDARD  Máquina de Costura Ponto Corrido, Corte de linha', 889.0000, 'margin', 34.9671, 'percent_discount', 19.3855, 'percent_discount', 19.3855);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, Direct Drive, Sistema de alimentação eletrónico', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'DIGIFLEX FEED diretamente ligado ao motor de passo', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'corte de linha, tira linhas, remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Dispositivo para segurar a linha superior', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Interruptor manual adicional', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 4000 - 5000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Comprimento máximo do ponto  5,0 - 7,0 mm.  (predefinido 5,0mm)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Altura do calcador 6 mm - Levantador de joelho 13 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Costura perfeita e eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Luz integrada', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'S7250A-703 STANDARD', 'Cabeça + Caixa', 'Cabeça + Caixa', 695.0000, 'price', 1069.0000, 'percent_discount', 19.4574, 'percent_discount', 19.4574, 1),
    (g_ver, 'S7250A-703 STANDARD', 'Completa', 'Completa', 889.0000, 'price', 1367.0000, 'percent_discount', 19.3855, 'percent_discount', 19.3855, 2),
    (g_ver, 'S7250A-705 STANDARD', 'Cabeça + Caixa', 'Cabeça + Caixa', 695.0000, 'price', 1069.0000, 'percent_discount', 19.4574, 'percent_discount', 19.4574, 3),
    (g_ver, 'S7250A-705 STANDARD', 'Completa', 'Completa', 889.0000, 'price', 1367.0000, 'percent_discount', 19.3855, 'percent_discount', 19.3855, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001213', 'N40001213', 'CA-E-BI/S7250A Tampo 105x55x4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001229', 'N40001229', '1PF-8ML1', 101.0000, 'price', 156.0000, 'percent_discount', 19.8718, 'percent_discount', 19.8718, 1),
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 2),
    (g_opt, 'N40001214', 'N40001214', 'CA-E-BI/S7250A Tampo 120x60x4', 75.0000, 'price', 116.0000, 'percent_discount', 19.8276, 'percent_discount', 19.8276, 3),
    (g_opt, 'N40001634', 'N40001634', 'PULLER PS/P204-S7250 W/AFL', 760.0000, 'price', 1170.0000, 'percent_discount', 19.5726, 'percent_discount', 19.5726, 4),
    (g_opt, 'N40001169', 'N40001169', 'CA-E-BI/S7250A Tampo ECO 105x55x4', 48.0000, 'price', 74.0000, 'percent_discount', 20.2703, 'percent_discount', 20.2703, 5),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 6),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 7);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'S7250A-PRE', '700 PREMIUM   Máquina de Costura Ponto Corrido, Corte de linha', 60)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'S7250A-703P-PREMIUM', 'S7250A-703P-PREMIUM', '700 PREMIUM   Máquina de Costura Ponto Corrido, Corte de linha', 964.0000, 'margin', 34.9966, 'percent_discount', 19.4201, 'percent_discount', 19.4201),
    (fam, 'S7250A-705P-PREMIUM', 'S7250A-705P-PREMIUM', '700 PREMIUM   Máquina de Costura Ponto Corrido, Corte de linha', 964.0000, 'margin', 34.9966, 'percent_discount', 19.4201, 'percent_discount', 19.4201);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, Direct Drive, Sistema de alimentação eletrónico', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'DIGIFLEX FEED diretamente ligado ao motor de passo', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'com duas lâminas móveis - linha sobrante curta', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Corte de linha, Tira linhas e remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Dispositivo para segurar a linha superior', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Interruptor manual adicional', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 4000 - 5000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Comprimento máximo do ponto 5,0 - 7,0 mm.  (predefinido 5,0mm)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Altura do calcador 6 mm -Levantador de joelho 13 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Costura perfeita e eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, 'Luz integrada', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'S7250A-703P-PREMIUM', 'Cabeça + Caixa', 'Cabeça + Caixa', 770.0000, 'price', 1185.0000, 'percent_discount', 19.4937, 'percent_discount', 19.4937, 1),
    (g_ver, 'S7250A-703P-PREMIUM', 'Completa', 'Completa', 964.0000, 'price', 1483.0000, 'percent_discount', 19.4201, 'percent_discount', 19.4201, 2),
    (g_ver, 'S7250A-705P-PREMIUM', 'Cabeça + Caixa', 'Cabeça + Caixa', 770.0000, 'price', 1185.0000, 'percent_discount', 19.4937, 'percent_discount', 19.4937, 3),
    (g_ver, 'S7250A-705P-PREMIUM', 'Completa', 'Completa', 964.0000, 'price', 1483.0000, 'percent_discount', 19.4201, 'percent_discount', 19.4201, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001213', 'N40001213', 'CA-E-BI/S7250A Tampo 105x55x4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior c/vareta ROD +PEDAL S424. Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001229', 'N40001229', '1PF-8ML1', 101.0000, 'price', 156.0000, 'percent_discount', 19.8718, 'percent_discount', 19.8718, 1),
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 2),
    (g_opt, 'N40001214', 'N40001214', 'CA-E-BI/S7250A Tampo 120x60x4', 75.0000, 'price', 116.0000, 'percent_discount', 19.8276, 'percent_discount', 19.8276, 3),
    (g_opt, 'N40001634', 'N40001634', 'PULLER PS/P204-S7250 W/AFL', 760.0000, 'price', 1170.0000, 'percent_discount', 19.5726, 'percent_discount', 19.5726, 4),
    (g_opt, 'N40001169', 'N40001169', 'CA-E-BI/S7250A Tampo ECO 105x55x4', 48.0000, 'price', 74.0000, 'percent_discount', 20.2703, 'percent_discount', 20.2703, 5),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 6),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 7);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'S7300A-S', 'Máquina de Costura Ponto Corrido Direct Drive', 70)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'S7300A-903 STANDARD', 'S7300A-903 STANDARD', 'Máquina de Costura Ponto Corrido Direct Drive', 1060.0000, 'margin', 34.9693, 'percent_discount', 19.4479, 'percent_discount', 19.4479),
    (fam, 'S7300A-905 STANDARD', 'S7300A-905 STANDARD', 'Máquina de Costura Ponto Corrido Direct Drive', 1060.0000, 'margin', 34.9693, 'percent_discount', 19.4479, 'percent_discount', 19.4479),
    (fam, 'S7300A-933 STANDARD', 'S7300A-933 STANDARD', 'Máquina de Costura Ponto Corrido Direct Drive', 1103.0000, 'margin', 34.9646, 'percent_discount', 19.4575, 'percent_discount', 19.4575);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, Direct Drive, Sistema de alimentação eletrónico', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'DIGIFLEX FEED diretamente ligado ao motor de passo,', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Corte de linha, Tira linhas e remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Levantamento do calcador, dispositivo de retenção da linha superior', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Painel tátil LCD Integrado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Entrada USB', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 4000 - 5000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Comprimento máximo do ponto  5,0 - 7,0 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Costura de alta qualidade, modelo eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'S7300A-903 STANDARD', 'Cabeça + Caixa', 'Cabeça + Caixa', 866.0000, 'price', 1332.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 1),
    (g_ver, 'S7300A-903 STANDARD', 'Completa', 'Completa', 1060.0000, 'price', 1630.0000, 'percent_discount', 19.4479, 'percent_discount', 19.4479, 2),
    (g_ver, 'S7300A-905 STANDARD', 'Cabeça + Caixa', 'Cabeça + Caixa', 866.0000, 'price', 1332.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 3),
    (g_ver, 'S7300A-905 STANDARD', 'Completa', 'Completa', 1060.0000, 'price', 1630.0000, 'percent_discount', 19.4479, 'percent_discount', 19.4479, 4),
    (g_ver, 'S7300A-933 STANDARD', 'Cabeça + Caixa', 'Cabeça + Caixa', 909.0000, 'price', 1398.0000, 'percent_discount', 19.4564, 'percent_discount', 19.4564, 5),
    (g_ver, 'S7300A-933 STANDARD', 'Completa', 'Completa', 1103.0000, 'price', 1696.0000, 'percent_discount', 19.4575, 'percent_discount', 19.4575, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000721', 'N40000721', 'CA-E-BI/S7300A Tampo105x55x4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 1),
    (g_opt, 'N40000749', 'N40000749', 'CA-E-BI/S7300A Tampo 120x60x4', 75.0000, 'price', 116.0000, 'percent_discount', 19.8276, 'percent_discount', 19.8276, 2),
    (g_opt, 'N40000748', 'N40000748', 'CA-E-BI/S7300A Tampo ECO 105x55x4', 48.0000, 'price', 74.0000, 'percent_discount', 20.2703, 'percent_discount', 20.2703, 3),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 4),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 5),
    (g_opt, 'SA1719101', 'SA1719101', 'LANÇADEIRA GRANDE COMPLETA', 399.0500, 'price', 614.0000, 'percent_discount', 43.6482, 'percent_discount', 43.6482, 6),
    (g_opt, 'S23848001', 'S23848001', 'BOBBIN FOR LARGE HOOK', 8.0000, 'price', 13.0000, 'percent_discount', 46.1538, 'percent_discount', 46.1538, 7),
    (g_opt, 'N40000935', 'N40000935', 'PULLER PS-P192 S7300A/AK W/AFL', 980.0000, 'price', 1508.0000, 'percent_discount', 19.4960, 'percent_discount', 19.4960, 8),
    (g_opt, 'N40000944', 'N40000944', 'PULLER PL-P192 S7300A/AK W/AFL', 850.0000, 'price', 1308.0000, 'percent_discount', 19.4954, 'percent_discount', 19.4954, 9);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'S7300A-P', 'Máquina de Costura Ponto Corrido', 80)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'S7300A-903P-PREMIUM', 'S7300A-903P-PREMIUM', 'Máquina de Costura Ponto Corrido', 1126.0000, 'margin', 34.9885, 'percent_discount', 19.4573, 'percent_discount', 19.4573),
    (fam, 'S7300A-905P-PREMIUM', 'S7300A-905P-PREMIUM', 'Máquina de Costura Ponto Corrido', 1126.0000, 'margin', 34.9885, 'percent_discount', 19.4573, 'percent_discount', 19.4573),
    (fam, 'S7300A-933P-PREMIUM', 'S7300A-933P-PREMIUM', 'Máquina de Costura Ponto Corrido', 1169.0000, 'margin', 34.9833, 'percent_discount', 19.4105, 'percent_discount', 19.4105);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, Direct Drive, Sistema de alimentação eletrónico', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'DIGIFLEX FEED diretamente ligada ao motor de passo', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'com duas lâminas móveis - linha sobrante curta', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Tira linhas e remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'levantamento do calcador, dispositivo de retenção da linha superiror', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Painel tátil e luz integrada', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Sensor de saliências para deteção de espessura', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Entrada USB', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 4000 - 5000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Comprimento máximo do ponto 5,0 - 7,0 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, 'Costura de alta qualidade, modelo eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'S7300A-903P-PREMIUM', 'Cabeça + Caixa', 'Cabeça + Caixa', 932.0000, 'price', 1434.0000, 'percent_discount', 19.5258, 'percent_discount', 19.5258, 1),
    (g_ver, 'S7300A-903P-PREMIUM', 'Completa', 'Completa', 1126.0000, 'price', 1732.0000, 'percent_discount', 19.4573, 'percent_discount', 19.4573, 2),
    (g_ver, 'S7300A-905P-PREMIUM', 'Cabeça + Caixa', 'Cabeça + Caixa', 932.0000, 'price', 1434.0000, 'percent_discount', 19.5258, 'percent_discount', 19.5258, 3),
    (g_ver, 'S7300A-905P-PREMIUM', 'Completa', 'Completa', 1126.0000, 'price', 1732.0000, 'percent_discount', 19.4573, 'percent_discount', 19.4573, 4),
    (g_ver, 'S7300A-933P-PREMIUM', 'Cabeça + Caixa', 'Cabeça + Caixa', 975.0000, 'price', 1500.0000, 'percent_discount', 19.4667, 'percent_discount', 19.4667, 5),
    (g_ver, 'S7300A-933P-PREMIUM', 'Completa', 'Completa', 1169.0000, 'price', 1798.0000, 'percent_discount', 19.4105, 'percent_discount', 19.4105, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000721', 'N40000721', 'CA-E-BI/S7300A Tampo105x55x4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 1),
    (g_opt, 'N40000749', 'N40000749', 'CA-E-BI/S7300A Tampo 120x60x4', 75.0000, 'price', 116.0000, 'percent_discount', 19.8276, 'percent_discount', 19.8276, 2),
    (g_opt, 'N40000748', 'N40000748', 'CA-E-BI/S7300A Tampo ECO 105x55x4', 48.0000, 'price', 74.0000, 'percent_discount', 20.2703, 'percent_discount', 20.2703, 3),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 4),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 5),
    (g_opt, 'SA1719101', 'SA1719101', 'Lançadeira grande completa', 399.0500, 'price', 614.0000, 'percent_discount', 43.6482, 'percent_discount', 43.6482, 6),
    (g_opt, 'S23848001', 'S23848001', 'Bobina para lançadeira grande', 8.0000, 'price', 13.0000, 'percent_discount', 46.1538, 'percent_discount', 46.1538, 7),
    (g_opt, 'N40000935', 'N40000935', 'PULLER PS-P192 S7300A/AK W/AFL', 980.0000, 'price', 1508.0000, 'percent_discount', 19.4960, 'percent_discount', 19.4960, 8),
    (g_opt, 'N40000944', 'N40000944', 'PULLER PL-P192 S7300A/AK W/AFL', 850.0000, 'price', 1308.0000, 'percent_discount', 19.4954, 'percent_discount', 19.4954, 9);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'S7220D', 'Máquina de Costura Ponto Corrido Direct Drive', 90)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'S7220D-403', 'S7220D-403', 'Máquina de Costura Ponto Corrido Direct Drive', 1669.0000, 'margin', 34.9825, 'percent_discount', 19.4390, 'percent_discount', 19.4390),
    (fam, 'S7220D-405', 'S7220D-405', 'Máquina de Costura Ponto Corrido Direct Drive', 1669.0000, 'margin', 34.9825, 'percent_discount', 19.4390, 'percent_discount', 19.4390);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, arrasto por agulha, acionamento direto', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Corte de linha, Tira linhas e remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Painel tátil a cores', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 4000 - 5000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Comprimento máx. dos pontos 4,5 - 5,5 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Altura do calcador 6 mm - Levantador de joelho 16 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Costura de alta qualidade, modelo eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'S7220D-403', 'Cabeça', 'Cabeça', 1283.0000, 'price', 1974.0000, 'percent_discount', 19.5035, 'percent_discount', 19.5035, 1),
    (g_ver, 'S7220D-403', 'Cabeça + Caixa', 'Cabeça + Caixa', 1475.0000, 'price', 2269.0000, 'percent_discount', 19.4799, 'percent_discount', 19.4799, 2),
    (g_ver, 'S7220D-403', 'Completa', 'Completa', 1669.0000, 'price', 2567.0000, 'percent_discount', 19.4390, 'percent_discount', 19.4390, 3),
    (g_ver, 'S7220D-405', 'Cabeça', 'Cabeça', 1283.0000, 'price', 1974.0000, 'percent_discount', 19.5035, 'percent_discount', 19.5035, 4),
    (g_ver, 'S7220D-405', 'Cabeça + Caixa', 'Cabeça + Caixa', 1475.0000, 'price', 2269.0000, 'percent_discount', 19.4799, 'percent_discount', 19.4799, 5),
    (g_ver, 'S7220D-405', 'Completa', 'Completa', 1669.0000, 'price', 2567.0000, 'percent_discount', 19.4390, 'percent_discount', 19.4390, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001740', 'N40001740', 'CA-E-BI/S7220D Tampo105x55x4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001712', 'N40001712', 'PF-8ECOE2', 128.0000, 'price', 197.0000, 'percent_discount', 19.2893, 'percent_discount', 19.2893, 1),
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 2),
    (g_opt, 'N40001632', 'N40001632', 'CA-E-BI/S7220D Tampo 120x60x4', 75.0000, 'price', 116.0000, 'percent_discount', 19.8276, 'percent_discount', 19.8276, 3),
    (g_opt, 'N40001631', 'N40001631', 'CA-E-BI/S7220D Tampo ECO 105x55x4', 48.0000, 'price', 74.0000, 'percent_discount', 20.2703, 'percent_discount', 20.2703, 4),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 5),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 6),
    (g_opt, 'N10012095', 'N10012095', 'PULLER PS-P2510-S7220D', 825.0000, 'price', 1270.0000, 'percent_discount', 19.5276, 'percent_discount', 19.5276, 7),
    (g_opt, 'N40001711', 'N40001711', 'PF-1C3', 114.0000, 'price', 176.0000, 'percent_discount', 19.8864, 'percent_discount', 19.8864, 8),
    (g_opt, 'SA1719101', 'SA1719101', 'Lançadeira grande completa', 399.0500, 'price', 614.0000, 'percent_discount', 43.6482, 'percent_discount', 43.6482, 9),
    (g_opt, 'S23848001', 'S23848001', 'Bobina para lançadeira grande', 8.0000, 'price', 13.0000, 'percent_discount', 46.1538, 'percent_discount', 46.1538, 10),
    (g_opt, 'BX8400D00000006045', 'BX8400D00000006045', 'X8400D-1P-230V', 192.0000, 'price', 296.0000, 'percent_discount', 19.5946, 'percent_discount', 19.5946, 11);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'UF8910', 'Máquina Ponto Corrido 1 agulha triplo arrasto Direct Drive', 100)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'UF-8910-101 Premium', 'UF-8910-101 Premium', 'Máquina Ponto Corrido 1 agulha triplo arrasto Direct Drive', 5462.0000, 'margin', 34.9994, 'percent_discount', 19.4930, 'percent_discount', 19.4930),
    (fam, 'UF-8910-001 Deluxe', 'UF-8910-001 Deluxe', 'Máquina Ponto Corrido 1 agulha triplo arrasto Direct Drive', 5203.0000, 'margin', 35.0031, 'percent_discount', 19.5003, 'percent_discount', 19.5003),
    (fam, 'UF-8910-000 Standard', 'UF-8910-000 Standard', 'Máquina Ponto Corrido 1 agulha triplo arrasto Direct Drive', 4943.0000, 'margin', 35.0033, 'percent_discount', 19.5003, 'percent_discount', 19.5003);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Uma agulha, triplo arrasto e acionamento direto', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Largura da área de trabalho 400 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Corte de linha, dispositivo de retenção da linha, remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Painel digital', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 3800 rpm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Comprimento máx. do ponto 9 mm.  12 mm option', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura do calcador 20 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Costura de alta qualidade, modelo eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Ajuste da digitalização para uma grande reprodutividade', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Calcador Integrado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, 'Hook size 28 mm Diam.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'UF-8910-101 Premium', 'Cabeça', 'Cabeça', 4671.0000, 'price', 7186.0000, 'percent_discount', 19.4962, 'percent_discount', 19.4962, 1),
    (g_ver, 'UF-8910-101 Premium', 'Cabeça + Caixa', 'Cabeça + Caixa', 5233.0000, 'price', 8051.0000, 'percent_discount', 19.5007, 'percent_discount', 19.5007, 2),
    (g_ver, 'UF-8910-101 Premium', 'Completa', 'Completa', 5462.0000, 'price', 8403.0000, 'percent_discount', 19.4930, 'percent_discount', 19.4930, 3),
    (g_ver, 'UF-8910-001 Deluxe', 'Cabeça', 'Cabeça', 4412.0000, 'price', 6788.0000, 'percent_discount', 19.5050, 'percent_discount', 19.5050, 4),
    (g_ver, 'UF-8910-001 Deluxe', 'Cabeça + Caixa', 'Cabeça + Caixa', 4974.0000, 'price', 7653.0000, 'percent_discount', 19.5087, 'percent_discount', 19.5087, 5),
    (g_ver, 'UF-8910-001 Deluxe', 'Completa', 'Completa', 5203.0000, 'price', 8005.0000, 'percent_discount', 19.5003, 'percent_discount', 19.5003, 6),
    (g_ver, 'UF-8910-000 Standard', 'Cabeça', 'Cabeça', 4152.0000, 'price', 6388.0000, 'percent_discount', 19.5053, 'percent_discount', 19.5053, 7),
    (g_ver, 'UF-8910-000 Standard', 'Cabeça + Caixa', 'Cabeça + Caixa', 4714.0000, 'price', 7253.0000, 'percent_discount', 19.5092, 'percent_discount', 19.5092, 8),
    (g_ver, 'UF-8910-000 Standard', 'Completa', 'Completa', 4943.0000, 'price', 7605.0000, 'percent_discount', 19.5003, 'percent_discount', 19.5003, 9);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001973', 'N40001973', 'E-BI/UF8910-8920 Tampo 120x60x4', 76.0000, 'price', 117.0000, 'percent_discount', 19.6581, 'percent_discount', 19.6581, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002554', 'N40002554', 'RE-2/HD-980 DS Bancada UF8910/8920', 101.0000, 'price', 156.0000, 'percent_discount', 19.8718, 'percent_discount', 19.8718, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 Motor switch 1P', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'SB6965001', 'SB6965001', 'Knee switch', 618.2000, 'price', 952.0000, 'percent_discount', 19.5378, 'percent_discount', 19.5378, 1),
    (g_opt, 'N40002135', 'N40002135', 'RE-HDP-1/EK STAND ELECT. HEIGHT ADJ.', 735.0000, 'price', 1131.0000, 'percent_discount', 19.5402, 'percent_discount', 19.5402, 2),
    (g_opt, 'N40000541', 'N40000541', '3 Pedal for stand up operation', 290.0000, 'price', 447.0000, 'percent_discount', 19.6868, 'percent_discount', 19.6868, 3),
    (g_opt, 'N40002217', 'N40002217', 'NTB-KG867A EGDE GUIDE', 62.0000, 'price', 96.0000, 'percent_discount', 19.7917, 'percent_discount', 19.7917, 4),
    (g_opt, 'N40002219', 'N40002219', 'COM-ELECTRICAL EDGE GUIDE', 1000.0000, 'price', 1539.0000, 'percent_discount', 19.5582, 'percent_discount', 19.5582, 5),
    (g_opt, 'SC1533201', 'SC1533201', 'BOBBIN WINDING DEVICE (for STD version)', 424.7500, 'price', 654.0000, 'percent_discount', 19.5719, 'percent_discount', 19.5719, 6),
    (g_opt, 'N40002218', 'N40002218', 'BIMH-HEAD LIFT BY DAMPER', 415.0000, 'price', 639.0000, 'percent_discount', 19.5618, 'percent_discount', 19.5618, 7),
    (g_opt, 'SC5050001', 'SC5050001', 'EDGE GUIDE SETTING PLATE', 6.7500, 'price', 11.0000, 'percent_discount', 27.2727, 'percent_discount', 27.2727, 8),
    (g_opt, 'SC60011E1', 'SC60011E1', 'Side Plate sensor UF891', 216.9000, 'price', 334.0000, 'percent_discount', 19.4611, 'percent_discount', 19.4611, 9),
    (g_opt, 'SC8638001', 'SC8638001', 'REVERSE LEVER SET', 330.1500, 'price', 508.0000, 'percent_discount', 19.4882, 'percent_discount', 19.4882, 10),
    (g_opt, 'BUX890000000000045', 'BUX890000000000045', 'UX8900-1P240V-CE-WO/SW', 562.0000, 'price', 865.0000, 'percent_discount', 19.5376, 'percent_discount', 19.5376, 11);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'UF8920', 'Máquina Ponto Corrido 2 agulhas triplo arrasto Direct Drive', 110)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'UF-8920-001 Deluxe', 'UF-8920-001 Deluxe', 'Máquina Ponto Corrido 2 agulhas triplo arrasto Direct Drive', 6396.0000, 'margin', 35.0000, 'percent_discount', 19.4919, 'percent_discount', 19.4919);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Duas agulhas, triplo arrasto e acionamento direto', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Largura da área de trabalho, 400 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Corte de linha, dispositivo de retenção da linha, remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Painel digital', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 3400 rpm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Comprimento máx. do ponto  9 mm.  12 mm option', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura do calcador 20 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Costura de alta qualidade, modelo eco-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Ajuste da digitalização para uma grande reprodutividade', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Calcador Integrado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, 'Hook size 28 mm Diam.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'UF-8920-001 Deluxe', 'Cabeça', 'Cabeça', 5605.0000, 'price', 8623.0000, 'percent_discount', 19.4944, 'percent_discount', 19.4944, 1),
    (g_ver, 'UF-8920-001 Deluxe', 'Cabeça + Caixa', 'Cabeça + Caixa', 6167.0000, 'price', 9488.0000, 'percent_discount', 19.4983, 'percent_discount', 19.4983, 2),
    (g_ver, 'UF-8920-001 Deluxe', 'Completa', 'Completa', 6396.0000, 'price', 9840.0000, 'percent_discount', 19.4919, 'percent_discount', 19.4919, 3);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001973', 'N40001973', 'E-BI/UF8910-8920 Tampo 120x60x4', 76.0000, 'price', 117.0000, 'percent_discount', 19.6581, 'percent_discount', 19.6581, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002554', 'N40002554', 'RE-2/HD-980 DS Bancada UF8910/8920', 101.0000, 'price', 156.0000, 'percent_discount', 19.8718, 'percent_discount', 19.8718, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 Motor switch 1P', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'SB6965001', 'SB6965001', 'Knee switch', 618.2000, 'price', 952.0000, 'percent_discount', 19.5378, 'percent_discount', 19.5378, 1),
    (g_opt, 'N40002135', 'N40002135', 'RE-HDP-1/EK STAND ELECT. HEIGHT ADJ.', 735.0000, 'price', 1131.0000, 'percent_discount', 19.5402, 'percent_discount', 19.5402, 2),
    (g_opt, 'N40000541', 'N40000541', '3 Pedal for stand up operation', 290.0000, 'price', 447.0000, 'percent_discount', 19.6868, 'percent_discount', 19.6868, 3),
    (g_opt, 'N40002217', 'N40002217', 'NTB-KG867A EGDE GUIDE', 62.0000, 'price', 96.0000, 'percent_discount', 19.7917, 'percent_discount', 19.7917, 4),
    (g_opt, 'N40002219', 'N40002219', 'COM-ELECTRICAL EDGE GUIDE', 1000.0000, 'price', 1539.0000, 'percent_discount', 19.5582, 'percent_discount', 19.5582, 5),
    (g_opt, 'SC1533201', 'SC1533201', 'BOBBIN WINDING DEVICE (for STD version)', 424.7500, 'price', 654.0000, 'percent_discount', 19.5719, 'percent_discount', 19.5719, 6),
    (g_opt, 'N40002218', 'N40002218', 'BIMH-HEAD LIFT BY DAMPER', 415.0000, 'price', 639.0000, 'percent_discount', 19.5618, 'percent_discount', 19.5618, 7),
    (g_opt, 'SC5050001', 'SC5050001', 'EDGE GUIDE SETTING PLATE', 6.7500, 'price', 11.0000, 'percent_discount', 27.2727, 'percent_discount', 27.2727, 8),
    (g_opt, 'SC60021E1', 'SC60021E1', 'Side Plate sensor UF892', 408.7500, 'price', 629.0000, 'percent_discount', 19.5548, 'percent_discount', 19.5548, 9),
    (g_opt, 'SC8638001', 'SC8638001', 'REVERSE LEVER SET', 330.1500, 'price', 508.0000, 'percent_discount', 19.4882, 'percent_discount', 19.4882, 10),
    (g_opt, 'BUX890000000000045', 'BUX890000000000045', 'UX8900-1P240V-CE-WO/SW', 562.0000, 'price', 865.0000, 'percent_discount', 19.5376, 'percent_discount', 19.5376, 11);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'T8XX0C', 'Máquina Ponto Corrido 2 agulhas s/ corte de linha', 120)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'T8420C-003-N64D', 'T8420C-003-N64D', 'Máquina Ponto Corrido 2 agulhas s/ corte de linha', 1211.0000, 'margin', 34.9624, 'percent_discount', 19.4952, 'percent_discount', 19.4952),
    (fam, 'T8420C-005-N64D', 'T8420C-005-N64D', 'Máquina Ponto Corrido 2 agulhas s/ corte de linha', 1211.0000, 'margin', 34.9624, 'percent_discount', 19.4952, 'percent_discount', 19.4952),
    (fam, 'T8720C-005-N64D', 'T8720C-005-N64D', 'Máquina Ponto Corrido 2 agulhas s/ corte de linha', 1601.0000, 'margin', 34.9716, 'percent_discount', 19.4963, 'percent_discount', 19.4963),
    (fam, 'T8450C-003-N64D', 'T8450C-003-N64D', 'Máquina Ponto Corrido 2 agulhas s/ corte de linha', 1654.0000, 'margin', 34.9843, 'percent_discount', 19.4969, 'percent_discount', 19.4969);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Duas agulhas, barra de agulha fixa, sem corte de linha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Barra de agulha fixa: Lançadeira Standard T8420C', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, '- Lançadeira grande T8720C', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Barra da agulha dividida: Lançadeira Standard T8450C', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Velocidade máx. de costura: T8420C: 3000 - 4000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Velocidade máx. de costura: T8450C - T8720C: 3000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Comprimento máx. do ponto  T8420C: 4,0 - 5,0 mm  - T8720C 7,0 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Comprimento máx. do ponto T8450C: 5,0 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Altura do calcador 7 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, '(Servo motor não incluido)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'T8420C-003-N64D', 'Cabeça', 'Cabeça', 920.0000, 'price', 1415.0000, 'percent_discount', 19.5053, 'percent_discount', 19.5053, 1),
    (g_ver, 'T8420C-003-N64D', 'Completa', 'Completa', 1211.0000, 'price', 1862.0000, 'percent_discount', 19.4952, 'percent_discount', 19.4952, 2),
    (g_ver, 'T8420C-005-N64D', 'Cabeça', 'Cabeça', 920.0000, 'price', 1415.0000, 'percent_discount', 19.5053, 'percent_discount', 19.5053, 3),
    (g_ver, 'T8420C-005-N64D', 'Completa', 'Completa', 1211.0000, 'price', 1862.0000, 'percent_discount', 19.4952, 'percent_discount', 19.4952, 4),
    (g_ver, 'T8720C-005-N64D', 'Cabeça', 'Cabeça', 1310.0000, 'price', 2015.0000, 'percent_discount', 19.5037, 'percent_discount', 19.5037, 5),
    (g_ver, 'T8720C-005-N64D', 'Completa', 'Completa', 1601.0000, 'price', 2462.0000, 'percent_discount', 19.4963, 'percent_discount', 19.4963, 6),
    (g_ver, 'T8450C-003-N64D', 'Cabeça', 'Cabeça', 1363.0000, 'price', 2097.0000, 'percent_discount', 19.5041, 'percent_discount', 19.5041, 7),
    (g_ver, 'T8450C-003-N64D', 'Completa', 'Completa', 1654.0000, 'price', 2544.0000, 'percent_discount', 19.4969, 'percent_discount', 19.4969, 8);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000409', 'N40000409', 'CA-E-BI/T8420C Tampo 105x55x4', 56.0000, 'price', 87.0000, 'percent_discount', 20.6897, 'percent_discount', 20.6897, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'ZFUPMXASU275', 'ZFUPMXASU275', 'PMX-ASU27-5 220V Servo motor Powermax', 140.0000, 'price', 216.0000, 'percent_discount', 19.9074, 'percent_discount', 19.9074, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT de rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 1),
    (g_opt, 'ZT72280G2', 'ZT72280G2', 'FIR1148.2T37 RPM2800 CLUTCH MOTOR', 162.0000, 'price', 250.0000, 'percent_discount', 19.6000, 'percent_discount', 19.6000, 2),
    (g_opt, 'N10006081', 'N10006081', 'BZ-10x6x1150/LR V-Belt DIN2215', 9.5000, 'price', 15.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 3),
    (g_opt, 'N40000175', 'N40000175', 'CA-2702.T.B Com bobine e cabos para 3PH', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 4),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 5),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 6),
    (g_opt, 'N10012373', 'N10012373', 'PULLER PL-P5550-T8420D', 825.0000, 'price', 1270.0000, 'percent_discount', 19.5276, 'percent_discount', 19.5276, 7);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'T8XXXC', 'Máquina Ponto Corrido 2 Agulhas com suspensão/corte de linha', 130)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'T8421D-T03-N64D', 'T8421D-T03-N64D', 'Máquina Ponto Corrido 2 Agulhas com suspensão/corte de linha', 1717.0000, 'margin', 34.9867, 'percent_discount', 19.4623, 'percent_discount', 19.4623),
    (fam, 'T8422D-S03-N64D', 'T8422D-S03-N64D', 'Máquina Ponto Corrido 2 Agulhas com suspensão/corte de linha', 2044.0000, 'margin', 34.9873, 'percent_discount', 19.4656, 'percent_discount', 19.4656),
    (fam, 'T8422D-S05-N64D', 'T8422D-S05-N64D', 'Máquina Ponto Corrido 2 Agulhas com suspensão/corte de linha', 2044.0000, 'margin', 34.9873, 'percent_discount', 19.4656, 'percent_discount', 19.4656),
    (fam, 'T8722D-S05-N64D', 'T8722D-S05-N64D', 'Máquina Ponto Corrido 2 Agulhas com suspensão/corte de linha', 2258.0000, 'margin', 34.9842, 'percent_discount', 19.4644, 'percent_discount', 19.4644);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Duas agulhas, barra de agulha fixa, Direct Drive,', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Corte de linha, Tira linhas e remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Painel digital', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Lançadeiras standard T8421D, T8422D - Lançadeiras grandes T8722D', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Velocidade máx. de costura 3000 - 4000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Comprimento máximo do ponto  T8422D  4,0 - 5,0 mm  - T8722D  7,0 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura do calcador 7 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'T8421D-T03-N64D', 'Cabeça', 'Cabeça', 1331.0000, 'price', 2048.0000, 'percent_discount', 19.5312, 'percent_discount', 19.5312, 1),
    (g_ver, 'T8421D-T03-N64D', 'Cabeça + Caixa', 'Cabeça + Caixa', 1523.0000, 'price', 2343.0000, 'percent_discount', 19.5049, 'percent_discount', 19.5049, 2),
    (g_ver, 'T8421D-T03-N64D', 'Completa', 'Completa', 1717.0000, 'price', 2641.0000, 'percent_discount', 19.4623, 'percent_discount', 19.4623, 3),
    (g_ver, 'T8422D-S03-N64D', 'Cabeça', 'Cabeça', 1658.0000, 'price', 2551.0000, 'percent_discount', 19.5218, 'percent_discount', 19.5218, 4),
    (g_ver, 'T8422D-S03-N64D', 'Cabeça + Caixa', 'Cabeça + Caixa', 1850.0000, 'price', 2846.0000, 'percent_discount', 19.5011, 'percent_discount', 19.5011, 5),
    (g_ver, 'T8422D-S03-N64D', 'Completa', 'Completa', 2044.0000, 'price', 3144.0000, 'percent_discount', 19.4656, 'percent_discount', 19.4656, 6),
    (g_ver, 'T8422D-S05-N64D', 'Cabeça', 'Cabeça', 1658.0000, 'price', 2551.0000, 'percent_discount', 19.5218, 'percent_discount', 19.5218, 7),
    (g_ver, 'T8422D-S05-N64D', 'Cabeça + Caixa', 'Cabeça + Caixa', 1850.0000, 'price', 2846.0000, 'percent_discount', 19.5011, 'percent_discount', 19.5011, 8),
    (g_ver, 'T8422D-S05-N64D', 'Completa', 'Completa', 2044.0000, 'price', 3144.0000, 'percent_discount', 19.4656, 'percent_discount', 19.4656, 9),
    (g_ver, 'T8722D-S05-N64D', 'Cabeça', 'Cabeça', 1872.0000, 'price', 2880.0000, 'percent_discount', 19.5139, 'percent_discount', 19.5139, 10),
    (g_ver, 'T8722D-S05-N64D', 'Cabeça + Caixa', 'Cabeça + Caixa', 2064.0000, 'price', 3175.0000, 'percent_discount', 19.4961, 'percent_discount', 19.4961, 11),
    (g_ver, 'T8722D-S05-N64D', 'Completa', 'Completa', 2258.0000, 'price', 3473.0000, 'percent_discount', 19.4644, 'percent_discount', 19.4644, 12);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001556', 'N40001556', 'CA-E-BI/T8422D Tampo 105x55x4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001711', 'N40001711', 'PF-1C3', 114.0000, 'price', 176.0000, 'percent_discount', 19.8864, 'percent_discount', 19.8864, 1),
    (g_opt, 'N40001311', 'N40001311', 'PF- 8E4 - Modified', 168.0000, 'price', 259.0000, 'percent_discount', 19.6911, 'percent_discount', 19.6911, 2),
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT de rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 3),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 4),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 5),
    (g_opt, 'N40001728', 'N40001728', 'PULLER PL-P5550-T8422D', 825.0000, 'price', 1270.0000, 'percent_discount', 19.5276, 'percent_discount', 19.5276, 6),
    (g_opt, 'BX8400D00000006045', 'BX8400D00000006045', 'X8400D-1P-230V', 192.0000, 'price', 296.0000, 'percent_discount', 19.5946, 'percent_discount', 19.5946, 7);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'T8XXXD', 'Máquina 2 agulhas ponto corrido com suspensão/corte de linha', 140)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'T8452D-S03-N64', 'T8452D-S03-N64', 'Máquina 2 agulhas ponto corrido com suspensão/corte de linha', 2685.0000, 'margin', 34.9879, 'percent_discount', 19.4673, 'percent_discount', 19.4673),
    (fam, 'T8452D-S05-N64', 'T8452D-S05-N64', 'Máquina 2 agulhas ponto corrido com suspensão/corte de linha', 2685.0000, 'margin', 34.9879, 'percent_discount', 19.4673, 'percent_discount', 19.4673),
    (fam, 'T8752D-405-N64D', 'T8752D-405-N64D', 'Máquina 2 agulhas ponto corrido com suspensão/corte de linha', 2845.0000, 'margin', 34.9863, 'percent_discount', 19.4698, 'percent_discount', 19.4698),
    (fam, 'T8752D-S05-N64D', 'T8752D-S05-N64D', 'Máquina 2 agulhas ponto corrido com suspensão/corte de linha', 2845.0000, 'margin', 34.9863, 'percent_discount', 19.4698, 'percent_discount', 19.4698),
    (fam, 'T8752D-S07-N64D', 'T8752D-S07-N64D', 'Máquina 2 agulhas ponto corrido com suspensão/corte de linha', 3113.0000, 'margin', 34.9833, 'percent_discount', 19.4653, 'percent_discount', 19.4653);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Duas agulhas, barra de agulha dividida, Direct Drive,', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Corte de linha, tira linhas e remate automatico', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Painel digital', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Lançadeiras Standard T8452D - Lançadeiras grandes T8752D', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 3000  spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Comprimento máx. do ponto  T8452D  5,0 mm  - T8752D  7,0 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura do calcador 7 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'T8452D-S03-N64', 'Cabeça', 'Cabeça', 2299.0000, 'price', 3537.0000, 'percent_discount', 19.5081, 'percent_discount', 19.5081, 1),
    (g_ver, 'T8452D-S03-N64', 'Cabeça + Caixa', 'Cabeça + Caixa', 2491.0000, 'price', 3832.0000, 'percent_discount', 19.4937, 'percent_discount', 19.4937, 2),
    (g_ver, 'T8452D-S03-N64', 'Completa', 'Completa', 2685.0000, 'price', 4130.0000, 'percent_discount', 19.4673, 'percent_discount', 19.4673, 3),
    (g_ver, 'T8452D-S05-N64', 'Cabeça', 'Cabeça', 2299.0000, 'price', 3537.0000, 'percent_discount', 19.5081, 'percent_discount', 19.5081, 4),
    (g_ver, 'T8452D-S05-N64', 'Cabeça + Caixa', 'Cabeça + Caixa', 2491.0000, 'price', 3832.0000, 'percent_discount', 19.4937, 'percent_discount', 19.4937, 5),
    (g_ver, 'T8452D-S05-N64', 'Completa', 'Completa', 2685.0000, 'price', 4130.0000, 'percent_discount', 19.4673, 'percent_discount', 19.4673, 6),
    (g_ver, 'T8752D-405-N64D', 'Cabeça', 'Cabeça', 2459.0000, 'price', 3783.0000, 'percent_discount', 19.5083, 'percent_discount', 19.5083, 7),
    (g_ver, 'T8752D-405-N64D', 'Cabeça + Caixa', 'Cabeça + Caixa', 2651.0000, 'price', 4078.0000, 'percent_discount', 19.4949, 'percent_discount', 19.4949, 8),
    (g_ver, 'T8752D-405-N64D', 'Completa', 'Completa', 2845.0000, 'price', 4376.0000, 'percent_discount', 19.4698, 'percent_discount', 19.4698, 9),
    (g_ver, 'T8752D-S05-N64D', 'Cabeça', 'Cabeça', 2459.0000, 'price', 3783.0000, 'percent_discount', 19.5083, 'percent_discount', 19.5083, 10),
    (g_ver, 'T8752D-S05-N64D', 'Cabeça + Caixa', 'Cabeça + Caixa', 2651.0000, 'price', 4078.0000, 'percent_discount', 19.4949, 'percent_discount', 19.4949, 11),
    (g_ver, 'T8752D-S05-N64D', 'Completa', 'Completa', 2845.0000, 'price', 4376.0000, 'percent_discount', 19.4698, 'percent_discount', 19.4698, 12),
    (g_ver, 'T8752D-S07-N64D', 'Cabeça', 'Cabeça', 2727.0000, 'price', 4195.0000, 'percent_discount', 19.4994, 'percent_discount', 19.4994, 13),
    (g_ver, 'T8752D-S07-N64D', 'Cabeça + Caixa', 'Cabeça + Caixa', 2919.0000, 'price', 4490.0000, 'percent_discount', 19.4878, 'percent_discount', 19.4878, 14),
    (g_ver, 'T8752D-S07-N64D', 'Completa', 'Completa', 3113.0000, 'price', 4788.0000, 'percent_discount', 19.4653, 'percent_discount', 19.4653, 15);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001556', 'N40001556', 'CA-E-BI/T8422D Tampo 105x55x4', 54.0000, 'price', 84.0000, 'percent_discount', 20.2381, 'percent_discount', 20.2381, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001711', 'N40001711', 'PF-1C3', 114.0000, 'price', 176.0000, 'percent_discount', 19.8864, 'percent_discount', 19.8864, 1),
    (g_opt, 'N40001311', 'N40001311', 'PF- 8E4 - Modificado', 168.0000, 'price', 259.0000, 'percent_discount', 19.6911, 'percent_discount', 19.6911, 2),
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT RODAS  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 3),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 4),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 5),
    (g_opt, 'N40001728', 'N40001728', 'PULLER PL-P5550-T8422D', 825.0000, 'price', 1270.0000, 'percent_discount', 19.5276, 'percent_discount', 19.5276, 6),
    (g_opt, 'BX8400D00000006045', 'BX8400D00000006045', 'X8400D-1P-230V', 192.0000, 'price', 296.0000, 'percent_discount', 19.5946, 'percent_discount', 19.5946, 7);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'Z8550B/Z8560B', 'Máquina de ZIGZAG Eletrónica Direct Drive', 150)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'Z8550B-031', 'Z8550B-031', 'Máquina de ZIGZAG Eletrónica Direct Drive', 2193.0000, 'margin', 34.9837, 'percent_discount', 19.4782, 'percent_discount', 19.4782),
    (fam, 'Z8550B-A31', 'Z8550B-A31', 'Máquina de ZIGZAG Eletrónica Direct Drive', 2283.0000, 'margin', 34.9943, 'percent_discount', 19.4761, 'percent_discount', 19.4761),
    (fam, 'Z8560B-431', 'Z8560B-431', 'Máquina de ZIGZAG Eletrónica Direct Drive', 2968.0000, 'margin', 34.9978, 'percent_discount', 19.4919, 'percent_discount', 19.4919);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Eletrónica, Direct Drive, Costura em zig-zag', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Z8550B sem corte de linha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Z8560B com corte de linha, tira linhas e remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 5000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Largura máx. de zigzag 10,0mm (standard 8,0mm)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Altura do calcador 6 mm - Levantador de joelho 10 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Ponto zigzag, 2 passos, 3 passos, baínha ondulada e ponto em T.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'Z8550B-031', 'Cabeça', 'Cabeça', 1310.0000, 'price', 2015.0000, 'percent_discount', 19.5037, 'percent_discount', 19.5037, 1),
    (g_ver, 'Z8550B-031', 'Cabeça + Caixa', 'Cabeça + Caixa', 1978.0000, 'price', 3043.0000, 'percent_discount', 19.5202, 'percent_discount', 19.5202, 2),
    (g_ver, 'Z8550B-031', 'Completa', 'Completa', 2193.0000, 'price', 3373.0000, 'percent_discount', 19.4782, 'percent_discount', 19.4782, 3),
    (g_ver, 'Z8550B-A31', 'Cabeça', 'Cabeça', 1400.0000, 'price', 2154.0000, 'percent_discount', 19.4986, 'percent_discount', 19.4986, 4),
    (g_ver, 'Z8550B-A31', 'Cabeça + Caixa', 'Cabeça + Caixa', 2068.0000, 'price', 3182.0000, 'percent_discount', 19.5160, 'percent_discount', 19.5160, 5),
    (g_ver, 'Z8550B-A31', 'Completa', 'Completa', 2283.0000, 'price', 3512.0000, 'percent_discount', 19.4761, 'percent_discount', 19.4761, 6),
    (g_ver, 'Z8560B-431', 'Cabeça', 'Cabeça', 2085.0000, 'price', 3208.0000, 'percent_discount', 19.5137, 'percent_discount', 19.5137, 7),
    (g_ver, 'Z8560B-431', 'Cabeça + Caixa', 'Cabeça + Caixa', 2753.0000, 'price', 4236.0000, 'percent_discount', 19.5231, 'percent_discount', 19.5231, 8),
    (g_ver, 'Z8560B-431', 'Completa', 'Completa', 2968.0000, 'price', 4566.0000, 'percent_discount', 19.4919, 'percent_discount', 19.4919, 9);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001555', 'N40001555', 'CA-E-BI/Z8560B Tampo 120x60x4', 75.0000, 'price', 116.0000, 'percent_discount', 19.8276, 'percent_discount', 19.8276, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001711', 'N40001711', 'PF-1C3', 114.0000, 'price', 176.0000, 'percent_discount', 19.8864, 'percent_discount', 19.8864, 1),
    (g_opt, 'N10000042BOM', 'N10000042BOM', 'PF-8E2 (SA13970E1) Modificado', 215.0000, 'price', 331.0000, 'percent_discount', 19.6375, 'percent_discount', 19.6375, 2),
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 3),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/pivô/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 4),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 5),
    (g_opt, 'N10013063', 'N10013063', 'PULLER PS-P2510-Z8550/Z8560', 825.0000, 'price', 1270.0000, 'percent_discount', 19.5276, 'percent_discount', 19.5276, 6),
    (g_opt, 'S50114001', 'S50114001', 'Barra de pressão U', 73.8500, 'price', 114.0000, 'percent_discount', 43.8596, 'percent_discount', 43.8596, 7),
    (g_opt, 'S50115001', 'S50115001', 'Barra de pressão TIP A', 150.4500, 'price', 232.0000, 'percent_discount', 43.9655, 'percent_discount', 43.9655, 8),
    (g_opt, 'S50116001', 'S50116001', 'Barra de pressão TIP B', 78.5000, 'price', 121.0000, 'percent_discount', 43.8017, 'percent_discount', 43.8017, 9),
    (g_opt, 'BX8560B00000000045', 'BX8560B00000000045', 'X8560B-1P230V', 668.0000, 'price', 1028.0000, 'percent_discount', 19.5525, 'percent_discount', 19.5525, 10);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'DA927A/DA928A', 'Máquina de Costura Inglesa', 160)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'DA-927A-2-248L', 'DA-927A-2-248L', 'Máquina de Costura Inglesa', 2219.0000, 'margin', 34.9839, 'percent_discount', 19.5136, 'percent_discount', 19.5136),
    (fam, 'DA-927A-3-264L', 'DA-927A-3-264L', 'Máquina de Costura Inglesa', 2219.0000, 'margin', 34.9839, 'percent_discount', 19.5136, 'percent_discount', 19.5136),
    (fam, 'DA-928A-5-364H', 'DA-928A-5-364H', 'Máquina de Costura Inglesa', 2689.0000, 'margin', 34.9855, 'percent_discount', 19.5116, 'percent_discount', 19.5116),
    (fam, 'DA-928A-7-364X', 'DA-928A-7-364X', 'Máquina de Costura Inglesa', 2689.0000, 'margin', 34.9855, 'percent_discount', 19.5116, 'percent_discount', 19.5116);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Base cilindrica estreira', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 4000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'DA927A com 2 agulhas para materiais leves e médios', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento do ponto: 3,0 mm (3,5 mm para materiais médios)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'DA928A com 3 agulhas para meteriais extra grossos (ex: ganga)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Comprimento do ponto: 4,2 mm - Calcador tipo trator', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, '(Servo motor não incluido)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'DA-927A-2-248L', 'Cabeça', 'Cabeça', 1700.0000, 'price', 2615.0000, 'percent_discount', 19.5029, 'percent_discount', 19.5029, 1),
    (g_ver, 'DA-927A-2-248L', 'Completa', 'Completa', 2219.0000, 'price', 3413.0000, 'percent_discount', 19.5136, 'percent_discount', 19.5136, 2),
    (g_ver, 'DA-927A-3-264L', 'Cabeça', 'Cabeça', 1700.0000, 'price', 2615.0000, 'percent_discount', 19.5029, 'percent_discount', 19.5029, 3),
    (g_ver, 'DA-927A-3-264L', 'Completa', 'Completa', 2219.0000, 'price', 3413.0000, 'percent_discount', 19.5136, 'percent_discount', 19.5136, 4),
    (g_ver, 'DA-928A-5-364H', 'Cabeça', 'Cabeça', 2170.0000, 'price', 3338.0000, 'percent_discount', 19.5027, 'percent_discount', 19.5027, 5),
    (g_ver, 'DA-928A-5-364H', 'Completa', 'Completa', 2689.0000, 'price', 4136.0000, 'percent_discount', 19.5116, 'percent_discount', 19.5116, 6),
    (g_ver, 'DA-928A-7-364X', 'Cabeça', 'Cabeça', 2170.0000, 'price', 3338.0000, 'percent_discount', 19.5027, 'percent_discount', 19.5027, 7),
    (g_ver, 'DA-928A-7-364X', 'Completa', 'Completa', 2689.0000, 'price', 4136.0000, 'percent_discount', 19.5116, 'percent_discount', 19.5116, 8);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000381', 'N40000381', 'CA-E-BI/DA9270-9280 Tampo 72x55x4', 77.0000, 'price', 119.0000, 'percent_discount', 20.1681, 'percent_discount', 20.1681, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40001965', 'N40001965', 'RE-S600 Bancada CPL. COLUMN DA9270/9280', 295.0000, 'price', 454.0000, 'percent_discount', 19.6035, 'percent_discount', 19.6035, 3),
    (g_ban, 'ZFUPMXASU275', 'ZFUPMXASU275', 'PMX-ASU27-5 220V Servo motor Powermax', 140.0000, 'price', 216.0000, 'percent_discount', 19.9074, 'percent_discount', 19.9074, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40000443', 'N40000443', 'CA-E-BI/DA9270-9280 Tampo 95x55x4', 77.0000, 'price', 119.0000, 'percent_discount', 20.1681, 'percent_discount', 20.1681, 1),
    (g_opt, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_opt, 'N40001960', 'N40001960', 'RE-S366 Bancada CPL. DA927/928A', 275.0000, 'price', 424.0000, 'percent_discount', 19.5755, 'percent_discount', 19.5755, 3),
    (g_opt, 'ZFUPMXASU275', 'ZFUPMXASU275', 'PMX-ASU27-5 220V Servo motor Powermax', 140.0000, 'price', 216.0000, 'percent_discount', 19.9074, 'percent_discount', 19.9074, 4),
    (g_opt, 'ZT72280G2', 'ZT72280G2', 'FIR1148.2T37 RPM2800 CLUTCH MOTOR', 162.0000, 'price', 250.0000, 'percent_discount', 19.6000, 'percent_discount', 19.6000, 5),
    (g_opt, 'N10006089', 'N10006089', 'BZ-10x6x1346/LR V-Belt DIN2215', 10.5000, 'price', 17.0000, 'percent_discount', 23.5294, 'percent_discount', 23.5294, 6),
    (g_opt, 'N40000175', 'N40000175', 'CA-2702.T.B With Bobbin and cables for 3PH', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 7),
    (g_opt, 'N40001451', 'N40001451', 'RACING PF-RB - Rubber belt', 1060.0000, 'price', 1631.0000, 'percent_discount', 19.4972, 'percent_discount', 19.4972, 8),
    (g_opt, 'N40001450', 'N40001450', 'RACING PF-HB - Rubber belt', 1125.0000, 'price', 1731.0000, 'percent_discount', 19.5263, 'percent_discount', 19.5263, 9),
    (g_opt, 'N40001471', 'N40001471', 'RACING PF-HB-ECV-AF', 2100.0000, 'price', 3231.0000, 'percent_discount', 19.4986, 'percent_discount', 19.4986, 10),
    (g_opt, 'N40000336', 'N40000336', 'RACING ECV', 850.0000, 'price', 1308.0000, 'percent_discount', 19.4954, 'percent_discount', 19.4954, 11),
    (g_opt, 'N40001470', 'N40001470', 'RACING AF', 432.0000, 'price', 665.0000, 'percent_discount', 19.5489, 'percent_discount', 19.5489, 12);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'KE-430HS', 'Máquina de Mosquear Eletrónica - Direct Drive', 170)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'KE-430HS-03', 'KE-430HS-03', 'Máquina de Mosquear Eletrónica - Direct Drive', 2338.0000, 'margin', 35.0014, 'percent_discount', 19.4885, 'percent_discount', 19.4885),
    (fam, 'KE-430HS-05', 'KE-430HS-05', 'Máquina de Mosquear Eletrónica - Direct Drive', 2338.0000, 'margin', 35.0014, 'percent_discount', 19.4885, 'percent_discount', 19.4885);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Alta produtividade e máx. velocidade de costura 3300 rpm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Máx. superfície de costura (X-Y): 40 x 30 mm. - Shuttle hook', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, '89 padrões de costura - 5000 pontos/padrão', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento do ponto:  0,05 - 12,7 mm. - Altura da pinça 17 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Com porta USB - Ponta de linha curta', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Lubrificação minima - Levantamento de calcador com motor de passo', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Corte de linha e tira linhas', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Painel LCD a cores intuitivo', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'KE-430HS-03', 'Cabeça', 'Cabeça', 1475.0000, 'price', 2269.0000, 'percent_discount', 19.4799, 'percent_discount', 19.4799, 1),
    (g_ver, 'KE-430HS-03', 'Cabeça + Caixa', 'Cabeça + Caixa', 2113.0000, 'price', 3251.0000, 'percent_discount', 19.5017, 'percent_discount', 19.5017, 2),
    (g_ver, 'KE-430HS-03', 'Completa', 'Completa', 2338.0000, 'price', 3597.0000, 'percent_discount', 19.4885, 'percent_discount', 19.4885, 3),
    (g_ver, 'KE-430HS-05', 'Cabeça', 'Cabeça', 1475.0000, 'price', 2269.0000, 'percent_discount', 19.4799, 'percent_discount', 19.4799, 4),
    (g_ver, 'KE-430HS-05', 'Cabeça + Caixa', 'Cabeça + Caixa', 2113.0000, 'price', 3251.0000, 'percent_discount', 19.5017, 'percent_discount', 19.5017, 5),
    (g_ver, 'KE-430HS-05', 'Completa', 'Completa', 2338.0000, 'price', 3597.0000, 'percent_discount', 19.4885, 'percent_discount', 19.4885, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001227', 'N40001227', 'CA-E-BI/KE430H Tampo 120x60x4 SHAPED', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior c/vareta +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 1),
    (g_opt, 'N40001228', 'N40001228', 'CA-E-BI/KE430H Tampo ECO 105x55x4', 65.0000, 'price', 100.0000, 'percent_discount', 19.0000, 'percent_discount', 19.0000, 2),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 3),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 4),
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 5),
    (g_opt, 'SA8197101', 'SA8197101', 'Lançadeira grande', 168.8000, 'price', 260.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 6),
    (g_opt, 'S59221501', 'S59221501', 'Caixa de bobine para lançadeira grande', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 7),
    (g_opt, 'S15665001', 'S15665001', 'Bobine para lançadeira grande', 7.6500, 'price', 12.0000, 'percent_discount', 41.6667, 'percent_discount', 41.6667, 8),
    (g_opt, 'SA4195001', 'SA4195001', 'Work clamp blank - Right', 29.7500, 'price', 46.0000, 'percent_discount', 43.4783, 'percent_discount', 43.4783, 9),
    (g_opt, 'SA4196001', 'SA4196001', 'Work clamp blank - Left', 34.2500, 'price', 53.0000, 'percent_discount', 43.3962, 'percent_discount', 43.3962, 10),
    (g_opt, 'SA3626101', 'SA3626101', 'Feed plate blank', 34.2500, 'price', 53.0000, 'percent_discount', 43.3962, 'percent_discount', 43.3962, 11),
    (g_opt, 'SA3627101', 'SA3627101', 'Feed plate blank', 49.9500, 'price', 77.0000, 'percent_discount', 44.1558, 'percent_discount', 44.1558, 12),
    (g_opt, 'SA3817101', 'SA3817101', 'Feed plate blank', 35.3000, 'price', 55.0000, 'percent_discount', 43.6364, 'percent_discount', 43.6364, 13),
    (g_opt, 'N40001554', 'N40001554', 'UG-LUCK-ST801 EXT LABEL ATT DEVICE 50X40', 1475.0000, 'price', 2270.0000, 'percent_discount', 19.5154, 'percent_discount', 19.5154, 14),
    (g_opt, 'SB7552001', 'SB7552001', '2 Pedal Foot Switch Assy - Necessary with N40001554', 188.9500, 'price', 291.0000, 'percent_discount', 43.6426, 'percent_discount', 43.6426, 15),
    (g_opt, 'N40002395', 'N40002395', 'UG-LUCKST805 ROUND BARTACK DEV. (KE430H)', 1500.0000, 'price', 2308.0000, 'percent_discount', 19.4974, 'percent_discount', 19.4974, 16),
    (g_opt, 'SB77771E1', 'SB77771E1', 'KIT PARA EXPANSÃO DA ÁREA DE COSTURA 50x40mm', 444.0500, 'price', 684.0000, 'percent_discount', 43.7135, 'percent_discount', 43.7135, 17),
    (g_opt, 'N40002265', 'N40002265', 'Blank clamp+feed plate 50x40', 144.5000, 'price', 223.0000, 'percent_discount', 19.7309, 'percent_discount', 19.7309, 18),
    (g_opt, 'BKX430H00000000045', 'BKX430H00000000045', 'KX430H-1P-230V-CE', 638.0000, 'price', 982.0000, 'percent_discount', 19.5519, 'percent_discount', 19.5519, 19);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'KE-430HX', 'Máquina de Mosquear Eletrónica - Direct Drive', 180)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'KE-430HX-03', 'KE-430HX-03', 'Máquina de Mosquear Eletrónica - Direct Drive', 2646.0000, 'margin', 35.0037, 'percent_discount', 19.5038, 'percent_discount', 19.5038),
    (fam, 'KE-430HX-05', 'KE-430HX-05', 'Máquina de Mosquear Eletrónica - Direct Drive', 2646.0000, 'margin', 35.0037, 'percent_discount', 19.5038, 'percent_discount', 19.5038),
    (fam, 'KE-430HX-01', 'KE-430HX-01', 'Máquina de Mosquear Eletrónica - Direct Drive', 2646.0000, 'margin', 35.0037, 'percent_discount', 19.5038, 'percent_discount', 19.5038),
    (fam, 'KE-430HX-0K', 'KE-430HX-0K', 'Máquina de Mosquear Eletrónica - Direct Drive', 2646.0000, 'margin', 35.0037, 'percent_discount', 19.5038, 'percent_discount', 19.5038);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Alta produtividade e máx. velocidade de costura 3300 rpm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Máx. superfície de costura (X-Y): 40 x 30 mm. - Shuttle hook', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, '89 padrões de costura - 5000 pontos/padrão', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento do ponto: 0,05 - 12,7 mm. - Altura da pinça 17 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Com porta USB - Arrefecimento de agulha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Semi-seca - Levantamento de calcador com motor de passo', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Painel LCD a cores intuitivo', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Corte de linha, tira linha e remate automático', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Tensão digital - Sistema de troca rápida da pinça de trabalho', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'KE-430HX-03', 'Cabeça', 'Cabeça', 1783.0000, 'price', 2743.0000, 'percent_discount', 19.5042, 'percent_discount', 19.5042, 1),
    (g_ver, 'KE-430HX-03', 'Cabeça + Caixa', 'Cabeça + Caixa', 2421.0000, 'price', 3725.0000, 'percent_discount', 19.5168, 'percent_discount', 19.5168, 2),
    (g_ver, 'KE-430HX-03', 'Completa', 'Completa', 2646.0000, 'price', 4071.0000, 'percent_discount', 19.5038, 'percent_discount', 19.5038, 3),
    (g_ver, 'KE-430HX-05', 'Cabeça', 'Cabeça', 1783.0000, 'price', 2743.0000, 'percent_discount', 19.5042, 'percent_discount', 19.5042, 4),
    (g_ver, 'KE-430HX-05', 'Cabeça + Caixa', 'Cabeça + Caixa', 2421.0000, 'price', 3725.0000, 'percent_discount', 19.5168, 'percent_discount', 19.5168, 5),
    (g_ver, 'KE-430HX-05', 'Completa', 'Completa', 2646.0000, 'price', 4071.0000, 'percent_discount', 19.5038, 'percent_discount', 19.5038, 6),
    (g_ver, 'KE-430HX-01', 'Cabeça', 'Cabeça', 1783.0000, 'price', 2743.0000, 'percent_discount', 19.5042, 'percent_discount', 19.5042, 7),
    (g_ver, 'KE-430HX-01', 'Cabeça + Caixa', 'Cabeça + Caixa', 2421.0000, 'price', 3725.0000, 'percent_discount', 19.5168, 'percent_discount', 19.5168, 8),
    (g_ver, 'KE-430HX-01', 'Completa', 'Completa', 2646.0000, 'price', 4071.0000, 'percent_discount', 19.5038, 'percent_discount', 19.5038, 9),
    (g_ver, 'KE-430HX-0K', 'Cabeça', 'Cabeça', 1783.0000, 'price', 2743.0000, 'percent_discount', 19.5042, 'percent_discount', 19.5042, 10),
    (g_ver, 'KE-430HX-0K', 'Cabeça + Caixa', 'Cabeça + Caixa', 2421.0000, 'price', 3725.0000, 'percent_discount', 19.5168, 'percent_discount', 19.5168, 11),
    (g_ver, 'KE-430HX-0K', 'Completa', 'Completa', 2646.0000, 'price', 4071.0000, 'percent_discount', 19.5038, 'percent_discount', 19.5038, 12);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001227', 'N40001227', 'CA-E-BI/KE430H Tampo 120x60x4 SHAPED', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 1),
    (g_opt, 'N40001228', 'N40001228', 'CA-E-BI/KE430H Tampo ECO 105x55x4', 65.0000, 'price', 100.0000, 'percent_discount', 19.0000, 'percent_discount', 19.0000, 2),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 3),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 4),
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 5),
    (g_opt, 'SA8197101', 'SA8197101', 'LARGE HOOK', 168.8000, 'price', 260.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 6),
    (g_opt, 'S59221501', 'S59221501', 'BOBBIN CASE FOR LARGE HOOK', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 7),
    (g_opt, 'S15665001', 'S15665001', 'BOBBIN FOR LARGE HOOK', 7.6500, 'price', 12.0000, 'percent_discount', 41.6667, 'percent_discount', 41.6667, 8),
    (g_opt, 'SA4195001', 'SA4195001', 'Work clamp blank - Right', 29.7500, 'price', 46.0000, 'percent_discount', 43.4783, 'percent_discount', 43.4783, 9),
    (g_opt, 'SA4196001', 'SA4196001', 'Work clamp blank - Left', 34.2500, 'price', 53.0000, 'percent_discount', 43.3962, 'percent_discount', 43.3962, 10),
    (g_opt, 'SA3626101', 'SA3626101', 'Feed plate blank', 34.2500, 'price', 53.0000, 'percent_discount', 43.3962, 'percent_discount', 43.3962, 11),
    (g_opt, 'SA3627101', 'SA3627101', 'Feed plate blank', 49.9500, 'price', 77.0000, 'percent_discount', 44.1558, 'percent_discount', 44.1558, 12),
    (g_opt, 'SA3817101', 'SA3817101', 'Feed plate blank', 35.3000, 'price', 55.0000, 'percent_discount', 43.6364, 'percent_discount', 43.6364, 13),
    (g_opt, 'N40001554', 'N40001554', 'UG-LUCK-ST801 EXT LABEL ATT DEVICE 50X40', 1475.0000, 'price', 2270.0000, 'percent_discount', 19.5154, 'percent_discount', 19.5154, 14),
    (g_opt, 'SB7552001', 'SB7552001', '2 Pedal Foot Switch Assy - Necessary with N40001554', 188.9500, 'price', 291.0000, 'percent_discount', 19.5876, 'percent_discount', 19.5876, 15),
    (g_opt, 'N40002395', 'N40002395', 'UG-LUCKST805 ROUND BARTACK DEV. (KE430H)', 1500.0000, 'price', 2308.0000, 'percent_discount', 19.4974, 'percent_discount', 19.4974, 16),
    (g_opt, 'SB77771E1', 'SB77771E1', 'KIT FOR SEWING AREA EXPANSION 50x40mm', 444.0500, 'price', 684.0000, 'percent_discount', 43.7135, 'percent_discount', 43.7135, 17),
    (g_opt, 'N40002265', 'N40002265', 'Blank clamp+feed plate 50x40', 144.5000, 'price', 223.0000, 'percent_discount', 19.7309, 'percent_discount', 19.7309, 18),
    (g_opt, 'BKX430H00000000045', 'BKX430H00000000045', 'KX430H-1P-230V-CE', 638.0000, 'price', 982.0000, 'percent_discount', 19.5519, 'percent_discount', 19.5519, 19);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BE-438HS/BE-438HX', 'Máquina de Pregar Botões Eletrónica Direct Drive', 190)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BE-438HS', 'BE-438HS', 'Máquina de Pregar Botões Eletrónica Direct Drive', 2825.0000, 'margin', 34.9977, 'percent_discount', 19.4892, 'percent_discount', 19.4892),
    (fam, 'BE-438HX', 'BE-438HX', 'Máquina de Pregar Botões Eletrónica Direct Drive', 3108.0000, 'margin', 35.0063, 'percent_discount', 19.5107, 'percent_discount', 19.5107);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máxima produtividade e máx. velocidade de costura 2800 rpm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Máx. superfície de costura (X-Y): 6,4 x 6,4 mm. - Shuttle hook', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, '64 modelos de costura - tamanho do botão 8-30mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento do ponto: 0,05 - 6,4 mm. - Altura da pinça 13 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Entrada USB - Linha sobrante curta', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Levantamento de calcador com motor de passo - Tira linhas', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Painel digital', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Lubrificação BE438HS: Lubrificação minima', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'BE438HX: Semi-seco', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'For BE438HX apenas: Tensão digital', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BE-438HS', 'Cabeça', 'Cabeça', 1962.0000, 'price', 3018.0000, 'percent_discount', 19.4831, 'percent_discount', 19.4831, 1),
    (g_ver, 'BE-438HS', 'Cabeça + Caixa', 'Cabeça + Caixa', 2600.0000, 'price', 4000.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000, 2),
    (g_ver, 'BE-438HS', 'Completa', 'Completa', 2825.0000, 'price', 4346.0000, 'percent_discount', 19.4892, 'percent_discount', 19.4892, 3),
    (g_ver, 'BE-438HX', 'Cabeça', 'Cabeça', 2245.0000, 'price', 3454.0000, 'percent_discount', 19.5136, 'percent_discount', 19.5136, 4),
    (g_ver, 'BE-438HX', 'Cabeça + Caixa', 'Cabeça + Caixa', 2883.0000, 'price', 4436.0000, 'percent_discount', 19.5221, 'percent_discount', 19.5221, 5),
    (g_ver, 'BE-438HX', 'Completa', 'Completa', 3108.0000, 'price', 4782.0000, 'percent_discount', 19.5107, 'percent_discount', 19.5107, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40001227', 'N40001227', 'CA-E-BI/KE430H Tampo 120x60x4 SHAPED', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 1),
    (g_opt, 'N40001228', 'N40001228', 'CA-E-BI/KE430H Tampo ECO 105x55x4', 65.0000, 'price', 100.0000, 'percent_discount', 19.0000, 'percent_discount', 19.0000, 2),
    (g_opt, 'N40001617', 'N40001617', 'RE-BR01-Bancada c/pedal/vareta/gaveta', 66.0000, 'price', 102.0000, 'percent_discount', 19.6078, 'percent_discount', 19.6078, 3),
    (g_opt, 'N40001616', 'N40001616', 'RE-BR02-Bancada c/pedal/vareta/gaveta/rodas', 80.0000, 'price', 124.0000, 'percent_discount', 20.1613, 'percent_discount', 20.1613, 4),
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 5),
    (g_opt, 'SB7900201', 'SB7900201', 'SET FOR SHANK BUTTON H Serie', 2142.0500, 'price', 3296.0000, 'percent_discount', 43.6590, 'percent_discount', 43.6590, 6),
    (g_opt, 'SA9303201', 'SA9303201', 'BUTTON CLAMP for button with diameter 20mm.', 401.8000, 'price', 619.0000, 'percent_discount', 43.7803, 'percent_discount', 43.7803, 7),
    (g_opt, 'N40001114', 'N40001114', 'ST-12 LOIVA AUTOMATIC BUTTON FEEDER', 6500.0000, 'price', 10000.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000, 8),
    (g_opt, 'ZLOIVAST10', 'ZLOIVAST10', 'ST-10 LOIVA BUTTON WRAPPING AND KNOTTING', 6100.0000, 'price', 9385.0000, 'percent_discount', 19.4992, 'percent_discount', 19.4992, 9),
    (g_opt, 'BKX430H00000000045', 'BKX430H00000000045', 'KX430H-1P-230V-CE', 638.0000, 'price', 982.0000, 'percent_discount', 19.5519, 'percent_discount', 19.5519, 10);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'HE-800C', 'Máquina de Casear Eletrónica  Direct Drive', 200)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'HE-800C-2', 'HE-800C-2', 'Máquina de Casear Eletrónica  Direct Drive', 3171.0000, 'margin', 34.9938, 'percent_discount', 19.4752, 'percent_discount', 19.4752),
    (fam, 'HE-800C-3', 'HE-800C-3', 'Máquina de Casear Eletrónica  Direct Drive', 3171.0000, 'margin', 34.9938, 'percent_discount', 19.4752, 'percent_discount', 19.4752);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máxima produtividade e máx. velocidade de costura 4000 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Comprimento máx. botão: 40 mm. - Largura máxima de costura: 6 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, '50 padrões de costura - 999  pontos/padrão', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, '21 formas de padrão - Altura da pinça de trabalho: 13 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Padrão de colocação - Painel digital', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Entrada para cartão SD', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'HE-800C-2', 'Cabeça', 'Cabeça', 2085.0000, 'price', 3208.0000, 'percent_discount', 19.5137, 'percent_discount', 19.5137, 1),
    (g_ver, 'HE-800C-2', 'Cabeça + Caixa', 'Cabeça + Caixa', 2940.0000, 'price', 4523.0000, 'percent_discount', 19.5003, 'percent_discount', 19.5003, 2),
    (g_ver, 'HE-800C-2', 'Completa', 'Completa', 3171.0000, 'price', 4878.0000, 'percent_discount', 19.4752, 'percent_discount', 19.4752, 3),
    (g_ver, 'HE-800C-3', 'Cabeça', 'Cabeça', 2085.0000, 'price', 3208.0000, 'percent_discount', 19.5137, 'percent_discount', 19.5137, 4),
    (g_ver, 'HE-800C-3', 'Cabeça + Caixa', 'Cabeça + Caixa', 2940.0000, 'price', 4523.0000, 'percent_discount', 19.5003, 'percent_discount', 19.5003, 5),
    (g_ver, 'HE-800C-3', 'Completa', 'Completa', 3171.0000, 'price', 4878.0000, 'percent_discount', 19.4752, 'percent_discount', 19.4752, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000416', 'N40000416', 'CA-E-BI/HE800B Tampo 120x65x4', 91.0000, 'price', 140.0000, 'percent_discount', 19.2857, 'percent_discount', 19.2857, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40002340', 'N40002340', 'RE-S385Bancada Versão Superior W/vareta ROD +PEDAL S424. High Ajustável', 88.0000, 'price', 136.0000, 'percent_discount', 19.8529, 'percent_discount', 19.8529, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 MOTOR SWITCH 230V', 45.0000, 'price', 70.0000, 'percent_discount', 20.0000, 'percent_discount', 20.0000, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BHE800C32A8412010L', 'BHE800C32A8412010L', 'HE-800C-3', 3171.0000, 'price', 4879.0000, 'percent_discount', 19.4917, 'percent_discount', 19.4917, 1),
    (g_opt, 'N40001962', 'N40001962', 'RE-S401 KIT rodas  (Bancada S385)', 24.0000, 'price', 37.0000, 'percent_discount', 18.9189, 'percent_discount', 18.9189, 2),
    (g_opt, 'S50321001', 'S50321001', 'NEEDLE PLATE', 160.7500, 'price', 248.0000, 'percent_discount', 43.9516, 'percent_discount', 43.9516, 3),
    (g_opt, '151843001', '151843001', 'TEFLON PLATE', 0.5500, 'price', 1.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000, 4),
    (g_opt, 'S50322101', 'S50322101', 'NEEDLE PLATE', 173.8500, 'price', 268.0000, 'percent_discount', 43.6567, 'percent_discount', 43.6567, 5),
    (g_opt, '156612001', '156612001', 'TEFLON PLATE', 0.7000, 'price', 2.0000, 'percent_discount', 50.0000, 'percent_discount', 50.0000, 6),
    (g_opt, 'S50477001', 'S50477001', 'RULER ASSY (BUTTONHOLE SPACER GUIDE)', 93.0000, 'price', 144.0000, 'percent_discount', 43.7500, 'percent_discount', 43.7500, 7),
    (g_opt, 'BHX800C00000000045', 'BHX800C00000000045', 'HX800C-1P-230V-CE', 855.0000, 'price', 1316.0000, 'percent_discount', 19.5289, 'percent_discount', 19.5289, 8);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'RH-982A', 'Máquina Olhal Eletrónica', 210)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'RH-982A-01-1D', 'RH-982A-01-1D', 'Máquina Olhal Eletrónica', 9109.0000, 'margin', 35.0007, 'percent_discount', 19.5019, 'percent_discount', 19.5019);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máxima produtividade e máx. velocidade de costura 2500 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Tamanho do ponto: 0,5 - 2,0 mm. - Largura do zigzag : 1,5 - 5,0 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Campo de trabalho grande - Altura do calcador: 12 - 16 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento da barra 0 - 20 mm. - Ciclo de costura (9 programas)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Comprimento de costura: 5 - 50 mm. for RH982A-00', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Comprimento de costura 5 - 42 mm. for RH982A-01', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'RH-982A-01-1D', 'Cabeça', 'Cabeça', 7805.0000, 'price', 12008.0000, 'percent_discount', 19.5037, 'percent_discount', 19.5037, 1),
    (g_ver, 'RH-982A-01-1D', 'Cabeça + Caixa', 'Cabeça + Caixa', 8660.0000, 'price', 13323.0000, 'percent_discount', 19.5001, 'percent_discount', 19.5001, 2),
    (g_ver, 'RH-982A-01-1D', 'Completa', 'Completa', 9109.0000, 'price', 14014.0000, 'percent_discount', 19.5019, 'percent_discount', 19.5019, 3);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000361', 'N40000361', 'CA-E-BI/RH982A Tampo 120x70x5', 130.0000, 'price', 200.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40001964', 'N40001964', 'RE-S480/750-ECO Bancada RH982A W/rodas', 240.0000, 'price', 370.0000, 'percent_discount', 19.7297, 'percent_discount', 19.7297, 3),
    (g_ban, 'N40000580', 'N40000580', 'CA-2702.M.EM Thermic switch 1PH/3 cables', 72.0000, 'price', 111.0000, 'percent_discount', 19.8198, 'percent_discount', 19.8198, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40000417', 'N40000417', 'CA-E-BI/RH982A SUBMERGED 120x80x5', 200.0000, 'price', 308.0000, 'percent_discount', 19.4805, 'percent_discount', 19.4805, 1),
    (g_opt, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_opt, 'N40001964', 'N40001964', 'RE-S480/750-ECO Bancada RH982A W/rodas', 240.0000, 'price', 370.0000, 'percent_discount', 19.7297, 'percent_discount', 19.7297, 3),
    (g_opt, 'N40000580', 'N40000580', 'CA-2702.M.EM Thermic switch 1PH/3 cables', 72.0000, 'price', 111.0000, 'percent_discount', 19.8198, 'percent_discount', 19.8198, 4),
    (g_opt, 'N100000120BOM', 'N100000120BOM', 'SET OF PARTS FOR SUBMERGED INSTALL.', 57.0000, 'price', 88.0000, 'percent_discount', 19.3182, 'percent_discount', 19.3182, 5),
    (g_opt, 'SC1761001', 'SC1761001', 'Thread breakage detector', 81.7000, 'price', 126.0000, 'percent_discount', 43.6508, 'percent_discount', 43.6508, 6),
    (g_opt, 'SA79310E1', 'SA79310E1', 'Thread nipper', 1700.0000, 'price', 2616.0000, 'percent_discount', 43.6544, 'percent_discount', 43.6544, 7),
    (g_opt, 'SA93130E1', 'SA93130E1', 'Cut lenght change over device (Lapel device)', 1700.0000, 'price', 2616.0000, 'percent_discount', 43.6544, 'percent_discount', 43.6544, 8),
    (g_opt, 'SB9980001', 'SB9980001', 'Two pedal foot switch', 163.6500, 'price', 252.0000, 'percent_discount', 43.6508, 'percent_discount', 43.6508, 9),
    (g_opt, 'SA7773001', 'SA7773001', 'Conversion set from spec. -01 to spec. -02', 790.1000, 'price', 1216.0000, 'percent_discount', 43.6678, 'percent_discount', 43.6678, 10),
    (g_opt, 'SA7808101', 'SA7808101', 'Conversion set for circular stitch - Quick change', 2000.0000, 'price', 3077.0000, 'percent_discount', 43.6464, 'percent_discount', 43.6464, 11),
    (g_opt, 'S41337001', 'S41337001', 'Work clamp (left and right)', 724.0000, 'price', 1114.0000, 'percent_discount', 43.6266, 'percent_discount', 43.6266, 12),
    (g_opt, 'S41340001', 'S41340001', 'Needle plate Right', 52.1000, 'price', 81.0000, 'percent_discount', 44.4444, 'percent_discount', 44.4444, 13),
    (g_opt, 'S41341001', 'S41341001', 'Needle plate Left', 52.1000, 'price', 81.0000, 'percent_discount', 44.4444, 'percent_discount', 44.4444, 14),
    (g_opt, 'SA6743101', 'SA6743101', 'Clamp arm Left', 15.6500, 'price', 25.0000, 'percent_discount', 44.0000, 'percent_discount', 44.0000, 15),
    (g_opt, 'SA6734101', 'SA6734101', 'Clamp arm Right', 15.6500, 'price', 25.0000, 'percent_discount', 44.0000, 'percent_discount', 44.0000, 16),
    (g_opt, 'S41344001', 'S41344001', 'Hammer for diameter 2 and 3 mm.', 84.6000, 'price', 131.0000, 'percent_discount', 44.2748, 'percent_discount', 44.2748, 17),
    (g_opt, 'S41345001', 'S41345001', 'Hammer for diameter 4 and 5 mm.', 84.6000, 'price', 131.0000, 'percent_discount', 44.2748, 'percent_discount', 44.2748, 18),
    (g_opt, 'S41347001', 'S41347001', 'Knife for diameter 3 mm.', 326.4500, 'price', 503.0000, 'percent_discount', 43.7376, 'percent_discount', 43.7376, 19),
    (g_opt, 'S41348001', 'S41348001', 'Knife for diameter 4 mm.', 328.5000, 'price', 506.0000, 'percent_discount', 43.6759, 'percent_discount', 43.6759, 20),
    (g_opt, 'S41349001', 'S41349001', 'Knife for diameter 5 mm.', 328.5000, 'price', 506.0000, 'percent_discount', 43.6759, 'percent_discount', 43.6759, 21),
    (g_opt, 'BRX982A00000000045', 'BRX982A00000000045', 'RX982A-1P-230V-CE-WO/SW', 855.0000, 'price', 1316.0000, 'percent_discount', 19.5289, 'percent_discount', 19.5289, 22);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'RH-982A-CO', 'Máquina de Casear Olhal Eletrónica', 220)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'RH-982A-02-12 L2230', 'RH-982A-02-12 L2230', 'Máquina de Casear Olhal Eletrónica', 9109.0000, 'margin', 35.0007, 'percent_discount', 23.4052, 'percent_discount', 23.4052);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máxima produtividade e máx. velocidade de costura 2500 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Tamanho do ponto 0,5 - 2,0 mm.  Largura do zigzag 1,5 - 5,0 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Campo de trabalho grande - Altura do calcador 12 - 16 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento da barra: 0 - 20 mm. - Ciclo de costura (9 programas)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Comprimento da costura: 22 -30 mm as standard for RH982A-02', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'RH-982A-02-12 L2230', 'Cabeça', 'Cabeça', 7805.0000, 'price', 12008.0000, 'percent_discount', 19.5037, 'percent_discount', 19.5037, 1),
    (g_ver, 'RH-982A-02-12 L2230', 'Cabeça + Caixa', 'Cabeça + Caixa', 8660.0000, 'price', 13323.0000, 'percent_discount', 19.5001, 'percent_discount', 19.5001, 2),
    (g_ver, 'RH-982A-02-12 L2230', 'Completa', 'Completa', 9109.0000, 'price', 14014.0000, 'percent_discount', 23.4052, 'percent_discount', 23.4052, 3);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000361', 'N40000361', 'CA-E-BI/RH982A Tampo 120x70x5', 130.0000, 'price', 200.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40001964', 'N40001964', 'RE-S480/750-ECO Bancada RH982A W/rodas', 240.0000, 'price', 370.0000, 'percent_discount', 19.7297, 'percent_discount', 19.7297, 3),
    (g_ban, 'N40000580', 'N40000580', 'CA-2702.M.EM Thermic switch 1PH/3 cables', 72.0000, 'price', 111.0000, 'percent_discount', 19.8198, 'percent_discount', 19.8198, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'N40000417', 'N40000417', 'CA-E-BI/RH982A SUBMERGED 120x80x5', 200.0000, 'price', 308.0000, 'percent_discount', 19.4805, 'percent_discount', 19.4805, 1),
    (g_opt, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_opt, 'N40001964', 'N40001964', 'RE-S480/750-ECO Bancada RH982A W/rodas', 240.0000, 'price', 370.0000, 'percent_discount', 19.7297, 'percent_discount', 19.7297, 3),
    (g_opt, 'N40000580', 'N40000580', 'CA-2702.M.EM Thermic switch 1PH/3 cables', 72.0000, 'price', 111.0000, 'percent_discount', 19.8198, 'percent_discount', 19.8198, 4),
    (g_opt, 'N100000120BOM', 'N100000120BOM', 'SET OF PARTS FOR SUBMERGED INSTALL.', 57.0000, 'price', 88.0000, 'percent_discount', 19.3182, 'percent_discount', 19.3182, 5),
    (g_opt, 'SC1761001', 'SC1761001', 'Thread breakage detector', 81.7000, 'price', 126.0000, 'percent_discount', 43.6508, 'percent_discount', 43.6508, 6),
    (g_opt, 'SB9980001', 'SB9980001', 'Two pedal foot switch', 163.6500, 'price', 252.0000, 'percent_discount', 43.6508, 'percent_discount', 43.6508, 7),
    (g_opt, 'SA7784201', 'SA7784201', 'Conversion set from spec. -02 to spec. -01', 1794.2000, 'price', 2761.0000, 'percent_discount', 43.6798, 'percent_discount', 43.6798, 8),
    (g_opt, 'SA7750401', 'SA7750401', 'Gauge parts for sewing length L 14-22', 1543.5500, 'price', 2375.0000, 'percent_discount', 43.6632, 'percent_discount', 43.6632, 9),
    (g_opt, 'SA7771201', 'SA7771201', 'Gauge parts for sewing length L 18-26', 1612.4000, 'price', 2481.0000, 'percent_discount', 43.6518, 'percent_discount', 43.6518, 10),
    (g_opt, 'SA7752201', 'SA7752201', 'Gauge parts for sewing length L 22-30', 1543.5500, 'price', 2375.0000, 'percent_discount', 43.6632, 'percent_discount', 43.6632, 11),
    (g_opt, 'SA7756201', 'SA7756201', 'Gauge parts for sewing length L 26-34', 1612.4000, 'price', 2481.0000, 'percent_discount', 43.6518, 'percent_discount', 43.6518, 12),
    (g_opt, 'SA7764201', 'SA7764201', 'Gauge parts for sewing length L 34-42', 1543.5500, 'price', 2375.0000, 'percent_discount', 43.6632, 'percent_discount', 43.6632, 13),
    (g_opt, 'BRX982A00000000045', 'BRX982A00000000045', 'RX982A-1P-230V-CE-WO/SW', 855.0000, 'price', 1316.0000, 'percent_discount', 19.5289, 'percent_discount', 19.5289, 14);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BAS311HN HX  HS', 'Máquina de Campo Eletrónica Direct Drive', 230)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BAS311HS05A', 'BAS311HS05A', 'Máquina de Campo Eletrónica Direct Drive', 5408.0000, 'margin', 35.0078, 'percent_discount', 19.5049, 'percent_discount', 19.5049),
    (fam, 'BAS311HX05A', 'BAS311HX05A', 'Máquina de Campo Eletrónica Direct Drive', 6072.0000, 'margin', 35.0102, 'percent_discount', 19.5119, 'percent_discount', 19.5119),
    (fam, 'BAS311HN-07A', 'BAS311HN-07A', 'Máquina de Campo Eletrónica Direct Drive', 6072.0000, 'margin', 35.0102, 'percent_discount', 19.5119, 'percent_discount', 19.5119);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máquina de costura programável com base cilindrica', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Lançadeira de grande capacidade e calcador intermitente', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Área de costura: (X-Y): 150 x 100 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Velocidade máx. de costura: 2800 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Comprimento do ponto: 0,05-12,7 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Elevação do calcador 22mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura de elevação da pinça de trabalho 30 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Tensão digital: (HX-05), Detetor de rutura do fio (HN, HX)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Entrada para cartão SD para transferencia de dados - 2 entradas USB', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Painel digital', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BAS311HS05A', 'Cabeça', 'Cabeça', 4025.0000, 'price', 6192.0000, 'percent_discount', 19.4929, 'percent_discount', 19.4929, 1),
    (g_ver, 'BAS311HS05A', 'Cabeça + Caixa', 'Cabeça + Caixa', 5072.0000, 'price', 7803.0000, 'percent_discount', 19.4925, 'percent_discount', 19.4925, 2),
    (g_ver, 'BAS311HS05A', 'Completa', 'Completa', 5408.0000, 'price', 8321.0000, 'percent_discount', 19.5049, 'percent_discount', 19.5049, 3),
    (g_ver, 'BAS311HX05A', 'Cabeça', 'Cabeça', 4689.0000, 'price', 7214.0000, 'percent_discount', 19.5037, 'percent_discount', 19.5037, 4),
    (g_ver, 'BAS311HX05A', 'Cabeça + Caixa', 'Cabeça + Caixa', 5736.0000, 'price', 8825.0000, 'percent_discount', 19.5014, 'percent_discount', 19.5014, 5),
    (g_ver, 'BAS311HX05A', 'Completa', 'Completa', 6072.0000, 'price', 9343.0000, 'percent_discount', 19.5119, 'percent_discount', 19.5119, 6),
    (g_ver, 'BAS311HN-07A', 'Cabeça', 'Cabeça', 4689.0000, 'price', 7214.0000, 'percent_discount', 19.5037, 'percent_discount', 19.5037, 7),
    (g_ver, 'BAS311HN-07A', 'Cabeça + Caixa', 'Cabeça + Caixa', 5736.0000, 'price', 8825.0000, 'percent_discount', 19.5014, 'percent_discount', 19.5014, 8),
    (g_ver, 'BAS311HN-07A', 'Completa', 'Completa', 6072.0000, 'price', 9343.0000, 'percent_discount', 19.5119, 'percent_discount', 19.5119, 9);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000519', 'N40000519', 'CA-E-BI/BAS311H Tampo 120x60x4', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40001963', 'N40001963', 'RE-S480/506 Bancada BAS W/rodas', 172.0000, 'price', 265.0000, 'percent_discount', 19.6226, 'percent_discount', 19.6226, 3),
    (g_ban, 'N40000580', 'N40000580', 'CA.2702.M.EM Thermic switch 1PH', 72.0000, 'price', 111.0000, 'percent_discount', 19.8198, 'percent_discount', 19.8198, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 1),
    (g_opt, 'SA64952E1', 'SA64952E1', '3 Pedal foot switch assy', 414.4000, 'price', 638.0000, 'percent_discount', 43.7304, 'percent_discount', 43.7304, 2),
    (g_opt, 'SB8722201', 'SB8722201', 'Bobbin winder', 1013.9500, 'price', 1560.0000, 'percent_discount', 43.6538, 'percent_discount', 43.6538, 3),
    (g_opt, 'N40000903', 'N40000903', 'Bar code reader RLB-1000-RS232C', 685.0000, 'price', 1054.0000, 'percent_discount', 19.5446, 'percent_discount', 19.5446, 4),
    (g_opt, 'SA9194101', 'SA9194101', 'Automatic ejecting system set', 1975.5500, 'price', 3040.0000, 'percent_discount', 43.6513, 'percent_discount', 43.6513, 5),
    (g_opt, 'SA7197301', 'SA7197301', '2 Step Thread tension device', 824.1500, 'price', 1268.0000, 'percent_discount', 43.6909, 'percent_discount', 43.6909, 6),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 7),
    (g_opt, 'SA7189301', 'SA7189301', 'Inner clamp device', 1800.0000, 'price', 2770.0000, 'percent_discount', 43.6823, 'percent_discount', 43.6823, 8),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 9),
    (g_opt, 'SA5559101', 'SA5559101', 'Needle cooler', 483.4500, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 10),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 11),
    (g_opt, 'N40001013', 'N40001013', '311-MHA-CLD100  Thread detective device', 1525.0000, 'price', 2347.0000, 'percent_discount', 19.5143, 'percent_discount', 19.5143, 12),
    (g_opt, 'N40001014', 'N40001014', '311-MHA-CSD100  Skip stitch and bobbin rotation detector', 2125.0000, 'price', 3270.0000, 'percent_discount', 19.5107, 'percent_discount', 19.5107, 13),
    (g_opt, 'N40000836', 'N40000836', 'Bobbin checker Kinoshita', 1475.0000, 'price', 2270.0000, 'percent_discount', 19.5154, 'percent_discount', 19.5154, 14),
    (g_opt, 'N40001710', 'N40001710', 'UG-LUCK-ST001 EXT LABEL ATT DEVICE BAS', 825.0000, 'price', 1270.0000, 'percent_discount', 19.5276, 'percent_discount', 19.5276, 15),
    (g_opt, 'SC33782E1', 'SC33782E1', 'SEW-DEFECT DETECTION DEVICE', 923.4500, 'price', 1421.0000, 'percent_discount', 43.6312, 'percent_discount', 43.6312, 16),
    (g_opt, 'N40002081', 'N40002081', 'RSG-BB102/10HC HEAT CUTTER H-SERIES LEFT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 17),
    (g_opt, 'N40002082', 'N40002082', 'RSG-BB102/10HC HEAT CUTTER H-SERIES RIGHT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 18),
    (g_opt, 'N40000011', 'N40000011', 'Auto Bobbin Changer - For 8 Bobbin', 2650.0000, 'price', 4077.0000, 'percent_discount', 19.4996, 'percent_discount', 19.4996, 19),
    (g_opt, 'S59221501', 'S59221501', 'Bobbin case for spec. -05 - NEED 16 pieces', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 20),
    (g_opt, 'S44633001', 'S44633001', 'Bobbin for spec. -05 - NEED 16 pieces', 8.7500, 'price', 14.0000, 'percent_discount', 42.8571, 'percent_discount', 42.8571, 21),
    (g_opt, 'S59222501', 'S59222501', 'Bobbin case for spec. -07 - NEED 16 pieces', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 22),
    (g_opt, 'S15666001', 'S15666001', 'Bobbin for specification -07 - NEED 16 pieces', 6.4500, 'price', 10.0000, 'percent_discount', 40.0000, 'percent_discount', 40.0000, 23),
    (g_opt, 'N10013428', 'N10013428', 'Additional Bobbin/Bobbin case magazin', 375.0000, 'price', 577.0000, 'percent_discount', 19.5841, 'percent_discount', 19.5841, 24),
    (g_opt, 'BAX311HA000000P045', 'BAX311HA000000P045', 'AX311HA-1P-230V-CE-WO/SW-W/PD', 1047.0000, 'price', 1611.0000, 'percent_discount', 19.4910, 'percent_discount', 19.4910, 25);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BAS326H HX HS', 'Máquina de Campo Eletrónica Direct Drive', 240)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BAS326HS05A', 'BAS326HS05A', 'Máquina de Campo Eletrónica Direct Drive', 6633.0000, 'margin', 35.0088, 'percent_discount', 19.5081, 'percent_discount', 19.5081),
    (fam, 'BAS326HX05A', 'BAS326HX05A', 'Máquina de Campo Eletrónica Direct Drive', 7584.0000, 'margin', 35.0073, 'percent_discount', 19.5047, 'percent_discount', 19.5047),
    (fam, 'BAS326H-07A', 'BAS326H-07A', 'Máquina de Campo Eletrónica Direct Drive', 7584.0000, 'margin', 35.0073, 'percent_discount', 19.5047, 'percent_discount', 19.5047);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máquina de costura programável de base cilindrica', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Lançadeira de grande capacidade e calcador intermitente', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Área de costura: (X-Y): BAS326H 220x100 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Máx. velocidade de costura: 2800 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Comprimento do ponto: 0,05-12,7 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Levantamento do calcador: 22 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura de elevação da pinça de trabalho 30 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Tensão digital (HX-05), Detetor de rutura do fio (H, HX)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Entrada para cartão SD para transferência de dados, e 2 entradas USB', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Painel digital com função de programação', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BAS326HS05A', 'Cabeça', 'Cabeça', 5250.0000, 'price', 8077.0000, 'percent_discount', 19.4998, 'percent_discount', 19.4998, 1),
    (g_ver, 'BAS326HS05A', 'Cabeça + Caixa', 'Cabeça + Caixa', 6297.0000, 'price', 9688.0000, 'percent_discount', 19.4983, 'percent_discount', 19.4983, 2),
    (g_ver, 'BAS326HS05A', 'Completa', 'Completa', 6633.0000, 'price', 10206.0000, 'percent_discount', 19.5081, 'percent_discount', 19.5081, 3),
    (g_ver, 'BAS326HX05A', 'Cabeça', 'Cabeça', 6201.0000, 'price', 9540.0000, 'percent_discount', 19.4969, 'percent_discount', 19.4969, 4),
    (g_ver, 'BAS326HX05A', 'Cabeça + Caixa', 'Cabeça + Caixa', 7248.0000, 'price', 11151.0000, 'percent_discount', 19.4960, 'percent_discount', 19.4960, 5),
    (g_ver, 'BAS326HX05A', 'Completa', 'Completa', 7584.0000, 'price', 11669.0000, 'percent_discount', 19.5047, 'percent_discount', 19.5047, 6),
    (g_ver, 'BAS326H-07A', 'Cabeça', 'Cabeça', 6201.0000, 'price', 9540.0000, 'percent_discount', 19.4969, 'percent_discount', 19.4969, 7),
    (g_ver, 'BAS326H-07A', 'Cabeça + Caixa', 'Cabeça + Caixa', 7248.0000, 'price', 11151.0000, 'percent_discount', 19.4960, 'percent_discount', 19.4960, 8),
    (g_ver, 'BAS326H-07A', 'Completa', 'Completa', 7584.0000, 'price', 11669.0000, 'percent_discount', 19.5047, 'percent_discount', 19.5047, 9);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000519', 'N40000519', 'CA-E-BI/BAS311H Tampo 120x60x4', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40001963', 'N40001963', 'RE-S480/506 Bancada BAS W/rodas', 172.0000, 'price', 265.0000, 'percent_discount', 19.6226, 'percent_discount', 19.6226, 3),
    (g_ban, 'N40000580', 'N40000580', 'CA.2702.M.EM Thermic switch 1PH', 72.0000, 'price', 111.0000, 'percent_discount', 19.8198, 'percent_discount', 19.8198, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 1),
    (g_opt, 'SA64952E1', 'SA64952E1', '3 Pedal foot switch assy', 414.4000, 'price', 638.0000, 'percent_discount', 43.7304, 'percent_discount', 43.7304, 2),
    (g_opt, 'SB8722201', 'SB8722201', 'Bobbin winder', 1013.9500, 'price', 1560.0000, 'percent_discount', 43.6538, 'percent_discount', 43.6538, 3),
    (g_opt, 'N40000903', 'N40000903', 'Bar code reader RLB-1000-RS232C', 685.0000, 'price', 1054.0000, 'percent_discount', 19.5446, 'percent_discount', 19.5446, 4),
    (g_opt, 'SA9194101', 'SA9194101', 'Automatic ejecting system set', 1975.5500, 'price', 3040.0000, 'percent_discount', 43.6513, 'percent_discount', 43.6513, 5),
    (g_opt, 'SA7197301', 'SA7197301', '2 Step Thread tension device', 824.1500, 'price', 1268.0000, 'percent_discount', 43.6909, 'percent_discount', 43.6909, 6),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 7),
    (g_opt, 'SA7189301', 'SA7189301', 'Inner clamp device', 1800.0000, 'price', 2770.0000, 'percent_discount', 43.6823, 'percent_discount', 43.6823, 8),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 9),
    (g_opt, 'SA5559101', 'SA5559101', 'Needle cooler', 483.4500, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 10),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 11),
    (g_opt, 'N40000011', 'N40000011', 'Auto Bobbin Changer - For 8 Bobbin', 2650.0000, 'price', 4077.0000, 'percent_discount', 19.4996, 'percent_discount', 19.4996, 12),
    (g_opt, 'S59221501', 'S59221501', 'Bobbin case for spec. -05 - NEED 16 pieces', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 13),
    (g_opt, 'S44633001', 'S44633001', 'Bobbin for spec. -05 - NEED 16 pieces', 8.7500, 'price', 14.0000, 'percent_discount', 42.8571, 'percent_discount', 42.8571, 14),
    (g_opt, 'S59222501', 'S59222501', 'Bobbin case for spec. -07 - NEED 16 pieces', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 15),
    (g_opt, 'S15666001', 'S15666001', 'Bobbin for specification -07 - NEED 16 pieces', 6.4500, 'price', 10.0000, 'percent_discount', 40.0000, 'percent_discount', 40.0000, 16),
    (g_opt, 'N10013428', 'N10013428', 'Additional Bobbin/Bobbin case magazin', 375.0000, 'price', 577.0000, 'percent_discount', 19.5841, 'percent_discount', 19.5841, 17),
    (g_opt, 'N40001013', 'N40001013', '311-MHA-CLD100  Thread detective device', 1525.0000, 'price', 2347.0000, 'percent_discount', 19.5143, 'percent_discount', 19.5143, 18),
    (g_opt, 'N40001014', 'N40001014', '311-MHA-CSD100  Skip stitch and bobbin rotation detector', 2125.0000, 'price', 3270.0000, 'percent_discount', 19.5107, 'percent_discount', 19.5107, 19),
    (g_opt, 'N40000836', 'N40000836', 'Bobbin checker Kinoshita', 1475.0000, 'price', 2270.0000, 'percent_discount', 19.5154, 'percent_discount', 19.5154, 20),
    (g_opt, 'SC33782E1', 'SC33782E1', 'SEW-DEFECT DETECTION DEVICE', 923.4500, 'price', 1421.0000, 'percent_discount', 43.6312, 'percent_discount', 43.6312, 21),
    (g_opt, 'N40002081', 'N40002081', 'RSG-BB102/10HC HEAT CUTTER H-SERIES LEFT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 22),
    (g_opt, 'N40002082', 'N40002082', 'RSG-BB102/10HC HEAT CUTTER H-SERIES RIGHT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 23),
    (g_opt, 'N40001710', 'N40001710', 'UG-LUCK-ST001 EXT LABEL ATT DEVICE BAS', 825.0000, 'price', 1270.0000, 'percent_discount', 19.5276, 'percent_discount', 19.5276, 24),
    (g_opt, 'BAX311HA000000P045', 'BAX311HA000000P045', 'AX311HA-1P-230V-CE-WO/SW-W/PD', 1047.0000, 'price', 1611.0000, 'percent_discount', 19.4910, 'percent_discount', 19.4910, 25);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BAS326H-484', '<Treble hook> Direct Drive Máquina de Campo Eletrónica', 250)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BAS326H-484', 'BAS326H-484', '<Treble hook> Direct Drive Máquina de Campo Eletrónica', 7424.0000, 'margin', 35.0083, 'percent_discount', 19.5045, 'percent_discount', 19.5045),
    (fam, 'BAS326H-484-SF', 'BAS326H-484-SF', '<Treble hook> Direct Drive Máquina de Campo Eletrónica', 7691.0000, 'margin', 35.0093, 'percent_discount', 19.5116, 'percent_discount', 19.5116);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máquina de costura programável de base cilindrica', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Equipado com uma lançadeira aguda e calcador intermitente', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Área de costura: (X-Y): 220 x 100 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Máx. velocidade de costura: 2200 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Comprimento do ponto: 0,05-12,7 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Mecanismo de corte forte para fio grosso', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Tira linhas, detetor de quebra de linhas', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Painel digital com função de programação', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Entrada para cartão SD para transferência de dados, e 2 entradas USB', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Para materiais grossos, cintos de segurança', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BAS326H-484', 'Cabeça', 'Cabeça', 6041.0000, 'price', 9294.0000, 'percent_discount', 19.4964, 'percent_discount', 19.4964, 1),
    (g_ver, 'BAS326H-484', 'Cabeça + Caixa', 'Cabeça + Caixa', 7088.0000, 'price', 10905.0000, 'percent_discount', 19.4956, 'percent_discount', 19.4956, 2),
    (g_ver, 'BAS326H-484', 'Completa', 'Completa', 7424.0000, 'price', 11423.0000, 'percent_discount', 19.5045, 'percent_discount', 19.5045, 3),
    (g_ver, 'BAS326H-484-SF', 'Cabeça', 'Cabeça', 6308.0000, 'price', 9705.0000, 'percent_discount', 19.5054, 'percent_discount', 19.5054, 4),
    (g_ver, 'BAS326H-484-SF', 'Cabeça + Caixa', 'Cabeça + Caixa', 7355.0000, 'price', 11316.0000, 'percent_discount', 19.5034, 'percent_discount', 19.5034, 5),
    (g_ver, 'BAS326H-484-SF', 'Completa', 'Completa', 7691.0000, 'price', 11834.0000, 'percent_discount', 19.5116, 'percent_discount', 19.5116, 6);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000519', 'N40000519', 'CA-E-BI/BAS311H Tampo 120x60x4', 85.0000, 'price', 131.0000, 'percent_discount', 19.8473, 'percent_discount', 19.8473, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40001963', 'N40001963', 'RE-S480/506 Bancada BAS W/rodas', 172.0000, 'price', 265.0000, 'percent_discount', 19.6226, 'percent_discount', 19.6226, 3),
    (g_ban, 'N40000580', 'N40000580', 'CA.2702.M.EM Thermic switch 1PH', 72.0000, 'price', 111.0000, 'percent_discount', 19.8198, 'percent_discount', 19.8198, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 1),
    (g_opt, 'SA64952E1', 'SA64952E1', '3 Pedal foot switch assy', 414.4000, 'price', 638.0000, 'percent_discount', 43.7304, 'percent_discount', 43.7304, 2),
    (g_opt, 'SB8722201', 'SB8722201', 'Bobbin winder', 1013.9500, 'price', 1560.0000, 'percent_discount', 43.6538, 'percent_discount', 43.6538, 3),
    (g_opt, 'SA9194101', 'SA9194101', 'Automatic ejecting system set', 1975.5500, 'price', 3040.0000, 'percent_discount', 43.6513, 'percent_discount', 43.6513, 4),
    (g_opt, 'SA7197301', 'SA7197301', '2 Step Thread tension device', 824.1500, 'price', 1268.0000, 'percent_discount', 43.6909, 'percent_discount', 43.6909, 5),
    (g_opt, 'SA5559101', 'SA5559101', 'Needle cooler', 483.4500, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 6),
    (g_opt, 'N40000514', 'N40000514', 'HAMS MHA-CLD100', 1050.0000, 'price', 1616.0000, 'percent_discount', 19.5545, 'percent_discount', 19.5545, 7),
    (g_opt, 'N40000516', 'N40000516', 'HAMS MHA-CSD100', 2419.0000, 'price', 3722.0000, 'percent_discount', 19.5056, 'percent_discount', 19.5056, 8),
    (g_opt, 'N40002081', 'N40002081', 'RSG-BB102/10HC HEAT CUTTER H-SERIES LEFT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 9),
    (g_opt, 'N40002082', 'N40002082', 'RSG-BB102/10HC HEAT CUTTER H-SERIES RIGHT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 10),
    (g_opt, 'SC33782E1', 'SC33782E1', 'SEW-DEFECT DETECTION DEVICE', 923.4500, 'price', 1421.0000, 'percent_discount', 43.6312, 'percent_discount', 43.6312, 11),
    (g_opt, 'N40002473', 'N40002473', 'CPL. Device
ABC, Skip.-Rot., Pin-ch.', 6500.0000, 'price', 10000.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000, 12),
    (g_opt, 'N40002474', 'N40002474', 'ABC only', 3450.0000, 'price', 5308.0000, 'percent_discount', 19.4989, 'percent_discount', 19.4989, 13),
    (g_opt, 'N40002475', 'N40002475', 'Bobbin rot. & Skip stitch only', 2450.0000, 'price', 3770.0000, 'percent_discount', 19.5225, 'percent_discount', 19.5225, 14),
    (g_opt, 'N40002476', 'N40002476', 'Pin checker only', 850.0000, 'price', 1308.0000, 'percent_discount', 19.4954, 'percent_discount', 19.4954, 15),
    (g_opt, 'N40002477', 'N40002477', 'Pin checker only
If ABC mounted as well', 710.0000, 'price', 1093.0000, 'percent_discount', 19.5791, 'percent_discount', 19.5791, 16),
    (g_opt, 'N40001303', 'N40001303', 'BOBBIN CASE MOD. FOR PIN CHECKER', 31.0900, 'price', 48.0000, 'percent_discount', 18.7500, 'percent_discount', 18.7500, 17),
    (g_opt, 'N40002478', 'N40002478', 'BOBBIN MOD.FOR BOBBIN ROTATION DEVICE ALUM', 2.5000, 'price', 4.0000, 'percent_discount', 25.0000, 'percent_discount', 25.0000, 18),
    (g_opt, 'BAX311HA000000P045', 'BAX311HA000000P045', 'AX311HA-1P-230V-CE-WO/SW-W/PD', 1047.0000, 'price', 1611.0000, 'percent_discount', 19.4910, 'percent_discount', 19.4910, 19);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BAS341JX/BAS342JS JX', 'Máquina de Campo Eletrónica  Direct Drive', 260)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BAS341JX-05A - 250X160', 'BAS341JX-05A - 250X160', 'Máquina de Campo Eletrónica  Direct Drive', 12588.5000, 'margin', 34.9969, 'percent_discount', 19.4981, 'percent_discount', 19.4981),
    (fam, 'BAS341JX-0AA - 250X160', 'BAS341JX-0AA - 250X160', 'Máquina de Campo Eletrónica  Direct Drive', 12588.5000, 'margin', 34.9969, 'percent_discount', 19.4981, 'percent_discount', 19.4981),
    (fam, 'BAS342JS05A - 300x200', 'BAS342JS05A - 300x200', 'Máquina de Campo Eletrónica  Direct Drive', 13616.5000, 'margin', 34.9986, 'percent_discount', 19.5007, 'percent_discount', 19.5007),
    (fam, 'BAS342JX05A - 300x200', 'BAS342JX05A - 300x200', 'Máquina de Campo Eletrónica  Direct Drive', 16116.5000, 'margin', 34.9984, 'percent_discount', 19.5007, 'percent_discount', 19.5007),
    (fam, 'BAS342JX0AA - 300x200', 'BAS342JX0AA - 300x200', 'Máquina de Campo Eletrónica  Direct Drive', 16116.5000, 'margin', 34.9984, 'percent_discount', 19.5007, 'percent_discount', 19.5007);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máquina de costura programável de base cilindrica', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Lançadeira de grande capacidade e calcador intermitente', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Área de costura: (X-Y):  BAS341JX  250 x 160 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Área de costura: (X-Y): BAS342JS JX  300 x 200 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Máx. velocidade de costura: 2800 spm - Comprimento do ponto: 0,05-12,7 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Levantamento do calcador 22 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura de elevação da pinça de trabalho 30 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Detetor de quebra da linha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Painel digital, user-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Entrada para cartão SD para transferência de dados, e 2 entradas USB', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, 'JX version: deteção automática de pontos falsos e pontos soltos.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BAS341JX-05A - 250X160', 'Cabeça', 'Cabeça', 10371.0000, 'price', 15955.0000, 'percent_discount', 19.4986, 'percent_discount', 19.4986, 1),
    (g_ver, 'BAS341JX-05A - 250X160', 'Cabeça + Caixa', 'Cabeça + Caixa', 11761.0000, 'price', 18093.0000, 'percent_discount', 19.4993, 'percent_discount', 19.4993, 2),
    (g_ver, 'BAS341JX-05A - 250X160', 'Completa', 'Completa', 12588.5000, 'price', 19366.0000, 'percent_discount', 19.4981, 'percent_discount', 19.4981, 3),
    (g_ver, 'BAS341JX-0AA - 250X160', 'Cabeça', 'Cabeça', 10371.0000, 'price', 15955.0000, 'percent_discount', 19.4986, 'percent_discount', 19.4986, 4),
    (g_ver, 'BAS341JX-0AA - 250X160', 'Cabeça + Caixa', 'Cabeça + Caixa', 11761.0000, 'price', 18093.0000, 'percent_discount', 19.4993, 'percent_discount', 19.4993, 5),
    (g_ver, 'BAS341JX-0AA - 250X160', 'Completa', 'Completa', 12588.5000, 'price', 19366.0000, 'percent_discount', 19.4981, 'percent_discount', 19.4981, 6),
    (g_ver, 'BAS342JS05A - 300x200', 'Cabeça', 'Cabeça', 11399.0000, 'price', 17537.0000, 'percent_discount', 19.5016, 'percent_discount', 19.5016, 7),
    (g_ver, 'BAS342JS05A - 300x200', 'Cabeça + Caixa', 'Cabeça + Caixa', 12789.0000, 'price', 19675.0000, 'percent_discount', 19.5019, 'percent_discount', 19.5019, 8),
    (g_ver, 'BAS342JS05A - 300x200', 'Completa', 'Completa', 13616.5000, 'price', 20948.0000, 'percent_discount', 19.5007, 'percent_discount', 19.5007, 9),
    (g_ver, 'BAS342JX05A - 300x200', 'Cabeça', 'Cabeça', 13899.0000, 'price', 21383.0000, 'percent_discount', 19.5015, 'percent_discount', 19.5015, 10),
    (g_ver, 'BAS342JX05A - 300x200', 'Cabeça + Caixa', 'Cabeça + Caixa', 15289.0000, 'price', 23521.0000, 'percent_discount', 19.5017, 'percent_discount', 19.5017, 11),
    (g_ver, 'BAS342JX05A - 300x200', 'Completa', 'Completa', 16116.5000, 'price', 24794.0000, 'percent_discount', 19.5007, 'percent_discount', 19.5007, 12),
    (g_ver, 'BAS342JX0AA - 300x200', 'Cabeça', 'Cabeça', 13899.0000, 'price', 21383.0000, 'percent_discount', 19.5015, 'percent_discount', 19.5015, 13),
    (g_ver, 'BAS342JX0AA - 300x200', 'Cabeça + Caixa', 'Cabeça + Caixa', 15289.0000, 'price', 23521.0000, 'percent_discount', 19.5017, 'percent_discount', 19.5017, 14),
    (g_ver, 'BAS342JX0AA - 300x200', 'Completa', 'Completa', 16116.5000, 'price', 24794.0000, 'percent_discount', 19.5007, 'percent_discount', 19.5007, 15);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'N40000916', 'N40000916', 'CA-E-BI/BAS341/342H Tampo 120x80x5', 200.0000, 'price', 308.0000, 'percent_discount', 19.4805, 'percent_discount', 19.4805, 1),
    (g_ban, 'N40000587', 'N40000587', 'CA-E-BI/2001 gaveta 047', 5.5000, 'price', 9.0000, 'percent_discount', 22.2222, 'percent_discount', 22.2222, 2),
    (g_ban, 'N40002356', 'N40002356', 'RE-REX10 Bancada BAS342H W/rodas', 550.0000, 'price', 847.0000, 'percent_discount', 19.5986, 'percent_discount', 19.5986, 3),
    (g_ban, 'N40000580', 'N40000580', 'CA.2702.M.EM Thermic switch 1PH', 72.0000, 'price', 111.0000, 'percent_discount', 19.8198, 'percent_discount', 19.8198, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 1),
    (g_opt, 'SA64952E1', 'SA64952E1', '3 Pedal foot switch assy', 414.4000, 'price', 638.0000, 'percent_discount', 43.7304, 'percent_discount', 43.7304, 2),
    (g_opt, 'SB8722201', 'SB8722201', 'Bobbin winder', 1013.9500, 'price', 1560.0000, 'percent_discount', 43.6538, 'percent_discount', 43.6538, 3),
    (g_opt, 'SA9194101', 'SA9194101', 'Automatic ejecting system set', 1975.5500, 'price', 3040.0000, 'percent_discount', 43.6513, 'percent_discount', 43.6513, 4),
    (g_opt, 'N40000903', 'N40000903', 'Bar code reader RLB-1000-RS232C', 685.0000, 'price', 1054.0000, 'percent_discount', 19.5446, 'percent_discount', 19.5446, 5),
    (g_opt, 'SA7197301', 'SA7197301', '2 Step Thread tension device', 824.1500, 'price', 1268.0000, 'percent_discount', 43.6909, 'percent_discount', 43.6909, 6),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 7),
    (g_opt, 'SA5559101', 'SA5559101', 'Needle cooler', 483.4500, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 8),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 9),
    (g_opt, 'N40000011', 'N40000011', 'Auto Bobbin Changer - For 8 Bobbin', 2650.0000, 'price', 4077.0000, 'percent_discount', 19.4996, 'percent_discount', 19.4996, 10),
    (g_opt, 'S59221501', 'S59221501', 'Bobbin case  - NEED 16 pieces', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 11),
    (g_opt, 'S44633001', 'S44633001', 'Bobbin  - NEED 16 pieces', 8.7500, 'price', 14.0000, 'percent_discount', 42.8571, 'percent_discount', 42.8571, 12),
    (g_opt, 'N10013428', 'N10013428', 'Additional Bobbin/Bobbin case magazin', 375.0000, 'price', 577.0000, 'percent_discount', 19.5841, 'percent_discount', 19.5841, 13),
    (g_opt, 'N40002081', 'N40002081', 'RSG-BB102/10HC HEAT CUTTER H-SERIES LEFT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 14),
    (g_opt, 'N40002082', 'N40002082', 'RSG-BB102/10HC HEAT CUTTER H-SERIES RIGHT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 15),
    (g_opt, 'N40000836', 'N40000836', 'Bobbin checker Kinoshita', 1475.0000, 'price', 2270.0000, 'percent_discount', 19.5154, 'percent_discount', 19.5154, 16),
    (g_opt, 'N40002607', 'N40002607', 'UG-LUCK-ST001 EXT LABEL ATT DEVICE BAS342', 1347.0000, 'price', 2073.0000, 'percent_discount', 19.5369, 'percent_discount', 19.5369, 17),
    (g_opt, 'N40001013', 'N40001013', '311-MHA-CLD100  Thread detective device', 1525.0000, 'price', 2347.0000, 'percent_discount', 19.5143, 'percent_discount', 19.5143, 18),
    (g_opt, 'N40001014', 'N40001014', '311-MHA-CSD100  Skip stitch and bobbin rotation detector', 2125.0000, 'price', 3270.0000, 'percent_discount', 19.5107, 'percent_discount', 19.5107, 19),
    (g_opt, 'BAX341JA000000P045', 'BAX341JA000000P045', 'BAX341JA', 1390.0000, 'price', 2139.0000, 'percent_discount', 19.5418, 'percent_discount', 19.5418, 20),
    (g_opt, 'BAX342JA000000P045', 'BAX342JA000000P045', 'AX342JA-1P-230/240V-CE-WO/SW', 1390.0000, 'price', 2139.0000, 'percent_discount', 19.5418, 'percent_discount', 19.5418, 21);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BAS3XXH', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 270)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BAS360H-05A - 500 x 400', 'BAS360H-05A - 500 x 400', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 28685.0000, 'margin', 35.0003, 'percent_discount', 19.5010, 'percent_discount', 19.5010),
    (fam, 'BAS365H-05A - 700 x 400', 'BAS365H-05A - 700 x 400', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 31005.0000, 'margin', 35.0000, 'percent_discount', 19.4990, 'percent_discount', 19.4990),
    (fam, 'BAS370H-05A - 700 x 700', 'BAS370H-05A - 700 x 700', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 41696.0000, 'margin', 35.0003, 'percent_discount', 19.5002, 'percent_discount', 19.5002),
    (fam, 'BAS370H XL 700x1500', 'BAS370H XL 700x1500', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 87465.0000, 'margin', 35.0002, 'percent_discount', 19.5003, 'percent_discount', 19.5003),
    (fam, 'BAS375H-05A - 1200 x 700', 'BAS375H-05A - 1200 x 700', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 50250.0000, 'margin', 35.0003, 'percent_discount', 19.4999, 'percent_discount', 19.4999);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Nova máquina tipo Bridge de campo programável', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Pinça pneumática - altura 30 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Velocidade máx. de costura: 2500 spm - Comprimento do ponto: 0,05-20,0 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Tensão digital permite utilizar materiais mais grossos', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Detetor de quebra da linha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Altura do pé de apoio: 27,5mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura de elevação da pinça de trabalho 52,5 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Painel digital, user-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Equipamento de injeção automática (BAS360H - BAS365H APENAS)', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Equipado com bobinador separado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, '100.000 pontos/programa - Até 999 programas', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11),
    (g_car, NULL, NULL, 'Estrutura compacta com dimensões reduzidas', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 12),
    (g_car, NULL, NULL, 'BAS370H - BAS375H Sem palete', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 13);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BAS360H-05A - 500 x 400', 'Completa', 'Completa', 28685.0000, 'price', 44131.0000, 'percent_discount', 19.5010, 'percent_discount', 19.5010, 1),
    (g_ver, 'BAS365H-05A - 700 x 400', 'Completa', 'Completa', 31005.0000, 'price', 47700.0000, 'percent_discount', 19.4990, 'percent_discount', 19.4990, 2),
    (g_ver, 'BAS370H-05A - 700 x 700', 'Completa', 'Completa', 41696.0000, 'price', 64148.0000, 'percent_discount', 19.5002, 'percent_discount', 19.5002, 3),
    (g_ver, 'BAS370H XL 700x1500', 'Completa', 'Completa', 87465.0000, 'price', 134562.0000, 'percent_discount', 19.5003, 'percent_discount', 19.5003, 4),
    (g_ver, 'BAS375H-05A - 1200 x 700', 'Completa', 'Completa', 50250.0000, 'price', 77308.0000, 'percent_discount', 19.4999, 'percent_discount', 19.4999, 5);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BAS375H050XC20060L', 'BAS375H050XC20060L', 'BAS375H-05A - 1200 x 700', 50250.0000, 'price', 77308.0000, 'percent_discount', 19.4999, 'percent_discount', 19.4999, 1),
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 2),
    (g_opt, 'SC0084001', 'SC0084001', 'Needle plate 1,6 mm For Thin material', 126.5500, 'price', 195.0000, 'percent_discount', 43.5897, 'percent_discount', 43.5897, 3),
    (g_opt, 'SC3414001', 'SC3414001', 'SEW-DEFECT DETECTION DEVICE L', 777.5500, 'price', 1197.0000, 'percent_discount', 43.6926, 'percent_discount', 43.6926, 4),
    (g_opt, 'N40001967', 'N40001967', 'TRI-A.B.C.-B/12 AUTO BOBBIN CHANGER BRO', 2900.0000, 'price', 4462.0000, 'percent_discount', 19.4980, 'percent_discount', 19.4980, 5),
    (g_opt, 'S59221501', 'S59221501', 'Bobbin case  - NEED 16 pieces', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 6),
    (g_opt, 'S44633001', 'S44633001', 'Bobbin  - NEED 16 pieces', 8.7500, 'price', 14.0000, 'percent_discount', 42.8571, 'percent_discount', 42.8571, 7),
    (g_opt, 'N10013428', 'N10013428', 'Additional Bobbin/Bobbin case magazin', 375.0000, 'price', 577.0000, 'percent_discount', 19.5841, 'percent_discount', 19.5841, 8),
    (g_opt, 'Auto Eject', 'Auto Eject', 'Auto Eject system for BAS370H and BAS375H', 716.8000, 'price', 1103.0000, 'percent_discount', 43.6990, 'percent_discount', 43.6990, 9);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BAS365K/BAS370K', 'Programmable Electronic Pattern Sewer with large sewing area', 280)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BAS365K-05A - 800 x 400', 'BAS365K-05A - 800 x 400', 'Programmable Electronic Pattern Sewer with large sewing area', 34000.0000, 'margin', 35.0004, 'percent_discount', 19.4999, 'percent_discount', 19.4999),
    (fam, 'BAS370K-05A - 800 x 700', 'BAS370K-05A - 800 x 700', 'Programmable Electronic Pattern Sewer with large sewing area', 45696.0000, 'margin', 35.0004, 'percent_discount', 19.5002, 'percent_discount', 19.5002);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'DIGIFLEX TUNE EXCLUSIVE SYSTEM', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'New Bridge Type Programmable pattern sewer', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Double capacity shuttle hook and intermittent presser foot', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Max. sewing speed 2500 spm - Stitch length 0,05-20,0 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Digital tension enable to use thicker thread', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Needle thread breakage detector', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Height of stepping foot 27,5 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Work clamp lift amount 52,5 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Use friendly colour LCD with Touch Panel Display', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Auto Eject equipment', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, 'Equipped with separate Bobbin Winder', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11),
    (g_car, NULL, NULL, '100.000 stitch/program - Up to 999 programs', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 12),
    (g_car, NULL, NULL, 'Compact stucture with small footprint: Space saving', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 13),
    (g_car, NULL, NULL, 'BAS370K Without pallet', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 14);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BAS365K-05A - 800 x 400', 'Completa', 'Completa', 34000.0000, 'price', 52308.0000, 'percent_discount', 19.4999, 'percent_discount', 19.4999, 1),
    (g_ver, 'BAS370K-05A - 800 x 700', 'Completa', 'Completa', 45696.0000, 'price', 70302.0000, 'percent_discount', 19.5002, 'percent_discount', 19.5002, 2);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'SC0084001', 'SC0084001', 'Needle plate 1,6 mm For Thin material', 126.5500, 'price', 195.0000, 'percent_discount', 43.5897, 'percent_discount', 43.5897, 2),
    (g_opt, 'SC3414101', 'SC3414101', 'SEW-DEFECT DETECTION DEVICE L', 777.5500, 'price', 1197.0000, 'percent_discount', 43.6926, 'percent_discount', 43.6926, 3),
    (g_opt, 'N40001967', 'N40001967', 'TRI-A.B.C.-B/12 AUTO BOBBIN CHANGER BRO', 2900.0000, 'price', 4462.0000, 'percent_discount', 19.4980, 'percent_discount', 19.4980, 4),
    (g_opt, 'S59221501', 'S59221501', 'Bobbin case  - NEED 24 pieces', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 5),
    (g_opt, 'S44633001', 'S44633001', 'Bobbin  - NEED 24 pieces', 8.7500, 'price', 14.0000, 'percent_discount', 42.8571, 'percent_discount', 42.8571, 6),
    (g_opt, 'Auto Eject', 'Auto Eject', 'Auto Eject system for BAS370H and BAS375H', 716.8000, 'price', 1103.0000, 'percent_discount', 43.6990, 'percent_discount', 43.6990, 7);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BAS326 XL/BAS342 XL', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 290)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BAS326 XL 500x100', 'BAS326 XL 500x100', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 21250.0000, 'margin', 34.9994, 'percent_discount', 19.5002, 'percent_discount', 19.5002),
    (fam, 'BAS342JX XL 450x380', 'BAS342JX XL 450x380', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 28840.0000, 'margin', 34.9997, 'percent_discount', 19.5001, 'percent_discount', 19.5001),
    (fam, 'BAS342JX XL 650x380', 'BAS342JX XL 650x380', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 29610.0000, 'margin', 35.0002, 'percent_discount', 19.4999, 'percent_discount', 19.4999),
    (fam, 'BAS342JX XL 800x380', 'BAS342JX XL 800x380', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 31810.0000, 'margin', 34.9994, 'percent_discount', 19.5002, 'percent_discount', 19.5002),
    (fam, 'BAS342JX XL 1000x380', 'BAS342JX XL 1000x380', 'Máquina de Campo Automática Eletrónica de Grande Dimensão', 32910.0000, 'margin', 35.0003, 'percent_discount', 19.4999, 'percent_discount', 19.4999);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Máquina de costura programável com base cilindrica', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Lançadeira de grande capacidade e calcador intermitente', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 2800 spm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Comprimento do ponto: 0,05-12,7 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Elevação do calcador 22 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Altura de elevação da pinça de trabalho 30 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Tensão digital, detetor de rutura do fio', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Painel digital com função de programação', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Deteção da espessura do tecido', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'JX version: deteção automática de pontos falsos e pontos soltos', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, 'Entrada para cartão SD para transferência de dados, e 2 entradas USB', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BAS326 XL 500x100', 'Completa', 'Completa', 21250.0000, 'price', 32692.0000, 'percent_discount', 19.5002, 'percent_discount', 19.5002, 1),
    (g_ver, 'BAS342JX XL 450x380', 'Completa', 'Completa', 28840.0000, 'price', 44369.0000, 'percent_discount', 19.5001, 'percent_discount', 19.5001, 2),
    (g_ver, 'BAS342JX XL 650x380', 'Completa', 'Completa', 29610.0000, 'price', 45554.0000, 'percent_discount', 19.4999, 'percent_discount', 19.4999, 3),
    (g_ver, 'BAS342JX XL 800x380', 'Completa', 'Completa', 31810.0000, 'price', 48938.0000, 'percent_discount', 19.5002, 'percent_discount', 19.5002, 4),
    (g_ver, 'BAS342JX XL 1000x380', 'Completa', 'Completa', 32910.0000, 'price', 50631.0000, 'percent_discount', 19.4999, 'percent_discount', 19.4999, 5);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BPS300B00000000000', 'BPS300B00000000000', 'PS-300B', 187.0000, 'price', 288.0000, 'percent_discount', 19.4444, 'percent_discount', 19.4444, 1),
    (g_opt, 'SA64952E1', 'SA64952E1', '3 Pedal foot switch assy', 414.4000, 'price', 638.0000, 'percent_discount', 43.7304, 'percent_discount', 43.7304, 2),
    (g_opt, 'SB8722201', 'SB8722201', 'Bobbin winder', 1013.9500, 'price', 1560.0000, 'percent_discount', 43.6538, 'percent_discount', 43.6538, 3),
    (g_opt, 'SA9194101', 'SA9194101', 'Automatic ejecting system set', 1975.5500, 'price', 3040.0000, 'percent_discount', 43.6513, 'percent_discount', 43.6513, 4),
    (g_opt, 'N40000903', 'N40000903', 'Bar code reader RLB-1000-RS232C', 685.0000, 'price', 1054.0000, 'percent_discount', 19.5446, 'percent_discount', 19.5446, 5),
    (g_opt, 'SA7197301', 'SA7197301', '2 Step Thread tension device', 824.1500, 'price', 1268.0000, 'percent_discount', 43.6909, 'percent_discount', 43.6909, 6),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 7),
    (g_opt, 'SA5559101', 'SA5559101', 'Needle cooler', 483.4500, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 8),
    (g_opt, 'SA75002E1', 'SA75002E1', 'Option manifold 5 set- must be on the machine', 483.4000, 'price', 744.0000, 'percent_discount', 43.6828, 'percent_discount', 43.6828, 9),
    (g_opt, 'N40000011', 'N40000011', 'Auto Bobbin Changer - For 8 Bobbin', 2650.0000, 'price', 4077.0000, 'percent_discount', 19.4996, 'percent_discount', 19.4996, 10),
    (g_opt, 'S59221501', 'S59221501', 'Bobbin case  - NEED 16 pieces', 84.1500, 'price', 130.0000, 'percent_discount', 43.8462, 'percent_discount', 43.8462, 11),
    (g_opt, 'S44633001', 'S44633001', 'Bobbin  - NEED 16 pieces', 8.7500, 'price', 14.0000, 'percent_discount', 42.8571, 'percent_discount', 42.8571, 12),
    (g_opt, 'N10013428', 'N10013428', 'Additional Bobbin/Bobbin case magazin', 375.0000, 'price', 577.0000, 'percent_discount', 19.5841, 'percent_discount', 19.5841, 13),
    (g_opt, 'N40002081', 'N40002081', 'RSG-BB102/10HC HEAT CUTTER H-SERIES LEFT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 14),
    (g_opt, 'N40002082', 'N40002082', 'RSG-BB102/10HC HEAT CUTTER H-SERIES RIGHT', 3280.0000, 'price', 5047.0000, 'percent_discount', 19.5165, 'percent_discount', 19.5165, 15),
    (g_opt, 'N40000836', 'N40000836', 'Bobbin checker Kinoshita', 1475.0000, 'price', 2270.0000, 'percent_discount', 19.5154, 'percent_discount', 19.5154, 16);
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BAS370H', 'DFS SYSTEM Máquina de Campo Automática Eletrónica de Grande Dimensão', 300)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BAS370H DFS 700x2500', 'BAS370H DFS 700x2500', 'DFS SYSTEM Máquina de Campo Automática Eletrónica de Grande Dimensão', 117000.0000, 'margin', 35.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000),
    (fam, 'BAS370H DFS 700x3500', 'BAS370H DFS 700x3500', 'DFS SYSTEM Máquina de Campo Automática Eletrónica de Grande Dimensão', 126000.0000, 'margin', 34.9999, 'percent_discount', 19.5000, 'percent_discount', 19.5000);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Nova máquina tipo Bridge de campo programável', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Lançadeira de grande capacidade e calcador intermitente', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Máx. velocidade de costura 2500 spm - Comprimento do ponto 0,05-20,0 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Tensão digital, permite utilizar um material mais grosso', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Detetor de quebra de linha da agulha', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Altura do pé de apoio 27,5 mm.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Altura de elevação da pinça de trabalho 52,5 mm', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Painel digital e user-friendly', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'Equipado com bobinador separado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, '100.000 pontos/programa - Até 999 programas', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BAS370H DFS 700x2500', 'Completa', 'Completa', 117000.0000, 'price', 180000.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000, 1),
    (g_ver, 'BAS370H DFS 700x3500', 'Completa', 'Completa', 126000.0000, 'price', 193846.0000, 'percent_discount', 19.5000, 'percent_discount', 19.5000, 2);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
END $$;

DO $$ DECLARE
  fam uuid; g_car uuid; g_ver uuid; g_ban uuid; g_opt uuid;
BEGIN
  INSERT INTO product_families (brand, name, description, sort_order)
    VALUES ('BROTHER', 'BM-2000', 'Máquina de Colagem Eletrónica, com cartucho de cola, Sistema de guia eletrónico', 310)
    RETURNING id INTO fam;
  INSERT INTO product_variants (family_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value) VALUES
    (fam, 'BM-2000', 'BM-2000', 'Máquina de Colagem Eletrónica, com cartucho de cola, Sistema de guia eletrónico', 30435.0000, 'margin', 35.0568, 'percent_discount', 19.5054, 'percent_discount', 19.5054);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Características', 'info', 0) RETURNING id INTO g_car;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_car, NULL, NULL, 'Tecnologia única no mercado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 1),
    (g_car, NULL, NULL, 'Tecnologia Brother "ISC" permite vários modelos', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 2),
    (g_car, NULL, NULL, 'Pode ser utilizada para colagem em formato tubular', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 3),
    (g_car, NULL, NULL, 'Qualquer pessoa consegue criar costuras de forma fácil e perfeita sem costura', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 4),
    (g_car, NULL, NULL, 'Para várias opções de tecidos', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 5),
    (g_car, NULL, NULL, 'Elevada resistência e elasticidade ao tecido colado', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 6),
    (g_car, NULL, NULL, 'Espelho para inserção do tecido com precisão', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 7),
    (g_car, NULL, NULL, 'Peças de vestuário confortáveis', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 8),
    (g_car, NULL, NULL, 'O adesivo da BROTHER suprime a deteorização do envelhecimento', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 9),
    (g_car, NULL, NULL, 'Sem problemas de controlo da temperatura', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 10),
    (g_car, NULL, NULL, 'Utilização de uma cola líquida a 120ºC super resistente capaz de suportar lavagens, calor e humidade.', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 11),
    (g_car, NULL, NULL, 'Redução do espaço na linha de produção', NULL, 'price', 0, 'percent_discount', 0, 'percent_discount', 0, 12);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Versões', 'single_select', 1) RETURNING id INTO g_ver;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ver, 'BM-2000', 'Cabeça', 'Cabeça', 30116.0000, 'price', 46332.0000, 'percent_discount', 19.4984, 'percent_discount', 19.4984, 1),
    (g_ver, 'BM-2000', 'Completa', 'Completa', 30435.0000, 'price', 46864.0000, 'percent_discount', 19.5054, 'percent_discount', 19.5054, 2);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Bancada', 'multi_select', 2) RETURNING id INTO g_ban;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_ban, 'XXXXXX', 'XXXXXX', 'mesa para a máquina de colagem', 95.0000, 'price', 147.0000, 'percent_discount', 13.6054, 'percent_discount', 13.6054, 1),
    (g_ban, 'N40000362', 'N40000362', 'CA-E-BI/2011 gaveta 048', 7.0000, 'price', 11.0000, 'percent_discount', 18.1818, 'percent_discount', 18.1818, 2),
    (g_ban, 'N40001963', 'N40001963', 'RE-S480/506 Bancada BAS W/rodas', 172.0000, 'price', 265.0000, 'percent_discount', 13.5849, 'percent_discount', 13.5849, 3),
    (g_ban, 'N40000940', 'N40000940', 'GA-534817 Motor switch 1P', 45.0000, 'price', 70.0000, 'percent_discount', 14.2857, 'percent_discount', 14.2857, 4);
  INSERT INTO option_groups (family_id, name, type, sort_order) VALUES (fam, 'Opções', 'multi_select', 3) RETURNING id INTO g_opt;
  INSERT INTO options (group_id, model, code, description, cost_price, sale_config_type, sale_config_value, resale_config_type, resale_config_value, volume_resale_config_type, volume_resale_config_value, sort_order) VALUES
    (g_opt, 'BBG100A11000000001', 'BBG100A11000000001', 'BG-100A 20 cartuchos de cola', 681.0000, 'price', 1048.0000, 'percent_discount', 13.3588, 'percent_discount', 13.3588, 1),
    (g_opt, 'N40000537', 'N40000537', 'BG-100A 1 cartucho de cola', 34.0000, 'price', 53.0000, 'percent_discount', 15.0943, 'percent_discount', 15.0943, 2),
    (g_opt, 'ZEMFT220000', 'ZEMFT220000', 'BICS-BM00 Limpeza CA', 37.0000, 'price', 57.0000, 'percent_discount', 14.0351, 'percent_discount', 14.0351, 3),
    (g_opt, 'SB1853001', 'SB1853001', 'BICO DA COLA', 9.0500, 'price', 14.0000, 'percent_discount', 14.2857, 'percent_discount', 14.2857, 4),
    (g_opt, 'SC2081001', 'SC2081001', 'Parte superior com folha refletora', 18.5500, 'price', 29.0000, 'percent_discount', 13.7931, 'percent_discount', 13.7931, 5),
    (g_opt, 'SC2077001', 'SC2077001', 'Folha inferior refletora', 19.4000, 'price', 30.0000, 'percent_discount', 13.3333, 'percent_discount', 13.3333, 6);
END $$;

