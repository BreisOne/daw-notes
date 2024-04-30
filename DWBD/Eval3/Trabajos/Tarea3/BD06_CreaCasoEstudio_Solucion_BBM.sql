#	MySQL
#---------------------------------------------------------------------------------------
#	CREACIÓN DE LA BASE DE DATOS Empresa
#---------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS	EmpresaOracle;
CREATE DATABASE			EmpresaOracle;
USE						EmpresaOracle;
#------------------------------------------------------------------------------------------------------
#  BORRAMOS LAS TABLAS
#------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS oficinas;    DROP TABLE IF EXISTS oficinasCopia;
DROP TABLE IF EXISTS familias;    DROP TABLE IF EXISTS familiasCopia;
DROP TABLE IF EXISTS agentes;     DROP TABLE IF EXISTS agentesCopia;

#------------------------------------------------------------------------------------------------------
#  CREAMOS LAS TABLAS
#------------------------------------------------------------------------------------------------------
create table oficinas (
     identificador     	int(6) not null primary key,
     nombre          	varchar(40) not null unique,
     domicilio     		varchar(40),
     localidad     		varchar(20),
     codigo_postal      varchar(5)
);

create table familias (
     identificador     	int(6) not null primary key,
     nombre          	varchar(40) not null unique,
     familia          	int(6) references familias,
     oficina          	int(6) references oficinas
);

create table agentes (
     identificador     	int(6) not null primary key,
     nombre          	varchar(60) not null,
     usuario          	varchar(20) not null unique,
     clave          	varchar(20) not null,
     habilidad     		int(1) not null,
     categoria     		int(1) not null,
     familia          	int(6) references familias,
     oficina          	int(6) references oficinas
);
#------------------------------------------------------------------------------------------------------
#  CREAMOS LAS TABLAS COPIA
#------------------------------------------------------------------------------------------------------
CREATE TABLE oficinasCopia AS SELECT * FROM oficinas;
CREATE TABLE familiasCopia AS SELECT * FROM familias;
CREATE TABLE agentesCopia  AS SELECT * FROM agentes;
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  GUIONES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# Secuencia de instrucciones que se ejecutarán de forma ordenada


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  PROCEDIMIENTOS
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS agregarOficina //
	CREATE PROCEDURE agregarOficina ( 
     id      INT,
     Nom     varchar(40),
     Dom     varchar(40),
     Loc     varchar(20),
     CP      varchar(5)	) 
	BEGIN
        INSERT INTO oficinas (identificador, nombre, domicilio, localidad, codigo_postal) 
            VALUES ( id, Nom, Dom, Loc, CP );
	END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS agregarOficinas //
	CREATE PROCEDURE agregarOficinas()
		BEGIN
			CALL agregarOficina( 1, 'Madrid', 'Gran vía, 37', 'Madrid', '28000' );
			CALL agregarOficina( 2, 'Granada', 'Camino Ronda, 50', 'Granada', '36000' );
			CALL agregarOficina( 3, 'Jaén', 'Gran Eje, 80', 'Jaén', '27000' );
		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS agregarFamilia //
CREATE PROCEDURE agregarFamilia (
     id     INT,
     Nom    varchar(40),
     Fam    INT,
     Ofi    INT )
BEGIN
	INSERT INTO familias VALUES ( id, Nom, Fam, Ofi );
END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS agregarFamilias //
CREATE PROCEDURE agregarFamilias()
    BEGIN
        call agregarFamilia( 11, 'Madrid-1', NULL, 1 );
        call agregarFamilia( 111, 'Madrid-1.1', 11, NULL );
        call agregarFamilia( 112, 'Madrid-1.2', 11, NULL );
        call agregarFamilia( 1121, 'Madrid-1.2.1', 112, NULL );
        call agregarFamilia( 1122, 'Madrid-1.2.2', 112, NULL );
        call agregarFamilia( 1123, 'Madrid-1.2.3', 112, NULL );
        call agregarFamilia( 21, 'Granada-1', NULL, 2 );
        call agregarFamilia( 211, 'Granada-1.1', 21, NULL );
        call agregarFamilia( 212, 'Granada-1.2', 21, NULL );
        call agregarFamilia( 213, 'Granada-1.3', 21, NULL );
        call agregarFamilia( 31, 'Jaén-1', NULL, 3 );
    END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS agregarAgente //
CREATE PROCEDURE agregarAgente (
     id     int,
     Nom    varchar(60),
     Usu    varchar(20),
     Cla    varchar(20),
     Hab    INT,
     Cat    INT,
     Fam    INT,
     Ofi    INT	)
BEGIN
	INSERT INTO agentes	VALUES ( id, Nom, Usu, Cla, Hab, Cat, Fam, Ofi );
END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS agregarAgentes //
CREATE PROCEDURE agregarAgentes()
    BEGIN
       call agregarAgente( 31, 'José Ramón Jiménez Reyes', 'jrjr', 'sup31', 9, 2, NULL, 3);
       call agregarAgente( 311, 'Pedro Fernández Arias', 'pfa', 'ag311', 5, 0, 31, NULL);
       call agregarAgente( 312, 'Vanesa Sánchez Rojo', 'vsr', 'ag312', 5, 0, 31, NULL);
       call agregarAgente( 313, 'Francisco Javier García Escobedo', 'fjge', 'ag313', 5, 0, 31, NULL);
       call agregarAgente( 314, 'Pilar Ramirez Pérez', 'prp', 'ag314', 5, 0, 31, NULL);
       call agregarAgente( 315, 'José Luis García Martínez', 'jlgm', 'ag315', 5, 0, 31, NULL);
       call agregarAgente( 21, 'Sebastián López Ojeda', 'slo', 'sup21', 9, 2, NULL, 2);
       call agregarAgente( 211, 'Diosdado Sánchez Hernández', 'dsh', 'ag211', 8, 1, 21, NULL);
       call agregarAgente( 2111, 'José Juan Cano Pardo', 'jjcp', 'ag2111', 5, 0, 211, NULL);
       call agregarAgente( 2112, 'Flor Moncada Añón', 'ag2112', 'fma', 5, 0, 211, NULL);
       call agregarAgente( 2113, 'Juan Manuel Alcazar Donaire', 'jmad', 'ag2113', 5, 0, 211, NULL);
       call agregarAgente( 2121, 'Manuel Jesús Rubia Mateos', 'mjrm', 'ag2121', 5, 0, 212, NULL);
       call agregarAgente( 2122, 'Esther López Delgado', 'eld', 'ag2122', 5, 0, 212, NULL);
       call agregarAgente( 2123, 'Francisco Javier Cabrerizo Membrilla', 'fjcm', 'ag2123', 5, 0, 212, NULL);
       call agregarAgente( 2124, 'Verónica Cabrerizo Menbrilla', 'vcm', 'ag2124', 5, 0, 212, NULL);
       call agregarAgente( 2125, 'María José Navascués Morales', 'mjnm', 'ag2125', 5, 0, 212, NULL);
       call agregarAgente( 2131, 'Isabel Cruz Granados', 'icg', 'ag2131', 5, 0, 213, NULL);
       call agregarAgente( 2132, 'Antonio Casado Fernández', 'acf', 'ag2132', 5, 0, 213, NULL);
       call agregarAgente( 2133, 'Gabriel Callejón García', 'gcg', 'ag2133', 5, 0, 213, NULL);
       call agregarAgente( 2134, 'Enrique Cano Balsera', 'ecb', 'ag2134', 5, 0, 213, NULL);
       call agregarAgente( 11, 'Narciso Jáimez Toro', 'njt', 'sup11', 9, 2, NULL, 1);
       call agregarAgente( 111, 'Jesús Baños Sancho', 'jbs', 'ag111', 8, 1, 11, NULL);
	   call agregarAgente( 1111, 'Salvador Romero Villegas', 'srv', 'ag1111', 7, 1, 111, NULL);
       call agregarAgente( 1112, 'José Javier Bermúdez Hernández', 'jjbh', 'ag1112', 7, 1, 111, NULL);
       call agregarAgente( 1113, 'Alfonso Bonillo Sierra', 'abs', 'ag1113', 7, 1, 111, NULL);
       call agregarAgente( 1121, 'Silvia Thomas Barrós', 'stb', 'ag1121', 7, 1, 112, NULL);
       call agregarAgente( 11211, 'Ernesto Osoro Gorrotxategi', 'eog', 'ag11211', 5, 0, 1121, NULL);
       call agregarAgente( 11212, 'Guillermo Campos Guillén', 'gcag', 'ag11212', 5, 0, 1121, NULL);
       call agregarAgente( 11213, 'Antonio Fernández Ruíz', 'afr', 'ag11213', 5, 0, 1121, NULL);
       call agregarAgente( 11214, 'María Luisa López Caballero', 'mllc', 'ag11214', 5, 0, 1121, NULL);
       call agregarAgente( 11221, 'Virginia Morenas Rubio', 'vmr', 'ag11221', 5, 0, 1121, NULL);
       call agregarAgente( 11222, 'Rosario Castro García', 'rcg', 'ag11222', 5, 0, 1122, NULL);
       call agregarAgente( 11223, 'Antonio Álvarez Palomeque', 'aap', 'ag11223', 5, 0, 1122, NULL);
       call agregarAgente( 11224, 'David Martínez Martínez', 'dmm', 'ag11224', 5, 0, 1122, NULL);
       call agregarAgente( 11225, 'Juan Corral González', 'jcg', 'ag11225', 5, 0, 1122, NULL);
       call agregarAgente( 11226, 'Eduardo Alfada Pereira', 'eap', 'ag11226', 5, 0, 1122, NULL);
       call agregarAgente( 11231, 'Cayetano García Herrera', 'cgh', 'ag11231', 5, 0, 1123, NULL);
       call agregarAgente( 11232, 'José Antonio Sieres Vega', 'jasv', 'ag11232', 5, 0, 1123, NULL);
       call agregarAgente( 11233, 'Juan Manuel Guzmán García', 'jmgg', 'ag11233', 5, 0, 1123, NULL);
    END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS agregarDatos //
CREATE PROCEDURE agregarDatos()
    BEGIN
        CALL agregarOficinas();
        CALL agregarFamilias();
        CALL agregarAgentes();
    END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  FUNCIONES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP FUNCTION IF EXISTS contarMiembrosFamilia //
CREATE FUNCTION contarMiembrosFamilia( familiaContar varchar(40) ) RETURNS INT
    BEGIN
		DECLARE numMiembros int;
    	
        SELECT COUNT(*) INTO numMiembros FROM agentes WHERE familia = familiaContar;

    	RETURN numMiembros;
    END; //
DELIMITER ;
# --
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP FUNCTION IF EXISTS obtenerNombreFamilia //
CREATE FUNCTION obtenerNombreFamilia( idFamilia int ) RETURNS varchar(40)
BEGIN
    DECLARE nombreFamilia varchar(40);
    
    SELECT nombre INTO nombreFamilia FROM familias WHERE identificador = idFamilia;
    	
	IF nombreFamilia IS NULL THEN
        RETURN 'Identificador no válido'; -- Mensaje de identificador no válido
    ELSE
        RETURN nombreFamilia;
    END IF;
    
END; //
DELIMITER ;

#--
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  DISPARADORES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP TRIGGER IF EXISTS TRAS_AGREGAR_OFICINA //
CREATE TRIGGER TRAS_AGREGAR_OFICINA
	AFTER INSERT ON oficinas	FOR EACH ROW
BEGIN
    INSERT INTO oficinasCopia VALUES (NEW.identificador, NEW.nombre, NEW.domicilio, NEW.localidad, NEW.codigo_postal);
END; //
DELIMITER ; 
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP TRIGGER IF EXISTS TRAS_AGREGAR_FAMILIA //
CREATE TRIGGER TRAS_AGREGAR_FAMILIA
	AFTER INSERT ON familias	FOR EACH ROW
BEGIN
    INSERT INTO familiasCopia VALUES (NEW.identificador, NEW.nombre, NEW.familia, NEW.oficina);
END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP TRIGGER IF EXISTS TRAS_AGREGAR_AGENTE //
CREATE TRIGGER TRAS_AGREGAR_AGENTE
	AFTER INSERT ON agentes		FOR EACH ROW
BEGIN
    INSERT INTO agentesCopia VALUES (NEW.identificador, NEW.nombre, NEW.usuario, NEW.clave, NEW.habilidad, NEW.categoria, NEW.familia, NEW.oficina);
END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP TRIGGER IF EXISTS TRAS_MODIFICAR_OFICINA //
CREATE TRIGGER TRAS_MODIFICAR_OFICINA
	AFTER UPDATE ON oficinas	FOR EACH ROW
BEGIN
    UPDATE oficinasCopia
    SET nombre = NEW.nombre, domicilio = NEW.domicilio, localidad = NEW.localidad, codigo_postal = NEW.codigo_postal
    	WHERE identificador = OLD.identificador;
END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP TRIGGER IF EXISTS TRAS_MODIFICAR_FAMILIA //
CREATE TRIGGER TRAS_MODIFICAR_FAMILIA
	AFTER UPDATE ON familias	FOR EACH ROW
BEGIN
    UPDATE familiasCopia
    SET nombre = NEW.nombre, familia = NEW.familia, oficina = NEW.oficina
    	WHERE identificador = OLD.identificador;
END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP TRIGGER IF EXISTS TRAS_MODIFICAR_AGENTE //
CREATE TRIGGER TRAS_MODIFICAR_AGENTE
	AFTER UPDATE ON agentes	  FOR EACH ROW
BEGIN
    UPDATE agentesCopia
    SET nombre = NEW.nombre, usuario = NEW.usuario, clave = NEW.clave, habilidad = NEW.habilidad, categoria = NEW.categoria, familia = NEW.familia, oficina = NEW.oficina
    	WHERE identificador = OLD.identificador;
END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  CURSORES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS mostrarOficinas //
CREATE PROCEDURE mostrarOficinas()
BEGIN
    DECLARE done INT DEFAULT FALSE;
	DECLARE var_id INT;
    DECLARE var_nom VARCHAR(40);
    DECLARE var_dom VARCHAR(40);
    DECLARE var_loc VARCHAR(20);
    DECLARE var_cp VARCHAR(5);
    
     -- Cursor para seleccionar los datos de oficinas
    DECLARE cursor_oficinas CURSOR FOR
        SELECT * FROM oficinas;
     
     -- Manejador para no encontrar más filas
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
   
   -- Creamos una tabla temporal para almacenar los datos
	DROP TEMPORARY TABLE IF EXISTS temp_oficinas;
    CREATE TEMPORARY TABLE temp_oficinas (
        datosOficinas VARCHAR(255)
    );
    
    OPEN cursor_oficinas;
    read_loop: LOOP
			   FETCH cursor_oficinas INTO var_id, var_nom, var_dom, var_loc, var_cp;
               IF done THEN
					LEAVE read_loop;
			   END IF;
        
        -- Mostrar los datos de la fila actual
        INSERT INTO temp_oficinas VALUES (CONCAT('Identificador: ', var_id, ', Nombre: ', var_nom, ', Domicilio: ', var_dom, ', Localidad: ', var_loc, ', Código Postal: ', var_cp));
		END LOOP read_loop;
    CLOSE cursor_oficinas;
   SELECT datosOficinas AS "Datos de las oficinas" FROM temp_oficinas;

END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS mostrarFamilias //
CREATE PROCEDURE mostrarFamilias()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE var_id INT;
    DECLARE var_nom VARCHAR(40);
    DECLARE var_fam INT;
    DECLARE var_ofi INT;
    
	 -- Cursor para seleccionar los datos de oficinas
    DECLARE cursor_familias CURSOR FOR
        SELECT * FROM familias;
        
	 -- Manejador para no encontrar más filas
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
	-- Creamos una tabla temporal para almacenar los datos
    DROP TEMPORARY TABLE IF EXISTS temp_familias;
    CREATE TEMPORARY TABLE temp_familias (
        datosFamilias VARCHAR(255)
    );
    
    OPEN cursor_familias;
    
    read_loop: LOOP
			   FETCH cursor_familias INTO var_id, var_nom, var_fam, var_ofi;
			   IF done THEN
					LEAVE read_loop;
			   END IF;
        -- Mostrar los datos de la fila actual
        INSERT INTO temp_familias VALUES(CONCAT('Identificador: ', var_id, ', Nombre: ', var_nom, ', Familia: ', IFNULL(var_fam, 'null'), ', Oficina: ', IFNULL(var_ofi, 'null')));
		END LOOP read_loop;
				
    CLOSE cursor_familias;
    SELECT datosFamilias AS "Datos de las familias"  FROM temp_familias;

END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS mostrarAgentes //
CREATE PROCEDURE mostrarAgentes()        
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE var_id INT;
    DECLARE var_nom VARCHAR(60);
    DECLARE var_usu VARCHAR(20);
    DECLARE var_cla VARCHAR(20);
    DECLARE var_hab INT;
    DECLARE var_cat INT;
    DECLARE var_fam INT;
    DECLARE var_ofi INT;
  
 	 -- Cursor para seleccionar los datos de los agentes
	DECLARE cursor_agentes CURSOR FOR SELECT * FROM agentes;
    
	-- Manejador para no encontrar más filas
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Creamos una tabla temporal para almacenar los datos
	DROP TEMPORARY TABLE IF EXISTS temp_agentes;
    CREATE TEMPORARY TABLE temp_agentes (
        datosAgentes VARCHAR(255)
    );
	
    OPEN cursor_agentes;
    read_loop: LOOP
        FETCH cursor_agentes INTO var_id, var_nom, var_usu, var_cla, var_hab, var_cat, var_fam, var_ofi;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Mostrar los datos de la fila actual
        INSERT INTO temp_agentes VALUES( CONCAT('Identificador: ', var_id, ', Nombre: ', var_nom, ', Usuario: ', var_usu, ', Clave: ', var_cla, ', Habilidad: ', var_hab, ', Categoría: ', var_cat, ', Familia: ', IFNULL(var_fam, 'null'), ', Oficina: ', IFNULL(var_ofi,'null')));
        END LOOP read_loop;
    CLOSE cursor_agentes;
    SELECT datosAgentes AS "Datos de los agentes" FROM temp_agentes;
    
END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS mostrarDatos //
CREATE PROCEDURE mostrarDatos()
    BEGIN
        call mostrarOficinas();
        call mostrarFamilias();
        call mostrarAgentes();
    END; //
DELIMITER ;
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------

CALL agregarDatos();
CALL mostrarDatos();
select obtenerNombreFamilia( 11 );
CALL mostrarOficinas();
