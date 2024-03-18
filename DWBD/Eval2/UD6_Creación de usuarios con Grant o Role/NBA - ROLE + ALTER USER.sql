#------------------------------------------------------------------------------------------------------
#	UTILIZACIÓN DE LA BASE DE DATOS
#------------------------------------------------------------------------------------------------------
#	USE <base de datos>
#------------------------------------------------------------------------------------------------------
	USE NBA;

#------------------------------------------------------------------------------------------------------
#	CREACIÓN DE VISTAS
#------------------------------------------------------------------------------------------------------
#	DROP VIEW IF EXISTS <vista>					CREATE VIEW	<vista>				AS <consulta>
#------------------------------------------------------------------------------------------------------
	DROP VIEW IF EXISTS NBA_JUGADORES;			CREATE VIEW	NBA_JUGADORES		AS SELECT * FROM NBA.jugadores;
    DROP VIEW IF EXISTS NBA_ESTADISTICAS;		CREATE VIEW NBA_ESTADISTICAS	AS SELECT * FROM NBA.estadisticas;

#------------------------------------------------------------------------------------------------------
#	CREACIÓN DE ROLES
#------------------------------------------------------------------------------------------------------
#	DROP ROLE IF EXISTS <rol>					CREATE ROLE	<rol>
#------------------------------------------------------------------------------------------------------
	DROP ROLE IF EXISTS ROL_DIRECTIVO_NBA;		CREATE ROLE	ROL_DIRECTIVO_NBA;
	DROP ROLE IF EXISTS ROL_JUGADOR_NBA;		CREATE ROLE	ROL_JUGADOR_NBA;

#------------------------------------------------------------------------------------------------------
#	ASIGNACIÓN DE PRIVILEGIOS A LOS ROLES
#------------------------------------------------------------------------------------------------------
#	GRANT <permiso>		ON <vista>		TO <role>
#------------------------------------------------------------------------------------------------------
#	GRANT Role_Admin	ON *.*			TO <rol>
#	GRANT Create_User	ON *.*			TO <rol>			WITH GRANT OPTION
#------------------------------------------------------------------------------------------------------
    GRANT Role_Admin, Create User	ON *.*	TO ROL_DIRECTIVO_NBA		WITH GRANT OPTION;
    
    GRANT ALL		ON NBA.*			TO ROL_DIRECTIVO_NBA;
    GRANT SELECT	ON NBA_JUGADORES	TO ROL_JUGADOR_NBA;			GRANT SELECT	ON NBA_ESTADISTICAS TO ROL_JUGADOR_NBA;

#------------------------------------------------------------------------------------------------------
# 	CREACIÓN DE USUARIOS
#------------------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <usuario>		CREATE USER <usuario>	IDENTIFIED BY <clave>	DEFAULT ROLE <rol>
#------------------------------------------------------------------------------------------------------
	DROP USER IF EXISTS DirectorNBA;	CREATE USER DirectorNBA	IDENTIFIED BY 'dir';
    DROP USER IF EXISTS JugadorNBA;		CREATE USER JugadorNBA	IDENTIFIED BY 'jug';
    
#------------------------------------------------------------------------------------------------------
#	ASIGNACIÓN DE PRIVILEGIOS A USUARIOS
#------------------------------------------------------------------------------------------------------
#	GRANT	<rol>				TO <usuario>		ALTER USER <usuario>	DEFAULT ROLE <rol>
#------------------------------------------------------------------------------------------------------
	GRANT	ROL_DIRECTIVO_NBA	TO DirectorNBA;		ALTER USER DirectorNBA	DEFAULT ROLE ROL_DIRECTIVO_NBA;
	GRANT	ROL_JUGADOR_NBA		TO JugadorNBA;		ALTER USER JugadorNBA 	DEFAULT ROLE ROL_JUGADOR_NBA;

#------------------------------------------------------------------------------------------------------
#	ACTUALIZACIÓN DE PRIVILEGIOS
#------------------------------------------------------------------------------------------------------
#	FLUSH PRIVILEGES;
#------------------------------------------------------------------------------------------------------
	FLUSH PRIVILEGES;