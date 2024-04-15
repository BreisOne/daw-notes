USE DatosConcello;
SELECT * FROM DatosConcello;

#-----------------------------------------------------------------------
#   1. Crea una función que devuelva los Concellos de una Comarca.
#-----------------------------------------------------------------------
DELIMITER //
DROP FUNCTION IF EXISTS obtenerConcellosXComarca //
CREATE FUNCTION obtenerConcellosXComarca(comarcaBuscar VARCHAR(40))
	RETURNS TEXT
	DETERMINISTIC
		BEGIN
			DECLARE concellosXcomarca TEXT DEFAULT '';
            SELECT GROUP_CONCAT(Nombre SEPARATOR ',') INTO concellosXcomarca
            FROM DatosConcello WHERE comarca = comarcaBuscar;
			IF (concellosXcomarca IS NULL) THEN
				SET concellosXcomarca = CONCAT('No se encontraron concellos para la comarca de ', comarcaBuscar);
            END IF;
            RETURN concellosXcomarca;
		END //
DELIMITER ;

SELECT obtenerConcellosXComarca( 'Vigo' ) AS 'Concellos que hay en la Comarca';
#-----------------------------------------------------------------------
#   2. Crea una función que devuelva los Concellos de una Provincia.
#-----------------------------------------------------------------------

DELIMITER //
DROP FUNCTION IF EXISTS obtenerConcellosXProvincia //
CREATE FUNCTION obtenerConcellosXProvincia(provinciaBuscar VARCHAR(40))
	RETURNS TEXT
	DETERMINISTIC
		BEGIN
			DECLARE concellosXProvincia TEXT DEFAULT '';
            SELECT GROUP_CONCAT(Nombre SEPARATOR ',') INTO concellosXprovincia
            FROM DatosConcello WHERE Provincia = provinciaBuscar;
			IF (concellosXprovincia IS NULL) THEN
				SET concellosXprovincia = CONCAT('No se encontraron concellos para la provincia de ', provinciaBuscar);
            END IF;
            RETURN concellosXProvincia;
		END //
DELIMITER ;

SELECT ObtenerConcellosXProvincia( 'A Coruña' ) AS 'Concellos que hay en la Provincia';

#-----------------------------------------------------------------------
#   3. Crea una función que devuelva las Comarcas de una Provincia.
#-----------------------------------------------------------------------
DELIMITER //
DROP FUNCTION IF EXISTS obtenerComarcasXProvincia //
CREATE FUNCTION obtenerComarcasXProvincia( provinciaBuscar VARCHAR(40)) RETURNS TEXT
	DETERMINISTIC
    BEGIN
		DECLARE comarcasXprovincia TEXT DEFAULT '';
        SELECT GROUP_CONCAT(Nombre SEPARATOR ',') INTO comarcasXprovincia
			FROM datosconcello WHERE Provincia = provinciaBuscar;
        
        IF(comarcasXprovincia IS NULL) THEN
			SET comarcasXprovincia = CONCAT('No se encontraron concellos para la provincia de ', provinciaBuscar);
		END IF;
        RETURN comarcasXprovincia;
    END //
DELIMITER ;

SELECT obtenerComarcasXProvincia( 'Pontevedra' ) AS 'Comarcas que hay en la Provincia';
SELECT obtenerComarcasXProvincia( 'Vigo' ) AS 'Comarcas que hay en la Provincia';

#-----------------------------------------------------------------------
#   4. Crea una función que devuelva los Concellos con mayor y menor superficie.
#-----------------------------------------------------------------------

DELIMITER //
	DROP PROCEDURE IF EXISTS obtenerConcellosMayorMenorSuperficie //
    CREATE PROCEDURE obtenerConcellosMayorMenorSuperficie()
		BEGIN
        SELECT CONCAT('Concellos con mayor superficie(', MAX(superficie),'):',
				GROUP_CONCAT(Nombre SEPARATOR ', ')) AS 'Concellos con mayor y menos superficie'
                FROM datosConcello
                WHERE Superficie = (SELECT MAX(Superficie) FROM datosconcello)
		UNION
		SELECT CONCAT('Concellos con menor superficie(', MIN(superficie),'):',
				GROUP_CONCAT(Nombre SEPARATOR ', ')) AS 'Concellos con mayor y menos superficie'
                FROM datosConcello
                WHERE Superficie = (SELECT MIN(Superficie) FROM datosconcello);
        END; //
DELIMITER ;

CALL obtenerConcellosMayorMenorSuperficie();
#-----------------------------------------------------------------------
#   5. Crea una función que devuelva las Comarcas con mayor y menor superficie.
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#   6. Crea una función que devuelva las Provincias con mayor y menor superficie.
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#   7. Crea una función que devuelva los Concellos con mayor y menor población. 
#-----------------------------------------------------------------------



#-----------------------------------------------------------------------
#   8. Crea una función que devuelva las Comarcas con mayor y menor población.
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#   9. Crea una función que devuelva las Provincias con mayor y menor población.
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
#    . 
#-----------------------------------------------------------------------

