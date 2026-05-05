--  Contraseñas: admin1→123 | admin2→234 |
--  admin3→345 | admin4→456 | admin5→567

-- limpieza de las tablas antes de hacer los insert nuevos para evitar errores 
set foreign_key_checks = 0;

use residencias_gestion;
truncate table gestion_propiedades;
truncate table pago_administracion;

use usuarios_db;
truncate table usuario;

use propiedades_db;
truncate table apartamento;
truncate table conjunto;
truncate table parqueadero;
truncate table torre;

set foreign_key_checks = 1;


-- insercion de datos


USE usuarios_db;

INSERT INTO usuario (id, nombre, telefono, email, username, password_hash, rol, conjunto_id, password_changed) VALUES
(1, 'Carlos Mendoza',   '3001234567', 'carlos.mendoza@residencias.com',   'admin1', '$2b$10$efn3vJrXtuFfGUdWLbxyMeKCW5vlp/PLTsBve.1oDcvVUGviIgbQi', 'administrador', 1, 0),
(2, 'Lucia Fernández',  '3012345678', 'lucia.fernandez@residencias.com',  'admin2', '$2b$10$n/hPfVI7.AQOJQoSIboEG.umTkVlu5Hc/ghsdXfTird4GznbSitjy', 'administrador', 2, 0),
(3, 'Andrés Castillo',  '3023456789', 'andres.castillo@residencias.com',  'admin3', '$2b$10$FWjP4lkK2QA2KY1cvQYFy.NrkvOxajyCKf75biSGY0GHKJYRGRHmG', 'administrador', 3, 0),
(4, 'Patricia Ríos',    '3034567890', 'patricia.rios@residencias.com',    'admin4', '$2b$10$tnrTVEQ846V6Y9GjkPXT9u7Tq.VvKBKhYJFyjjzRpD1eBYP6gapfq', 'administrador', 4, 0),
(5, 'Fernando Salcedo', '3045678901', 'fernando.salcedo@residencias.com', 'admin5', '$2b$10$SCeu72w7.w6/gT2F51lRke1AKnrJE/y/U1FP.YGC7lWfon5e17RHW', 'administrador', 5, 0);

INSERT INTO usuario (id, nombre, telefono, email, username, password_hash, rol, conjunto_id, password_changed) VALUES
( 6, 'Juan Pablo Gómez',   '3100000001', 'jpgomez@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
( 7, 'María Elena Torres', '3100000002', 'metorres@gmail.com',     NULL, NULL, 'arrendatario', NULL, 1),
( 8, 'Diego Herrera',      '3100000003', 'dherrera@gmail.com',     NULL, NULL, 'arrendatario', NULL, 1),
( 9, 'Valentina Cruz',     '3100000004', 'vcruz@gmail.com',        NULL, NULL, 'arrendatario', NULL, 1),
(10, 'Samuel Ortiz',       '3100000005', 'sortiz@gmail.com',       NULL, NULL, 'arrendatario', NULL, 1),
(11, 'Camila Restrepo',    '3100000006', 'crestrepo@gmail.com',    NULL, NULL, 'arrendatario', NULL, 1),
(12, 'Nicolás Vargas',     '3100000007', 'nvargas@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(13, 'Isabela Mora',       '3100000008', 'imora@gmail.com',        NULL, NULL, 'arrendatario', NULL, 1),
(14, 'Sebastián Peña',     '3100000009', 'spena@gmail.com',        NULL, NULL, 'arrendatario', NULL, 1),
(15, 'Daniela Suárez',     '3100000010', 'dsuarez@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(16, 'Mateo Jiménez',      '3100000011', 'mjimenez@gmail.com',     NULL, NULL, 'arrendatario', NULL, 1),
(17, 'Sofía Ramírez',      '3100000012', 'sramirez@gmail.com',     NULL, NULL, 'arrendatario', NULL, 1),
(18, 'Alejandro Muñoz',    '3100000013', 'amunoz@gmail.com',       NULL, NULL, 'arrendatario', NULL, 1),
(19, 'Laura Aguilar',      '3100000014', 'laguilar@gmail.com',     NULL, NULL, 'arrendatario', NULL, 1),
(20, 'Julián Medina',      '3100000015', 'jmedina@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(21, 'Andrea Sánchez',     '3100000016', 'asanchez@gmail.com',     NULL, NULL, 'arrendatario', NULL, 1),
(22, 'Tomás Rojas',        '3100000017', 'trojas@gmail.com',       NULL, NULL, 'arrendatario', NULL, 1),
(23, 'Carolina Mejía',     '3100000018', 'cmejia@gmail.com',       NULL, NULL, 'arrendatario', NULL, 1),
(24, 'David Cardona',      '3100000019', 'dcardona@gmail.com',     NULL, NULL, 'arrendatario', NULL, 1),
(25, 'Manuela Ospina',     '3100000020', 'mospina@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(26, 'Felipe Arango',      '3100000021', 'farango@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(27, 'Paola Quintero',     '3100000022', 'pquintero@gmail.com',    NULL, NULL, 'arrendatario', NULL, 1),
(28, 'Esteban Lozano',     '3100000023', 'elozano@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(29, 'Natalia Bedoya',     '3100000024', 'nbedoya@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(30, 'Rodrigo Pizarro',    '3100000025', 'rpizarro@gmail.com',     NULL, NULL, 'arrendatario', NULL, 1),
(31, 'Tatiana Guzmán',     '3100000026', 'tguzman@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(32, 'Mauricio Acosta',    '3100000027', 'macosta@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1),
(33, 'Verónica Cano',      '3100000028', 'vcano@gmail.com',        NULL, NULL, 'arrendatario', NULL, 1),
(34, 'Cristian Bohórquez', '3100000029', 'cbohorquez@gmail.com',   NULL, NULL, 'arrendatario', NULL, 1),
(35, 'Ángela Duarte',      '3100000030', 'aduarte@gmail.com',      NULL, NULL, 'arrendatario', NULL, 1);

INSERT INTO usuario (id, nombre, telefono, email, username, password_hash, rol, conjunto_id, password_changed) VALUES
(36, 'Roberto Estrada',    '3200000001', 'restrada@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(37, 'Gloria Naranjo',     '3200000002', 'gnaranjo@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(38, 'Hernando Urrego',    '3200000003', 'hurrego@hotmail.com',    NULL, NULL, 'arrendador', NULL, 1),
(39, 'Beatriz Londoño',    '3200000004', 'blondono@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(40, 'Jaime Montoya',      '3200000005', 'jmontoya@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(41, 'Amparo Velásquez',   '3200000006', 'avelasquez@hotmail.com', NULL, NULL, 'arrendador', NULL, 1),
(42, 'Gilberto Parra',     '3200000007', 'gparra@hotmail.com',     NULL, NULL, 'arrendador', NULL, 1),
(43, 'Marta Castaño',      '3200000008', 'mcastano@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(44, 'Álvaro Zapata',      '3200000009', 'azapata@hotmail.com',    NULL, NULL, 'arrendador', NULL, 1),
(45, 'Nohora Pineda',      '3200000010', 'npineda@hotmail.com',    NULL, NULL, 'arrendador', NULL, 1),
(46, 'Oscar Cárdenas',     '3200000011', 'ocardenas@hotmail.com',  NULL, NULL, 'arrendador', NULL, 1),
(47, 'Blanca Ávila',       '3200000012', 'bavila@hotmail.com',     NULL, NULL, 'arrendador', NULL, 1),
(48, 'Ernesto Fuentes',    '3200000013', 'efuentes@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(49, 'Consuelo Palomino',  '3200000014', 'cpalomino@hotmail.com',  NULL, NULL, 'arrendador', NULL, 1),
(50, 'Víctor Hugo Ibáñez', '3200000015', 'vibanez@hotmail.com',    NULL, NULL, 'arrendador', NULL, 1),
(51, 'Rosario Gallego',    '3200000016', 'rgallego@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(52, 'Enrique Serrano',    '3200000017', 'eserrano@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(53, 'Luz Marina Vega',    '3200000018', 'lvega@hotmail.com',      NULL, NULL, 'arrendador', NULL, 1),
(54, 'Gustavo Arbeláez',   '3200000019', 'garbelaz@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1),
(55, 'Carmen Salazar',     '3200000020', 'csalazar@hotmail.com',   NULL, NULL, 'arrendador', NULL, 1);

USE propiedades_db;

INSERT INTO conjunto (id, nombre_conjunto) VALUES
(1, 'Conjunto Altos del Río'),
(2, 'Conjunto Laureles Park'),
(3, 'Conjunto Villa del Sol'),
(4, 'Conjunto Los Pinos'),
(5, 'Conjunto Bello Horizonte');

INSERT INTO torre (id, nombre, num_pisos, conjunto_id) VALUES
( 1, 'Torre A', 5, 1),
( 2, 'Torre B', 5, 1),
( 3, 'Torre A', 5, 2),
( 4, 'Torre B', 5, 2),
( 5, 'Torre A', 5, 3),
( 6, 'Torre B', 5, 3),
( 7, 'Torre A', 5, 4),
( 8, 'Torre B', 5, 4),
( 9, 'Torre A', 5, 5),
(10, 'Torre B', 5, 5);

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
( 1, '101', 1, 1, 'ocupado'),
( 2, '102', 2, 1, 'ocupado'),
( 3, '103', 3, 1, 'ocupado'),
( 4, '104', 4, 1, 'disponible'),
( 5, '105', 5, 1, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
( 6, '201', 1, 2, 'ocupado'),
( 7, '202', 2, 2, 'ocupado'),
( 8, '203', 3, 2, 'disponible'),
( 9, '204', 4, 2, 'disponible'),
(10, '205', 5, 2, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
(11, '301', 1, 3, 'ocupado'),
(12, '302', 2, 3, 'ocupado'),
(13, '303', 3, 3, 'disponible'),
(14, '304', 4, 3, 'disponible'),
(15, '305', 5, 3, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
(16, '401', 1, 4, 'ocupado'),
(17, '402', 2, 4, 'disponible'),
(18, '403', 3, 4, 'disponible'),
(19, '404', 4, 4, 'disponible'),
(20, '405', 5, 4, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
(21, '501', 1, 5, 'ocupado'),
(22, '502', 2, 5, 'ocupado'),
(23, '503', 3, 5, 'disponible'),
(24, '504', 4, 5, 'disponible'),
(25, '505', 5, 5, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
(26, '601', 1, 6, 'ocupado'),
(27, '602', 2, 6, 'disponible'),
(28, '603', 3, 6, 'disponible'),
(29, '604', 4, 6, 'disponible'),
(30, '605', 5, 6, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
(31, '701', 1, 7, 'ocupado'),
(32, '702', 2, 7, 'ocupado'),
(33, '703', 3, 7, 'disponible'),
(34, '704', 4, 7, 'disponible'),
(35, '705', 5, 7, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
(36, '801', 1, 8, 'ocupado'),
(37, '802', 2, 8, 'disponible'),
(38, '803', 3, 8, 'disponible'),
(39, '804', 4, 8, 'disponible'),
(40, '805', 5, 8, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
(41, '901', 1, 9, 'ocupado'),
(42, '902', 2, 9, 'disponible'),
(43, '903', 3, 9, 'disponible'),
(44, '904', 4, 9, 'disponible'),
(45, '905', 5, 9, 'disponible');

INSERT INTO apartamento (id, numero, piso, torre_id, estado) VALUES
(46, '1001', 1, 10, 'ocupado'),
(47, '1002', 2, 10, 'disponible'),
(48, '1003', 3, 10, 'disponible'),
(49, '1004', 4, 10, 'disponible'),
(50, '1005', 5, 10, 'disponible');

INSERT INTO parqueadero (numero, tipo, apartamento_id) VALUES
('P-01',  'privado',  1),
('P-02',  'privado',  2),
('P-03',  'privado',  3),
('P-04',  'privado',  6),
('P-05',  'privado',  7),
('P-06',  'privado', 11),
('P-07',  'privado', 12),
('P-08',  'privado', 16),
('P-09',  'privado', 21),
('P-10',  'privado', 22),
('P-11',  'privado', 26),
('P-12',  'privado', 31),
('P-13',  'privado', 32),
('P-14',  'privado', 36),
('P-15',  'privado', 41),
('P-16',  'privado', 46),
('PUB-01','publico',  NULL),
('PUB-02','publico',  NULL),
('PUB-03','publico',  NULL),
('PUB-04','publico',  NULL);


USE residencias_gestion;

INSERT INTO gestion_propiedades
  (id, usuario_id, apartamento_id, fecha_inicio, fecha_fin,
   nombre_usuario, email_usuario, rol_usuario,
   numero_apartamento, piso_apartamento, estado_apartamento)
VALUES
( 1,  6,  1, '2025-01-01', NULL, 'Juan Pablo Gómez',   'jpgomez@gmail.com',   'arrendatario', '101',  1, 'ocupado'),
( 2,  7,  2, '2025-02-01', NULL, 'María Elena Torres', 'metorres@gmail.com',  'arrendatario', '102',  2, 'ocupado'),
( 3,  8,  3, '2025-03-01', NULL, 'Diego Herrera',      'dherrera@gmail.com',  'arrendatario', '103',  3, 'ocupado'),
( 4,  9,  6, '2025-01-15', NULL, 'Valentina Cruz',     'vcruz@gmail.com',     'arrendatario', '201',  1, 'ocupado'),
( 5, 10,  7, '2025-04-01', NULL, 'Samuel Ortiz',       'sortiz@gmail.com',    'arrendatario', '202',  2, 'ocupado'),
( 6, 11, 11, '2025-05-01', NULL, 'Camila Restrepo',    'crestrepo@gmail.com', 'arrendatario', '301',  1, 'ocupado'),
( 7, 12, 12, '2025-06-01', NULL, 'Nicolás Vargas',     'nvargas@gmail.com',   'arrendatario', '302',  2, 'ocupado'),
( 8, 13, 16, '2025-07-01', NULL, 'Isabela Mora',       'imora@gmail.com',     'arrendatario', '401',  1, 'ocupado'),
( 9, 14, 21, '2025-08-01', NULL, 'Sebastián Peña',     'spena@gmail.com',     'arrendatario', '501',  1, 'ocupado'),
(10, 15, 26, '2025-09-01', NULL, 'Daniela Suárez',     'dsuarez@gmail.com',   'arrendatario', '601',  1, 'ocupado');


INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(250000, 'enero',      2025, 'pagado',    '2025-01-05', 1),
(250000, 'febrero',    2025, 'pagado',    '2025-02-04', 1),
(250000, 'marzo',      2025, 'pagado',    '2025-03-06', 1),
(250000, 'abril',      2025, 'vencido',   NULL,          1),
(250000, 'mayo',       2025, 'vencido',   NULL,          1),
(250000, 'junio',      2025, 'pagado',    '2025-06-03', 1),
(250000, 'julio',      2025, 'pagado',    '2025-07-02', 1),
(250000, 'agosto',     2025, 'vencido',   NULL,          1),
(250000, 'septiembre', 2025, 'pendiente', NULL,          1),
(250000, 'octubre',    2025, 'pendiente', NULL,          1);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(300000, 'febrero',    2025, 'pagado', '2025-02-10', 2),
(300000, 'marzo',      2025, 'pagado', '2025-03-08', 2),
(300000, 'abril',      2025, 'pagado', '2025-04-07', 2),
(300000, 'mayo',       2025, 'pagado', '2025-05-05', 2),
(300000, 'junio',      2025, 'pagado', '2025-06-09', 2),
(300000, 'julio',      2025, 'pagado', '2025-07-07', 2),
(300000, 'agosto',     2025, 'pagado', '2025-08-04', 2),
(300000, 'septiembre', 2025, 'pagado', '2025-09-08', 2),
(300000, 'octubre',    2025, 'pagado', '2025-10-06', 2),
(300000, 'noviembre',  2025, 'pagado', '2025-11-03', 2);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(180000, 'marzo',      2025, 'vencido',   NULL, 3),
(180000, 'abril',      2025, 'vencido',   NULL, 3),
(180000, 'mayo',       2025, 'vencido',   NULL, 3),
(180000, 'junio',      2025, 'vencido',   NULL, 3),
(180000, 'julio',      2025, 'vencido',   NULL, 3),
(180000, 'agosto',     2025, 'vencido',   NULL, 3),
(180000, 'septiembre', 2025, 'vencido',   NULL, 3),
(180000, 'octubre',    2025, 'pendiente', NULL, 3),
(180000, 'noviembre',  2025, 'pendiente', NULL, 3),
(180000, 'diciembre',  2025, 'pendiente', NULL, 3);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(220000, 'enero',      2025, 'pagado',    '2025-01-20', 4),
(220000, 'febrero',    2025, 'pagado',    '2025-02-18', 4),
(220000, 'marzo',      2025, 'vencido',   NULL,          4),
(220000, 'abril',      2025, 'pagado',    '2025-04-15', 4),
(220000, 'mayo',       2025, 'vencido',   NULL,          4),
(220000, 'junio',      2025, 'pagado',    '2025-06-12', 4),
(220000, 'julio',      2025, 'pagado',    '2025-07-10', 4),
(220000, 'agosto',     2025, 'pendiente', NULL,          4),
(220000, 'septiembre', 2025, 'pendiente', NULL,          4),
(220000, 'octubre',    2025, 'pendiente', NULL,          4);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(270000, 'abril',      2025, 'pagado',    '2025-04-03', 5),
(270000, 'mayo',       2025, 'pagado',    '2025-05-02', 5),
(270000, 'junio',      2025, 'pagado',    '2025-06-04', 5),
(270000, 'julio',      2025, 'pagado',    '2025-07-03', 5),
(270000, 'agosto',     2025, 'pendiente', NULL,          5),
(270000, 'septiembre', 2025, 'pendiente', NULL,          5),
(270000, 'octubre',    2025, 'pendiente', NULL,          5),
(270000, 'noviembre',  2025, 'pendiente', NULL,          5);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(200000, 'mayo',       2025, 'pagado',    '2025-05-08', 6),
(200000, 'junio',      2025, 'pagado',    '2025-06-06', 6),
(200000, 'julio',      2025, 'vencido',   NULL,          6),
(200000, 'agosto',     2025, 'pendiente', NULL,          6),
(200000, 'septiembre', 2025, 'pendiente', NULL,          6);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(310000, 'junio',      2025, 'pagado', '2025-06-15', 7),
(310000, 'julio',      2025, 'pagado', '2025-07-14', 7),
(310000, 'agosto',     2025, 'pagado', '2025-08-12', 7),
(310000, 'septiembre', 2025, 'pagado', '2025-09-10', 7);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(240000, 'julio',      2025, 'vencido',   NULL, 8),
(240000, 'agosto',     2025, 'vencido',   NULL, 8),
(240000, 'septiembre', 2025, 'vencido',   NULL, 8),
(240000, 'octubre',    2025, 'pendiente', NULL, 8),
(240000, 'noviembre',  2025, 'pendiente', NULL, 8);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(260000, 'agosto',     2025, 'pendiente', NULL, 9),
(260000, 'septiembre', 2025, 'pendiente', NULL, 9),
(260000, 'octubre',    2025, 'pendiente', NULL, 9);

INSERT INTO pago_administracion (monto, mes_facturacion, anio_facturacion, estado, fecha_pago, gestion_propiedades_id) VALUES
(290000, 'septiembre', 2025, 'pagado',    '2025-09-05', 10),
(290000, 'octubre',    2025, 'vencido',   NULL,          10),
(290000, 'noviembre',  2025, 'pendiente', NULL,          10),
(290000, 'diciembre',  2025, 'pendiente', NULL,          10);