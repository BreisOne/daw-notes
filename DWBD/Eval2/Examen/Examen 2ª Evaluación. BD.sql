---------------------------------------------------------------------------------------------------------------------------
--  EXAMEN DE BASES DE DATOS - SEGUNDA EVALUACIÓN DE DAW - ALUMNADO DUAL
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
--  EMBARCACIONES DE VIGO
---------------------------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS EmbarcacionesVigo;
CREATE DATABASE EmbarcacionesVigo;
USE EmbarcacionesVigo;

---------------------------------------------------------------------------------------------------------------------------
-- Borramos las tablas de la base de datos
---------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS BarcoPuerto;
DROP TABLE IF EXISTS BarcoTripulante;
DROP TABLE IF EXISTS Ruta;
DROP TABLE IF EXISTS Tripulante;
DROP TABLE IF EXISTS Puerto;
DROP TABLE IF EXISTS Barco;
DROP TABLE IF EXISTS Propietario;

---------------------------------------------------------------------------------------------------------------------------
-- CREAMOS LAS TABLAS
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
-- Creamos la tabla Propietario
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Propietario (
    idPropietario 				INT,
    NombrePropietario			VARCHAR( 100 ),
    ApellidosPropietario		VARCHAR( 100 ),
    Direccion 					VARCHAR( 200 ),
    TelefonoPropietario			VARCHAR(  20 ),
    Nacionalidad 				VARCHAR(  50 ),
    CONSTRAINT PK_Propietario			PRIMARY KEY ( idPropietario )
);

---------------------------------------------------------------------------------------------------------------------------
-- Creamos la tabla Barco
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Barco (
    idBarco 					INT,
    NombreBarco					VARCHAR( 100 ),
    Tipo 						VARCHAR(  50 ),
    AnoConstruccion 			INT,
    Manga 						FLOAT,
    Eslora 						FLOAT,
    Peso 						FLOAT,
    NumeroRegistro 				VARCHAR(  20 ),
    TelefonoBarco				VARCHAR(  20 ),
    Propietario 				INT,
    CONSTRAINT PK_Barco					PRIMARY KEY ( idBarco ),
    CONSTRAINT FK_Propietario_Barco FOREIGN KEY ( Propietario)	REFERENCES Propietario( idPropietario )
);

---------------------------------------------------------------------------------------------------------------------------
-- Creamos la tabla Puerto
-- Tabla que almacena los puertos de la base de datos, contiene una clave principal de tipo entero (idPuerto), un varchar de 100 para almancenar el nombre del puerto, un varcar de 200 caracteres para la ubicacion, la capacidad máxima del barco como un entero
-- El capitan responsable almacenado en un varchar de 100 y el telefono del puerto como un varchar de 20 caracteres.
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Puerto (
    idPuerto 					INT,
    NombrePuerto				VARCHAR( 100 ),
    Ubicacion 					VARCHAR( 200 ),
    CapacidadMaximaBarcos 		INT,
    CapitanResponsable 			VARCHAR( 100 ),
    TelefonoPuerto				VARCHAR(  20 ),
    CONSTRAINT PK_Puerto				PRIMARY KEY( idPuerto )
);

---------------------------------------------------------------------------------------------------------------------------
-- Creamos la tabla Tripulante 
-- Tabla que almacena los tripulantes con una clave primaria con id Tripulante de tipo entero, nombre de tripulante con un character cariable de hasta 100 para el nombre del tripulante, otro pala los apellidos, un varchar de 50 caracteres para el apodo y otro carchar de 200 caracteres apra ostros datos del tripulante. 
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tripulante (
    idTripulante 				INT,
    NombreTripulante			VARCHAR( 100 ),
    ApellidosTripulante			VARCHAR( 100 ),
    Apodo 						VARCHAR(  50 ),
    OtrosDatosTripulante		VARCHAR( 200 ),
    CONSTRAINT PK_Tripulante			PRIMARY KEY( idTripulante )
);

---------------------------------------------------------------------------------------------------------------------------
-- Creamos la tabla Ruta
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Ruta (
    idRuta 						INT,
    NombreRuta					VARCHAR( 100 ),
    Distancia 					FLOAT,
    DuracionEstimada 			FLOAT,
    Coste 						FLOAT,
    PuertoOrigen				INT,
    PuertoDestino				INT,
    CONSTRAINT PK_Ruta					PRIMARY KEY ( idRuta ),
    CONSTRAINT FK_Ruta_PuertoOrigen 	FOREIGN KEY ( PuertoOrigen )	REFERENCES Puerto( idPuerto ),
    CONSTRAINT FK_Ruta_PuertoDestino 	FOREIGN KEY ( PuertoDestino )	REFERENCES Puerto( idPuerto )
);

---------------------------------------------------------------------------------------------------------------------------
-- Creamos la tabla BarcoRuta
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE BarcoRuta (
    idBarcoPuerto				INT,
    Barco						INT,
    Ruta						INT,
    Fecha 						DATE,
    CONSTRAINT PK_BarcoPuerto			PRIMARY KEY ( idBarcoPuerto ),
    CONSTRAINT FK_BarcoPuerto_Barco 	FOREIGN KEY ( Barco )		REFERENCES Barco( idBarco ),
    CONSTRAINT FK_BarcoPuerto_Puerto	FOREIGN KEY ( Ruta )			REFERENCES Ruta( idRuta )
);

---------------------------------------------------------------------------------------------------------------------------
-- Creamos la tabla BarcoTripulante
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE BarcoTripulante (
    idBarcoTripulante 			INT,
    Barco 						INT,
    Tripulante 					INT,
    FechaContratacion 			DATE,
    RolTripulante				VARCHAR( 50 ),
    Salario 					FLOAT,
    CONSTRAINT PK_BarcoTripulante				PRIMARY KEY ( idBarcoTripulante ),
    CONSTRAINT FK_BarcoTripulante_Barco			FOREIGN KEY ( Barco ) 		REFERENCES Barco( idBarco ),
    CONSTRAINT FK_BarcoTripulante_Tripulante 	FOREIGN KEY ( Tripulante ) 	REFERENCES Tripulante( idTripulante )
);

---------------------------------------------------------------------------------------------------------------------------
-- AGREGAMOS LOS DATOS
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
-- Agregamos datos a la tabla Propietario
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO Propietario VALUES (  1, 'Juan de Dios', 'García Pérez', 'Calle Principal 13', '586456789', 'Español' );
INSERT INTO Propietario VALUES (  2, 'María Elena', 'López Villaverde', 'Avenida Central 56', '587654321', 'Mexicano' );
INSERT INTO Propietario VALUES (  3, 'Carlos', 'Martínez Soria', 'Calle Secundaria 79', '509222333', 'Colombiano' );
INSERT INTO Propietario VALUES (  4, 'Ana', 'Rodríguez Rodríguez', 'Paseo Marítimo 24', '508555666', 'Argentino' );
INSERT INTO Propietario VALUES (  5, 'Pedro', 'Fernández Gómez', 'Calle del Puerto 57', '509888999', 'Chileno' );
INSERT INTO Propietario VALUES (  6, 'Laura Sofía', 'Pérez Guía', 'Avenida del Mar 80', '596123123', 'Peruano' );
INSERT INTO Propietario VALUES (  7, 'Diego', 'Gómez Gutiérrez', 'Paseo de los Pescadores 11', '586456456', 'Español' );
INSERT INTO Propietario VALUES (  8, 'Sofía María', 'Hernández Pérez', 'Calle Costera 2', '589789789', 'Ecuatoriano' );
INSERT INTO Propietario VALUES (  9, 'Javier Enrique', 'Díaz Córdoba', 'Avenida del Mar 33', '500999888', 'Cubano' );
INSERT INTO Propietario VALUES ( 10, 'Elena', 'González González', 'Calle del Faro 4', '577000111', 'Paraguayo' );

---------------------------------------------------------------------------------------------------------------------------
-- Agregamos datos a la tabla Barco
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO Barco VALUES (  1, 'Mar Azul', 'Yate', 2015, 10.5, 25.3, 150.2, 'ABC123', '700456789', 1 );
INSERT INTO Barco VALUES (  2, 'Viento Veloz', 'Velero', 2010, 8.7, 20.1, 100.5, 'DEF456', '987654321', 3 );
INSERT INTO Barco VALUES (  3, 'Estrella del Mar', 'Crucero', 2018, 15.2, 35.6, 200.9, 'GHI789', '702222333', 10 );
INSERT INTO Barco VALUES (  4, 'Aventura Marina', 'Lancha', 2016, 6.3, 18.7, 80.4, 'JKL012', '444555666', 7 );
INSERT INTO Barco VALUES (  5, 'Sirena Encantada', 'Yate', 2019, 12.8, 30.4, 180.6, 'MNO345', '777888999', 9 );
INSERT INTO Barco VALUES (  6, 'Bravo Delta', 'Velero', 2014, 9.5, 22.6, 120.3, 'PQR678', '123123123', 8 );
INSERT INTO Barco VALUES (  7, 'Onda Marina', 'Crucero', 2017, 14.0, 32.1, 190.0, 'STU901', '456456456', 4 );
INSERT INTO Barco VALUES (  8, 'Mariposa Azul', 'Lancha', 2013, 7.2, 19.8, 90.5, 'VWX234', '789789789', 2 );
INSERT INTO Barco VALUES (  9, 'Aurora Boreal', 'Yate', 2020, 11.6, 28.3, 160.8, 'YZA567', '000999888', 6);
INSERT INTO Barco VALUES ( 10, 'Viento Marino', 'Velero', 2012, 8.9, 21.5, 110.2, 'BCD890', '777000111', 5 );

---------------------------------------------------------------------------------------------------------------------------
-- Agregamos datos a la tabla Puerto
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO Puerto  VALUES  ( 1, 'Puerto deportivo de Cangas', 'Cangas', 8, 'Uxía Pereiro Rodríguez', '884567337' );
INSERT INTO Puerto  VALUES  ( 2, 'Puerto náutico de Portonovo', 'Portonovo', 7, 'Antón Seixa Ermida', '886134587' );
INSERT INTO Puerto  VALUES  ( 3, 'Puerto náutico de Sanxenxo', 'Sanxenxo', 9, 'Xoana Díaz Lópoez', 	  '867450763' );
INSERT INTO Puerto  VALUES  ( 4, 'Puerto pesquero de Moaña', 'Moaña', 5, 'Lois Croque Ouso', 		  '867786747' );
INSERT INTO Puerto  VALUES  ( 5, 'Puerto marinero de Nigrán', 'Nigrán', 8, 'Carme Martínez Fermín',   '897852261' );
INSERT INTO Puerto  VALUES  ( 6, 'Puerto marinero de Baiona', 'Baiona', 7, 'Breogán Outeiro Galán',   '822155797' );

---------------------------------------------------------------------------------------------------------------------------
-- Agregamos datos a la tabla Tripulante
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tripulante VALUES (  1, 'María José', 'García López', 'Marita', 'Experiencia en navegación de cruceros.' );
INSERT INTO Tripulante VALUES (  2, 'José Luis', 'Rodríguez López', 'Pepe', 'Especialista en mantenimiento de motores.' );
INSERT INTO Tripulante VALUES (  3, 'Ana María', 'Martínez Pérez', 'Anita', 'Especialista en maniobras de amarre.' );
INSERT INTO Tripulante VALUES (  4, 'Juan Carlos', 'Fernández Martínez', 'Juancho', 'Habilidad en navegación nocturna.' );
INSERT INTO Tripulante VALUES (  5, 'Laura Isabel', 'Hernández García', 'Laurita', 'Conocimientos en primeros auxilios.' );
INSERT INTO Tripulante VALUES (  6, 'Pedro Pablo', 'Gómez Pérez', 'Pedrito', 'Experto en navegación de aguas profundas.' );
INSERT INTO Tripulante VALUES (  7, 'Sofía Carmen', 'Díaz Rodríguez', 'Sofi', 'Experta en cocina a bordo.' );
INSERT INTO Tripulante VALUES (  8, 'Manuel Jesús', 'Ruiz Sánchez', 'Manu', 'Conocimientos avanzados en electrónica marina.' );
INSERT INTO Tripulante VALUES (  9, 'Elena Victoria', 'González Ruiz', 'Lenita', 'Buena capacidad de trabajo en equipo.' );
INSERT INTO Tripulante VALUES ( 10, 'David Alejandro', 'Hernández García', 'Davi', 'Experiencia en navegación en mares turbulentos.' );
INSERT INTO Tripulante VALUES ( 11, 'Carla María', 'Sánchez Gómez', 'Carly', 'Amplia experiencia en navegación costera.' );
INSERT INTO Tripulante VALUES ( 12, 'Francisco Javier', 'Díaz Ruiz', 'Paco', 'Habilidad en técnicas de navegación a vela.' );

---------------------------------------------------------------------------------------------------------------------------
-- Agregamos datos a la tabla Ruta
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO Ruta VALUES (  1, 'Cangas - A Toxa - Portonovo', 50.5, 10.0, 700.0, 1, 2 );
INSERT INTO Ruta VALUES (  2, 'Portonovo - Sanxenxo', 10.3, 12.5, 250.0, 2, 3 );
INSERT INTO Ruta VALUES (  3, 'Sanxenxo - Marín - Moaña', 180.8, 11.0, 550.0, 3, 4 );
INSERT INTO Ruta VALUES (  4, 'Moaña - Baiona - Nigrán', 220.6, 13.5, 650.0, 4, 5 );
INSERT INTO Ruta VALUES (  5, 'Nigrán - Baiona', 190.2, 11.8, 580.0, 5, 6 );
INSERT INTO Ruta VALUES (  6, 'Baiona - Vigo - Marín - Cangas', 160.7, 9.5, 520.0, 6, 1 );
INSERT INTO Ruta VALUES (  7, 'Cangas - Sanxenxo', 210.4, 12.0, 630.0, 1, 3 );
INSERT INTO Ruta VALUES (  8, 'Portonovo - Moaña', 240.1, 14.0, 680.0, 2, 4 );
INSERT INTO Ruta VALUES (  9, 'Sanxenxo - Vigo - Nigrán', 170.9, 10.3, 540.0, 3, 5 );
INSERT INTO Ruta VALUES ( 10, 'Moaña - Baiona', 230.0, 13.2, 660.0, 4, 6 );
INSERT INTO Ruta VALUES ( 11, 'Nigrán - Cangas', 200.5, 11.5, 600.0, 5, 1 );
INSERT INTO Ruta VALUES ( 12, 'Baiona - Portonovo', 180.0, 10.8, 550.0, 6, 2 );
INSERT INTO Ruta VALUES ( 13, 'Cangas - Moaña', 250.2, 14.5, 200.0, 1, 4 );
INSERT INTO Ruta VALUES ( 14, 'Vigo - Baiona - Vigo', 250.2, 14.5, 700.0, 1, 4);

---------------------------------------------------------------------------------------------------------------------------
-- Agregamos datos a la tabla BarcoRuta
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO BarcoRuta VALUES (  1,  1,  1, '2024-02-01' );
INSERT INTO BarcoRuta VALUES (  2,  2,  2, '2024-02-01' );
INSERT INTO BarcoRuta VALUES (  3, 10, 14, '2024-02-01' );
INSERT INTO BarcoRuta VALUES (  4,  3,  3, '2024-02-01' );
INSERT INTO BarcoRuta VALUES (  5,  4,  4, '2024-02-02' );
INSERT INTO BarcoRuta VALUES (  6,  5,  5, '2024-02-03' );
INSERT INTO BarcoRuta VALUES (  7,  9, 14, '2024-02-03' );
INSERT INTO BarcoRuta VALUES (  8,  6,  1, '2024-02-03' );
INSERT INTO BarcoRuta VALUES (  9,  7,  2, '2024-02-03' );
INSERT INTO BarcoRuta VALUES ( 10,  2,  2, '2024-02-04' );
INSERT INTO BarcoRuta VALUES ( 11,  8,  3, '2024-02-05' );
INSERT INTO BarcoRuta VALUES ( 12,  7, 11, '2024-02-05' );
INSERT INTO BarcoRuta VALUES ( 13,  2, 14, '2024-02-05' );
INSERT INTO BarcoRuta VALUES ( 14,  9,  4, '2024-02-05' );
INSERT INTO BarcoRuta VALUES ( 15,  1, 13, '2024-02-06' );
INSERT INTO BarcoRuta VALUES ( 16, 10,  5, '2024-03-07' );
INSERT INTO BarcoRuta VALUES ( 17,  9, 14, '2024-03-07' );
INSERT INTO BarcoRuta VALUES ( 18,  2,  2, '2024-02-08' );
INSERT INTO BarcoRuta VALUES ( 19,  9, 14, '2024-03-09' );
INSERT INTO BarcoRuta VALUES ( 20,  7,  2, '2024-02-09' );

---------------------------------------------------------------------------------------------------------------------------
-- Agregamos datos a tabla BarcoTripulante
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO BarcoTripulante VALUES (  1,  1, 1, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES (  2,  2, 3, '2024-03-04', 'Marinero', 1500.00);
INSERT INTO BarcoTripulante VALUES (  3,  2, 4, '2024-03-04', 'Marinero', 1500.00);
INSERT INTO BarcoTripulante VALUES (  4,  2, 1, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES (  5,  2, 3, '2024-03-04', 'Marinero', 1500.00);
INSERT INTO BarcoTripulante VALUES (  6,  4, 1, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES (  7,  3, 1, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES (  8, 10, 1, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES (  9,  8, 1, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES ( 10,  7, 1, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES ( 11,  5, 1, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES ( 12,  5, 2, '2024-03-04', 'Oficial', 2000.00);
INSERT INTO BarcoTripulante VALUES ( 13,  6, 3, '2024-03-04', 'Capitán', 1500.00);
INSERT INTO BarcoTripulante VALUES ( 14,  6, 3, '2024-03-04', 'Marinero', 1500.00);
INSERT INTO BarcoTripulante VALUES ( 15,  4, 4, '2024-03-04', 'Cocinero', 1800.00);
INSERT INTO BarcoTripulante VALUES ( 16,  5, 5, '2024-03-04', 'Ingeniero', 2200.00);
INSERT INTO BarcoTripulante VALUES ( 17,  6, 6, '2024-03-04', 'Técnico de navegación', 1900.00);
INSERT INTO BarcoTripulante VALUES ( 18,  7, 7, '2024-03-04', 'Marinero', 1500.00);
INSERT INTO BarcoTripulante VALUES ( 19,  8, 8, '2024-03-04', 'Oficial', 2000.00);
INSERT INTO BarcoTripulante VALUES ( 20,  9, 9, '2024-03-04', 'Capitán', 2500.00);
INSERT INTO BarcoTripulante VALUES ( 21, 10, 10, '2024-03-04', 'Marinero', 1500.00);
INSERT INTO BarcoTripulante VALUES ( 22,  1, 11, '2024-03-04', 'Ingeniero', 2200.00);
INSERT INTO BarcoTripulante VALUES ( 23,  2, 12, '2024-03-04', 'Cocinero', 1800.00);
INSERT INTO BarcoTripulante VALUES ( 24,  3,  3, '2024-03-04', 'Marinero', 1500.00);
INSERT INTO BarcoTripulante VALUES ( 25,  4,  4, '2024-03-04', 'Técnico de navegación', 1900.00);
INSERT INTO BarcoTripulante VALUES ( 26,  5, 10, '2024-03-04', 'Oficial', 2000.00);


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
-- UNIDAD BD04. REALIZACIÓN DE CONSULTAS - ( 1,50 puntos )		mínimo	0,375 puntos			cada respuesta 0,15 puntos
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--  1. Muestra el nombre completo, apodo y otros datos de los Tripulantes cuyo rol sea Capitán.
---------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tripulante inner join barcotripulante ON tripulante.idTripulante = barcotripulante.tripulante where barcotripulante.rolTripulante = "Capitán";

---------------------------------------------------------------------------------------------------------------------------
--  2. Muestra el nombre del barco o de los barcos que participe/n en el número mayor de rutas, mostrando también el número de rutas
---------------------------------------------------------------------------------------------------------------------------
Select NombreBarco, count(ruta) as numRutas from barco inner join  barcoruta on barco.idBarco = barcoruta.Barco group by barco.NombreBarco;

-- Solución correcta --
SELECT B.NombreBarco, COUNT(*) AS NumeroDeRutas FROM Barco B JOIN BarcoRuta BR ON B.idBarco = BR.Barco GROUP BY B.NombreBarco ORDER BY COUNT(*) DESC LIMIT 1;

---------------------------------------------------------------------------------------------------------------------------
--  3. Muestra el apodo de los Tripulantes cuyo nombre contenga, al menos una, 'a' y sus apellidos no contengan ni 'l' ni 'm'.
---------------------------------------------------------------------------------------------------------------------------
Select Apodo from tripulante where NombreTripulante like '%a%' AND apellidosTripulante regexp '^[^l|m]';

-- Solución correcta --
SELECT Apodo
FROM Tripulante
WHERE NombreTripulante LIKE '%a%' 
    AND (ApellidosTripulante NOT LIKE '%l%' AND ApellidosTripulante NOT LIKE '%m%');
        
---------------------------------------------------------------------------------------------------------------------------
--  4. Muestra el nombre del barco, el de su propietario y el del puerto de origen y destino de sus rutas, ordenado 
--     ascendentemente por el nombre del barco.
---------------------------------------------------------------------------------------------------------------------------

select b.NombreBarco, 
	concat(p.NombrePropietario, ' ', p.ApellidosPropietario) as 'Nombre Completo', 
    r.NombreRuta as "Puerto Origen-destino" 
    from barco as b 
    inner join propietario as p ON b.propietario = p.idpropietario 
    inner join barcoruta as br on br.barco = b.idBarco 
    inner join ruta as r on r.idRuta = br.ruta 
    order by b.NombreBarco ASC;
    
    -- Solución correcta --
SELECT 
    B.NombreBarco,
    P.NombrePropietario,
    PO.NombrePuerto AS PuertoOrigen,
    PD.NombrePuerto AS PuertoDestino
FROM Barco B
JOIN Propietario P ON B.Propietario = P.idPropietario
JOIN BarcoRuta BR ON B.idBarco = BR.Barco
JOIN Ruta R on r.idRuta = br.ruta 
JOIN Puerto PO ON R.PuertoOrigen = PO.idPuerto
JOIN Puerto PD ON R.PuertoDestino = PD.idPuerto
ORDER BY B.NombreBarco ASC;


---------------------------------------------------------------------------------------------------------------------------
--  5. Muestra los datos del barco (toda la información) y el nombre del propietario, cuyo barco tenga un peso entre 100 y 150 y su manga sea menor
--     que 9, o su barco meramente tenga una eslora mayor de 25 y menor de 30.
---------------------------------------------------------------------------------------------------------------------------

Select * 
from barco b 
inner join propietario p on b.propietario = p.idPropietario 
where (b.peso between 100 and 150) AND (b.manga < 9 OR b.eslora between 25 and 30);

-- Solución correcta --
SELECT 
    B.*,
    P.NombrePropietario
FROM Barco B
JOIN Propietario P ON B.Propietario = P.idPropietario
WHERE (B.Peso BETWEEN 100 AND 150 AND B.Manga < 9) OR (B.Eslora BETWEEN 25 AND 30);

---------------------------------------------------------------------------------------------------------------------------
--  6. Muestra el nombre de los barcos que hagan una ruta que pase por Portonovo o Marín.
--------------------------------------------------------------------------------------------------------------------------- 
select b.nombrebarco 
from barco b 
inner join barcoruta br on b.idBarco = br.barco 
inner join ruta r on br.ruta = r.idRuta 
where r.NombreRuta  like '%Portonovo%' OR r.nombreruta like '%Marín%';

-- Solucion correcta --
SELECT DISTINCT B.NombreBarco
FROM Barco B
JOIN BarcoRuta BR ON B.idBarco = BR.Barco
JOIN Ruta R ON BR.Ruta = R.idRuta
WHERE R.NombreRuta LIKE '%Portonovo%' OR R.NombreRuta LIKE '%Marín%';
---------------------------------------------------------------------------------------------------------------------------
--  7. Muestra el nombre del barco que ha recorrido la menor distancia junto con esa distancia recorrida.
---------------------------------------------------------------------------------------------------------------------------
-- Solución correcta --
SELECT 
    B.NombreBarco,
    MIN(R.Distancia) AS DistanciaRecorrida
FROM Barco B
JOIN BarcoRuta BR ON B.idBarco = BR.Barco
JOIN Ruta R ON BR.Ruta = R.idRuta
GROUP BY B.NombreBarco
ORDER BY DistanciaRecorrida LIMIT 1;

--------------------------------------------------------------------------------------------------------------------------
--  8. Muestra el nombre del barco, el nombre completo de sus tripulantes, el rol desempeñado y la fecha de contratación de
--     cada tripulante en cada barco. Ordena descendentemente en función del nombre del barco.
---------------------------------------------------------------------------------------------------------------------------
-- Solucion correcta -- 
SELECT 
    B.NombreBarco,
    CONCAT(T.NombreTripulante, ' ', T.ApellidosTripulante) AS NombreCompletoTripulante,
    BT.RolTripulante,
    BT.FechaContratacion
FROM Barco B
JOIN BarcoTripulante BT ON B.idBarco = BT.Barco
JOIN Tripulante T ON BT.Tripulante = T.idTripulante
JOIN Propietario P ON B.Propietario = P.idPropietario
ORDER BY B.NombreBarco DESC;


---------------------------------------------------------------------------------------------------------------------------
--  9. Muestra el nombre de la ruta de mayor longitud, su longitud y los barcos que la hacen
---------------------------------------------------------------------------------------------------------------------------
-- Solución correcta --
SELECT 
    R.NombreRuta,
    R.Distancia AS Longitud,
    B.NombreBarco
FROM Ruta R
JOIN BarcoRuta BR ON R.idRuta = BR.Ruta
JOIN Barco B ON BR.Barco = B.idBarco
WHERE R.Distancia = (SELECT MAX(Distancia) FROM Ruta);

---------------------------------------------------------------------------------------------------------------------------
-- 10. Muestra el nombre completo de los Tripulantes que tengan rol de Técnico de navegación, así como el nombre del barco 
--     en que desempeñe ese rol, la fecha de contratación y el salario asociado.
---------------------------------------------------------------------------------------------------------------------------
-- Solucion correcta --
SELECT 
    CONCAT(T.NombreTripulante, ' ', T.ApellidosTripulante) AS NombreCompletoTripulante,
    B.NombreBarco,
    BT.FechaContratacion,
    BT.Salario
FROM Tripulante T
JOIN BarcoTripulante BT ON T.idTripulante = BT.Tripulante
JOIN Barco B ON BT.Barco = B.idBarco
WHERE BT.RolTripulante = 'Técnico de navegación';

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
-- UNIDAD BD05. TRATAMIENTO DE DATOS - ( 1,50 puntos )		mínimo	0,375 puntos			cada respuesta 0,15 puntos
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--  1. Agrega los datos de los siguientes Tripulantes
---------------------------------------------------------------------------------------------------------------------------
--    Nombre			  Apellidos				  Apodo 				  Otros datos
---------------------------------------------------------------------------------------------------------------------------
--  | Fulgencio			| Villacid Montenegro   |						| Experto en cocina
--  | Celeste			| Campo Verde			| Celes					| Experta en navegación
--  | Agripino			| Amable Pérez			| Agri					| 
--  | Lilith			| Garza Urriaga			|						|
--  | Anacleto			| Bonachera Sorda		| Investigador			| Experto en solucionar problemas
--  | Siena				| Llagaria Zas			| 						|
--  | Alipio			| Cedeño Melgar			|						| Experto en mando
--  | Talía	Nala		| Mazagatos Píez		| Maza					|
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO tripulante values ("13","Fulgencio", "Villacid Montenegro", " ", "Experto en cocina");
INSERT INTO tripulante values ("14","Celeste", "Campo Verde", "Celes", "Experta en navegación");
INSERT INTO tripulante values ("15","Agripino","Amable Pérez","Agri","");
INSERT INTO tripulante values ("16","Lilith", "Garza Urriaga","","");
INSERT INTO tripulante values ("17","Anacleto","Bonachera Sorda","Investigador",	"Experto en solucionar problemas");
INSERT INTO tripulante values ("18","Siena","Llagaria Zas","","");
INSERT INTO tripulante values ("19","Alipio","Cedeño Melgar","", "Experto en mando");
INSERT INTO tripulante values ("20","Talía	Nala", "Mazagatos Píez", "Maza", "");                                 

-- Solución alternativa --
INSERT INTO Tripulante (idTripulante, NombreTripulante, ApellidosTripulante, Apodo, OtrosDatosTripulante)
VALUES 
    (13, 'Fulgencio', 'Villacid Montenegro', NULL, 'Experto en cocina'),
    (14, 'Celeste', 'Campo Verde', 'Celes', 'Experta en navegación'),
    (15, 'Agripino', 'Amable Pérez', 'Agri', NULL),
    (16, 'Lilith', 'Garza Urriaga', NULL, NULL),
    (17, 'Anacleto', 'Bonachera Sorda', 'Investigador', 'Experto en solucionar problemas'),
    (18, 'Siena', 'Llagaria Zas', NULL, NULL),
    (19, 'Alipio', 'Cedeño Melgar', NULL, 'Experto en mando'),
    (20, 'Talía Nala', 'Mazagatos Píez', 'Maza', NULL);


---------------------------------------------------------------------------------------------------------------------------
--  2. Reparte los Tripulantes agregados en el paso anterior entre dos barcos, asigna como fecha de contratación la del día
--     de hoy, un rol de Marinero y un salario de 1500
---------------------------------------------------------------------------------------------------------------------------
-- Solucion --
-- Barco 1
INSERT INTO BarcoTripulante (idBarcoTripulante, Barco, Tripulante, FechaContratacion, RolTripulante, Salario)
SELECT 
    26 + ROW_NUMBER() OVER (ORDER BY idTripulante) AS idBarcoTripulante, -- Genera ids secuenciales comenzando desde 26
    1, -- ID del primer barco
    idTripulante, 
    CURDATE(), -- Fecha de contratación de hoy
    'Marinero', -- Rol de marinero
    1500 -- Salario
FROM Tripulante
WHERE idTripulante BETWEEN 13 AND 16; -- Tripulantes asignados al primer barco

-- Barco 2
INSERT INTO BarcoTripulante (idBarcoTripulante, Barco, Tripulante, FechaContratacion, RolTripulante, Salario)
SELECT 
    30 + ROW_NUMBER() OVER (ORDER BY idTripulante) AS idBarcoTripulante, -- Genera ids secuenciales comenzando desde 30
    2, -- ID del segundo barco
    idTripulante, 
    CURDATE(), -- Fecha de contratación de hoy
    'Marinero', -- Rol de marinero
    1500 -- Salario
FROM Tripulante
WHERE idTripulante BETWEEN 17 AND 20; -- Tripulantes asignados al segundo barco

---------------------------------------------------------------------------------------------------------------------------
--  3. Aumenta el salario de los Marineros un 15% cuyo barco sea Velero o Yate
---------------------------------------------------------------------------------------------------------------------------
UPDATE barcotripulante 
	set salario = salario * 1.15
    where tripulante IN (select tripulante from barcotripulante bt inner join barco b on bt.barco = b.idBarco where b.tipo in ("Velero", "Yate"));

-- Solucion correcta --
UPDATE BarcoTripulante BT
JOIN Barco B ON BT.Barco = B.idBarco
SET BT.Salario = BT.Salario * 1.15
WHERE BT.RolTripulante = 'Marinero' 
    AND (B.Tipo = 'Velero' OR B.Tipo = 'Yate');
---------------------------------------------------------------------------------------------------------------------------
--  4. Cambia en el atributo OtrosDatosTripulante de los Tripulantes el texto 'Experto' o 'Experta' por 'Manitas'
---------------------------------------------------------------------------------------------------------------------------
UPDATE tripulante
	set OtrosDatosTripulante = "Manitas"
    where OtrosDatosTripulante like "%Expert%";
    
-- Solucion correcta --
UPDATE Tripulante
SET OtrosDatosTripulante = REPLACE(REPLACE(OtrosDatosTripulante, 'Experto', 'Manitas'), 'Experta', 'Manitas')
WHERE OtrosDatosTripulante LIKE '%Experto%' OR OtrosDatosTripulante LIKE '%Experta%';

---------------------------------------------------------------------------------------------------------------------------
--  5. Borra de la asignación de Tripulantes a Barcos aquéllos cuyo rol sea 'Ingeniero' que trabajen en un Velero o en un Yate
---------------------------------------------------------------------------------------------------------------------------
-- Solucion correcta --
DELETE BT
FROM BarcoTripulante BT
JOIN Barco B ON BT.Barco = B.idBarco
WHERE BT.RolTripulante = 'Ingeniero' AND (B.Tipo = 'Velero' OR B.Tipo = 'Yate');
---------------------------------------------------------------------------------------------------------------------------
--  6. En los apodos de los tripulantes cambia las 'e' por'o'
---------------------------------------------------------------------------------------------------------------------------
UPDATE tripulante
	set apodo = "%o%"
    where apodo like "%e%";
    
-- Solucion correcta --
UPDATE Tripulante
	SET Apodo = REPLACE(Apodo, 'e', 'o')
	WHERE Apodo LIKE '%e%';

---------------------------------------------------------------------------------------------------------------------------
--  7. Borra los apellidos de los propietarios de barcos cuya nacionalidad no sea la española
---------------------------------------------------------------------------------------------------------------------------
Delete ApellidosPropietario from propietario where Nacionalidad = "Española";

-- Solucion correcta --
UPDATE Propietario
	SET ApellidosPropietario = NULL
	WHERE Nacionalidad != 'Española';

---------------------------------------------------------------------------------------------------------------------------
--  8. Acorta un 17% la distancia de la ruta que acabe en Sanxenxo
---------------------------------------------------------------------------------------------------------------------------
UPDATE ruta
	set DuracionEstimada = DuracionEstimada * 0.83
	where NombreRuta like "%Sanxenxo%";
    
-- Solucion correcta --
UPDATE Ruta
	SET DistanciaEstimada = DistanciaEstimada * 0.83
	WHERE PuertoDestino = (SELECT idPuerto FROM Puerto WHERE NombrePuerto = 'Sanxenxo');
---------------------------------------------------------------------------------------------------------------------------
--  9. Borra los tripulantes que no estén asignados a ningún barco
---------------------------------------------------------------------------------------------------------------------------
Delete from tripulantes where idTripulante NOT IN (select idTripulante from tripulante t left join barcotripulante bt on t.idTripulante = bt.tripulante where tr.barco IS NOT NULL);

-- Solucion Correcta --
DELETE FROM Tripulante
WHERE idTripulante NOT IN (SELECT DISTINCT Tripulante FROM BarcoTripulante);

---------------------------------------------------------------------------------------------------------------------------
-- 10. En la tabla Puerto, duplica la capacidad máxima de los barcos ubicados en Cangas, Moaña y Sanxenxo. Triplica la capacidad
--     máxima de los barcos de las otros puertos.
---------------------------------------------------------------------------------------------------------------------------
UPDATE puerto
	set capacidadMaximaBarcos = capacidadMaximaBarcos * 2
	where ubicacion in ("Cangas", "Moaña", "Sanxenxo");

UPDATE puerto
 set capacidadMaximaBarcos = capacidadMaximaBarcos * 3
 where ubicacion not in ("Cangas", "Moaña", "Sanxenxo");
 
 -- Solucion correcta -- 
 UPDATE Puerto
SET CapacidadMaximaBarcos = 
    CASE 
        WHEN NombrePuerto IN ('Cangas', 'Moaña', 'Sanxenxo') THEN CapacidadMaximaBarcos * 2
        ELSE CapacidadMaximaBarcos * 3
    END;


