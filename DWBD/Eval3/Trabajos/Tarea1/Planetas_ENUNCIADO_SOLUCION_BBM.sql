#------------------------------------------------------------------------------------------
#	CREAMOS LA BASE DE DATOS PLANETAS
#------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS planetas;
CREATE DATABASE planetas;
USE planetas;
#------------------------------------------------------------------------------------------
#	CREAMOS LA TABLA PLANETA
#------------------------------------------------------------------------------------------
#		id			Identificador
#		nombre		Nombre del Planeta
#		distancia	Distancia al Sol en metros
#		masa		Masa del cuerpo en Kg
#		radio		Radio del cuerpo en m
#------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS planeta;
CREATE TABLE planeta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    distancia FLOAT NOT NULL,
    masa FLOAT NOT NULL,
    radio FLOAT NOT NULL
);
#------------------------------------------------------------------------------------------
#	AGREGAMOS LOS DATOS DEL Sol y de los ocho Planetas
#------------------------------------------------------------------------------------------
INSERT INTO planeta (nombre, distancia, masa, radio) VALUES
('Sol', 0, 1.9891e30, 695500000), -- Datos del Sol
('Mercurio', 57900000000, 3.3e23, 2439700), -- Datos de Mercurio
('Venus', 108200000000, 4.87e24, 6051800), -- Datos de Venus
('Tierra', 149600000000, 5.97e24, 6371000), -- Datos de la Tierra
('Marte', 227900000000, 6.42e23, 3389500), -- Datos de Marte
('Júpiter', 778600000000, 1.898e27, 69911000), -- Datos de Júpiter
('Saturno', 1433500000000, 5.68e26, 58232000), -- Datos de Saturno
('Urano', 2872500000000, 8.68e25, 25362000), -- Datos de Urano
('Neptuno', 4495100000000, 1.02e26, 24622000); -- Datos de Neptuno

#------------------------------------------------------------------------------------------
#	Creamos un procedimiento o función para realizar el cálculo de la gravedad a nivel de 
#	  superficie del cuerpo
#		CREATE FUNCTION calcularGravedad
#------------------------------------------------------------------------------------------
#
#
#				G  *  Masa
#	g = -----------------------
#				r ^ 2 
#
#
DELIMITER //

CREATE FUNCTION calcularGravedad(masa FLOAT, radio FLOAT)
RETURNS FLOAT
BEGIN
    DECLARE g FLOAT;
    DECLARE constG FLOAT;
    
    SET constG = 6.67430e-11;
    
    SET g = (constG * masa) / (POW(radio, 2));
    
    RETURN g;
END//

DELIMITER ;
#
#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
#	Creamos un procedimiento o función para obtener la velocidad de escape de la superficie
#	  del cuerpo
#		CREATE FUNCTION calcularVelocidadEscape
#------------------------------------------------------------------------------------------
#
#				______________________
#			   |	2  *  G  *  Masa
#  Vescape = \ |----------------------
#			  \|		radio
#
#
DELIMITER //

CREATE FUNCTION calcularVelocidadEscape(masa FLOAT, radio FLOAT)
RETURNS FLOAT
BEGIN
    DECLARE Vescape FLOAT;
    DECLARE G FLOAT;
    
    SET G = 6.67430e-11;
    
    SET Vescape = SQRT((2 * G * masa) / radio);
    
    RETURN Vescape;
END//

DELIMITER ;

#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
#	Creamos un procedimiento o función para obtener la velocidad orbital del cuerpo
#		CREATE FUNCTION calcularVelocidadOrbital
#------------------------------------------------------------------------------------------
# 	Calcular la velocidad de escape
#----------------------------------------
#
#				 ______________________
#			    |	G  *  Masa
#  Vorbital = \ |----------------------
#			   \|	  radio
#
DELIMITER //

CREATE FUNCTION calcularVelocidadOrbital(masa FLOAT, radio FLOAT)
RETURNS FLOAT
BEGIN
    DECLARE Vorbital FLOAT;
    DECLARE G FLOAT;
    
    SET G = 6.67430e-11; 
    
    SET Vorbital = SQRT((G * masa) / radio);
    
    RETURN Vorbital;
END//

DELIMITER ;
#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
#	Creamos una vista que muestre el nombre del Planeta, Distancia al sol (m), Masa (Kg), Radio (m), Gravedad ecuatorial, Velocidad de escape (m/s), Velocidad Orbital
#		CREATE VIEW DatosPlanetas AS SELECT 
#------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS DatosPlanetas;
CREATE VIEW DatosPlanetas as
SELECT nombre as Planeta,
	   distancia as "Distancia al sol (m)",
       masa as "Masa (Kg)",
       radio as "Radio (m)",
	   calcularGravedad(masa, radio) AS 'Gravedad ecuatorial',
       calcularVelocidadEscape(masa, radio) AS 'Velocidad de escape (m/s)',
       calcularVelocidadOrbital(masa, radio) AS 'Velocidad Orbital'
FROM planeta;

#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
set @masa = (SELECT masa FROM Planeta WHERE nombre = 'Tierra');
set @radio = (SELECT radio FROM Planeta WHERE nombre = 'Tierra' );
set @distancia = (SELECT distancia FROM Planeta WHERE nombre = 'Tierra' );
SELECT calcularGravedad( @masa, @radio );
SELECT calcularVelocidadEscape( @masa, @radio );
SELECT * FROM DatosPlanetas;