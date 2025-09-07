-- ============================================
-- PROYECTO SQL - BASE DE DATOS UNIVERSIDAD
-- ============================================


-- ============================================
-- PASO 1: CREAR Y SELECCIONAR LA BASE DE DATOS
-- ============================================

-- Eliminar la base de datos si existe (❗CUIDADO❗ esto borra todo)
DROP DATABASE IF EXISTS universidad;

-- Crear una nueva base de datos
CREATE DATABASE IF NOT EXISTS universidad;

-- Seleccionar la base de datos para trabajar con ella
USE universidad;


-- ============================================
-- PASO 2: CREAR LAS TABLAS
-- ============================================

-- ----------------------------
-- Tabla: Estudiantes
-- ----------------------------
CREATE TABLE Estudiantes (
    estudiante_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
);

-- ----------------------------
-- Tabla: Profesores
-- ----------------------------
CREATE TABLE Profesores (
    profesor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
);

-- ----------------------------
-- Tabla: Asignaturas
-- ----------------------------
CREATE TABLE Asignaturas (
    asignatura_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES Profesores (profesor_id) ,
);

-- ----------------------------
-- Tabla: Calificaciones
-- ----------------------------
CREATE TABLE Calificaciones (
    calificacion_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT NOT NULL,
    asignatura_id INT NOT NULL,
    nota DECIMAL(3, 1),  -- 3 digitos con 1 decimal -> Permite notas del 0.0 al 10.0 
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes (estudiante_id),
    FOREIGN KEY (asignatura_id) REFERENCES Asignaturas (asignatura_id),
);