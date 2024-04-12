#---------------------------------------------------------------------------------------
#	CREACIÓN DE LA BASE DE DATOS Empresa
#---------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS	Empresa;
CREATE DATABASE			Empresa;
USE						Empresa;

#---------------------------------------------------------------------------------------
#	CREACIÓN DE LAS TABLAS
#---------------------------------------------------------------------------------------
CREATE TABLE Oficina (
  idOficina 		INT 			AUTO_INCREMENT,
  nombreOficina 	VARCHAR( 50 ) ,
  numeroOficina		INT,
  dimension 		INT,
  ubicacion 		VARCHAR( 50 ),
  numeroMesas 		INT,
  CONSTRAINT	LlavePrimaria_Oficina	PRIMARY KEY ( idOficina ),
  CONSTRAINT	nombreOficinaNoNula		CHECK( nombreOficina 	IS NOT NULL ),
  CONSTRAINT	numeroOficinaNoNulo		CHECK( numeroOficina 	IS NOT NULL ),
  CONSTRAINT	dimensiónNoNula			CHECK( dimension		IS NOT NULL ),
  CONSTRAINT	ubicaciónNoNula			CHECK( ubicacion		IS NOT NULL ),
  CONSTRAINT	numeroMesasNoNulo		CHECK( numeroMesas		IS NOT NULL ),
  CONSTRAINT	NombreOficinaNoVacía	CHECK( nombreOficina 	!= '' ),
  CONSTRAINT	ubicacionNoVacía		CHECK( ubicacion		!= '' ),
  CONSTRAINT	numeroOficinaIncorrecto	CHECK( numeroOficina	>= 1000 ),
  CONSTRAINT	dimensionNoNegativa		CHECK( dimension		> 0 ),
  CONSTRAINT	numeroMesasNoNegativo	CHECK( numeroMesas		> 0 ),
  CONSTRAINT	nombreOficinaRepetido	UNIQUE( nombreOficina ),
  CONSTRAINT	numeroOficinaRepetido	UNIQUE( numeroOficina )
);

CREATE TABLE Empleado (
  idEmpleado 			INT 			AUTO_INCREMENT,
  NIFEmpleado			VARCHAR(  9 ),
  nombreEmpleado 		VARCHAR( 50 ),
  apellidosEmpleado 	VARCHAR( 50 ),
  fechaIncorporacion	DATE,
  CONSTRAINT	LlavePrimaria_Empleado		PRIMARY KEY ( idEmpleado ),
  CONSTRAINT	nombreEmpleadoNoNulo		CHECK( nombreEmpleado		IS NOT NULL ),
  CONSTRAINT	NIFEmpleadoNoNulo			CHECK( NIFEmpleado			IS NOT NULL ),
  CONSTRAINT	apellidosEmpleadoNoNulo		CHECK( apellidosEmpleado	IS NOT NULL ),
  CONSTRAINT	fechaIncorporacionNoNula	CHECK( fechaIncorporacion	IS NOT NULL ),
  CONSTRAINT	NIFEmpleadoNoVacío			CHECK( NIFEmpleado			!= '' ),
  CONSTRAINT	nombreEmpleadoNoVacío		CHECK( nombreEmpleado		!= '' ),
  CONSTRAINT	apellidosEmpleadoNoVacío	CHECK( apellidosEmpleado	!= '' ),
  CONSTRAINT	NIFDuplicado				UNIQUE( NIFEmpleado )
);
                   
CREATE TABLE Contratacion (
	idContratacion			INT	AUTO_INCREMENT,
	tipoContrato			VARCHAR( 40 ),
    inicioContratacion		DATE,
    finContratacion			DATE,
    Empleado				INT,
    Oficina					INT,
	puestoTrabajo			VARCHAR( 50 ),
    Jefe					INT,
    CONSTRAINT	PK_Contratacion				PRIMARY KEY( idContratacion ),
    CONSTRAINT	FK_Contratacion_Empleado	FOREIGN KEY( empleado )		REFERENCES Empleado( idEmpleado ),
    CONSTRAINT	FK_Contratacion_Oficina		FOREIGN KEY( oficina )		REFERENCES Oficina( idOficina ),
    CONSTRAINT	FK_Contratacion_Jefe		FOREIGN KEY( jefe )			REFERENCES Empleado( idEmpleado ),
    CONSTRAINT	tipoContratoNoNulo			CHECK( tipoContrato			IS NOT NULL ),
    CONSTRAINT	inicioContratacionNoNulo	CHECK( inicioContratacion	IS NOT NULL ),
    CONSTRAINT	empleadoNoNulo				CHECK( empleado				IS NOT NULL ),
    CONSTRAINT	oficinaNoNula				CHECK( oficina				IS NOT NULL ),
    CONSTRAINT	puestoTrabajoNoNulo			CHECK( puestoTrabajo		IS NOT NULL ),
    CONSTRAINT	tipoContratoNoVacío			CHECK( tipoContrato			!= '' ),
    CONSTRAINT	puestoTrabajoNoVacío		CHECK( puestoTrabajo		!= '' )
);

CREATE TABLE Salario (
  idSalario 			INT 	AUTO_INCREMENT,
  puestoTrabajo 		VARCHAR( 50 ),
  sueldoBase 			INT,
  incrementoAnual 		INT,
  productividad 		INT,
  CONSTRAINT	PK_Salario		PRIMARY KEY ( idSalario ),
  CONSTRAINT	Salario_puestoTrabajoNoNulo			CHECK( puestoTrabajo	IS NOT NULL ),
  CONSTRAINT	Salario_sueldoBaseNoNulo			CHECK( sueldoBase		IS NOT NULL ),
  CONSTRAINT	Salario_incrementoAnual				CHECK( incrementoAnual	IS NOT NULL ),
  CONSTRAINT	Salario_productividad				CHECK( productividad	IS NOT NULL ),
  CONSTRAINT	Salario_puestoTrabajoNoVacío		CHECK( puestoTrabajo	!= '' ),
  CONSTRAINT	Salario_sueldoBaseNoNegativo		CHECK( sueldoBase		>= 0 ),
  CONSTRAINT	Salario_incrementoAnualNoNegativo	CHECK( incrementoAnual	>= 0 ),
  CONSTRAINT	Salario_productividadNoNegativa		CHECK( productividad	>= 0 ),
  CONSTRAINT	Salario_sueldoBaseNoCero			CHECK( sueldoBase		!= 0 ),
  CONSTRAINT	Salario_incrementoAnualNoCero		CHECK( incrementoAnual	!= 0 )
);


#---------------------------------------------------------------------------------------
#	AGREGAMOS DATOS
#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------
#	Tabla de Oficinas - 8
#---------------------------------------------------------------------------------------
INSERT	Oficina	( nombreOficina, numeroOficina, dimension, ubicacion, numeroMesas )	VALUES  	# MESAS 42
				( 			"Direccion",      1000,        50, "Planta 1", 2 ),
                ( 				 "RRHH",      8000,        50, "Planta 1", 6 ),
                ( 	  		  "Nóminas",      3600,        50, "Planta 1", 4 ),
                ( "Atención al Cliente",      1007,        50, "Planta 1", 9 ),
                ( 			   "Ventas",      1001,        50, "Planta 1", 8 ),
                ( 			  "Compras",      1002,        50, "Planta 1", 5 ),
                ( "Desarrollo Producto",      3505,        50, "Planta 1", 7 ),
                ( 			"Reuniones",      4040,        50, "Planta 1", 6 );
#---------------------------------------------------------------------------------------
#	Tabla de Empleados - 42
#---------------------------------------------------------------------------------------
INSERT	Empleado	( NIFEmpleado, nombreEmpleado, apellidosEmpleado, fechaIncorporacion )	VALUES
					( "42345678A", "Fulgencio", "Malatraba Uñíquez", 		"2024-02-01" ),
                    ( "62345678A", "Fulgencia", "Bienhallada Perfecta",		"2024-02-01" ),
                    ( "81111111A", "María", "López García", 				"2024-02-01" ),
                    ( "82222222B", "Juan", "Martínez Ruiz", 				"2024-02-02" ),
                    ( "63333333C", "Ana", "Sánchez Rodríguez", 				"2024-02-02" ),
                    ( "64444444D", "Carlos", "Fernández López", 			"2024-02-02" ),
                    ( "45555555E", "Laura", "González Martínez", 			"2024-02-02" ),
                    ( "76666666F", "David", "Pérez García", 				"2024-02-05" ),
                    ( "67777777G", "Sara", "Ruiz Sánchez", 					"2024-02-05" ),
                    ( "88888888H", "Javier", "Díaz Martínez", 				"2024-02-03" ),
                    ( "89999999I", "Elena", "López Pérez", 					"2024-02-05" ),
                    ( "70101010J", "Pedro", "García Ruiz", 					"2024-02-05" ),
                    ( "62121212K", "Marta", "Sánchez López", 				"2024-02-10" ),
                    ( "63131313L", "Roberto", "Martínez Sánchez", 			"2024-02-10" ),
                    ( "74141414M", "Carmen", "López Martínez", 				"2024-02-05" ),
                    ( "65151515N", "Daniel", "Sánchez Pérez", 				"2024-02-05" ),
                    ( "86161616O", "Paula", "Martínez García", 				"2024-02-09" ),
                    ( "47171717P", "Diego", "González Sánchez", 			"2024-02-09" ),
                    ( "58181818Q", "Lucía", "Pérez López", 					"2024-02-13" ),
                    ( "79191919R", "Adrián", "Sánchez Ruiz", 				"2024-02-14" ),
                    ( "60202020S", "Eva", "Martínez López", 				"2024-02-05" ),
                    ( "81212121T", "Marcos", "González Pérez", 				"2024-02-05" ),
                    ( "73232323U", "María José", "García López", 			"2024-02-12" ),
                    ( "84343434V", "Juan Antonio", "Martínez Gómez", 		"2024-02-10" ),
                    ( "55454545W", "Ana María", "Sánchez Rodríguez", 		"2024-02-15" ),
                    ( "76565656X", "Carlos Alberto", "Fernández López", 	"2024-02-17" ),
                    ( "57676767Y", "Laura Isabel", "González Martínez", 	"2024-02-25" ),
                    ( "38787878Z", "David Alejandro", "Pérez García", 		"2024-02-08" ),
                    ( "39898989A", "Sara Lucía", "Ruiz Sánchez", 			"2024-02-12" ),
                    ( "40909090B", "Javier Miguel", "Díaz Martínez", 		"2024-02-05" ),
                    ( "22121212C", "Elena Patricia", "López Pérez", 		"2024-02-15" ),
                    ( "33232323D", "Pedro José", "García Ruiz", 			"2024-02-05" ),
                    ( "34343434E", "Marta María", "Sánchez López", 			"2024-02-06" ),
                    ( "45454545F", "Roberto Antonio", "Martínez Sánchez", 	"2024-02-07" ),
                    ( "46565656G", "Carmen Isabel", "López Martínez", 		"2024-02-07" ),
                    ( "37676767H", "Daniel Alejandro", "Sánchez Pérez", 	"2024-02-11" ),
                    ( "38787878I", "Paula María", "Martínez García", 		"2024-02-13" ),
                    ( "29898989J", "Diego José", "González Sánchez", 		"2024-02-22" ),
                    ( "30909090K", "Lucía Antonia", "Pérez López", 			"2024-03-01" ),
                    ( "20101010L", "Adrián Manuel", "Sánchez Ruiz", 		"2024-03-03" ),
                    ( "41212121M", "Eva María", "Martínez López", 			"2024-03-05" ),
                    ( "31313131N", "Marcos Antonio", "González Pérez", 		"2024-03-05" );
#---------------------------------------------------------------------------------------
#	Tabla de Contrataciones
#---------------------------------------------------------------------------------------
INSERT Contratacion( tipoContrato, inicioContratacion, finContratacion, Empleado, Oficina, puestoTrabajo, Jefe )	VALUES
					( 'Indefinido', "2024-02-01", NULL,  1, 1, 'Director', NULL ),
                    ( 'Indefinido', "2024-02-01", NULL,  2, 2, 'Jefe de Recursos Humanos', 1 ),
                    ( 'Indefinido', "2024-02-01", NULL,  3, 3, 'Jefe de Nóminas', 1 ),
                    ( 'Indefinido', "2024-02-02", NULL,  4, 4, 'Jefe de Atención al Cliente', 1 ),
                    ( 'Indefinido', "2024-02-02", NULL,  5, 5, 'Jefe de Ventas', 1 ),
                    ( 'Indefinido', "2024-02-02", NULL,  6, 6, 'Jefe de Compras', 1 ),
                    ( 'Indefinido', "2024-02-02", NULL,  7, 7, 'Jefe de Desarrollo de Productos', 1 ),
                    ( 'Indefinido', "2024-02-05", NULL,  8, 8, 'Jefe de Reuniones', 1 ),
                    ( 'Indefinido', "2024-02-06", NULL,  9, 1, 'Secretario del Director', 1 ),
                    ( 'Indefinido', "2024-02-04", NULL, 10, 2, 'Trabajador de Recursos Humanos', 2 ),
                    ( 'Indefinido', "2024-02-05", NULL, 11, 2, 'Trabajador de Recursos Humanos', 2 ),
                    ( 'Indefinido', "2024-02-05", NULL, 12, 2, 'Trabajador de Recursos Humanos', 2 ),
                    ( 'Indefinido', "2024-02-12", NULL, 13, 2, 'Trabajador de Recursos Humanos', 2 ),
                    ( 'Indefinido', "2024-02-12", NULL, 14, 2, 'Trabajador de Recursos Humanos', 2 ),
                    ( 'Indefinido', "2024-02-08", NULL, 15, 3, 'Trabajador de Nóminas', 3 ),
                    ( 'Indefinido', "2024-02-08", NULL, 16, 3, 'Trabajador de Nóminas', 3 ),
                    ( 'Indefinido', "2024-02-09", NULL, 17, 3, 'Trabajador de Nóminas', 3 ),
                    ( 'Indefinido', "2024-02-10", NULL, 18, 4, 'Trabajador de Atención al Cliente', 4 ),
                    ( 'Indefinido', "2024-02-14", NULL, 19, 4, 'Trabajador de Atención al Cliente', 4 ),
                    ( 'Indefinido', "2024-02-15", NULL, 20, 4, 'Trabajador de Atención al Cliente', 4 ),
                    ( 'Indefinido', "2024-02-07", NULL, 21, 5, 'Trabajador de Ventas', 5 ),
                    ( 'Indefinido', "2024-02-12", NULL, 22, 5, 'Trabajador de Ventas', 5 ),
                    ( 'Indefinido', "2024-02-13", NULL, 23, 5, 'Trabajador de Ventas', 5 ),
                    ( 'Indefinido', "2024-02-10", NULL, 24, 5, 'Trabajador de Ventas', 5 ),
                    ( 'Indefinido', "2024-02-15", NULL, 25, 5, 'Trabajador de Ventas', 5 ),
                    ( 'Indefinido', "2024-02-17", NULL, 26, 5, 'Trabajador de Ventas', 5 ),
                    ( 'Indefinido', "2024-02-26", NULL, 27, 5, 'Trabajador de Ventas', 5 ),
                    ( 'Indefinido', "2024-02-12", NULL, 28, 6, 'Trabajador de Compras', 6 ),
                    ( 'Indefinido', "2024-02-12", NULL, 29, 6, 'Trabajador de Compras', 6 ),
                    ( 'Indefinido', "2024-02-07", NULL, 30, 6, 'Trabajador de Compras', 6 ),
                    ( 'Indefinido', "2024-02-18", NULL, 31, 6, 'Trabajador de Compras', 6 ),
                    ( 'Indefinido', "2024-02-05", NULL, 32, 7, 'Trabajador de Desarrollo de Productos', 7 ),
                    ( 'Indefinido', "2024-02-09", NULL, 33, 7, 'Trabajador de Desarrollo de Productos', 7 ),
                    ( 'Indefinido', "2024-02-08", NULL, 34, 7, 'Trabajador de Desarrollo de Productos', 7 ),
                    ( 'Indefinido', "2024-02-07", NULL, 35, 7, 'Trabajador de Desarrollo de Productos', 7 ),
                    ( 'Indefinido', "2024-02-11", NULL, 36, 7, 'Trabajador de Desarrollo de Productos', 7 ),
                    ( 'Indefinido', "2024-02-13", NULL, 37, 7, 'Trabajador de Desarrollo de Productos', 7 ),
                    ( 'Indefinido', "2024-02-25", NULL, 38, 4, 'Trabajador de Atención al Cliente', 4 ),
                    ( 'Indefinido', "2024-03-02", NULL, 39, 4, 'Trabajador de Atención al Cliente', 4 ),
                    ( 'Indefinido', "2024-03-03", NULL, 40, 4, 'Trabajador de Atención al Cliente', 4 ),
                    ( 'Indefinido', "2024-03-05", NULL, 41, 4, 'Trabajador de Atención al Cliente', 4 ),
                    ( 'Indefinido', "2024-03-05", NULL, 42, 4, 'Trabajador de Atención al Cliente', 4 );
#---------------------------------------------------------------------------------------
#	Tabla de Salarios
#---------------------------------------------------------------------------------------
INSERT INTO Salario ( puestoTrabajo, sueldoBase, incrementoAnual, productividad )	VALUES
			( 'Director', 							   10000, 1200, 0 ),
            ( 'Jefe de Recursos Humanos', 	 	 		8200,  800, 4000),
            ( 'Jefe de Nóminas', 			 	 		7800,  820, 4200),
            ( 'Jefe de Atención al Cliente', 	 		8300,  850, 4300),
            ( 'Jefe de Ventas', 			 	 		7900,  780, 3900),
            ( 'Jefe de Compras', 			 	 		8100,  800, 4100),
            ( 'Jefe de Desarrollo de Productos', 		8400,  840, 4400),
            ( 'Jefe de Reuniones', 				 		7700,  770, 3900),
            ( 'Secretario del Director', 		 		7000,  700, 3500),
            ( 'Trabajador de Recursos Humanos',  		4200,  500, 2500),
            ( 'Trabajador de Nóminas', 			 		3800,  550, 2700),
            ( 'Trabajador de Atención al Cliente', 		4300,  600, 3000),
            ( 'Trabajador de Ventas', 					3900,  530, 2600),
            ( 'Trabajador de Compras', 					4100,  580, 2900),
            ( 'Trabajador de Desarrollo de Productos',	4400,  620, 3100);


#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------
#	CONVIERTE LOS INSERT DE CADA UNA DE LAS TABLAS EN LOS PROCEDIMIENTOS ESPECIFICADOS
#	EN LOS PASOS SIGUIENTES:
#		-	El procedimiento de los pasos del 5 al 8 es para agregar CADA tupla de cada una de las tablas
#		-	El procedimiento de los pasos 2 al 4 es para agregar TODAS las tuplas de cada una de las tablas
#		-	El procedimiento del paso 1 es para invocar a los cuatro siguientes procedimientos
#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------
#	1. Procedimiento agregarDatosEmpresa
#		Agregamos los datos de las cuatro tablas
#---------------------------------------------------------------------------------------
DELIMITER // agregarOficina
DROP PROCEDURE IF EXISTS  agregarOficinas //
CREATE PROCEDURE agregarOficinas()
	BEGIN
		call agregarOficinas();
		call agregarEmpleados();
        call agregarContratos();
        call agregarSalarios();
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	2. Procedimiento agregarOficinas - AGREGAMOS LAS OCHO OFICINAS
#---------------------------------------------------------------------------------------
DELIMITER // agregarOficina
DROP PROCEDURE IF EXISTS  agregarOficinas //
CREATE PROCEDURE agregarOficinas()
	BEGIN
		call agregarOficina( 			"Direccion",      1000,        50, "Planta 1", 2 );
		call agregarOficina( 				 "RRHH",      8000,        50, "Planta 1", 6 );
		call agregarOficina( 	  		  "Nóminas",      3600,        50, "Planta 1", 4 );
		call agregarOficina( "Atención al Cliente",      1007,        50, "Planta 1", 9 );
		call agregarOficina( 			   "Ventas",      1001,        50, "Planta 1", 8 );
		call agregarOficina( 			  "Compras",      1002,        50, "Planta 1", 5 );
		call agregarOficina( "Desarrollo Producto",      3505,        50, "Planta 1", 7 );
		call agregarOficina( 			"Reuniones",      4040,        50, "Planta 1", 6 );
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	3. Procedimiento agregarEmpleados - AGREGAMOS LOS 48 EMPLEADOS
#---------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS  agregarEmpleados //
CREATE PROCEDURE agregarEmpleados()
	BEGIN
		call agregarEmpleado( "42345678A", "Fulgencio", "Malatraba Uñíquez", 		"2024-02-01" );
		call agregarEmpleado( "62345678A", "Fulgencia", "Bienhallada Perfecta",		"2024-02-01" );
		call agregarEmpleado( "81111111A", "María", "López García", 				"2024-02-01" );
		call agregarEmpleado( "82222222B", "Juan", "Martínez Ruiz", 				"2024-02-02" );
		call agregarEmpleado( "63333333C", "Ana", "Sánchez Rodríguez", 				"2024-02-02" );
		call agregarEmpleado( "64444444D", "Carlos", "Fernández López", 			"2024-02-02" );
		call agregarEmpleado( "45555555E", "Laura", "González Martínez", 			"2024-02-02" );
		call agregarEmpleado( "76666666F", "David", "Pérez García", 				"2024-02-05" );
		call agregarEmpleado( "67777777G", "Sara", "Ruiz Sánchez", 					"2024-02-05" );
		call agregarEmpleado( "88888888H", "Javier", "Díaz Martínez", 				"2024-02-03" );
		call agregarEmpleado( "89999999I", "Elena", "López Pérez", 					"2024-02-05" );
		call agregarEmpleado( "70101010J", "Pedro", "García Ruiz", 					"2024-02-05" );
		call agregarEmpleado( "62121212K", "Marta", "Sánchez López", 				"2024-02-10" );
		call agregarEmpleado( "63131313L", "Roberto", "Martínez Sánchez", 			"2024-02-10" );
		call agregarEmpleado( "74141414M", "Carmen", "López Martínez", 				"2024-02-05" );
		call agregarEmpleado( "65151515N", "Daniel", "Sánchez Pérez", 				"2024-02-05" );
		call agregarEmpleado( "86161616O", "Paula", "Martínez García", 				"2024-02-09" );
		call agregarEmpleado( "47171717P", "Diego", "González Sánchez", 			"2024-02-09" );
		call agregarEmpleado( "58181818Q", "Lucía", "Pérez López", 					"2024-02-13" );
		call agregarEmpleado( "79191919R", "Adrián", "Sánchez Ruiz", 				"2024-02-14" );
		call agregarEmpleado( "60202020S", "Eva", "Martínez López", 				"2024-02-05" );
		call agregarEmpleado( "81212121T", "Marcos", "González Pérez", 				"2024-02-05" );
		call agregarEmpleado( "73232323U", "María José", "García López", 			"2024-02-12" );
		call agregarEmpleado( "84343434V", "Juan Antonio", "Martínez Gómez", 		"2024-02-10" );
		call agregarEmpleado( "55454545W", "Ana María", "Sánchez Rodríguez", 		"2024-02-15" );
		call agregarEmpleado( "76565656X", "Carlos Alberto", "Fernández López", 	"2024-02-17" );
		call agregarEmpleado( "57676767Y", "Laura Isabel", "González Martínez", 	"2024-02-25" );
		call agregarEmpleado( "38787878Z", "David Alejandro", "Pérez García", 		"2024-02-08" );
		call agregarEmpleado( "39898989A", "Sara Lucía", "Ruiz Sánchez", 			"2024-02-12" );
		call agregarEmpleado( "40909090B", "Javier Miguel", "Díaz Martínez", 		"2024-02-05" );
		call agregarEmpleado( "22121212C", "Elena Patricia", "López Pérez", 		"2024-02-15" );
		call agregarEmpleado( "33232323D", "Pedro José", "García Ruiz", 			"2024-02-05" );
		call agregarEmpleado( "34343434E", "Marta María", "Sánchez López", 			"2024-02-06" );
		call agregarEmpleado( "45454545F", "Roberto Antonio", "Martínez Sánchez", 	"2024-02-07" );
		call agregarEmpleado( "46565656G", "Carmen Isabel", "López Martínez", 		"2024-02-07" );
		call agregarEmpleado( "37676767H", "Daniel Alejandro", "Sánchez Pérez", 	"2024-02-11" );
		call agregarEmpleado( "38787878I", "Paula María", "Martínez García", 		"2024-02-13" );
		call agregarEmpleado( "29898989J", "Diego José", "González Sánchez", 		"2024-02-22" );
		call agregarEmpleado( "30909090K", "Lucía Antonia", "Pérez López", 			"2024-03-01" );
		call agregarEmpleado( "20101010L", "Adrián Manuel", "Sánchez Ruiz", 		"2024-03-03" );
		call agregarEmpleado( "41212121M", "Eva María", "Martínez López", 			"2024-03-05" );
		call agregarEmpleado( "31313131N", "Marcos Antonio", "González Pérez", 		"2024-03-05" );
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	3. Procedimiento agregarContratos - AGREGAMOS LOS 48 EMPLEADOS
#---------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS  agregarContratos //
CREATE PROCEDURE agregarContratos()
	BEGIN
		call agregarContratacion( 'Indefinido', "2024-02-01", NULL,  1, 1, 'Director', NULL );
		call agregarContratacion( 'Indefinido', "2024-02-01", NULL,  2, 2, 'Jefe de Recursos Humanos', 1 );
		call agregarContratacion( 'Indefinido', "2024-02-01", NULL,  3, 3, 'Jefe de Nóminas', 1 );
		call agregarContratacion( 'Indefinido', "2024-02-02", NULL,  4, 4, 'Jefe de Atención al Cliente', 1 );
		call agregarContratacion( 'Indefinido', "2024-02-02", NULL,  5, 5, 'Jefe de Ventas', 1 );
		call agregarContratacion( 'Indefinido', "2024-02-02", NULL,  6, 6, 'Jefe de Compras', 1 );
		call agregarContratacion( 'Indefinido', "2024-02-02", NULL,  7, 7, 'Jefe de Desarrollo de Productos', 1 );
		call agregarContratacion( 'Indefinido', "2024-02-05", NULL,  8, 8, 'Jefe de Reuniones', 1 );
		call agregarContratacion( 'Indefinido', "2024-02-06", NULL,  9, 1, 'Secretario del Director', 1 );
		call agregarContratacion( 'Indefinido', "2024-02-04", NULL, 10, 2, 'Trabajador de Recursos Humanos', 2 );
		call agregarContratacion( 'Indefinido', "2024-02-05", NULL, 11, 2, 'Trabajador de Recursos Humanos', 2 );
		call agregarContratacion( 'Indefinido', "2024-02-05", NULL, 12, 2, 'Trabajador de Recursos Humanos', 2 );
		call agregarContratacion( 'Indefinido', "2024-02-12", NULL, 13, 2, 'Trabajador de Recursos Humanos', 2 );
		call agregarContratacion( 'Indefinido', "2024-02-12", NULL, 14, 2, 'Trabajador de Recursos Humanos', 2 );
		call agregarContratacion( 'Indefinido', "2024-02-08", NULL, 15, 3, 'Trabajador de Nóminas', 3 );
		call agregarContratacion( 'Indefinido', "2024-02-08", NULL, 16, 3, 'Trabajador de Nóminas', 3 );
		call agregarContratacion( 'Indefinido', "2024-02-09", NULL, 17, 3, 'Trabajador de Nóminas', 3 );
		call agregarContratacion( 'Indefinido', "2024-02-10", NULL, 18, 4, 'Trabajador de Atención al Cliente', 4 );
		call agregarContratacion( 'Indefinido', "2024-02-14", NULL, 19, 4, 'Trabajador de Atención al Cliente', 4 );
		call agregarContratacion( 'Indefinido', "2024-02-15", NULL, 20, 4, 'Trabajador de Atención al Cliente', 4 );
		call agregarContratacion( 'Indefinido', "2024-02-07", NULL, 21, 5, 'Trabajador de Ventas', 5 );
		call agregarContratacion( 'Indefinido', "2024-02-12", NULL, 22, 5, 'Trabajador de Ventas', 5 );
		call agregarContratacion( 'Indefinido', "2024-02-13", NULL, 23, 5, 'Trabajador de Ventas', 5 );
		call agregarContratacion( 'Indefinido', "2024-02-10", NULL, 24, 5, 'Trabajador de Ventas', 5 );
		call agregarContratacion( 'Indefinido', "2024-02-15", NULL, 25, 5, 'Trabajador de Ventas', 5 );
		call agregarContratacion( 'Indefinido', "2024-02-17", NULL, 26, 5, 'Trabajador de Ventas', 5 );
		call agregarContratacion( 'Indefinido', "2024-02-26", NULL, 27, 5, 'Trabajador de Ventas', 5 );
		call agregarContratacion( 'Indefinido', "2024-02-12", NULL, 28, 6, 'Trabajador de Compras', 6 );
		call agregarContratacion( 'Indefinido', "2024-02-12", NULL, 29, 6, 'Trabajador de Compras', 6 );
		call agregarContratacion( 'Indefinido', "2024-02-07", NULL, 30, 6, 'Trabajador de Compras', 6 );
		call agregarContratacion( 'Indefinido', "2024-02-18", NULL, 31, 6, 'Trabajador de Compras', 6 );
		call agregarContratacion( 'Indefinido', "2024-02-05", NULL, 32, 7, 'Trabajador de Desarrollo de Productos', 7 );
		call agregarContratacion( 'Indefinido', "2024-02-09", NULL, 33, 7, 'Trabajador de Desarrollo de Productos', 7 );
		call agregarContratacion( 'Indefinido', "2024-02-08", NULL, 34, 7, 'Trabajador de Desarrollo de Productos', 7 );
		call agregarContratacion( 'Indefinido', "2024-02-07", NULL, 35, 7, 'Trabajador de Desarrollo de Productos', 7 );
		call agregarContratacion( 'Indefinido', "2024-02-11", NULL, 36, 7, 'Trabajador de Desarrollo de Productos', 7 );
		call agregarContratacion( 'Indefinido', "2024-02-13", NULL, 37, 7, 'Trabajador de Desarrollo de Productos', 7 );
		call agregarContratacion( 'Indefinido', "2024-02-25", NULL, 38, 4, 'Trabajador de Atención al Cliente', 4 );
		call agregarContratacion( 'Indefinido', "2024-03-02", NULL, 39, 4, 'Trabajador de Atención al Cliente', 4 );
		call agregarContratacion( 'Indefinido', "2024-03-03", NULL, 40, 4, 'Trabajador de Atención al Cliente', 4 );
		call agregarContratacion( 'Indefinido', "2024-03-05", NULL, 41, 4, 'Trabajador de Atención al Cliente', 4 );
		call agregarContratacion( 'Indefinido', "2024-03-05", NULL, 42, 4, 'Trabajador de Atención al Cliente', 4 );
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	4. Procedimiento agregarSalarios - AGREGAMOS LOS SALARIOS DE LOS DISTINTOS TIPOS DE EMPLEADOS
#---------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS  agregarSalarios //
CREATE PROCEDURE agregarSalarios()
	BEGIN
			call agregarSalario( 'Director', 							   10000, 1200, 0 );
            call agregarSalario( 'Jefe de Recursos Humanos', 	 	 		8200,  800, 4000);
			call agregarSalario( 'Jefe de Nóminas', 			 	 		7800,  820, 4200);
            call agregarSalario( 'Jefe de Atención al Cliente', 	 		8300,  850, 4300);
            call agregarSalario( 'Jefe de Ventas', 			 	 		7900,  780, 3900);
            call agregarSalario( 'Jefe de Compras', 			 	 		8100,  800, 4100);
            call agregarSalario( 'Jefe de Desarrollo de Productos', 		8400,  840, 4400);
            call agregarSalario( 'Jefe de Reuniones', 				 		7700,  770, 3900);
            call agregarSalario( 'Secretario del Director', 		 		7000,  700, 3500);
            call agregarSalario( 'Trabajador de Recursos Humanos',  		4200,  500, 2500);
            call agregarSalario( 'Trabajador de Nóminas', 			 		3800,  550, 2700);
            call agregarSalario( 'Trabajador de Atención al Cliente', 		4300,  600, 3000);
            call agregarSalario( 'Trabajador de Ventas', 					3900,  530, 2600);
            call agregarSalario( 'Trabajador de Compras', 					4100,  580, 2900);
            call agregarSalario( 'Trabajador de Desarrollo de Productos',	4400,  620, 3100);
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	5. Procedimiento agregarOficina( nombre, numero, dimension, ubicacion, Mesas )
#		( nombreOficina, numeroOficina, dimension, ubicacion, numeroMesas )
#---------------------------------------------------------------------------------------

DELIMITER //
DROP PROCEDURE IF EXISTS  agregarOficina //
CREATE PROCEDURE agregarOficina( nombre VARCHAR(50), numero INT, dimension INT, ubicacion VARCHAR(50), Mesas INT)
	BEGIN
    INSERT	Oficina	( nombreOficina, numeroOficina, dimension, ubicacion, numeroMesas )	VALUES 
							( nombre, numero, dimension, ubicacion, Mesas );
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	6. Procedimiento agregarEmpleado( NIF, Nombre, apellidos, incorporación )
#		( NIFEmpleado, nombreEmpleado, apellidosEmpleado, fechaIncorporacion )
#---------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS  agregarEmpleado //
CREATE PROCEDURE agregarEmpleado( NIF VARCHAR(9), Nombre VARCHAR(50), apellidos VARCHAR(50), incorporación DATE)
	BEGIN
    INSERT	Empleado	( NIFEmpleado, nombreEmpleado, apellidosEmpleado, fechaIncorporacion )	VALUES
										(NIF , Nombre, apellidos, incorporación);
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	7. Procedimiento agregarContratacion( Contrato, Inicio, Fin, Trabajador, Oficina, Puesto, Jefe )
#		( tipoContrato, inicioContratacion, finContratacion, Empleado, Oficina, puestoTrabajo, Jefe )
#---------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS  agregarContratacion //
CREATE PROCEDURE agregarContratacion( Contrato VARCHAR(40), Inicio  DATE, Fin DATE, Trabajador INT, Oficina INT, Puesto VARCHAR(50), Jefe INT)
	BEGIN
    INSERT Contratacion( tipoContrato, inicioContratacion, finContratacion, Empleado, Oficina, puestoTrabajo, Jefe )	VALUES
					( Contrato, Inicio , Fin, Trabajador, Oficina, Puesto, Jefe);
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	8. Procedimiento agregarSalario( Puesto, Base, Incremento, Productividad )
#		( puestoTrabajo, sueldoBase, incrementoAnual, productividad )
#---------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS  agregarSalario //
CREATE PROCEDURE agregarSalario (Puesto VARCHAR(50), Base INT, Incremento INT, Productividad INT)
	BEGIN
    INSERT INTO Salario ( puestoTrabajo, sueldoBase, incrementoAnual, productividad )	VALUES
							(Puesto, Base, Incremento, Productividad);
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#	9. Procedimiento despedirTrabajador( Trabajador, Despido )
#---------------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS  despedirTrabajador //
CREATE PROCEDURE despedirTrabajador( Trabajador VARCHAR(40), Despido DATE)
	BEGIN
    UPDATE contratacion
		SET finContratacion = Despido
		WHERE Empleado = Trabajador;
    END //
DELIMITER ;

#---------------------------------------------------------------------------------------
#  10. Procedimiento contratarTrabajador( trabajador, Contrato, Fecha, OficinaTrabajo, Puesto, Jefe )
#---------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------
#  11. Procedimiento mostrarContratosTrabajador( trabajador )
#---------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------
#	- Agrega todos los datos de la Empresa a la base de datos
#	- Despide al trabajador/es que desees con fecha de '2024-03-02'
#	- Contrata a ese mismo trabajador/es para realizar un 'Proyecto' como contrato, con fecha de '2024-03-02', asigna una oficina de trabajo, un puesto y un jefe
#	- Despide a ese trabajador/es con fecha de '2024-03-12'
#	- Contrata a ese mismo trabajador/es para realizar otro 'Proyecto' como contrato, con fecha de '2024-03-14', asigna una oficina de trabajo, un puesto y un jefe
#	- Despide a ese trabajador/es con fecha de '2024-03-17'
#	- Contrata a ese mismo trabajador/es con contrato indefinido, con fecha de '2024-03-20', asigna una oficina de trabajo, un puesto y un jefe
#	- Despide a ese trabajador/es con fecha de '2024-03-27'
#	- Contrata a ese mismo trabajador/es con contrato indefinido, con fecha de '2024-03-30', asigna una oficina de trabajo, un puesto y un jefe
#	- Despide a ese trabajador/es con fecha de '2024-04-12'
#	- Muestra los Contratos de ese trabajador/es
#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------


