#------------------------------------------------------------------------------------------------------
#  Creación de la Base de Datos
#------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

#------------------------------------------------------------------------------------------------------
#  Creación de las tablas
#------------------------------------------------------------------------------------------------------
CREATE TABLE departamento (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  codigo_departamento INT UNSIGNED,
  FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);