#	ORACLE
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
     identificador     int(6) not null primary key,
     nombre          varchar(40) not null unique,
     domicilio     varchar(40),
     localidad     varchar(20),
     codigo_postal      varchar(5)
);

create table familias (
     identificador     int(6) not null primary key,
     nombre          varchar(40) not null unique,
     familia          int(6) references familias,
     oficina          int(6) references oficinas
);

create table agentes (
     identificador     int(6) not null primary key,
     nombre          varchar(60) not null,
     usuario          varchar(20) not null unique,
     clave          varchar(20) not null,
     habilidad     int(1) not null,
     categoria     int(1) not null,
     familia          int(6) references familias,
     oficina          int(6) references oficinas
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
     id      int,
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
CREATE OR REPLACE PROCEDURE agregarFamilia (
     id     int,
     Nom    varchar,
     Fam    int,
     Ofi    int	) IS
BEGIN
	INSERT INTO familias VALUES ( id, Nom, Fam, Ofi );
	COMMIT;  -- Confirmar la transacción
END;
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarFamilias IS
    BEGIN
        agregarFamilia( 11, 'Madrid-1', NULL, 1 );
        agregarFamilia( 111, 'Madrid-1.1', 11, NULL );
        agregarFamilia( 112, 'Madrid-1.2', 11, NULL );
        agregarFamilia( 1121, 'Madrid-1.2.1', 112, NULL );
        agregarFamilia( 1122, 'Madrid-1.2.2', 112, NULL );
        agregarFamilia( 1123, 'Madrid-1.2.3', 112, NULL );
        agregarFamilia( 21, 'Granada-1', NULL, 2 );
        agregarFamilia( 211, 'Granada-1.1', 21, NULL );
        agregarFamilia( 212, 'Granada-1.2', 21, NULL );
        agregarFamilia( 213, 'Granada-1.3', 21, NULL );
        agregarFamilia( 31, 'Jaén-1', NULL, 3 );
    END;
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarAgente (
     id     int,
     Nom    varchar,
     Usu    varchar,
     Cla    varchar,
     Hab    int,
     Cat    int,
     Fam    int,
     Ofi    int	) IS
BEGIN
	INSERT INTO agentes	VALUES ( id, Nom, Usu, Cla, Hab, Cat, Fam, Ofi );
	COMMIT;  -- Confirmar la transacción
END;
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarAgentes IS
    BEGIN
        agregarAgente( 31, 'José Ramón Jiménez Reyes', 'jrjr', 'sup31', 9, 2, NULL, 3);
        agregarAgente( 311, 'Pedro Fernández Arias', 'pfa', 'ag311', 5, 0, 31, NULL);
        agregarAgente( 312, 'Vanesa Sánchez Rojo', 'vsr', 'ag312', 5, 0, 31, NULL);
        agregarAgente( 313, 'Francisco Javier García Escobedo', 'fjge', 'ag313', 5, 0, 31, NULL);
        agregarAgente( 314, 'Pilar Ramirez Pérez', 'prp', 'ag314', 5, 0, 31, NULL);
        agregarAgente( 315, 'José Luis García Martínez', 'jlgm', 'ag315', 5, 0, 31, NULL);
        agregarAgente( 21, 'Sebastián López Ojeda', 'slo', 'sup21', 9, 2, NULL, 2);
        agregarAgente( 211, 'Diosdado Sánchez Hernández', 'dsh', 'ag211', 8, 1, 21, NULL);
        agregarAgente( 2111, 'José Juan Cano Pardo', 'jjcp', 'ag2111', 5, 0, 211, NULL);
        agregarAgente( 2112, 'Flor Moncada Añón', 'ag2112', 'fma', 5, 0, 211, NULL);
        agregarAgente( 2113, 'Juan Manuel Alcazar Donaire', 'jmad', 'ag2113', 5, 0, 211, NULL);
        agregarAgente( 2121, 'Manuel Jesús Rubia Mateos', 'mjrm', 'ag2121', 5, 0, 212, NULL);
        agregarAgente( 2122, 'Esther López Delgado', 'eld', 'ag2122', 5, 0, 212, NULL);
        agregarAgente( 2123, 'Francisco Javier Cabrerizo Membrilla', 'fjcm', 'ag2123', 5, 0, 212, NULL);
        agregarAgente( 2124, 'Verónica Cabrerizo Menbrilla', 'vcm', 'ag2124', 5, 0, 212, NULL);
        agregarAgente( 2125, 'María José Navascués Morales', 'mjnm', 'ag2125', 5, 0, 212, NULL);
        agregarAgente( 2131, 'Isabel Cruz Granados', 'icg', 'ag2131', 5, 0, 213, NULL);
        agregarAgente( 2132, 'Antonio Casado Fernández', 'acf', 'ag2132', 5, 0, 213, NULL);
        agregarAgente( 2133, 'Gabriel Callejón García', 'gcg', 'ag2133', 5, 0, 213, NULL);
        agregarAgente( 2134, 'Enrique Cano Balsera', 'ecb', 'ag2134', 5, 0, 213, NULL);
        agregarAgente( 11, 'Narciso Jáimez Toro', 'njt', 'sup11', 9, 2, NULL, 1);
        agregarAgente( 111, 'Jesús Baños Sancho', 'jbs', 'ag111', 8, 1, 11, NULL);
        agregarAgente( 1111, 'Salvador Romero Villegas', 'srv', 'ag1111', 7, 1, 111, NULL);
        agregarAgente( 1112, 'José Javier Bermúdez Hernández', 'jjbh', 'ag1112', 7, 1, 111, NULL);
        agregarAgente( 1113, 'Alfonso Bonillo Sierra', 'abs', 'ag1113', 7, 1, 111, NULL);
        agregarAgente( 1121, 'Silvia Thomas Barrós', 'stb', 'ag1121', 7, 1, 112, NULL);
        agregarAgente( 11211, 'Ernesto Osoro Gorrotxategi', 'eog', 'ag11211', 5, 0, 1121, NULL);
        agregarAgente( 11212, 'Guillermo Campos Guillén', 'gcag', 'ag11212', 5, 0, 1121, NULL);
        agregarAgente( 11213, 'Antonio Fernández Ruíz', 'afr', 'ag11213', 5, 0, 1121, NULL);
        agregarAgente( 11214, 'María Luisa López Caballero', 'mllc', 'ag11214', 5, 0, 1121, NULL);
        agregarAgente( 11221, 'Virginia Morenas Rubio', 'vmr', 'ag11221', 5, 0, 1121, NULL);
        agregarAgente( 11222, 'Rosario Castro García', 'rcg', 'ag11222', 5, 0, 1122, NULL);
        agregarAgente( 11223, 'Antonio Álvarez Palomeque', 'aap', 'ag11223', 5, 0, 1122, NULL);
        agregarAgente( 11224, 'David Martínez Martínez', 'dmm', 'ag11224', 5, 0, 1122, NULL);
        agregarAgente( 11225, 'Juan Corral González', 'jcg', 'ag11225', 5, 0, 1122, NULL);
        agregarAgente( 11226, 'Eduardo Alfada Pereira', 'eap', 'ag11226', 5, 0, 1122, NULL);
        agregarAgente( 11231, 'Cayetano García Herrera', 'cgh', 'ag11231', 5, 0, 1123, NULL);
        agregarAgente( 11232, 'José Antonio Sieres Vega', 'jasv', 'ag11232', 5, 0, 1123, NULL);
        agregarAgente( 11233, 'Juan Manuel Guzmán García', 'jmgg', 'ag11233', 5, 0, 1123, NULL);
    END;
#------------------------------------------------------------------------------------------------------
CREATE PROCEDURE agregarDatos IS
    BEGIN
        CALL agregarOficinas();
        CALL agregarFamilias();
        CALL agregarAgentes();
    END;
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  FUNCIONES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION contarMiembrosFamilia( familiaContar varchar ) RETURN int IS
    numMiembros int;
    BEGIN
    	SELECT COUNT(*) INTO numMiembros FROM agentes WHERE familia = familiaContar;

    	RETURN numMiembros;
    END;
# --
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION obtenerNombreFamilia( idFamilia int ) RETURN varchar IS
    nombreFamilia varchar( 40 );
BEGIN
    SELECT nombre INTO nombreFamilia FROM familias WHERE identificador = idFamilia;
    RETURN nombreFamilia;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Identificador no válido'; -- Mensaje de identificador no válido
END;
#--


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  DISPARADORES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_OFICINA
	AFTER INSERT ON oficinas	FOR EACH ROW
BEGIN
    INSERT INTO oficinasCopia VALUES (:NEW.identificador, :NEW.nombre, :NEW.domicilio, :NEW.localidad, :NEW.codigo_postal);
END;
/
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_FAMILIA
	AFTER INSERT ON familias	FOR EACH ROW
BEGIN
    INSERT INTO familiasCopia VALUES (:NEW.identificador, :NEW.nombre, :NEW.familia, :NEW.oficina);
END;
/
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_AGENTE
	AFTER INSERT ON agentes		FOR EACH ROW
BEGIN
    INSERT INTO agentesCopia VALUES (:NEW.identificador, :NEW.nombre, :NEW.usuario, :NEW.clave, :NEW.habilidad, :NEW.categoria, :NEW.familia, :NEW.oficina);
END;
/
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_OFICINA
	AFTER UPDATE ON oficinas	FOR EACH ROW
BEGIN
    UPDATE oficinasCopia
    SET nombre = :NEW.nombre, domicilio = :NEW.domicilio, localidad = :NEW.localidad, codigo_postal = :NEW.codigo_postal
    	WHERE identificador = :OLD.identificador;
END;
/
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_FAMILIA
	AFTER UPDATE ON familias	FOR EACH ROW
BEGIN
    UPDATE familiasCopia
    SET nombre = :NEW.nombre, familia = :NEW.familia, oficina = :NEW.oficina
    	WHERE identificador = :OLD.identificador;
END;
/
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_AGENTE
	AFTER UPDATE ON agentes		FOR EACH ROW
BEGIN
    UPDATE agentesCopia
    SET nombre = :NEW.nombre, usuario = :NEW.usuario, clave = :NEW.clave, habilidad = :NEW.habilidad, categoria = :NEW.categoria, familia = :NEW.familia, oficina = :NEW.oficina
    	WHERE identificador = :OLD.identificador;
END;
/
#------------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  CURSORES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarOficinas IS
    CURSOR cursor_oficinas IS	SELECT * FROM oficinas;
        
    var_id oficinas.identificador%TYPE;
    var_nom oficinas.nombre%TYPE;
    var_dom oficinas.domicilio%TYPE;
    var_loc oficinas.localidad%TYPE;
    var_cp oficinas.codigo_postal%TYPE;
BEGIN
    OPEN cursor_oficinas;
    LOOP
        FETCH cursor_oficinas INTO var_id, var_nom, var_dom, var_loc, var_cp;
        EXIT WHEN cursor_oficinas%NOTFOUND;
        
        -- Mostrar los datos de la fila actual
        DBMS_OUTPUT.PUT_LINE('Identificador: ' || var_id || ', Nombre: ' || var_nom || ', Domicilio: ' || var_dom || ', Localidad: ' || var_loc || ', Código Postal: ' || var_cp );
    END LOOP;
    CLOSE cursor_oficinas;
END;
/
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarFamilias IS
    CURSOR cursor_familias IS	SELECT * FROM familias;
        
    var_id familias.identificador%TYPE;
    var_nom familias.nombre%TYPE;
    var_fam familias.familia%TYPE;
    var_ofi familias.oficina%TYPE;
BEGIN
    OPEN cursor_familias;
    LOOP
        FETCH cursor_familias INTO var_id, var_nom, var_fam, var_ofi;
        EXIT WHEN cursor_familias%NOTFOUND;
        
        -- Mostrar los datos de la fila actual
        DBMS_OUTPUT.PUT_LINE('Identificador: ' || var_id || ', Nombre: ' || var_nom || ', Familia: ' || var_fam || ', Oficina: ' || var_ofi );
    END LOOP;
    CLOSE cursor_familias;
END;
/
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarAgentes IS
    CURSOR cursor_agentes IS	SELECT * FROM agentes;
        
    var_id agentes.identificador%TYPE;
    var_nom agentes.nombre%TYPE;
    var_usu agentes.usuario%TYPE;
    var_cla agentes.clave%TYPE;
    var_hab agentes.habilidad%TYPE;
    var_cat agentes.categoria%TYPE;
    var_fam agentes.familia%TYPE;
    var_ofi agentes.oficina%TYPE;
BEGIN
    OPEN cursor_agentes;
    LOOP
        FETCH cursor_agentes INTO var_id, var_nom, var_usu, var_cla, var_hab, var_cat, var_fam, var_ofi;
        EXIT WHEN cursor_agentes%NOTFOUND;
        
        -- Mostrar los datos de la fila actual
        DBMS_OUTPUT.PUT_LINE('Identificador: ' || var_id || ', Nombre: ' || var_nom || ', Usuario: ' || var_usu || ', Clave: ' || var_cla || ', Habilidad: ' || var_hab || ', Categoría: ' || var_cat || ', Familia: ' || var_fam || ', Oficina: ' || var_ofi );
    END LOOP;
    CLOSE cursor_agentes;
END;
/
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarDatos IS
    BEGIN
        mostrarOficinas();
        mostrarFamilias();
        mostrarAgentes();
    END;
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------

CALL agregarDatos();
CALL mostrarDatos();
select obtenerNombreFamilia( 10 ) FROM dual;
CALL mostrarOficinas();
