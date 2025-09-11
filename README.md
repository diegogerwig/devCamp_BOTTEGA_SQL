# Proyecto SQL - Base de Datos Universidad

## 📋 Descripción

Proyecto final del curso SQL de devCamp by Bottega. Consiste en crear una base de datos para gestionar información universitaria: estudiantes, profesores, asignaturas y calificaciones.

## 🎯 Requisitos del Proyecto (devCamp)

### Tablas Requeridas
- **Students** - Información de estudiantes
- **Professors** - Información de profesores  
- **Courses** - Asignaturas disponibles
- **Grades** - Calificaciones de estudiantes

### Características Técnicas
- Relaciones con Foreign Keys entre tablas
- Script de población con datos de ejemplo
- Consultas SQL específicas:
 1. Promedio de calificación por profesor
 2. Mejor nota de cada estudiante
 3. Estudiantes ordenados por cursos inscritos
 4. Reporte de cursos por dificultad (basado en promedio)
 5. Par estudiante-profesor con más cursos en común

## 🚀 Cómo Ejecutar el Proyecto

### Paso 1: Preparar el Entorno
- Abrir MySQL Workbench
- Conectarse a tu servidor MySQL local

### Paso 2: Ejecutar el Script
1. Abrir el archivo `universidad.sql` en MySQL Workbench
2. Ejecutar todo el script con el botón de rayo ⚡
3. El script automáticamente:
  - Creará la base de datos
  - Creará las 4 tablas
  - Insertará datos de ejemplo
  - Ejecutará las 5 consultas requeridas

### Paso 3: Revisar Resultados
- Los resultados de cada consulta aparecerán en la parte inferior
- Cada consulta muestra información diferente según los requisitos

## ⚠️ Notas Importantes

- El script incluye `DROP DATABASE IF EXISTS` al inicio
- Esto significa que borrará cualquier base de datos llamada "universidad" existente