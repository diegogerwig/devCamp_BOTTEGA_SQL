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
    nombre VARCHAR(100) NOT NULL
);

-- ----------------------------
-- Tabla: Profesores
-- ----------------------------
CREATE TABLE Profesores (
    profesor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- ----------------------------
-- Tabla: Asignaturas
-- ----------------------------
CREATE TABLE Asignaturas (
    asignatura_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES Profesores (profesor_id)
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
    FOREIGN KEY (asignatura_id) REFERENCES Asignaturas (asignatura_id)
);


-- ============================================
-- PASO 3: INSERTAR DATOS DE EJEMPLO
-- ============================================

-- ----------------------------
-- Insertar Estudiantes
-- ----------------------------
INSERT INTO Estudiantes (nombre) VALUES
    ('Ana Sánchez'),
    ('Carlos Pérez'),
    ('María González'),
    ('Luis Ramírez'),
    ('Elena Torres');

-- ----------------------------
-- Insertar Profesores
-- ----------------------------
INSERT INTO Profesores (nombre) VALUES 
    ('D. Ricardo García'),
    ('D. Santiago Martínez'),
    ('Dña. Marta López');

-- ----------------------------
-- Insertar Asignaturas
-- ----------------------------
INSERT INTO Asignaturas (nombre, profesor_id) VALUES
    ('Matemáticas', 1),
    ('Física', 2),
    ('Química', 3),
    ('Biología', 2),
    ('Programación', 1);

-- ----------------------------
-- Insertar Calificaciones
-- ----------------------------
INSERT INTO Calificaciones (estudiante_id, asignatura_id, nota) VALUES
-- Ana (estudiante 1) - 4 asignaturas
    (1, 1, 8.5),
    (1, 2, 7.0),
    (1, 3, 9.0),
    (1, 4, 8.0),

-- Carlos (estudiante 2) - 5 asignaturas
    (2, 1, 6.5), 
    (2, 2, 7.5),
    (2, 3, 7.5), 
    (2, 4, 8.0), 
    (2, 5, 9.5), 

-- María (estudiante 3) - 3 asignaturas
    (3, 2, 8.0), 
    (3, 3, 7.5),
    (3, 4, 9.0),

-- Luis (estudiante 4) - 4 asignaturas
    (4, 1, 9.5), 
    (4, 2, 8.5), 
    (4, 4, 7.0), 
    (4, 5, 9.0),

-- Elena (estudiante 5) - 5 asignaturas
    (5, 1, 6.0), 
    (5, 2, 8.0), 
    (5, 3, 9.0), 
    (5, 4, 8.5), 
    (5, 5, 7.5);


-- ============================================
-- PASO 4: CONSULTAS REQUERIDAS
-- ============================================

-- ----------------------------
-- 1. Promedio de nota que da cada profesor
-- ----------------------------
SELECT Profesores.nombre, AVG(Calificaciones.nota)
FROM
    Profesores
    JOIN Asignaturas ON Profesores.profesor_id = Asignaturas.profesor_id
    JOIN Calificaciones ON Asignaturas.asignatura_id = Calificaciones.asignatura_id
GROUP BY
    Profesores.profesor_id,
    Profesores.nombre;

-- ----------------------------
-- 2. Las mejores notas de cada estudiante
-- ----------------------------
SELECT Estudiantes.nombre, MAX(Calificaciones.nota)
FROM Estudiantes
    JOIN Calificaciones ON Estudiantes.estudiante_id = Calificaciones.estudiante_id
GROUP BY
    Estudiantes.estudiante_id,
    Estudiantes.nombre;

-- ----------------------------
-- 3. Ordenar estudiantes por las asignaturas en las que están inscritos
-- ----------------------------
SELECT Asignaturas.nombre, Estudiantes.nombre, Calificaciones.nota
FROM
    Estudiantes
    JOIN Calificaciones ON Estudiantes.estudiante_id = Calificaciones.estudiante_id
    JOIN Asignaturas ON Calificaciones.asignatura_id = Asignaturas.asignatura_id
ORDER BY Asignaturas.nombre, Estudiantes.nombre;

