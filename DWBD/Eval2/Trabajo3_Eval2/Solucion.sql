-- Crear una transacción
START TRANSACTION;

-- Crear puntos de restauración
SAVEPOINT Punto1;
SAVEPOINT Punto2;

-- Insertar valores en la tabla
INSERT INTO comarca (nombre, idProvincia) VALUES ('Betanzons de Arriba', '10');
INSERT INTO concello (nombre, superficie, idComarca) VALUES ('Frodo', 500000.45, '104');

-- Mostrar todos los valores introducidos en la tabla
SELECT * FROM comarca;
SELECT * FROM concello;

-- Restaurar hacia alguno de los puntos de restauración
ROLLBACK TO SAVEPOINT Punto1;

-- Mostrar los valores que hay en la tabla después de la restauración
SELECT * FROM comarca;
SELECT * FROM concello;

-- Copiar los INSERT de los datos que necesites
-- Puedes obtener los INSERT utilizando la salida de las consultas anteriores

-- Borrado completo de los datos introducidos
DELETE FROM comarca;
DELETE FROM concello;

-- Mostrar los valores que hay en la tabla después del borrado
SELECT * FROM comarca;
SELECT * FROM concello;

-- Copiar los INSERT de los datos que necesites
-- Puedes obtener los INSERT utilizando la salida de las consultas anteriores

-- Confirmar finalmente los datos introducidos
COMMIT;

-- Comprobar los valores que hay en la tabla después de la confirmación
SELECT * FROM comarca;
SELECT * FROM concello;
