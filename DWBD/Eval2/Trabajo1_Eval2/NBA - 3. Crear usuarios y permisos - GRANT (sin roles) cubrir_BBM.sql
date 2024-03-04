#--------------------------------------------------------------------------------------------
#	1.	UTILIZAMOS LA BASE DE DATOS 'NBA'
#--------------------------------------------------------------------------------------------
#	USE <base de datos>
#--------------------------------------------------------------------------------------------
use NBA;
    
#--------------------------------------------------------------------------------------------
#	2. 	BORRAMOS Y CREAMOS LOS USUARIOS: hay 2 Conferencias (East, West) y 3 divisiones en cada una (Atlantic, SouthEast, Central) y (Pacific, SouthWest, NorthWest)
#	Los usuarios serán creados todos con la misma clave 'abc'
#--------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <usuario>		CREATE USER <usuario>	IDENTIFIED BY <clave>
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

DROP USER IF EXISTS Fulgencia;
CREATE USER Fulgencia IDENTIFIED BY 'abc';

DROP USER IF EXISTS Guillermino;
CREATE USER Guillermino IDENTIFIED BY 'abc';

DROP USER IF EXISTS Guillermina;
CREATE USER Guillermina IDENTIFIED BY 'abc';

DROP USER IF EXISTS Pancracio;
CREATE USER Pancracio IDENTIFIED BY 'abc';

DROP USER IF EXISTS Pancracia;
CREATE USER Pancracia IDENTIFIED BY 'abc';

DROP USER IF EXISTS Filomeno;
CREATE USER Filomeno IDENTIFIED BY 'abc';

DROP USER IF EXISTS Filomena;
CREATE USER Filomena IDENTIFIED BY 'abc';

DROP USER IF EXISTS Anaximandro;
CREATE USER Anaximandro IDENTIFIED BY 'abc';

DROP USER IF EXISTS Anaximandra;
CREATE USER Anaximandra IDENTIFIED BY 'abc';

DROP USER IF EXISTS Romino;
CREATE USER Romino IDENTIFIED BY 'abc';

DROP USER IF EXISTS Romina;
CREATE USER Romina IDENTIFIED BY 'abc';

DROP USER IF EXISTS Agapito;
CREATE USER Agapito IDENTIFIED BY 'abc';

DROP USER IF EXISTS Agapita;
CREATE USER Agapita IDENTIFIED BY 'abc';

DROP USER IF EXISTS Apolonio;
CREATE USER Apolonio IDENTIFIED BY 'abc';

DROP USER IF EXISTS Apolonia;
CREATE USER Apolonia IDENTIFIED BY 'abc';

DROP USER IF EXISTS Luzdivino;
CREATE USER Luzdivino IDENTIFIED BY 'abc';

DROP USER IF EXISTS Luzdivina;
CREATE USER Luzdivina IDENTIFIED BY 'abc';

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
DROP VIEW IF EXISTS Vista_Division_Sudoeste_Estadisticas;
CREATE VIEW Vista_Division_Sudoeste_Estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_division_Sudoeste_jugadores);

-- Borrar y crear Vista_Division_Noroeste
DROP VIEW IF EXISTS Vista_Division_Noroeste_Estadisticas;
CREATE VIEW Vista_Division_Noroeste_Estadisticas AS SELECT * FROM estadisticas WHERE jugador IN (select codigo from vista_division_Noroeste_jugadores);


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
#	4. ASIGNAMOS PRIVILEGIOS (O PERMISOS) A LOS USUARIOS
#--------------------------------------------------------------------------------------------
#	GRANT <permiso>	ON <vista>	TO <usuario>, ...
#--------------------------------------------------------------------------------------------
#		USUARIOS						ACCESO
#
#	Fulgencio y Fulgencia					Todos los datos de Equipos, Jugadores, Estadisticas y Partidos
#	Guillermino y Guillermina				Todos los datos de Equipos, Jugadores, Estadisticas y Partidos de la Conferencia ESTE
#	Pancracio y Pancracia					Todos los datos de Equipos, Jugadores, Estadisticas y Partidos de la Conferencia OESTE
#	Filomeno y Filomena						Todos los datos de Equipos, Jugadores, Estadisticas y Partidos de la División Atlántica
#	Anaximandro y Anaximandra				Todos los datos de Equipos, Jugadores, Estadisticas y Partidos de la División Sudeste
#	Romino y Romina							Todos los datos de Equipos, Jugadores, Estadisticas y Partidos de la División Central
#	Agapito y Agapita						Todos los datos de Equipos, Jugadores, Estadisticas y Partidos de la División Pacífico
#	Apolonio y Apolonia						Todos los datos de Equipos, Jugadores, Estadisticas y Partidos de la División Sudoeste
#	Luzdivino y Luzdivina					Todos los datos de Equipos, Jugadores, Estadisticas y Partidos de la División Noroeste
#--------------------------------------------------------------------------------------------
GRANT ALL ON Vista_equipos TO Fulgencio, Fulgencia;
GRANT ALL ON Vista_jugadores TO Fulgencio, Fulgencia;
GRANT ALL ON Vista_estadisticas TO Fulgencio, Fulgencia;
GRANT ALL ON Vista_partidos TO Fulgencio, Fulgencia;

GRANT ALL ON Vista_Conferencia_ESTE_equipos TO Guillermino, Guillermina;
GRANT ALL ON Vista_Conferencia_ESTE_jugadores TO Guillermino, Guillermina;
GRANT ALL ON Vista_Conferencia_ESTE_estadisticas TO Guillermino, Guillermina;
GRANT ALL ON Vista_Conferencia_ESTE_partidos TO Guillermino, Guillermina;

GRANT ALL ON Vista_Conferencia_OESTE_equipos TO Pancracio, Pancracia;
GRANT ALL ON Vista_Conferencia_OESTE_jugadores TO Pancracio, Pancracia;
GRANT ALL ON Vista_Conferencia_OESTE_estadisticas TO Pancracio, Pancracia;
GRANT ALL ON Vista_Conferencia_OESTE_partidos TO Pancracio, Pancracia;

GRANT ALL ON Vista_division_ATLANTICA_equipos TO Filomeno, Filomena;
GRANT ALL ON Vista_division_ATLANTICA_jugadores TO Filomeno, Filomena;
GRANT ALL ON Vista_division_ATLANTICA_estadsiticas TO Filomeno, Filomena;	
GRANT ALL ON Vista_division_ATLANTICA_partidos TO Filomeno, Filomena;	

GRANT ALL ON Vista_division_SUDESTE_equipos TO Anaximandro, Anaximandra;	
GRANT ALL ON Vista_division_SUDESTE_jugadores TO Anaximandro, Anaximandra;	
GRANT ALL ON Vista_division_SUDESTE_estadisticas TO Anaximandro, Anaximandra;	
GRANT ALL ON Vista_division_SUDESTE_partidos TO Anaximandro, Anaximandra;	

GRANT ALL ON Vista_division_CENTRAL_equipos TO Romino, Romina;
GRANT ALL ON Vista_division_CENTRAL_jugadores TO Romino, Romina;
GRANT ALL ON Vista_division_CENTRAL_estadisticas TO Romino, Romina;
GRANT ALL ON Vista_division_CENTRAL_partidos TO Romino, Romina;

GRANT ALL ON Vista_division_PACIFICO_equipos TO Agapito, Agapita;
GRANT ALL ON Vista_division_PACIFICO_jugadores TO Agapito, Agapita;
GRANT ALL ON Vista_division_PACIFICO_estadisticas TO Agapito, Agapita;
GRANT ALL ON Vista_division_PACIFICO_partidos TO Agapito, Agapita;

GRANT ALL ON Vista_division_SUDOESTE_equipos TO Apolonio, Apolonia;	
GRANT ALL ON Vista_division_SUDOESTE_jugadores TO Apolonio, Apolonia;
GRANT ALL ON Vista_division_SUDOESTE_estadisticas TO Apolonio, Apolonia;
GRANT ALL ON Vista_division_SUDOESTE_partidos TO Apolonio, Apolonia;

GRANT ALL ON Vista_division_NOROESTE_equipos TO Luzdivino, Luzdivina;
GRANT ALL ON Vista_division_NOROESTE_jugadores TO Luzdivino, Luzdivina;
GRANT ALL ON Vista_division_NOROESTE_estadisticas TO Luzdivino, Luzdivina;
GRANT ALL ON Vista_division_NOROESTE_partidos TO Luzdivino, Luzdivina;
#--------------------------------------------------------------------------------------------
#	5. REFRESCAMOS LOS PRIVILEGIOS
#--------------------------------------------------------------------------------------------
#	FLUSH PRIVILEGES;
#--------------------------------------------------------------------------------------------
FLUSH PRIVILEGES;

