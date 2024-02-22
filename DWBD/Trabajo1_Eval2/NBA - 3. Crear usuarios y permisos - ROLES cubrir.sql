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
-- Borrar todos los roles existentes (ten en cuenta que esto eliminará todos los roles, incluyendo aquellos que podrían haber sido creados independientemente de la NBA)
DROP ROLE IF EXISTS NBA, Este, Oeste, Atlantico, Sudeste, Central, Pacifico, Sudoeste, Noroeste;

-- Crear el rol asociado a la NBA
CREATE ROLE NBA;

-- Crear roles para cada conferencia
CREATE ROLE Este;
CREATE ROLE Oeste;

-- Crear roles para cada división
CREATE ROLE Atlantico;
CREATE ROLE Sudeste;
CREATE ROLE Central;
CREATE ROLE Pacifico;
CREATE ROLE Sudoeste;
CREATE ROLE Noroeste; 

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
-- Borrar y crear Vista_Conferencia_ESTE
DROP VIEW IF EXISTS Vista_Conferencia_ESTE;
CREATE VIEW Vista_Conferencia_ESTE AS SELECT * FROM Equipos WHERE Conferencia = 'East';

-- Borrar y crear Vista_Conferencia_OESTE
DROP VIEW IF EXISTS Vista_Conferencia_OESTE;
CREATE VIEW Vista_Conferencia_OESTE AS SELECT * FROM Equipos WHERE Conferencia = 'West';

-- Borrar y crear Vista_Division_Atlantica
DROP VIEW IF EXISTS Vista_Division_Atlantica_equipos;
CREATE VIEW Vista_Division_Atlantica AS SELECT * FROM Equipos WHERE Division = 'Atlantic';

-- Borrar y crear Vista_Division_Sudeste
DROP VIEW IF EXISTS Vista_Division_Sudeste_equipos;
CREATE VIEW Vista_Division_Sudeste AS SELECT * FROM Equipos WHERE Division = 'SouthEast';

-- Borrar y crear Vista_Division_Central
DROP VIEW IF EXISTS Vista_Division_Central_equipos;
CREATE VIEW Vista_Division_Central AS SELECT * FROM Equipos WHERE Division = 'Central';

-- Borrar y crear Vista_Division_Pacifico
DROP VIEW IF EXISTS Vista_Division_Pacifico_equipos;
CREATE VIEW Vista_Division_Pacifico AS SELECT * FROM Equipos WHERE Division = 'Pacific';

-- Borrar y crear Vista_Division_Sudoeste
DROP VIEW IF EXISTS Vista_Division_Sudoeste_equipos;
CREATE VIEW Vista_Division_Sudoeste AS SELECT * FROM Equipos WHERE Division = 'SouthWest';

-- Borrar y crear Vista_Division_Noroeste
DROP VIEW IF EXISTS Vista_Division_Noroeste_equipos;
CREATE VIEW Vista_Division_Noroeste AS SELECT * FROM Equipos WHERE Division = 'NorthWest';

-- JUGADORES
-- Borrar y crear Vista_Conferencia_ESTE_jugadores
DROP VIEW IF EXISTS Vista_Conferencia_ESTE;
CREATE VIEW Vista_Conferencia_ESTE AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_conferencia_este);

-- Borrar y crear Vista_Conferencia_OESTE_jugadores
DROP VIEW IF EXISTS Vista_Conferencia_OESTE;
CREATE VIEW Vista_Conferencia_OESTE AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_conferencia_oeste);

-- Borrar y crear Vista_Division_Atlantica_jugadores
DROP VIEW IF EXISTS Vista_Division_Atlantica;
CREATE VIEW Vista_Division_Atlantica AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_atlantica);

-- Borrar y crear Vista_Division_Sudeste
DROP VIEW IF EXISTS Vista_Division_Sudeste;
CREATE VIEW Vista_Division_Sudeste AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_sudeste);

-- Borrar y crear Vista_Division_Central
DROP VIEW IF EXISTS Vista_Division_Central;
CREATE VIEW Vista_Division_Central AS SELECT * FROM Jugadores WHERE equipo IN (select nombre from vista_division_atlantica);

-- Borrar y crear Vista_Division_Pacifico
DROP VIEW IF EXISTS Vista_Division_Pacifico;
CREATE VIEW Vista_Division_Pacifico AS SELECT * FROM Jugadores WHERE Division = 'Pacifico';

-- Borrar y crear Vista_Division_Sudoeste
DROP VIEW IF EXISTS Vista_Division_Sudoeste;
CREATE VIEW Vista_Division_Sudoeste AS SELECT * FROM Jugadores WHERE Division = 'Sudoeste';

-- Borrar y crear Vista_Division_Noroeste
DROP VIEW IF EXISTS Vista_Division_Noroeste;
CREATE VIEW Vista_Division_Noroeste AS SELECT * FROM Jugadores WHERE Division = 'Noroeste';

-- Borrar y crear Vista_Conferencia_ESTE
DROP VIEW IF EXISTS Vista_Conferencia_ESTE;
CREATE VIEW Vista_Conferencia_ESTE AS SELECT * FROM estadisticas WHERE Conferencia = 'Este';

-- Borrar y crear Vista_Conferencia_OESTE
DROP VIEW IF EXISTS Vista_Conferencia_OESTE;
CREATE VIEW Vista_Conferencia_OESTE AS SELECT * FROM estadisticas WHERE Conferencia = 'Oeste';

-- Borrar y crear Vista_Division_Atlantica
DROP VIEW IF EXISTS Vista_Division_Atlantica;
CREATE VIEW Vista_Division_Atlantica AS SELECT * FROM estadisticas WHERE Division = 'Atlantica';

-- Borrar y crear Vista_Division_Sudeste
DROP VIEW IF EXISTS Vista_Division_Sudeste;
CREATE VIEW Vista_Division_Sudeste AS SELECT * FROM estadisticas WHERE Division = 'Sudeste';

-- ESTADSITICAS
-- Borrar y crear Vista_Division_Central
DROP VIEW IF EXISTS Vista_Division_Central;
CREATE VIEW Vista_Division_Central AS SELECT * FROM estadisticas WHERE Division = 'Central';

-- Borrar y crear Vista_Division_Pacifico
DROP VIEW IF EXISTS Vista_Division_Pacifico;
CREATE VIEW Vista_Division_Pacifico AS SELECT * FROM estadisticas WHERE Division = 'Pacifico';

-- Borrar y crear Vista_Division_Sudoeste
DROP VIEW IF EXISTS Vista_Division_Sudoeste;
CREATE VIEW Vista_Division_Sudoeste AS SELECT * FROM estadisticas WHERE Division = 'Sudoeste';

-- Borrar y crear Vista_Division_Noroeste
DROP VIEW IF EXISTS Vista_Division_Noroeste;
CREATE VIEW Vista_Division_Noroeste AS SELECT * FROM estadisticas WHERE Division = 'Noroeste';

-- Repetir el mismo patrón para otras vistas según tus necesidades y estructura de la

#--------------------------------------------------------------------------------------------
#	4. ASIGNAMOS PRIVILEGIOS (O PERMISOS) A LOS ROLES
#--------------------------------------------------------------------------------------------
#	GRANT <privilegio>	ON <vista>	TO 	<rol>
#--------------------------------------------------------------------------------------------

   
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
 
 
#--------------------------------------------------------------------------------------------
#	6. REFRESCA LOS PRIVILEGIOS
#--------------------------------------------------------------------------------------------
#	FLUSH PRIVILEGES;
#--------------------------------------------------------------------------------------------

