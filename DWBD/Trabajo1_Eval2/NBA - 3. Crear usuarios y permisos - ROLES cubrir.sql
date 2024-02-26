#--------------------------------------------------------------------------------------------
#	1.	UTILIZAMOS LA BASE DE DATOS 'NBA'
#--------------------------------------------------------------------------------------------
#	USE <base de datos>
#--------------------------------------------------------------------------------------------
Use NBA;

#--------------------------------------------------------------------------------------------
#	2. 	BORRAMOS Y CREAMOS LOS ROLES
#--------------------------------------------------------------------------------------------
#	Rol asociado a NBA y a cada Conferencia (Este, Oeste) y a cada División (Atlántico, Sudeste, Central, Pacífico, Sudoeste y Noroeste)
#--------------------------------------------------------------------------------------------
#	CREATE ROLE <rol>
#--------------------------------------------------------------------------------------------
-- Crear el rol asociado a la NBA
DROP ROLE IF EXISTS NBA;
CREATE ROLE NBA;

-- Crear roles para cada conferencia
DROP ROLE IF EXISTS conferencia_Este;
CREATE ROLE conferencia_Este;

DROP ROLE IF EXISTS conferencia_Oeste;
CREATE ROLE conferencia_Oeste;

-- Crear roles para cada división
DROP ROLE IF EXISTS division_Atlantica;
CREATE ROLE division_Atlantica;

DROP ROLE IF EXISTS division_Sudeste;
CREATE ROLE division_Sudeste;

DROP ROLE IF EXISTS division_Central;
CREATE ROLE division_Central;

DROP ROLE IF EXISTS division_Pacifico;
CREATE ROLE division_Pacifico;

DROP ROLE IF EXISTS division_Sudoeste;
CREATE ROLE division_Sudoeste;

DROP ROLE IF EXISTS division_Noroeste;
CREATE ROLE division_Noroeste; 

#--------------------------------------------------------------------------------------------
#	3. BORRAMOS Y CREAMOS LAS VISTAS
#--------------------------------------------------------------------------------------------
#	DROP VIEW IF EXISTS <vista>							CREATE VIEW	<vista>	AS <consulta>
#--------------------------------------------------------------------------------------------
#		Vista General de TODOS los Equipos, otra para TODOS los Jugadores, otra para TODAS las Estadísticas y otra para TODOS los partidos
#		Vista de Equipos, Jugadores, Estadísticas y Partidos sobre la Conferencia ESTE
#		Vista de Equipos, Jugadores, Estadísticas y Partidos sobre la Conferencia OESTE
#		Vista de Equipos, Jugadores, Estadísticas y Partidos sobre la División Atlantica
#		Vista de Equipos, Jugadores, Estadísticas y Partidos sobre la División Sudeste
#		Vista de Equipos, Jugadores, Estadísticas y Partidos sobre la División Central
#		Vista de Equipos, Jugadores, Estadísticas y Partidos sobre la División Pacífico
#		Vista de Equipos, Jugadores, Estadísticas y Partidos sobre la División Sudoeste
#		Vista de Equipos, Jugadores, Estadísticas y Partidos sobre la División Noroeste
#--------------------------------------------------------------------------------------------

-- Borrar y crear Vista_Equipos
DROP VIEW IF EXISTS Vista_Equipos;
CREATE VIEW Vista_Equipos AS SELECT * FROM Equipos;

-- Borrar y crear Vista_Jugadores
DROP VIEW IF EXISTS Vista_Jugadores;
CREATE VIEW Vista_Jugadores AS SELECT * FROM Jugadores;

-- Borrar y crear Vista_Estadisticas
DROP VIEW IF EXISTS Vista_Estadisticas;
CREATE VIEW Vista_Estadisticas AS SELECT * FROM Estadisticas;

-- Borrar y crear Vista_Partidos
DROP VIEW IF EXISTS Vista_Partidos;
CREATE VIEW Vista_Partidos AS SELECT * FROM Partidos;

-- EQUIPOS
-- Borrar y crear Vista_Conferencia_ESTE_equipos
DROP VIEW IF EXISTS Vista_Conferencia_ESTE_equipos;
CREATE VIEW Vista_Conferencia_ESTE_equipos AS SELECT * FROM Equipos WHERE Conferencia = 'East';

-- Borrar y crear Vista_Conferencia_OESTE_equipos
DROP VIEW IF EXISTS Vista_Conferencia_OESTE_equipos;
CREATE VIEW Vista_Conferencia_OESTE_equipos AS SELECT * FROM Equipos WHERE Conferencia = 'West';

-- Borrar y crear Vista_Division_Atlantica_equipos
DROP VIEW IF EXISTS Vista_Division_Atlantica_equipos;
CREATE VIEW Vista_Division_Atlantica_equipos AS SELECT * FROM Equipos WHERE Division = 'Atlantic';

-- Borrar y crear Vista_Division_Sudeste_equipos
DROP VIEW IF EXISTS Vista_Division_Sudeste_equipos;
CREATE VIEW Vista_Division_Sudeste_equipos AS SELECT * FROM Equipos WHERE Division = 'SouthEast';

-- Borrar y crear Vista_Division_Central_equipos
DROP VIEW IF EXISTS Vista_Division_Central_equipos;
CREATE VIEW Vista_Division_Central_equipos AS SELECT * FROM Equipos WHERE Division = 'Central';

-- Borrar y crear Vista_Division_Pacifico_equipos
DROP VIEW IF EXISTS Vista_Division_Pacifico_equipos;
CREATE VIEW Vista_Division_Pacifico_equipos AS SELECT * FROM Equipos WHERE Division = 'Pacific';

-- Borrar y crear Vista_Division_Sudoeste_equipos
DROP VIEW IF EXISTS Vista_Division_Sudoeste_equipos;
CREATE VIEW Vista_Division_Sudoeste_equipos AS SELECT * FROM Equipos WHERE Division = 'SouthWest';

-- Borrar y crear Vista_Division_Noroeste_equipos
DROP VIEW IF EXISTS Vista_Division_Noroeste_Equipos;
CREATE VIEW Vista_Division_Noroeste_Equipos AS SELECT * FROM Equipos WHERE Division = 'NorthWest';

-- JUGADORES
-- Borrar y crear Vista_Conferencia_ESTE_jugadores
DROP VIEW IF EXISTS Vista_Conferencia_ESTE_jugadores;
CREATE VIEW Vista_Conferencia_ESTE_jugadores AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_conferencia_este_equipos);

-- Borrar y crear Vista_Conferencia_OESTE_jugadores
DROP VIEW IF EXISTS Vista_Conferencia_OESTE_jugadores;
CREATE VIEW Vista_Conferencia_OESTE_jugadores AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_conferencia_oeste_equipos);

-- Borrar y crear Vista_Division_Atlantica_jugadores
DROP VIEW IF EXISTS Vista_Division_Atlantica_jugadores;
CREATE VIEW Vista_Division_Atlantica_jugadores AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_atlantica_equipos);

-- Borrar y crear Vista_Division_Sudeste_jugadores
DROP VIEW IF EXISTS Vista_Division_Sudeste_jugadores;
CREATE VIEW Vista_Division_Sudeste_jugadores AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_sudeste_equipos);

-- Borrar y crear Vista_Division_Central_jugadores
DROP VIEW IF EXISTS Vista_Division_Central_jugadores;
CREATE VIEW Vista_Division_Central_jugadores AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_central_equipos);

-- Borrar y crear Vista_Division_Pacifico_jugadores
DROP VIEW IF EXISTS Vista_Division_Pacifico_jugadores;
CREATE VIEW Vista_Division_Pacifico_jugadores AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_pacifico_equipos);

-- Borrar y crear Vista_Division_Sudoeste_jugadores
DROP VIEW IF EXISTS Vista_Division_Sudoeste_jugadores;
CREATE VIEW Vista_Division_Sudoeste_jugadores AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_sudoeste_equipos);

-- Borrar y crear Vista_Division_Noroeste_jugadores
DROP VIEW IF EXISTS Vista_Division_Noroeste_jugadores;
CREATE VIEW Vista_Division_Noroeste_jugadores AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_Noroeste_equipos);

-- ESTADSITICAS
-- Borrar y crear Vista_Conferencia_ESTE
DROP VIEW IF EXISTS Vista_Conferencia_ESTE_Estadisticas;
CREATE VIEW Vista_Conferencia_ESTE_Estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_conferencia_este_jugadores);

-- Borrar y crear Vista_Conferencia_OESTE
DROP VIEW IF EXISTS Vista_Conferencia_OESTE_Estadisticas;
CREATE VIEW Vista_Conferencia_OESTE_Estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_conferencia_oeste_jugadores);

-- Borrar y crear Vista_Division_Atlantica
DROP VIEW IF EXISTS Vista_Division_Atlantica_Estadsiticas;
CREATE VIEW Vista_Division_Atlantica_Estadsiticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_division_atlantica_jugadores);

-- Borrar y crear Vista_Division_Sudeste
DROP VIEW IF EXISTS Vista_Division_Sudeste_Estadisticas;
CREATE VIEW Vista_Division_Sudeste_Estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_division_sudeste_jugadores);

-- Borrar y crear Vista_Division_Central
DROP VIEW IF EXISTS Vista_Division_Central_Estadisticas;
CREATE VIEW Vista_Division_Central_Estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select nombre from vista_division_central_jugadores);

-- Borrar y crear Vista_Division_Pacifico
DROP VIEW IF EXISTS Vista_Division_Pacifico_Estadisticas;
CREATE VIEW Vista_Division_Pacifico_Estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_division_pacifico_jugadores);

-- Borrar y crear Vista_Division_Sudoeste
DROP VIEW IF EXISTS Vista_Division_Sudoeste_estadisticas;
CREATE VIEW Vista_Division_Sudoeste_estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_division_Sudoeste_jugadores);

-- Borrar y crear Vista_Division_Noroeste
DROP VIEW IF EXISTS Vista_Division_Noroeste_estadisticas;
CREATE VIEW Vista_Division_Noroeste_estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_division_Noroeste_jugadores);


-- PARTIDOS
-- Borrar y crear Vista_Conferencia_ESTE
DROP VIEW IF EXISTS Vista_Conferencia_ESTE_partidos;
CREATE VIEW Vista_Conferencia_ESTE_partidos AS SELECT * FROM partidos WHERE EquipoLocal IN (SELECT nombre FROM Vista_Conferencia_ESTE_Equipos) AND EquipoVisitante IN (select nombre from Vista_Conferencia_ESTE_Equipos);

-- Borrar y crear Vista_Conferencia_OESTE
DROP VIEW IF EXISTS Vista_Conferencia_OESTE_partidos;
CREATE VIEW Vista_Conferencia_OESTE_partidos AS SELECT * FROM partidos WHERE EquipoLocal IN (SELECT nombre FROM Vista_Conferencia_OESTE_equipos) AND EquipoVisitante IN (select nombre from Vista_Conferencia_OESTE_equipos);

-- Borrar y crear Vista_Division_Atlantica
DROP VIEW IF EXISTS Vista_Division_Atlantica_partidos;
CREATE VIEW Vista_Division_Atlantica_partidos AS SELECT * FROM partidos WHERE EquipoLocal IN (SELECT nombre FROM Vista_division_atlantica_equipos) AND EquipoVisitante IN (select nombre from Vista_division_atlantica_equipos);

-- Borrar y crear Vista_Division_Sudeste
DROP VIEW IF EXISTS Vista_Division_Sudeste_partidos;
CREATE VIEW Vista_Division_Sudeste_partidos AS SELECT * FROM partidos WHERE EquipoLocal IN (SELECT nombre FROM Vista_division_sudeste_equipos) AND EquipoVisitante IN (select nombre from Vista_division_sudeste_equipos);

-- Borrar y crear Vista_Division_Central
DROP VIEW IF EXISTS Vista_Division_Central_partidos;
CREATE VIEW Vista_Division_Central_partidos AS SELECT * FROM partidos WHERE EquipoLocal IN (SELECT nombre FROM Vista_division_central_equipos) AND EquipoVisitante IN (select nombre from Vista_division_central_equipos);

-- Borrar y crear Vista_Division_Pacifico
DROP VIEW IF EXISTS Vista_Division_Pacifico_partidos;
CREATE VIEW Vista_Division_Pacifico_partidos AS SELECT * FROM partidos WHERE EquipoLocal IN (SELECT nombre FROM Vista_division_pacifico_equipos) AND EquipoVisitante IN (select nombre from Vista_division_pacifico_equipos);

-- Borrar y crear Vista_Division_Sudoeste
DROP VIEW IF EXISTS Vista_Division_Sudoeste_partidos;
CREATE VIEW Vista_Division_Sudoeste_partidos AS SELECT * FROM partidos WHERE EquipoLocal IN (SELECT nombre FROM Vista_division_sudoeste_equipos) AND EquipoVisitante IN (select nombre from Vista_division_sudoeste_equipos);

-- Borrar y crear Vista_Division_Noroeste
DROP VIEW IF EXISTS Vista_Division_Noroeste_partidos;
CREATE VIEW Vista_Division_Noroeste_partidos AS SELECT * FROM partidos WHERE EquipoLocal IN (SELECT nombre FROM Vista_division_noroeste_equipos) AND EquipoVisitante IN (select nombre from Vista_division_noroeste_equipos);

#--------------------------------------------------------------------------------------------
#	4. ASIGNAMOS PRIVILEGIOS (O PERMISOS) A LOS ROLES
#--------------------------------------------------------------------------------------------
#	GRANT <privilegio>	ON <vista>	TO 	<rol>
#--------------------------------------------------------------------------------------------
GRANT ALL ON Vista_equipos TO nba;
GRANT ALL ON Vista_jugadores TO nba;
GRANT ALL ON Vista_estadisticas TO nba;
GRANT ALL ON Vista_partidos TO nba;

GRANT ALL ON Vista_Conferencia_ESTE_equipos TO conferencia_este;
GRANT ALL ON Vista_Conferencia_ESTE_jugadores TO conferencia_este;
GRANT ALL ON Vista_Conferencia_ESTE_estadsiticas TO conferencia_este;
GRANT ALL ON Vista_Conferencia_ESTE_partidos TO conferencia_este;

GRANT ALL ON Vista_Conferencia_OESTE_equipos TO conferencia_oeste;
GRANT ALL ON Vista_Conferencia_OESTE_jugadores TO conferencia_oeste;
GRANT ALL ON Vista_Conferencia_OESTE_estadsiticas TO conferencia_oeste;
GRANT ALL ON Vista_Conferencia_OESTE_partidos TO conferencia_oeste;

GRANT ALL ON Vista_division_ATLANTICA_equipos TO division_atlantica;
GRANT ALL ON Vista_division_ATLANTICA_jugadores TO division_atlantica;
GRANT ALL ON Vista_division_ATLANTICA_estadsiticas TO division_atlantica;
GRANT ALL ON Vista_division_ATLANTICA_partidos TO division_atlantica;

GRANT ALL ON Vista_division_SUDESTE_equipos TO division_sudeste;
GRANT ALL ON Vista_division_SUDESTE_jugadores TO division_sudeste;
GRANT ALL ON Vista_division_SUDESTE_estadsiticas TO division_sudeste;
GRANT ALL ON Vista_division_SUDESTE_partidos TO division_sudeste;

GRANT ALL ON Vista_division_CENTRAL_equipos TO division_central;
GRANT ALL ON Vista_division_CENTRAL_jugadores TO division_central;
GRANT ALL ON Vista_division_CENTRAL_estadsiticas TO division_central;
GRANT ALL ON Vista_division_CENTRAL_partidos TO division_central;

GRANT ALL ON Vista_division_PACIFICO_equipos TO division_pacifico;
GRANT ALL ON Vista_division_PACIFICO_jugadores TO division_pacifico;
GRANT ALL ON Vista_division_PACIFICO_estadsiticas TO division_pacifico;
GRANT ALL ON Vista_division_PACIFICO_partidos TO division_pacifico;

GRANT ALL ON Vista_division_SUDOESTE_equipos TO division_sudoeste;
GRANT ALL ON Vista_division_SUDOESTE_jugadores TO division_sudoeste;
GRANT ALL ON Vista_division_SUDOESTE_estadsiticas TO division_sudoeste;
GRANT ALL ON Vista_division_SUDOESTE_partidos TO division_sudoeste;

GRANT ALL ON Vista_division_NOROESTE_equipos TO division_noroeste;
GRANT ALL ON Vista_division_NOROESTE_jugadores TO division_noroeste;
GRANT ALL ON Vista_division_NOROESTE_estadsiticas TO division_noroeste;
GRANT ALL ON Vista_division_NOROESTE_partidos TO division_noroeste;
   
#--------------------------------------------------------------------------------------------
#	5. 	BORRAMOS Y CREAMOS LOS USUARIOS, ASINGNÁNDOLES POR DEFECTO SU ROL ASOCIADO
#	Los usuarios serán creados todos con la misma clave 'abc'
#--------------------------------------------------------------------------------------------
#	CREATE USER <usuario>	IDENTIFIED BY <clave>	DEFAULT ROLE <rol>
#--------------------------------------------------------------------------------------------
#	Fulgencio y Fulgencia
#	Guillermino y Guillermina
#	Pancracio y Pancracia
#	Filomeno y Filomena
#	Anaximandro y Anaximandra
#	Romino y Romina
#	Agapito y Agapita
#	Apolonio y Apolonia
#	Luzdivino y Luzdivina
#--------------------------------------------------------------------------------------------
 
DROP USER IF EXISTS Fulgencio;
CREATE USER Fulgencio IDENTIFIED BY 'abc';
GRANT NBA TO Fulgencio;
SET DEFAULT ROLE NBA FOR Fulgencio;

DROP USER IF EXISTS Fulgencia;
CREATE USER Fulgencia IDENTIFIED BY 'abc';
GRANT NBA TO Fulgencia;
SET DEFAULT ROLE NBA FOR Fulgencia;

DROP USER IF EXISTS Guillermino;
CREATE USER Guillermino IDENTIFIED BY 'abc';
GRANT conferencia_Este TO Guillermino;
SET DEFAULT ROLE conferencia_Este FOR Guillermino;

DROP USER IF EXISTS Guillermina;
CREATE USER Guillermina IDENTIFIED BY 'abc';
GRANT conferencia_Este TO Guillermina;
SET DEFAULT ROLE conferencia_Este FOR Guillermina;

DROP USER IF EXISTS Pancracio;
CREATE USER Pancracio IDENTIFIED BY 'abc';
GRANT conferencia_Oeste TO Pancracio;
SET DEFAULT ROLE conferencia_Oeste FOR Pancracio;

DROP USER IF EXISTS Pancracia;
CREATE USER Pancracia IDENTIFIED BY 'abc';
GRANT conferencia_Oeste TO Pancracia;
SET DEFAULT ROLE conferencia_Oeste FOR Pancracia;

DROP USER IF EXISTS Filomeno;
CREATE USER Filomeno IDENTIFIED BY 'abc';
GRANT division_Atlantica TO Filomeno;
SET DEFAULT ROLE division_Atlantica FOR Filomeno;

DROP USER IF EXISTS Filomena;
CREATE USER Filomena IDENTIFIED BY 'abc';
GRANT division_Atlantica TO Filomena;
SET DEFAULT ROLE division_Atlantica FOR Filomena;

DROP USER IF EXISTS Anaximandro;
CREATE USER Anaximandro IDENTIFIED BY 'abc';
GRANT division_Sudeste TO Anaximandro;
SET DEFAULT ROLE division_Sudeste FOR Anaximandro;

DROP USER IF EXISTS Anaximandra;
CREATE USER Anaximandra IDENTIFIED BY 'abc';
GRANT division_Sudeste TO Anaximandra;
SET DEFAULT ROLE division_Sudeste FOR Anaximandra ;

DROP USER IF EXISTS Romino;
CREATE USER Romino IDENTIFIED BY 'abc';
GRANT division_Central TO Romino;
SET DEFAULT ROLE division_Central FOR Romino;

DROP USER IF EXISTS Romina;
CREATE USER Romina IDENTIFIED BY 'abc';
GRANT division_Central TO Romina;
SET DEFAULT ROLE division_Central FOR Romina;

DROP USER IF EXISTS Agapito;
CREATE USER Agapito IDENTIFIED BY 'abc';
GRANT division_Pacifico TO Agapito;
SET DEFAULT ROLE division_Pacifico FOR Agapito ;

DROP USER IF EXISTS Agapita;
CREATE USER Agapita IDENTIFIED BY 'abc';
GRANT division_Pacifico TO Agapita;
SET DEFAULT ROLE division_Pacifico FOR Agapita;

DROP USER IF EXISTS Apolonio;
CREATE USER Apolonio IDENTIFIED BY 'abc';
GRANT division_Sudoeste TO Apolonio;
SET DEFAULT ROLE division_Sudoeste FOR Apolonio;

DROP USER IF EXISTS Apolonia;
CREATE USER Apolonia IDENTIFIED BY 'abc';
GRANT division_Sudoeste TO Apolonia;
SET DEFAULT ROLE division_Sudoeste FOR Apolonia;

DROP USER IF EXISTS Luzdivino;
CREATE USER Luzdivino IDENTIFIED BY 'abc';
GRANT division_Noroeste TO Luzdivino;
SET DEFAULT ROLE division_Noroeste FOR Luzdivino;

DROP USER IF EXISTS Luzdivina;
CREATE USER Luzdivina IDENTIFIED BY 'abc';
GRANT division_Noroeste TO Luzdivina;
SET DEFAULT ROLE division_Noroeste FOR Luzdivina;
 
#--------------------------------------------------------------------------------------------
#	6. REFRESCA LOS PRIVILEGIOS
#--------------------------------------------------------------------------------------------
#	FLUSH PRIVILEGES;
#--------------------------------------------------------------------------------------------
FLUSH PRIVILEGES;
