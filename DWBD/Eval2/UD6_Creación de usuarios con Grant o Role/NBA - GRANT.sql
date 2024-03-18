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
#  CREACIÓN DE USUARIOS
#------------------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <usuario>			CREATE USER <usuario>	IDENTIFIED BY <clave>
#------------------------------------------------------------------------------------------------------
	DROP USER IF EXISTS DirectorNBA;		CREATE USER DirectorNBA	IDENTIFIED BY 'dir';
    DROP USER IF EXISTS JugadorNBA;			CREATE USER JugadorNBA	IDENTIFIED BY 'jug';
    
#------------------------------------------------------------------------------------------------------
#	ASIGNACIÓN DE PRIVILEGIOS A LOS USUARIOS
#------------------------------------------------------------------------------------------------------
#	GRANT <permiso>		ON <vista>		TO <usuario>
#------------------------------------------------------------------------------------------------------
#	GRANT Role_Admin	ON *.*			TO <usuario>
#	GRANT Create_User	ON *.*			TO <usuario>			WITH GRANT OPTION
#------------------------------------------------------------------------------------------------------
    GRANT Role_Admin, Create User	ON *.*	TO DirectorNBA		WITH GRANT OPTION;
    
    GRANT ALL		ON NBA.*			TO DirectorNBA;
    GRANT SELECT	ON NBA_JUGADORES	TO JugadorNBA;			GRANT SELECT	ON NBA_ESTADISTICAS TO JugadorNBA;

#------------------------------------------------------------------------------------------------------
#	ACTUALIZACIÓN DE PRIVILEGIOS
#------------------------------------------------------------------------------------------------------
#	FLUSH PRIVILEGES;
#------------------------------------------------------------------------------------------------------
	FLUSH PRIVILEGES;