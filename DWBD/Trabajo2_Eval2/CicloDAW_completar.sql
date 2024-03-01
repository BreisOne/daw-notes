#*******************************************************************************************
#	1.	CREACIÓN Y USO DE LA BASE DE DATOS 'CicloDAW'
#*******************************************************************************************
DROP DATABASE IF EXISTS CicloDAW;
CREATE DATABASE CicloDAW;
USE CicloDAW;

#*******************************************************************************************
#	2.	CREACIÓN DE LA TABLA DE LA BASE DE DATOS
#*******************************************************************************************
#		TABLA Modulo
#*******************************************************************************************
#		ID		int				auto_increment
#		Siglas	varchar(5)
#		Codigo	varchar(6)
#		Nombre	text
#		Horas	int
#
#		Llave primaria 					->	ID empieza desde el valor 100
#		Valor único    					->	Siglas, Codigo
#		Comprobación de Valor no nulo	->	Siglas, Codigo, Nombre, Horas
#		Comprobación de Valor no vacío	->	Siglas, Codigo, Nombre
#		Comprobación de Valor positivo	->	Horas
#		Índice							->	Horas
#*******************************************************************************************
CREATE TABLE Modulo (
  ID int AUTO_INCREMENT,
  Siglas varchar(5) UNIQUE NOT NULL CHECK (CHAR_LENGTH(Siglas) > 0),
  Codigo varchar(6) UNIQUE NOT NULL CHECK (CHAR_LENGTH(Codigo) > 0),
  Nombre text NOT NULL CHECK (CHAR_LENGTH(Nombre) > 0),
  Horas int NOT NULL CHECK (Horas > 0),
  PRIMARY KEY (ID)
);

-- Definición del valor inicial para ID
ALTER TABLE Modulo AUTO_INCREMENT = 100;

-- Creación de índice en la columna Horas
CREATE INDEX idx_horas ON Modulo (Horas);

#*******************************************************************************************
#	3.	AÑADIMOS LOS DATOS SIGLAS, CÓDIGO, NOMBRE Y HORAS DE CADA MÓDULO DENTRO DE UNA MISMA SENTENCIA
#*******************************************************************************************
-- Agregar datos a la tabla Modulo
INSERT INTO Modulo (Siglas, Codigo, Nombre, Horas) VALUES
    ('LMARC', 'MP0373', 'Linguaxes de marcas e sistemas de xestión empresarial', 133),
    ('SI', 'MP0483', 'Sistemas Informáticos', 186),
    ('BD', 'MP0484', 'Bases de Datos', 187),
    ('Prog', 'MP0485', 'Programación', 240),
	('CD', 'MP0487', 'Contornos de Desenvolvemento', 107),
	('DWEBC', 'MP0612', 'Desemvolvemento Web en Contorno Cliente', 157),
	('DWEBS', 'MP0613', 'Desemvolvemento Web en Contorno Servidor', 175),
	('DAW', 'MP0614', 'Despregamento de Aplicacións Web', 88),
	('DIM', 'MP0615', 'Deseño de Interfaces Web', 157),
	('Prox', 'MP0616', 'Proxecto de desenvolvemento de aplicacións web', 26),
	('FOL', 'MP0617', 'Formación e orientación laboral', 107),
	('EIE', 'MP0618', 'Empresa e iniciativa emprendedora', 53),
    ('FCT', 'MP0619', 'Formación en centros de traballo', 384);
        
#*******************************************************************************************
#	4.	CREAMOS 10 ALUMNOS Y 5 PROFESORES CON FORMATO Alumn_01, Alumn_02, ...Y Prof_1, Prof_2, ...
#*******************************************************************************************
DROP USER IF EXISTS  Alumn_01, Alumn_02, Alumn_03, Alumn_04, Alumn_05, Alumn_06, Alumn_07, Alumn_08, Alumn_09, Alumn_10;
CREATE USER Alumn_01 IDENTIFIED BY 'abc', Alumn_02 IDENTIFIED BY 'abc', Alumn_03 IDENTIFIED BY 'abc', Alumn_04 IDENTIFIED BY 'abc', Alumn_05 IDENTIFIED BY 'abc', 
Alumn_06 IDENTIFIED BY 'abc', Alumn_07 IDENTIFIED BY 'abc', Alumn_08 IDENTIFIED BY 'abc', Alumn_09 IDENTIFIED BY 'abc', Alumn_10 IDENTIFIED BY 'abc';

DROP USER IF EXISTS  Prof_01, Prof_02, Prof_03, Prof_04, Prof_05, Prof_06, Prof_07, Prof_08, Prof_09, Prof_10;
CREATE USER Prof_01 IDENTIFIED BY 'abc', Prof_02 IDENTIFIED BY 'abc', Prof_03 IDENTIFIED BY 'abc', Prof_04 IDENTIFIED BY 'abc', Prof_05 IDENTIFIED BY 'abc', 
Prof_06 IDENTIFIED BY 'abc', Prof_07 IDENTIFIED BY 'abc', Prof_08 IDENTIFIED BY 'abc', Prof_09 IDENTIFIED BY 'abc', Prof_10 IDENTIFIED BY 'abc';
    
#*******************************************************************************************
#	5.	CREAMOS DOS GRUPOS DE USUARIOS:	ALUMNADO, PROFESORADO
#		PROFESORADO -> ACCESO TOTAL
#		ALUMNADO	-> SÓLO CONSULTA
#*******************************************************************************************
DROP ROLE IF EXISTS PROFESORADO;
CREATE ROLE PROFESORADO;

DROP ROLE IF EXISTS ALUMNADO;
CREATE ROLE ALUMNADO;

    
#*******************************************************************************************
#	6.	DAMOS LOS RESPECTIVOS PRIVILEGIOS A LOS GRUPOS PROFESORADO Y ALUMNADO
#		PROFESORADO		Posibilidad de privilegios de acceso (role_admin) y creación de  usuarios (create user)
#		ALUMNADO		Sólo visibilidad (select)
#*******************************************************************************************
GRANT CREATE USER ON *.* TO PROFESORADO;
GRANT ALL ON Modulo TO PROFESORADO;
#GRANT ALL PRIVILEGES ON *.* TO PROFESORADO WITH GRANT OPTION;

GRANT SELECT ON Modulo TO ALUMNADO;
    
#*******************************************************************************************
#	7.	ASIGNAMOS A CADA GRUPO SUS USUARIOS CREADOS
#*******************************************************************************************
GRANT PROFESORADO TO Prof_01, Prof_02, Prof_03, Prof_04, Prof_05, Prof_06, Prof_07, Prof_08, Prof_09, Prof_10 WITH ADMIN OPTION;
GRANT ALUMNADO TO Alumn_01, Alumn_02, Alumn_03, Alumn_04, Alumn_05, Alumn_06, Alumn_07, Alumn_08, Alumn_09, Alumn_10;

#*******************************************************************************************
#	8.	ASIGNAMOS PRIVILEGIOS POR DEFECTO
#*******************************************************************************************  
SET DEFAULT ROLE PROFESORADO FOR Prof_01;     SET DEFAULT ROLE ALUMNADO FOR Alumn_01;
SET DEFAULT ROLE PROFESORADO FOR Prof_02;	  SET DEFAULT ROLE ALUMNADO FOR Alumn_02;
SET DEFAULT ROLE PROFESORADO FOR Prof_03;     SET DEFAULT ROLE ALUMNADO FOR Alumn_03;
SET DEFAULT ROLE PROFESORADO FOR Prof_04;     SET DEFAULT ROLE ALUMNADO FOR Alumn_04;
SET DEFAULT ROLE PROFESORADO FOR Prof_05;	  SET DEFAULT ROLE ALUMNADO FOR Alumn_05;
SET DEFAULT ROLE PROFESORADO FOR Prof_06;	  SET DEFAULT ROLE ALUMNADO FOR Alumn_06;	
SET DEFAULT ROLE PROFESORADO FOR Prof_07;	  SET DEFAULT ROLE ALUMNADO FOR Alumn_07;	
SET DEFAULT ROLE PROFESORADO FOR Prof_08;	  SET DEFAULT ROLE ALUMNADO FOR Alumn_08;	
SET DEFAULT ROLE PROFESORADO FOR Prof_09;	  SET DEFAULT ROLE ALUMNADO FOR Alumn_09;	
SET DEFAULT ROLE PROFESORADO FOR Prof_10;	  SET DEFAULT ROLE ALUMNADO FOR Alumn_10;	

#*******************************************************************************************
#	9.	REFRESCAMOS LOS CAMBIOS YA REALIZADOS (AUNQUE NO ES NECESARIO)
#*******************************************************************************************
FLUSH PRIVILEGES;

