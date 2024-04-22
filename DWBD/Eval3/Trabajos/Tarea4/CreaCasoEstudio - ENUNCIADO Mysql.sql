#---------------------------------------------------------------------------------------
#	CREACIÓN DE LA BASE DE DATOS Empresa
#---------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS	Empresa;
CREATE DATABASE			Empresa;
USE						Empresa;
#------------------------------------------------------------------------------------------------------
#  BORRAMOS LAS TABLAS
#------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS oficinas, oficinasCopia, oficinasOLD;
DROP TABLE IF EXISTS familias, familiasCopia, familiasOLD;
DROP TABLE IF EXISTS agentes, agentesCopia, agentesOLD;

#------------------------------------------------------------------------------------------------------
#  CREAMOS LAS TABLAS
#------------------------------------------------------------------------------------------------------
create table oficinas (
     identificador     	int,
     nombre          	varchar( 40 ),
     domicilio     		varchar( 40 ),
     localidad     		varchar( 20 ),
     codigo_postal      varchar( 5 ),
     CONSTRAINT	PK_oficinas				PRIMARY KEY( identificador ),
     CONSTRAINT	UQ_oficinas_nombre		UNIQUE( nombre ),
     CONSTRAINT oficinas_nombre_NULO	CHECK( nombre IS NOT NULL )
);

create table familias (
     identificador     	int,
     nombre         	varchar( 40 ),
     familia          	int,
     oficina          	int,
     CONSTRAINT	PK_familias				PRIMARY KEY( identificador ),
     CONSTRAINT	FK_familias_familias	FOREIGN KEY( familia )		REFERENCES familias( identificador )	ON DELETE CASCADE,
     CONSTRAINT	FK_familias_oficinas	FOREIGN KEY( oficina )		REFERENCES oficinas( identificador )	ON DELETE CASCADE,
     CONSTRAINT	UQ_familias_nombre		UNIQUE( nombre ),
     CONSTRAINT	familia_nombre_NULO		CHECK( nombre IS NOT NULL )
);

create table agentes (
     identificador    	int,
     nombre          	varchar( 60 ),
     usuario          	varchar( 20 ),
     clave          	varchar( 20 ),
     habilidad     		int,
     categoria     		int,
     familia          	int,
     oficina          	int,
     CONSTRAINT	PK_agentes				PRIMARY KEY( identificador ),
     CONSTRAINT FK_agentes_familias		FOREIGN KEY( familia )		REFERENCES familias( identificador )	ON DELETE CASCADE,
     CONSTRAINT FK_agentes_oficinas		FOREIGN KEY( oficina )		REFERENCES oficinas( identificador )	ON DELETE CASCADE,
     CONSTRAINT UQ_agentes_usuario		UNIQUE( usuario ),
     CONSTRAINT agentes_nombre_NULO		CHECK( nombre IS NOT NULL ),
     CONSTRAINT agentes_usuario_NULO	CHECK( usuario IS NOT NULL ),
     CONSTRAINT agentes_clave_NULA		CHECK( clave IS NOT NULL ),
     CONSTRAINT agentes_habilidad_NULA	CHECK( habilidad IS NOT NULL ),
     CONSTRAINT agentes_categoria_NULA	CHECK( categoria IS NOT NULL )
);
#------------------------------------------------------------------------------------------------------
#  CREAMOS LAS TABLAS COPIA Y LAS TABLAS OLD, A PARTIR DE LAS TABLAS RECIÉN CREADAS
#		EJEMPLO:	oficinas, oficinasCopia y oficinasOLD
#------------------------------------------------------------------------------------------------------
CREATE TABLE oficinasCopia AS SELECT * FROM oficinas;	CREATE TABLE oficinasOLD AS SELECT * FROM oficinas;
CREATE TABLE familiasCopia AS SELECT * FROM familias;	CREATE TABLE familiasOLD AS SELECT * FROM familias;
CREATE TABLE agentesCopia  AS SELECT * FROM agentes;	CREATE TABLE agentesOLD  AS SELECT * FROM agentes;
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  GUIONES - ES LA SECUENCIA DE INSTRUCCIONES QUE APARECEN EN ESTE DOCUMENTO
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# Secuencia de instrucciones que se ejecutarán de forma ordenada


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  PROCEDIMIENTOS
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos de una nueva Oficina
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS 	agregarOficina //
	CREATE PROCEDURE 			agregarOficina ( 
		id      int,
		Nom     varchar( 40 ),
		Dom     varchar( 40 ),
		Loc     varchar( 20 ),
		CP      varchar(  5 )	) 
	BEGIN
        INSERT INTO oficinas (identificador, nombre, domicilio, localidad, codigo_postal) 
            VALUES ( id, Nom, Dom, Loc, CP );
	END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos todas las oficinas en función del procedimiento creado previamente
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS	agregarOficinas //
	CREATE PROCEDURE 			agregarOficinas()
		BEGIN
			CALL agregarOficina( 1, 'Madrid', 'Gran vía, 37', 'Madrid', '28000' );

			# faltan aquí dos oficinas más
		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos de una nueva Familia
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS 	agregarFamilia //
    CREATE PROCEDURE 			agregarFamilia (
		#	Añade aquí los parámetros necesarios
        ) 
	BEGIN
        #	Añade aquí la forma de agregar los datos de la nueva familia
	END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos todas las familias en función del procedimiento creado previamente
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS agregarFamilias //
	CREATE PROCEDURE agregarFamilias()
		BEGIN
			CALL agregarFamilia( 11, 'Madrid-1', NULL, 1 );
            
            # añade aquí los datos de las demás familias
		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos de un nuevo agente
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS agregarAgente //
    CREATE PROCEDURE agregarAgente (
		#	Añade aquí los parámetros necesarios
        ) 
	BEGIN
        #	Añade aquí la forma de agregar los datos del nuevo agente
	END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos todos los agentes en función del procedimiento creado previamente
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS agregarAgentes //
    CREATE PROCEDURE agregarAgentes()
    BEGIN
        CALL agregarAgente( 31, 'José Ramón Jiménez Reyes', 'jrjr', 'sup31', 9, 2, NULL, 3);
        
        #	Añade aquí los datos de los demás agentes
    END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos de todas las tablas creadas, es decir invocar desde aquí
#		a los tres procedimientos agregar
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS agregarDatos //
    CREATE PROCEDURE agregarDatos()
		BEGIN
			# Añadimos aquí tres llamadas a procedimientos
		END;
// DELIMITER ;


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  FUNCIONES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#	- Función que va a devolver el número de miembros de la familia cuyo nombre se pase como parámetro
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP FUNCTION IF EXISTS contarMiembrosFamilia //
		# escribimos aquí la función
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Función que va a devolver el nombre de la familia cuyo identificamdor se pasa como parámetro
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP FUNCTION IF EXISTS obtenerNombreFamilia //
	CREATE FUNCTION obtenerNombreFamilia( idFamilia int ) RETURNS varchar( 40 )
		DETERMINISTIC
		BEGIN
			DECLARE nombreFamilia varchar( 40 );
			SELECT nombre INTO nombreFamilia FROM familias WHERE identificador = idFamilia;
            
			IF nombreFamilia IS NULL THEN
				RETURN 'Identificador no válido'; -- Mensaje de identificador no válido
			ELSE
				RETURN nombreFamilia;
			END IF;
		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento sencillo cuya finalidad es mostrar todos los datos de las oficinas
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS mostrarOficinas //
    #	escribimos aquí el procedimiento
    
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento sencillo cuya finalidad es mostrar todos los datos de las familias
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS mostrarFamilias //
    #	escribimos aquí el procedimiento

// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento sencillo cuya finalidad es mostrar todos los datos de los agentes
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS mostrarAgentes //
    #	escribimos aquí el procedimiento

// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Procedimiento sencillo cuya finalidad es invocar a los tres procedimientos anteriores para
#		mostrar los datos de las Oficinas, Familias y Agentes. Pero de forma independiente
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS mostrarDatos //
    #	escribimos aquí el procedimiento

// DELIMITER ;    


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  DISPARADORES
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al agregar una tupla en la tabla Oficinas, cuya finalidad es volcar esos datos
#		sobre la tabla oficinasCopia
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_AGREGAR_OFICINA //
	CREATE TRIGGER TRAS_AGREGAR_OFICINA
		AFTER INSERT ON oficinas	FOR EACH ROW
		BEGIN
			#	escribimos aquí la sentencia necesaria

		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al agregar una tupla en la tabla Familias, cuya finalidad es volcar esos datos
#		sobre la tabla familiasCopia
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_AGREGAR_FAMILIA //
	#	escribimos aquí el trigger

// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al agregar una tupla en la tabla Agentes, cuya finalidad es volcar esos datos
#		sobre la tabla agentesCopia
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_AGREGAR_AGENTE //
	#	escribimos aquí el trigger

// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al modificar datos de la tabla Agentes, cuya finalidad es volcar esos datos
#		sobre la tabla agentesCopia. En la tabla oficinasOLD se volcarán los datos que van a ser modificados
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_MODIFICAR_OFICINA //
    CREATE TRIGGER TRAS_MODIFICAR_OFICINA
		AFTER UPDATE ON oficinas	FOR EACH ROW
		BEGIN
			#	actualizamos la tabla oficinasCopia

			#	agragamos los datos que van a ser modificados en la tabla oficinasOLD

		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al modificar datos de la tabla Familias, cuya finalidad es volcar esos datos
#		sobre la tabla familiasCopia. En la tabla familiasOLD se volcarán los datos que van a ser modificados
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_MODIFICAR_FAMILIA //
	#	escribimos aquí el trigger
    
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al modificar datos de la tabla Agentes, cuya finalidad es volcar esos datos
#		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser modificados
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_MODIFICAR_AGENTE //
	#	escribimos aquí el trigger
    
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al borrar datos de la tabla Oficinas, cuya finalidad es volcar esos datos
#		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser eliminados
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_BORRAR_OFICINA //
	CREATE TRIGGER TRAS_BORRAR_OFICINA
		AFTER DELETE ON oficinas	FOR EACH ROW
		BEGIN
			#	borramos en la tabla oficinasCopia

			#	agragamos los datos que van a ser borrados en la tabla oficinasOLD
            
		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al borrar datos de la tabla Familias, cuya finalidad es volcar esos datos
#		sobre la tabla familiasCopia. En la tabla familiasOLD se volcarán los datos que van a ser eliminados
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_BORRAR_FAMILIA //
	#	escribimos aquí el trigger

// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Código que se ejecuta al borrar datos de la tabla Agentes, cuya finalidad es volcar esos datos
#		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser eliminados
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP TRIGGER IF EXISTS TRAS_BORRAR_AGENTE //
	#	escribimos aquí el trigger
    
// DELIMITER ;

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#  CURSORES
#------------------------------------------------------------------------------------------------------
#	- Creamos un cursor cuya finalidad será restaurar la tabla oficinas tras un borrado a partir de las
#		tuplas que hay en la tabla oficinasOLD
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS restaurarOficinas //
    CREATE PROCEDURE restaurarOficinas()
		BEGIN
			DECLARE	FIN	INT	DEFAULT	FALSE;		-- variable asociada al bucle
            
            DECLARE var_id		INT;
			DECLARE	var_nom		VARCHAR( 40 );
			DECLARE	var_dom 	VARCHAR( 40 );
            DECLARE	var_loc		VARCHAR( 20 );
            DECLARE	var_cp		VARCHAR(  5 );

            DECLARE	cursorOficinas	CURSOR FOR SELECT * FROM oficinasOLD;	-- variable cursor que leerá cada tupla de la tabla oficinasOLD
            DECLARE	CONTINUE	HANDLER FOR NOT	FOUND	SET FIN = TRUE;		-- la variabla asociada al bucle cambiará de valor cuando ya no haya ninguna tupla que leer
            
			OPEN cursorOficinas;	-- se inicia el valor del cursor sobre las tuplas de la tabla oficinasOLD
			leerOficinas:	LOOP
				FETCH cursorOficinas INTO var_id, var_nom, var_dom, var_loc, var_cp;	-- se lee los valores de los atributos asociados a cada tupla, uno a uno
				IF	FIN	THEN
					LEAVE	leerOficinas;	-- si no hay más tuplas que leer salimos de este bucle
                END IF;
        
				IF EXISTS (	SELECT * FROM oficinas WHERE identificador = var_id )	THEN		-- si ya existe el atributo en la tabla sólo es modificar (ej. tras modificar)
					UPDATE oficinas SET nombre = var_nom, domicilio = var_dom, localidad = var_loc, codigo_postal = var_cp
						WHERE identificador = var_id;
				ELSE																			-- si NO existe el atributo en la tabla hay que añadir (ej. tras borrar)
					INSERT oficinas VALUES ( var_id, var_nom, var_dom, var_loc, var_cp );
				END IF;
			END LOOP;
			CLOSE cursorOficinas;		-- se cierra el cursor
		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Creamos un cursor cuya finalidad será restaurar la tabla familias tras un borrado a partir de las
#		tuplas que hay en la tabla familiasOLD
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS restaurarFamilias //
	#	escribimos aquí el procedimiento que trabajará con cursores según el ejemplo anterior

// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Creamos un cursor cuya finalidad será restaurar la tabla agentes tras un borrado a partir de las
#		tuplas que hay en la tabla agentesOLD
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS restaurarAgentes //
	#	escribimos aquí el procedimiento que trabajará con cursores según el ejemplo anterior

// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Creamos un procedimiento cuya finalidad es borrar todas las tuplas de las tablas agentes, familias 
#		y oficinas (son tres sentencias básicas de sql).
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS borrarDatos //
	#	escribimos aquí el procedimiento de borrado de las tres tablas señaladas
    
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Creamos un procedimiento cuya finalidad es restaurar las tuplas de las tablas agentes, familias 
#		y oficinas (son llamadas a los tres procedimientos de restaurar creados previamente).
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS restaurarDatos //
	#	escribimos aquí las llamadas a los procedimientos de restauración de las tres tablas señaladas
    
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
#	- Creamos un procedimiento cuya finalidad es incrementar la categoría de los agentes en una unidad.
#		El procedimiento se realizará a través del cursor
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS aumentarCategoriaAgentes //
	CREATE PROCEDURE aumentarCategoriaAgentes()
		BEGIN
			DECLARE FIN INT DEFAULT FALSE;		-- variable asociada al bucle
            
			DECLARE var_id	INT;		-- variable que se leerá de cada tupla: identificador
			DECLARE var_cat INT;		-- variable que se leerá de cada tupla: categoría

			DECLARE cursorAgentes CURSOR FOR SELECT identificador, categoria FROM agentes;	-- variable cursor que leerá cada tupla (dos atributos únicamente) de la tabla oficinasOLD
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIN = TRUE;							-- la variabla asociada al bucle cambiará de valor cuando ya no haya ninguna tupla que leer

			OPEN cursorAgentes;		-- se inicia el valor del cursor sobre las tuplas de la tabla oficinasOLD
			leerAgentes: LOOP
				FETCH cursorAgentes INTO var_id, var_cat;		-- se lee los valores de los dos atributos asociados a cada tupla
				IF FIN THEN
					LEAVE leerAgentes;		-- si no hay más tuplas que leer salimos de este bucle
				END IF;
        
				UPDATE agentes SET categoria = categoria + 1 WHERE identificador = var_id;		-- se incrementa la categoría de cada agente, uno a uno
			END LOOP;
			CLOSE cursorAgentes;		-- se cierra el cursor
		END;
// DELIMITER ;
#------------------------------------------------------------------------------------------------------
DELIMITER //
	DROP PROCEDURE IF EXISTS disminuirCategoriaAgentes //
	#	escribimos aquí el procedimiento que trabajará con cursores según el ejemplo anterior

//
DELIMITER ;


#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------

CALL agregarDatos();	CALL mostrarDatos();
select obtenerNombreFamilia( 10 ) AS 'Nombre de Familia';
select obtenerNombreFamilia( 11 ) AS 'Nombre de Familia';

# modificamos los atributos nombre
update oficinas		set nombre = 'Vigo'	where nombre = 'Madrid';
update familias		set nombre = REPLACE( nombre, 'a', 'e' );
update agentes		set nombre = REPLACE( nombre, ' ', '' );

CALL mostrarDatos();	CALL restaurarDatos();
CALL borrarDatos();		CALL mostrarDatos();
CALL restaurarDatos();	CALL mostrarDatos();
