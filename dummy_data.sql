-- =====================================================
-- DATOS DE PRUEBA LIMPIOS - SISTEMA ACADÉMICO
-- =====================================================

USE moshaca_marbore;

-- =====================================================
-- DATOS PARA TABLAS CATÁLOGO
-- =====================================================

-- Limpiar y reinsertar PARENTESCO
INSERT INTO parentesco (nombre_parentesco) VALUES
('Padre'),
('Madre'),
('Abuelo'),
('Abuela'),
('Tío'),
('Tía'),
('Hermano'),
('Hermana'),
('Tutor Legal'),
('Otro Familiar');

-- Limpiar y reinsertar SOLO los 3 tipos de reporte requeridos
INSERT INTO tipo_reporte (nombre_tipo, descripcion, gravedad) VALUES
('Acceso con Credencial Virtual', 'Reporte generado cuando un alumno accede con credencial virtual', 'BAJA'),
('Retraso', 'Alumno llegó tarde a la institución', 'BAJA'),
('Pérdida de Credencial', 'Alumno no ingreso con la credencial física', 'MEDIA');

-- =====================================================
-- DATOS PARA TABLAS PRINCIPALES
-- =====================================================

-- Limpiar y reinsertar ALUMNO
INSERT INTO alumno (boleta, curp, nombre, apellido_paterno, apellido_materno, foto, status) VALUES
('2024010001', 'GARP010315HMCRNR05', 'Pedro', 'García', 'Ramírez', 'https://ejemplo.com/fotos/pedro_garcia.jpg', 'INSCRITO'),
('2024010002', 'LOMS020408MDFPRL01', 'María', 'López', 'Martínez', 'https://ejemplo.com/fotos/maria_lopez.jpg', 'INSCRITO'),
('2024010003', 'ROGE031209HPLDRG02', 'Jorge', 'Rodríguez', 'González', 'https://ejemplo.com/fotos/jorge_rodriguez.jpg', 'INSCRITO'),
('2024010004', 'SAAC040612MDFNND03', 'Ana', 'Sánchez', 'Castillo', 'https://ejemplo.com/fotos/ana_sanchez.jpg', 'INSCRITO'),
('2024010005', 'MEDR050715HPLRTV04', 'David', 'Méndez', 'Rivera', 'https://ejemplo.com/fotos/david_mendez.jpg', 'NO INSCRITO'),
('2024010006', 'TORN061018MDFRRG05', 'Regina', 'Torres', 'Núñez', 'https://ejemplo.com/fotos/regina_torres.jpg', 'INSCRITO'),
('2024010007', 'VALA070221HPLSLL06', 'Alejandro', 'Vásquez', 'Luna', 'https://ejemplo.com/fotos/alejandro_vasquez.jpg', 'INSCRITO'),
('2024010008', 'FLCR080524MDFRNC07', 'Carla', 'Flores', 'Cruz', 'https://ejemplo.com/fotos/carla_flores.jpg', 'INSCRITO'),
('2024010009', 'JMNT091127HPLMTN08', 'Martín', 'Jiménez', 'Torres', 'https://ejemplo.com/fotos/martin_jimenez.jpg', 'INSCRITO'),
('2024010010', 'ESPR100230MDFSPZ09', 'Priscila', 'Espinoza', 'Ruiz', 'https://ejemplo.com/fotos/priscila_espinoza.jpg', 'INSCRITO');

-- Limpiar y reinsertar TUTOR
INSERT INTO tutor (id_tutor, nombre, apellido_paterno, apellido_materno, telefono, email, direccion, foto, status) VALUES
(UUID(), 'Roberto', 'García', 'Mendoza', '5551234567', 'roberto.garcia@email.com', 'Av. Principal 123, Col. Centro', 'https://ejemplo.com/fotos/roberto_garcia_t.jpg', 'ACTIVO'),
(UUID(), 'Carmen', 'López', 'Silva', '5552345678', 'carmen.lopez@email.com', 'Calle Secundaria 456, Col. Norte', 'https://ejemplo.com/fotos/carmen_lopez_t.jpg', 'ACTIVO'),
(UUID(), 'Miguel', 'Rodríguez', 'Pérez', '5553456789', 'miguel.rodriguez@email.com', 'Av. Reforma 789, Col. Sur', 'https://ejemplo.com/fotos/miguel_rodriguez_t.jpg', 'ACTIVO'),
(UUID(), 'Patricia', 'Sánchez', 'Vega', '5554567890', 'patricia.sanchez@email.com', 'Calle Juárez 321, Col. Este', 'https://ejemplo.com/fotos/patricia_sanchez_t.jpg', 'ACTIVO'),
(UUID(), 'Fernando', 'Méndez', 'Aguilar', '5555678901', 'fernando.mendez@email.com', 'Av. Hidalgo 654, Col. Oeste', 'https://ejemplo.com/fotos/fernando_mendez_t.jpg', 'INACTIVO'),
(UUID(), 'Gloria', 'Torres', 'Morales', '5556789012', 'gloria.torres@email.com', 'Calle Morelos 987, Col. Centro', 'https://ejemplo.com/fotos/gloria_torres_t.jpg', 'ACTIVO'),
(UUID(), 'Eduardo', 'Vásquez', 'Herrera', '5557890123', 'eduardo.vasquez@email.com', 'Av. Constitución 147, Col. Norte', 'https://ejemplo.com/fotos/eduardo_vasquez_t.jpg', 'ACTIVO'),
(UUID(), 'Lucía', 'Flores', 'Domínguez', '5558901234', 'lucia.flores@email.com', 'Calle Independencia 258, Col. Sur', 'https://ejemplo.com/fotos/lucia_flores_t.jpg', 'ACTIVO'),
(UUID(), 'Sergio', 'Jiménez', 'Castro', '5559012345', 'sergio.jimenez@email.com', 'Av. Revolución 369, Col. Este', 'https://ejemplo.com/fotos/sergio_jimenez_t.jpg', 'ACTIVO'),
(UUID(), 'Mónica', 'Espinoza', 'Guerrero', '5550123456', 'monica.espinoza@email.com', 'Calle Libertad 741, Col. Oeste', 'https://ejemplo.com/fotos/monica_espinoza_t.jpg', 'ACTIVO');

-- Limpiar y reinsertar CREDENCIAL
INSERT INTO credencial (id_credencial, boleta, codigo_qr, foto, fecha_emision, fecha_vencimiento) VALUES
(UUID(), '2024010001', 'QR_GARP010315HMCRNR05_1704067200', 'https://ejemplo.com/qr/credencial_001.jpg', '2024-01-01 08:00:00', '2024-12-31 23:59:59'),
(UUID(), '2024010002', 'QR_LOMS020408MDFPRL01_1704067300', 'https://ejemplo.com/qr/credencial_002.jpg', '2024-01-01 08:05:00', '2024-12-31 23:59:59'),
(UUID(), '2024010003', 'QR_ROGE031209HPLDRG02_1704067400', 'https://ejemplo.com/qr/credencial_003.jpg', '2024-01-01 08:10:00', '2024-12-31 23:59:59'),
(UUID(), '2024010004', 'QR_SAAC040612MDFNND03_1704067500', 'https://ejemplo.com/qr/credencial_004.jpg', '2024-01-01 08:15:00', '2024-12-31 23:59:59'),
(UUID(), '2024010006', 'QR_TORN061018MDFRRG05_1704067600', 'https://ejemplo.com/qr/credencial_006.jpg', '2024-01-01 08:20:00', '2024-12-31 23:59:59'),
(UUID(), '2024010007', 'QR_VALA070221HPLSLL06_1704067700', 'https://ejemplo.com/qr/credencial_007.jpg', '2024-01-01 08:25:00', '2024-12-31 23:59:59'),
(UUID(), '2024010008', 'QR_FLCR080524MDFRNC07_1704067800', 'https://ejemplo.com/qr/credencial_008.jpg', '2024-01-01 08:30:00', '2024-12-31 23:59:59'),
(UUID(), '2024010009', 'QR_JMNT091127HPLMTN08_1704067900', 'https://ejemplo.com/qr/credencial_009.jpg', '2024-01-01 08:35:00', '2024-12-31 23:59:59'),
(UUID(), '2024010010', 'QR_ESPR100230MDFSPZ09_1704068000', 'https://ejemplo.com/qr/credencial_010.jpg', '2024-01-01 08:40:00', '2024-12-31 23:59:59');

-- Obtener IDs de tutores para las relaciones
SET @tutor1 = (SELECT id_tutor FROM tutor WHERE nombre = 'Roberto' AND apellido_paterno = 'García' LIMIT 1);
SET @tutor2 = (SELECT id_tutor FROM tutor WHERE nombre = 'Carmen' AND apellido_paterno = 'López' LIMIT 1);
SET @tutor3 = (SELECT id_tutor FROM tutor WHERE nombre = 'Miguel' AND apellido_paterno = 'Rodríguez' LIMIT 1);
SET @tutor4 = (SELECT id_tutor FROM tutor WHERE nombre = 'Patricia' AND apellido_paterno = 'Sánchez' LIMIT 1);
SET @tutor5 = (SELECT id_tutor FROM tutor WHERE nombre = 'Fernando' AND apellido_paterno = 'Méndez' LIMIT 1);
SET @tutor6 = (SELECT id_tutor FROM tutor WHERE nombre = 'Gloria' AND apellido_paterno = 'Torres' LIMIT 1);
SET @tutor7 = (SELECT id_tutor FROM tutor WHERE nombre = 'Eduardo' AND apellido_paterno = 'Vásquez' LIMIT 1);
SET @tutor8 = (SELECT id_tutor FROM tutor WHERE nombre = 'Lucía' AND apellido_paterno = 'Flores' LIMIT 1);
SET @tutor9 = (SELECT id_tutor FROM tutor WHERE nombre = 'Sergio' AND apellido_paterno = 'Jiménez' LIMIT 1);
SET @tutor10 = (SELECT id_tutor FROM tutor WHERE nombre = 'Mónica' AND apellido_paterno = 'Espinoza' LIMIT 1);

-- Limpiar y reinsertar ALUMNO_TUTOR
INSERT INTO alumno_tutor (id_relacion, boleta, id_tutor, id_parentesco, es_contacto_principal, status) VALUES
(UUID(), '2024010001', @tutor1, 1, 1, 'ACTIVO'), -- Pedro - Roberto (Padre)
(UUID(), '2024010002', @tutor2, 2, 1, 'ACTIVO'), -- María - Carmen (Madre)
(UUID(), '2024010003', @tutor3, 1, 1, 'ACTIVO'), -- Jorge - Miguel (Padre)
(UUID(), '2024010004', @tutor4, 2, 1, 'ACTIVO'), -- Ana - Patricia (Madre)
(UUID(), '2024010005', @tutor5, 1, 1, 'ACTIVO'), -- David - Fernando (Padre)
(UUID(), '2024010006', @tutor6, 2, 1, 'ACTIVO'), -- Regina - Gloria (Madre)
(UUID(), '2024010007', @tutor7, 1, 1, 'ACTIVO'), -- Alejandro - Eduardo (Padre)
(UUID(), '2024010008', @tutor8, 2, 1, 'ACTIVO'), -- Carla - Lucía (Madre)
(UUID(), '2024010009', @tutor9, 1, 1, 'ACTIVO'), -- Martín - Sergio (Padre)
(UUID(), '2024010010', @tutor10, 2, 1, 'ACTIVO'), -- Priscila - Mónica (Madre)
-- Algunos alumnos con tutores secundarios
(UUID(), '2024010001', @tutor2, 2, 0, 'ACTIVO'), -- Pedro - Carmen (Madre como contacto secundario)
(UUID(), '2024010003', @tutor4, 3, 0, 'ACTIVO'), -- Jorge - Patricia (Abuela como contacto secundario)
(UUID(), '2024010006', @tutor7, 5, 0, 'ACTIVO'); -- Regina - Eduardo (Tío como contacto secundario)

-- Limpiar y reinsertar REGISTRO_ACCESO
INSERT INTO registro_acceso (id_registro, boleta, tipo_acceso, metodo_acceso, fecha_hora) VALUES
-- Registros normales (FISICA)
(UUID(), '2024010001', 'ENTRADA', 'FISICA', '2024-06-01 07:30:00'),
(UUID(), '2024010001', 'SALIDA', 'FISICA', '2024-06-01 14:00:00'),
(UUID(), '2024010003', 'ENTRADA', 'FISICA', '2024-06-01 07:25:00'),
(UUID(), '2024010003', 'SALIDA', 'FISICA', '2024-06-01 13:55:00'),
(UUID(), '2024010004', 'ENTRADA', 'FISICA', '2024-06-01 07:35:00'),
(UUID(), '2024010004', 'SALIDA', 'FISICA', '2024-06-01 14:20:00'),
(UUID(), '2024010008', 'ENTRADA', 'FISICA', '2024-06-01 07:20:00'),
(UUID(), '2024010008', 'SALIDA', 'FISICA', '2024-06-01 13:50:00'),
(UUID(), '2024010009', 'ENTRADA', 'FISICA', '2024-06-01 07:40:00'),
(UUID(), '2024010009', 'SALIDA', 'FISICA', '2024-06-01 14:25:00'),

-- Registros con VIRTUAL (generarán reportes automáticos)
(UUID(), '2024010002', 'ENTRADA', 'VIRTUAL', '2024-06-01 07:45:00'),
(UUID(), '2024010002', 'SALIDA', 'FISICA', '2024-06-01 14:15:00'),
(UUID(), '2024010006', 'ENTRADA', 'FISICA', '2024-06-01 07:35:00'),
(UUID(), '2024010006', 'SALIDA', 'VIRTUAL', '2024-06-01 14:05:00'),
(UUID(), '2024010007', 'ENTRADA', 'VIRTUAL', '2024-06-01 07:50:00'),
(UUID(), '2024010007', 'SALIDA', 'FISICA', '2024-06-01 14:10:00'),
(UUID(), '2024010010', 'ENTRADA', 'VIRTUAL', '2024-06-01 08:00:00'),
(UUID(), '2024010010', 'SALIDA', 'FISICA', '2024-06-01 14:30:00'),

-- Registros con MANUAL
(UUID(), '2024010004', 'ENTRADA', 'MANUAL', '2024-06-02 08:10:00'),
(UUID(), '2024010009', 'SALIDA', 'MANUAL', '2024-06-02 14:25:00'),

-- Algunos registros de días anteriores
(UUID(), '2024010001', 'ENTRADA', 'FISICA', '2024-05-31 07:28:00'),
(UUID(), '2024010001', 'SALIDA', 'FISICA', '2024-05-31 14:02:00'),
(UUID(), '2024010002', 'ENTRADA', 'FISICA', '2024-05-31 07:32:00'),
(UUID(), '2024010002', 'SALIDA', 'VIRTUAL', '2024-05-31 14:08:00'),
-- Entrada tardía (generará reporte de retraso)
(UUID(), '2024010003', 'ENTRADA', 'FISICA', '2024-05-30 08:15:00'),
(UUID(), '2024010003', 'SALIDA', 'FISICA', '2024-05-30 14:20:00');

-- Limpiar y reinsertar REPORTE (solo con los 3 tipos permitidos)
INSERT INTO reporte (id_reporte, boleta, id_tipo_reporte, motivo, status, created_at) VALUES
-- Reportes de Acceso con Credencial Virtual (se generan automáticamente por el trigger)
(UUID(), '2024010002', 1, 'Acceso de entrada registrado con credencial virtual', 'PENDIENTE', '2024-06-01 07:45:00'),
(UUID(), '2024010006', 1, 'Acceso de salida registrado con credencial virtual', 'PENDIENTE', '2024-06-01 14:05:00'),
(UUID(), '2024010007', 1, 'Acceso de entrada registrado con credencial virtual', 'RESUELTO', '2024-06-01 07:50:00'),
(UUID(), '2024010010', 1, 'Acceso de entrada registrado con credencial virtual', 'PENDIENTE', '2024-06-01 08:00:00'),
(UUID(), '2024010002', 1, 'Acceso de salida registrado con credencial virtual', 'RESUELTO', '2024-05-31 14:08:00'),

-- Reportes de Retraso
(UUID(), '2024010003', 2, 'Llegada tardía a las instalaciones - 8:15 AM (hora límite 8:00 AM)', 'RESUELTO', '2024-05-30 08:15:00'),
(UUID(), '2024010004', 2, 'Llegada tardía a las instalaciones - 8:10 AM', 'EN_PROCESO', '2024-06-02 08:10:00'),
(UUID(), '2024010010', 2, 'Llegada tardía a las instalaciones - 8:00 AM', 'PENDIENTE', '2024-06-01 08:00:00'),

-- Reportes de Pérdida de Credencial
(UUID(), '2024010001', 3, 'Alumno reporta pérdida de credencial física - Solicitada reposición', 'RESUELTO', '2024-05-28 12:00:00'),
(UUID(), '2024010005', 3, 'Credencial física extraviada - En proceso de reposición', 'EN_PROCESO', '2024-05-25 10:30:00');

-- =====================================================
-- CONSULTAS DE VERIFICACIÓN
-- =====================================================

-- Verificar datos insertados
SELECT 'PARENTESCO' AS tabla, COUNT(*) AS total_registros FROM parentesco
UNION ALL
SELECT 'TIPO_REPORTE' AS tabla, COUNT(*) AS total_registros FROM tipo_reporte
UNION ALL
SELECT 'ALUMNO' AS tabla, COUNT(*) AS total_registros FROM alumno
UNION ALL
SELECT 'TUTOR' AS tabla, COUNT(*) AS total_registros FROM tutor
UNION ALL
SELECT 'CREDENCIAL' AS tabla, COUNT(*) AS total_registros FROM credencial
UNION ALL
SELECT 'ALUMNO_TUTOR' AS tabla, COUNT(*) AS total_registros FROM alumno_tutor
UNION ALL
SELECT 'REGISTRO_ACCESO' AS tabla, COUNT(*) AS total_registros FROM registro_acceso
UNION ALL
SELECT 'REPORTE' AS tabla, COUNT(*) AS total_registros FROM reporte;

-- Verificar solo los 3 tipos de reporte
SELECT 
    id_tipo_reporte,
    nombre_tipo,
    descripcion,
    gravedad
FROM tipo_reporte
ORDER BY id_tipo_reporte;

-- Ver reportes por tipo
SELECT 
    tr.nombre_tipo,
    COUNT(*) as cantidad_reportes,
    COUNT(CASE WHEN r.status = 'PENDIENTE' THEN 1 END) as pendientes,
    COUNT(CASE WHEN r.status = 'EN_PROCESO' THEN 1 END) as en_proceso,
    COUNT(CASE WHEN r.status = 'RESUELTO' THEN 1 END) as resueltos
FROM reporte r
JOIN tipo_reporte tr ON r.id_tipo_reporte = tr.id_tipo_reporte
GROUP BY tr.id_tipo_reporte, tr.nombre_tipo
ORDER BY tr.id_tipo_reporte;

-- Ver todos los reportes con detalles
SELECT 
    r.id_reporte,
    a.boleta,
    CONCAT(a.nombre, ' ', a.apellido_paterno) AS alumno,
    tr.nombre_tipo,
    r.motivo,
    r.status,
    r.created_at
FROM reporte r
JOIN alumno a ON r.boleta = a.boleta
JOIN tipo_reporte tr ON r.id_tipo_reporte = tr.id_tipo_reporte
ORDER BY r.created_at DESC;