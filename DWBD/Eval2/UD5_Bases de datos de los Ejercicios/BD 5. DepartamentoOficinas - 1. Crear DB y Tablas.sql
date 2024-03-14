#------------------------------------------------------------------------------------------------------
#  Creación de la Base de Datos
#------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS departamentoOficinas;
CREATE DATABASE departamentoOficinas;
USE departamentoOficinas;

#------------------------------------------------------------------------------------------------------
#  Creación de las tablas
#------------------------------------------------------------------------------------------------------
CREATE TABLE oficina (
  oficina INTEGER NOT NULL,
  ciudad VARCHAR( 30 ) NOT NULL,
  region VARCHAR( 50 ) DEFAULT NULL,
  PRIMARY KEY ( oficina )
);

CREATE TABLE departamento (
  dpto INTEGER NOT NULL,
  nombre VARCHAR( 15 ) NOT NULL,
  PRIMARY KEY ( dpto )
);

CREATE TABLE dpto_oficinas (
  codigo INTEGER NOT NULL,
  oficina INTEGER NOT NULL,
  departamento INTEGER NOT NULL,
  telefono VARCHAR( 11 ),
  PRIMARY KEY ( codigo ),
  FOREIGN KEY ( oficina ) REFERENCES oficina( oficina ),
  FOREIGN KEY ( departamento ) REFERENCES departamento( dpto )
);

CREATE TABLE categoria (
  categoria INTEGER NOT NULL,
  titulo VARCHAR( 20 ),
  salario INTEGER NOT NULL,
  trienio INTEGER NOT NULL,
  PRIMARY KEY ( categoria )
);

CREATE TABLE empleado (
  numero INTEGER NOT NULL,
  nombre VARCHAR( 50 ) NOT NULL,
  edad INTEGER NOT NULL,
  departamento INTEGER NOT NULL,
  categoria INTEGER NOT NULL,
  contrato DATE,
  PRIMARY KEY ( numero ),
  FOREIGN KEY ( departamento ) REFERENCES dpto_oficinas ( codigo ),
  FOREIGN KEY ( categoria ) REFERENCES categoria ( categoria )
);


            