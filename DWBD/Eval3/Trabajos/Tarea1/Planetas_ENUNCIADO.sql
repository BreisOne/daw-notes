#------------------------------------------------------------------------------------------
#	CREAMOS LA BASE DE DATOS PLANETAS
#------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------
#	CREAMOS LA TABLA PLANETA
#------------------------------------------------------------------------------------------
#		id			Identificador
#		nombre		Nombre del Planeta
#		distancia	Distancia al Sol en metros
#		masa		Masa del cuerpo en Kg
#		radio		Radio del cuerpo en m
#------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------
#	AGREGAMOS LOS DATOS DEL Sol y de los ocho Planetas
#------------------------------------------------------------------------------------------


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
#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
#	Creamos una vista que muestre el nombre del Planeta, Distancia al sol (m), Masa (Kg), Radio (m), Gravedad ecuatorial, Velocidad de escape (m/s), Velocidad Orbital
#		CREATE VIEW DatosPlanetas AS SELECT 
#------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------

set @masa = (SELECT masa FROM Planeta WHERE nombre = 'Tierra');
set @radio = (SELECT radio FROM Planeta WHERE nombre = 'Tierra' );
set @distancia = (SELECT distancia FROM Planeta WHERE nombre = 'Tierra' );
SELECT calcularGravedad( @masa, @radio );
SELECT calcularVelocidadEscape( @masa, @radio );
SELECT * FROM DatosPlanetas;