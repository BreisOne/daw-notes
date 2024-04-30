---------------------------------------------------------------------------------------
-- CREACIÓN DE LA BASE DE DATOS Empresa
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-- BORRAMOS LAS TABLAS
------------------------------------------------------------------------------------------------------
DROP TABLE agentes;     DROP TABLE agentesCopia;    DROP TABLE agentesOLD;
DROP TABLE familias;    DROP TABLE familiasCopia;   DROP TABLE familiasOLD;
DROP TABLE oficinas;    DROP TABLE oficinasCopia;   DROP TABLE oficinasOLD;

------------------------------------------------------------------------------------------------------
-- CREAMOS LAS TABLAS
------------------------------------------------------------------------------------------------------
CREATE TABLE oficinas (
    identificador     	NUMBER(6),
    nombre          	VARCHAR2(40),
    domicilio     	    VARCHAR2(40),
    localidad     	    VARCHAR2(20),
    codigo_postal       VARCHAR2(5),
    CONSTRAINT	PK_oficinas				PRIMARY KEY( identificador ),
    --CONSTRAINT	UQ_oficinas_nombre		UNIQUE( nombre ),
    CONSTRAINT oficinas_nombre_NULO	    CHECK( nombre IS NOT NULL )
);

CREATE TABLE familias (
    identificador     	NUMBER(6),
    nombre         	    VARCHAR2(40),
    familia          	NUMBER(6),
    oficina          	NUMBER(6),
    CONSTRAINT	PK_familias				PRIMARY KEY( identificador ),
    CONSTRAINT	FK_familias_familias	FOREIGN KEY( familia )		REFERENCES familias( identificador )	ON DELETE CASCADE,
    CONSTRAINT	FK_familias_oficinas	FOREIGN KEY( oficina )		REFERENCES oficinas( identificador )	ON DELETE CASCADE,
    --CONSTRAINT	UQ_familias_nombre		UNIQUE( nombre ),
    CONSTRAINT	familia_nombre_NULO		CHECK( nombre IS NOT NULL )
);

CREATE TABLE agentes (
    identificador    	NUMBER(6),
    nombre          	VARCHAR2(60),
    usuario          	VARCHAR2(20),
    clave          	    VARCHAR2(20),
    habilidad     	    NUMBER(1),
    categoria     	    NUMBER(1),
    familia          	NUMBER(6),
    oficina          	NUMBER(6),
    CONSTRAINT	PK_agentes				PRIMARY KEY( identificador ),
    CONSTRAINT FK_agentes_familias		FOREIGN KEY( familia )		REFERENCES familias( identificador )	ON DELETE CASCADE,
    CONSTRAINT FK_agentes_oficinas		FOREIGN KEY( oficina )		REFERENCES oficinas( identificador )	ON DELETE CASCADE,
    --CONSTRAINT UQ_agentes_usuario		UNIQUE( usuario ),
    CONSTRAINT agentes_nombre_NULO		CHECK( nombre IS NOT NULL ),
    CONSTRAINT agentes_usuario_NULO	    CHECK( usuario IS NOT NULL ),
    CONSTRAINT agentes_clave_NULA		CHECK( clave IS NOT NULL ),
    CONSTRAINT agentes_habilidad_NULA	CHECK( habilidad IS NOT NULL ),
    CONSTRAINT agentes_categoria_NULA	CHECK( categoria IS NOT NULL )
);

------------------------------------------------------------------------------------------------------
-- CREAMOS LAS TABLAS COPIA Y LAS TABLAS OLD, A PARTIR DE LAS TABLAS RECIÉN CREADAS
--		EJEMPLO:	oficinas, oficinasCopia y oficinasOLD
------------------------------------------------------------------------------------------------------
CREATE TABLE oficinasCopia AS SELECT * FROM oficinas;   CREATE TABLE oficinasOLD AS SELECT * FROM oficinas;
CREATE TABLE familiasCopia AS SELECT * FROM familias;   CREATE TABLE familiasOLD AS SELECT * FROM familias;
CREATE TABLE agentesCopia  AS SELECT * FROM agentes;    CREATE TABLE agentesOLD  AS SELECT * FROM agentes;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- GUIONES
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Secuencia de instrucciones que se ejecutarán de forma ordenada


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos de una nueva Oficina
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarOficina ( 
    id      NUMBER,
    Nom     VARCHAR2,
    Dom     VARCHAR2,
    Loc     VARCHAR2,
    CP      VARCHAR2
) 
IS 
BEGIN
    INSERT INTO oficinas (identificador, nombre, domicilio, localidad, codigo_postal) 
    VALUES (id, Nom, Dom, Loc, CP);
END;
/
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos todas las oficinas en función del procedimiento creado previamente
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarOficinas
IS
BEGIN
    agregarOficina( 1, 'Madrid', 'Gran vía, 37', 'Madrid', '28000' );

	# faltan aquí dos oficinas más
    COMMIT; -- hacemos permanentes los cambios
END;
/
------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos de una nueva Familia
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarFamilia (
		#	Añade aquí los parámetros necesarios
) 
IS 
BEGIN
        #	Añade aquí la forma de agregar los datos de la nueva familia
END;
/
------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos todas las familias en función del procedimiento creado previamente
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarFamilias
IS
BEGIN
    agregarFamilia(11, 'Madrid-1', NULL, 1);
            
            # añade aquí los datos de las demás familias
    COMMIT; -- hacemos permanentes los cambios
END;
/
------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos de un nuevo agente
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarAgente (
		#	Añade aquí los parámetros necesarios
)
IS 
BEGIN
        #	Añade aquí la forma de agregar los datos del nuevo agente
END;
/
#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos todos los agentes en función del procedimiento creado previamente
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarAgentes  IS
BEGIN
        agregarAgente( 31, 'José Ramón Jiménez Reyes', 'jrjr', 'sup31', 9, 2, NULL, 3);
        
        #	Añade aquí los datos de los demás agentes
    COMMIT; -- hacemos permanentes los cambios
END;
/
------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos de todas las tablas creadas, es decir invocar desde aquí
--		a los tres procedimientos agregar
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarDatos IS
BEGIN
			# Añadimos aquí tres llamadas a procedimientos
END;
/
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- FUNCIONES
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Función que va a devolver el número de miembros de la familia cuyo nombre se pase como parámetro
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION contarMiembrosFamilia( familiaContar INT ) RETURN INT IS
    numMiembros INT;
BEGIN
		# escribimos aquí la función
END;
/
------------------------------------------------------------------------------------------------------
--	Función que va a devolver el nombre de la familia cuyo identificador se pasa como parámetro
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION obtenerNombreFamilia( idFamilia INT ) RETURN VARCHAR IS
    nombreFamilia VARCHAR(40);
BEGIN
    SELECT nombre INTO nombreFamilia FROM familias WHERE identificador = idFamilia;
            
    IF nombreFamilia IS NULL THEN
        RETURN 'Identificador no válido'; -- Mensaje de identificador no válido
    ELSE
        RETURN nombreFamilia;
    END IF;
END;
/
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Procedimiento cuya finalidad es mostrar todos los datos de las oficinas
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarOficinas IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('MOSTRAMOS LAS OFICINAS');
    DBMS_OUTPUT.PUT_LINE('----------------------');    
    FOR oficina IN (SELECT * FROM oficinas) LOOP
        DBMS_OUTPUT.PUT_LINE('Identificador: ' || oficina.identificador || ', Nombre: ' || oficina.nombre || ', Domicilio: ' || oficina.domicilio || ', Localidad: ' || oficina.localidad || ', Código Postal: ' || oficina.codigo_postal );
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'No hay datos en la tabla Oficinas.' );
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'Error: ' || SQLERRM );
END;
/
------------------------------------------------------------------------------------------------------
--	Procedimiento cuya finalidad es mostrar todos los datos de las familias
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarFamilias IS
BEGIN
    #	escribimos aquí el procedimiento
END;
/
------------------------------------------------------------------------------------------------------
--	Procedimiento cuya finalidad es mostrar todos los datos de los agentes
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarAgentes IS
BEGIN
    #	escribimos aquí el procedimiento
END;
/
------------------------------------------------------------------------------------------------------
--	Procedimiento sencillo cuya finalidad es invocar a los tres procedimientos anteriores para
--		mostrar los datos de las Oficinas, Familias y Agentes. Pero de forma independiente
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarDatos IS
BEGIN
    #	escribimos aquí el procedimiento
END;
/
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- DISPARADORES
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al agregar una tupla en la tabla Oficinas, cuya finalidad es volcar esos datos
--		sobre la tabla oficinasCopia
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_OFICINA
	AFTER INSERT ON oficinas	FOR EACH ROW
BEGIN
    INSERT INTO oficinasCopia VALUES ( :NEW.identificador, :NEW.nombre, :NEW.domicilio, :NEW.localidad, :NEW.codigo_postal );
END;
/
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al agregar una tupla en la tabla Familias, cuya finalidad es volcar esos datos
--		sobre la tabla familiasCopia
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_FAMILIA
	#	escribimos aquí el trigger
END;
/
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al agregar una tupla en la tabla Agentes, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_AGENTE
	#	escribimos aquí el trigger
END;
/
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al modificar datos de la tabla Agentes, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia. En la tabla oficinasOLD se volcarán los datos que van a ser modificados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_OFICINA
	AFTER UPDATE ON oficinas	FOR EACH ROW
BEGIN
	#	actualizamos la tabla oficinasCopia

	#	agregamos los datos que van a ser modificados en la tabla oficinasOLD
END;
/
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al modificar datos de la tabla Familias, cuya finalidad es volcar esos datos
--		sobre la tabla familiasCopia. En la tabla familiasOLD se volcarán los datos que van a ser modificados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_FAMILIA
	AFTER UPDATE ON familias	FOR EACH ROW
BEGIN
	#	actualizamos la tabla familiasCopia

	#	agregamos los datos que van a ser modificados en la tabla familiasOLD
END;
/
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al modificar datos de la tabla Agentes, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser modificados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_AGENTE
	AFTER UPDATE ON agentes		FOR EACH ROW
BEGIN
	#	actualizamos la tabla agentesCopia

	#	agregamos los datos que van a ser modificados en la tabla agentesOLD
END;
/
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al borrar datos de la tabla Oficinas, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser eliminados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_BORRAR_OFICINA
    AFTER DELETE ON oficinas    FOR EACH ROW
BEGIN
	#	borramos en la tabla oficinasCopia

	#	agragamos los datos que van a ser borrados en la tabla oficinasOLD
END;
/
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al borrar datos de la tabla Familias, cuya finalidad es volcar esos datos
--		sobre la tabla familiasCopia. En la tabla familiasOLD se volcarán los datos que van a ser eliminados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_BORRAR_FAMILIA
    AFTER DELETE ON familias    FOR EACH ROW
BEGIN
	#	borramos en la tabla familiasCopia

	#	agragamos los datos que van a ser borrados en la tabla familiasOLD
END;
/
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al borrar datos de la tabla Agentes, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser eliminados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_BORRAR_AGENTE
    AFTER DELETE ON agentes     FOR EACH ROW
BEGIN
	#	borramos en la tabla agentesCopia

	#	agragamos los datos que van a ser borrados en la tabla agentesOLD
END;
/
------------------------------------------------------------------------------------------------------
-- CURSORES
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Creamos un cursor cuya finalidad será restaurar la tabla oficinas tras un borrado a partir de las
--		tuplas que hay en la tabla oficinasOLD
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE restaurarOficinas IS
    var_id 	oficinas.identificador%TYPE;	# variable del mismo tipo que en la definición
    var_nom 	oficinas.nombre%TYPE;
    var_dom 	oficinas.domicilio%TYPE;
    var_loc 	oficinas.localidad%TYPE;
    var_cp 	oficinas.codigo_postal%TYPE;

    FIN INT := 0;			-- variable asociada al bucle
    CURSOR cursorOficinas IS SELECT * FROM oficinasOLD;	-- variable cursor que leerá cada tupla de la tabla oficinasOLD
BEGIN
    OPEN cursorOficinas;	-- se inicia el valor del cursor sobre las tuplas de la tabla oficinasOLD
    LOOP
        FETCH cursorOficinas INTO var_id, var_nom, var_dom, var_loc, var_cp;	-- se lee los valores de los atributos asociados a cada tupla, uno a uno
        EXIT WHEN cursorOficinas%NOTFOUND;

        BEGIN
            SELECT COUNT(*)
            INTO FIN
            FROM oficinas
            WHERE identificador = var_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                FIN := 0;
        END;

        IF FIN = 1 THEN		-- si ya existe el atributo en la tabla sólo es modificar (ej. tras modificar)
            UPDATE oficinas
            SET nombre = var_nom,
                domicilio = var_dom,
                localidad = var_loc,
                codigo_postal = var_cp
            WHERE identificador = var_id;
        ELSE			-- si NO existe el atributo en la tabla hay que añadir (ej. tras borrar)
            INSERT INTO oficinas VALUES (var_id, var_nom, var_dom, var_loc, var_cp);
        END IF;
    END LOOP;
    CLOSE cursorOficinas;	-- se cierra el cursor
    COMMIT; -- hacemos permanentes los cambios
END;
/
------------------------------------------------------------------------------------------------------
--	Creamos un cursor cuya finalidad será restaurar la tabla familias tras un borrado a partir de las
--		tuplas que hay en la tabla familiasOLD
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE restaurarFamilias IS
	#	escribimos aquí el procedimiento que trabajará con cursores según el ejemplo anterior
END;
/
------------------------------------------------------------------------------------------------------
--	Creamos un cursor cuya finalidad será restaurar la tabla agentes tras un borrado a partir de las
--		tuplas que hay en la tabla agentesOLD
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE restaurarAgentes IS
	#	escribimos aquí el procedimiento que trabajará con cursores según el ejemplo anterior
    COMMIT; -- hacemos permanentes los cambios
END;
/
------------------------------------------------------------------------------------------------------
--	Creamos un procedimiento cuya finalidad es borrar todas las tuplas de las tablas agentes, familias 
--		y oficinas (son tres sentencias básicas de sql).
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE borrarDatos IS
BEGIN
	#	escribimos aquí el procedimiento de borrado de las tres tablas señaladas
END;
/
------------------------------------------------------------------------------------------------------
--	Creamos un procedimiento cuya finalidad es restaurar las tuplas de las tablas agentes, familias 
--		y oficinas (son llamadas a los tres procedimientos de restaurar creados previamente).
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE restaurarDatos IS
BEGIN
	#	escribimos aquí las llamadas a los procedimientos de restauración de las tres tablas señaladas
END;
/
------------------------------------------------------------------------------------------------------
--	Creamos un procedimiento cuya finalidad es incrementar la categoría de los agentes en una unidad.
--		El procedimiento se realizará a través del cursor
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE aumentarCategoriaAgentes IS
BEGIN
    FOR rec IN (SELECT identificador, categoria FROM agentes) LOOP
        UPDATE agentes SET categoria = rec.categoria + 1 WHERE identificador = rec.identificador;
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL;
    COMMIT; -- hacemos permanentes los cambios
END;
/
------------------------------------------------------------------------------------------------------
--	Creamos un procedimiento cuya finalidad es decrementar la categoría de los agentes en una unidad.
--		El procedimiento se realizará a través del cursor
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE decrementarCategoriaAgentes IS
BEGIN
	#	escribimos aquí el procedimiento que trabajará con cursores según el ejemplo anterior
END;
/
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;	-- activamos la visualización de los resultados
EXEC agregarDatos;	-- llamamos al procedimiento de agregación de datos
...			-- llamamos al procedimiento de mostrar los datos

SELECT obtenerNombreFamilia(10) AS "Nombre de Familia"  FROM DUAL;	-- mostramos el nombre de la familia con el índice 10
...									-- mostramos el nombre de la familia con el índice 11

-- Modificamos los atributos nombre
UPDATE oficinas ...;		-- cambiamos el nombre de las oficinas 'Madrid' por 'Vigo'
UPDATE familias ...;		-- cambiamos 'a' por 'e' en el nombre de las familias
UPDATE agentes  ...;		-- quitamos los espacios de los nombres de los agentes (cambiamos ' ' por '')
COMMIT; -- hacemos permanentes los cambios

EXEC mostrarDatos;    	-- mostramos las actualizaciones realizadas
EXEC ...;		-- restauramos los datos para anular los cambios efectuados
EXEC mostrarDatos;     	-- mostramos los datos sin los cambios realizados
EXEC ...;       	-- borramos todos los datos de las tres tablas
EXEC mostrarDatos;	-- mostramos las tablas sin datos
EXEC ...;		-- restauramos los datos borrados
EXEC ...;		-- mostramos las tablas con los datos recuperados
