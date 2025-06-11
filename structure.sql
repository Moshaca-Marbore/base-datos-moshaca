-- =====================================================
-- SCRIPT SQL - SISTEMA ACADÉMICO
-- =====================================================

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS moshaca_marbore;
USE moshaca_marbore;

-- =====================================================
-- TABLAS CATÁLOGO
-- =====================================================

-- Tabla: PARENTESCO
-- Esta tabla almacena los tipos de parentesco que un tutor puede tener con un alumno.
/*
    Ejemplo: Padre, Madre, Abuelo, Tío, etc.
    - id_parentesco: Identificador único del parentesco.
    - nombre_parentesco: Nombre del parentesco (ej. Padre, Madre).
    - created_at: Fecha de creación del registro.
    - updated_at: Fecha de última actualización del registro.
*/
CREATE TABLE parentesco (
    id_parentesco INT AUTO_INCREMENT PRIMARY KEY,
    nombre_parentesco VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla: TIPO_REPORTE
-- Esta tabla almacena los tipos de reportes que pueden generarse en el sistema.
/*
    Datos:
    - id_tipo_reporte: Identificador único del tipo de reporte.
    - nombre_tipo: Nombre del tipo de reporte (ej. Acceso con Credencial Virtual).
    - descripcion: Descripción del tipo de reporte.
    - gravedad: Nivel de gravedad del reporte (Baja, Media, Alta).
*/
CREATE TABLE tipo_reporte (
    id_tipo_reporte INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(191),
    gravedad ENUM('BAJA', 'MEDIA', 'ALTA') DEFAULT 'MEDIA'
);

-- =====================================================
-- TABLAS PRINCIPALES
-- =====================================================

-- Tabla: ALUMNO
-- Esta tabla almacena la información de los alumnos del sistema.
/*
    Datos:
    - boleta: Identificador único del alumno (ej. 2023090001).
    - curp: CURP del alumno (ej. ABCD123456HDFGJ01).
    - nombre: Nombre del alumno.
    - apellido_paterno: Apellido paterno del alumno.
    - apellido_materno: Apellido materno del alumno.
    - foto: URL foto del alumno.
    - status: Estado del alumno (INSCRITO, NO INSCRITO).
*/
CREATE TABLE alumno (
    boleta VARCHAR(10) PRIMARY KEY,
    curp VARCHAR(18) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    foto VARCHAR(255),
    status ENUM('INSCRITO', 'NO INSCRITO') DEFAULT 'INSCRITO',
    
    INDEX idx_alumno_nombre (nombre, apellido_paterno),
    INDEX idx_alumno_curp (curp),
    INDEX idx_alumno_status (status)
);

-- Tabla: TUTOR
-- Esta tabla almacena la información de los tutores de los alumnos.
/*
    Datos:
    - id_tutor: Identificador único del tutor (UUID).
    - nombre: Nombre del tutor.
    - apellido_paterno: Apellido paterno del tutor.
    - apellido_materno: Apellido materno del tutor.
    - telefono: Teléfono de contacto del tutor.
    - email: Correo electrónico del tutor.
    - direccion: Dirección del tutor.
    - foto: URL foto del tutor.
    - fecha_registro: Fecha y hora de registro del tutor en el sistema.
    - status: Estado del tutor (ACTIVO, INACTIVO).
*/
CREATE TABLE tutor (
    id_tutor VARCHAR(36) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(191),
    foto VARCHAR(255),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('ACTIVO', 'INACTIVO') DEFAULT 'ACTIVO',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_tutor_nombre (nombre, apellido_paterno),
    INDEX idx_tutor_telefono (telefono),
    INDEX idx_tutor_email (email)
);

-- Tabla: CREDENCIAL
-- Esta tabla almacena las credenciales de acceso de los alumnos.
/*
    Ejemplo:
    - id_credencial: Identificador único de la credencial (UUID).
    - boleta: Boleta del alumno a quien pertenece la credencial.
    - codigo_qr: Código QR único asociado a la credencial.
    - foto: URL foto de la credencial.
    - fecha_emision: Fecha y hora de emisión de la credencial.
    - fecha_vencimiento: Fecha y hora de vencimiento de la credencial.
*/
CREATE TABLE credencial (
    id_credencial VARCHAR(36) PRIMARY KEY,
    boleta VARCHAR(10) NOT NULL,
    codigo_qr VARCHAR(255) UNIQUE,
    foto VARCHAR(191),
    fecha_emision DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_vencimiento DATETIME NOT NULL,
    
    FOREIGN KEY (boleta) REFERENCES alumno(boleta) ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX idx_credencial_alumno (boleta),
    INDEX idx_credencial_qr (codigo_qr),
    INDEX idx_credencial_vencimiento (fecha_vencimiento)
);

-- Tabla: ALUMNO_TUTOR (Relación muchos a muchos)
-- Esta tabla almacena la relación entre alumnos y tutores.
/*
    Ejemplo:
    - id_relacion: Identificador único de la relación (UUID).
    - boleta: Boleta del alumno.
    - id_tutor: Identificador del tutor.
    - id_parentesco: Identificador del parentesco entre el tutor y el alumno.
    - es_contacto_principal: Indica si el tutor es el contacto principal del alumno.
    - status: Estado de la relación (ACTIVO, INACTIVO).
*/
CREATE TABLE alumno_tutor (
    id_relacion VARCHAR(36) PRIMARY KEY,
    boleta VARCHAR(10) NOT NULL,
    id_tutor VARCHAR(36) NOT NULL,
    id_parentesco INT NOT NULL,
    es_contacto_principal TINYINT DEFAULT 0,
    status ENUM('ACTIVO', 'INACTIVO') DEFAULT 'ACTIVO',
    
    FOREIGN KEY (boleta) REFERENCES alumno(boleta) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_parentesco) REFERENCES parentesco(id_parentesco) ON UPDATE CASCADE ON DELETE RESTRICT,
    UNIQUE KEY unique_alumno_tutor (boleta, id_tutor),
    INDEX idx_alumno_tutor_alumno (boleta),
    INDEX idx_alumno_tutor_tutor (id_tutor),
    INDEX idx_contacto_principal (es_contacto_principal)
);

-- Tabla: REGISTRO_ACCESO
-- Esta tabla almacena los registros de acceso de los alumnos al sistema.
/*
    Ejemplo:
    - id_registro: Identificador único del registro (UUID).
    - boleta: Boleta del alumno que accede.
    - tipo_acceso: Tipo de acceso (ENTRADA, SALIDA).
    - metodo_acceso: Método de acceso (FISICA, VIRTUAL, MANUAL).
    - fecha_hora: Fecha y hora del acceso.
*/
CREATE TABLE registro_acceso (
    id_registro VARCHAR(36) PRIMARY KEY,
    boleta VARCHAR(10) NOT NULL,
    tipo_acceso ENUM('ENTRADA', 'SALIDA') NOT NULL,
    metodo_acceso ENUM('FISICA', 'VIRTUAL', 'MANUAL') NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (boleta) REFERENCES alumno(boleta) ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX idx_registro_alumno (boleta),
    INDEX idx_registro_fecha (fecha_hora),
    INDEX idx_registro_tipo (metodo_acceso)
);

-- Tabla: REPORTE
-- Esta tabla almacena los reportes generados por los alumnos.
/*
    Ejemplo:
    - id_reporte: Identificador único del reporte (UUID).
    - boleta: Boleta del alumno que genera el reporte.
    - id_tipo_reporte: Identificador del tipo de reporte.
    - motivo: Motivo del reporte.
    - fecha: Fecha y hora de creación del reporte.
    - status: Estado del reporte (PENDIENTE, EN_PROCESO, RESUELTO, CANCELADO).
    - requiere_tutor: Indica si se requiere la intervención de un tutor.
*/
CREATE TABLE reporte (
    id_reporte VARCHAR(36) PRIMARY KEY,
    boleta VARCHAR(10) NOT NULL,
    id_tipo_reporte INT NOT NULL,
    motivo VARCHAR(191) NOT NULL,
    status ENUM('PENDIENTE', 'EN_PROCESO', 'RESUELTO', 'CANCELADO') DEFAULT 'PENDIENTE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (boleta) REFERENCES alumno(boleta) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_tipo_reporte) REFERENCES tipo_reporte(id_tipo_reporte) ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_reporte_alumno (boleta),
    INDEX idx_reporte_tipo (id_tipo_reporte),
    INDEX idx_reporte_status (status)
);

-- =====================================================
-- TRIGGERS Y PROCEDIMIENTOS ALMACENADOS
-- =====================================================

DELIMITER //

-- Trigger para generar ID único en credencial
CREATE TRIGGER before_insert_credencial
BEFORE INSERT ON credencial
FOR EACH ROW
BEGIN
    IF NEW.id_credencial IS NULL OR NEW.id_credencial = '' THEN
        SET NEW.id_credencial = UUID();
    END IF;
    
    IF NEW.codigo_qr IS NULL OR NEW.codigo_qr = '' THEN
        SET NEW.codigo_qr = CONCAT('QR_', NEW.boleta, '_', UNIX_TIMESTAMP());
    END IF;
END//

-- Trigger para generar ID único en tutor
CREATE TRIGGER before_insert_tutor
BEFORE INSERT ON tutor
FOR EACH ROW
BEGIN
    IF NEW.id_tutor IS NULL OR NEW.id_tutor = '' THEN
        SET NEW.id_tutor = UUID();
    END IF;
END//

-- Trigger para generar ID único en alumno_tutor
CREATE TRIGGER before_insert_alumno_tutor
BEFORE INSERT ON alumno_tutor
FOR EACH ROW
BEGIN
    IF NEW.id_relacion IS NULL OR NEW.id_relacion = '' THEN
        SET NEW.id_relacion = UUID();
    END IF;
END//

-- Trigger para generar ID único en registro_acceso
CREATE TRIGGER before_insert_registro_acceso
BEFORE INSERT ON registro_acceso
FOR EACH ROW
BEGIN
    IF NEW.id_registro IS NULL OR NEW.id_registro = '' THEN
        SET NEW.id_registro = UUID();
    END IF;
END//

-- Trigger para generar ID único en reporte
CREATE TRIGGER before_insert_reporte
BEFORE INSERT ON reporte
FOR EACH ROW
BEGIN
    IF NEW.id_reporte IS NULL OR NEW.id_reporte = '' THEN
        SET NEW.id_reporte = UUID();
    END IF;
END//

-- Trigger para registrar reporte si se ingresa con una credencial virtual
CREATE TRIGGER after_insert_registro_acceso
BEFORE INSERT ON registro_acceso
FOR EACH ROW
BEGIN
    IF NEW.metodo_acceso = 'VIRTUAL' THEN
        INSERT INTO reporte (boleta, id_tipo_reporte, motivo, status)
        VALUES (NEW.boleta, (SELECT id_tipo_reporte FROM tipo_reporte WHERE nombre_tipo = 'Acceso con Credencial Virtual'), 
                'Acceso registrado con credencial virtual', 'PENDIENTE');
    END IF;
END//

DELIMITER ;
