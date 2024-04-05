#------------------------------------------------------
#	BASE DE DATOS Galicia
#-------------------------------------------------------------------------------------------------------------------
#	DICCIONARIO ASOCIADO
#-------------------------------------------------------------------------------------------------------------------
# dígito 			  = [ 0 | 1 | 2 | 3 | 4 | 5 | 6  | 7 | 8 |9 ]													*dígitos del sistema numérico*
# vocalMinúscula 	  = [ a | á | e | é | i | í | o | ó | u | ú | ü ]												*vocales minúsculas, sin y con tilde, y con diéresis*
# vocalMayúscula	  = [ A | Á | E | É | I | Í | O | Ó | U | Ú | Ü ]												*vocales mayúsculas, sin y con tilde, y con diéresis*
# consonanteMinúscula = [ b | c | d | f | g | h | j | k | l | m | n | ñ | p | q | r | s | t | v | w | x | y | z ]	*consonantes minúsculas*
# consonanteMinúscula = [ B | C | D | F | G | H | J | K | L | M | N | Ñ | P | Q | R | S | T | V | W | X | Y | Z ]	*consonantes mayúsculas*
# espacio			  = ' '																							*separación entre palabras*
# separador			  = [ , | . | ; | - | ( | ) ]
# letraMinúscula = [ vocalMinúscula | consonanteMinúscula ]															*letras minúsculas como unión entre vocales y consonantes en minúscula*
# letraMayúscula = [ vocalMayúscula | consonanteMayúscula ]															*letras mayúsculas como unión entre vocales y consonantes en mayúscula*
# letra = [ letraMinúscula | letraMayúscula | espacio ]																*alfabeto completo en minúscula y en mayúsculas, y con espacio de separación*
# alfanumérico = [ letra | dígito ]																					*unión entre el total de letras más espacio y dígitos*
#------------------------------------------------------------------------------------------------------
drop database if exists datosGalicia_1;
create database 		datosGalicia_1;
use 					datosGalicia_1;


#------------------------------------------------------
#	CREACIÓN DE LA TABLA Provincia
#------------------------------------------------------
#	idProvincia			clave primaria y autoincrementable
#	NombreProvincia		cadena de  40 caracteres, no puede ser nulo
#	DatosProvincia		cadena de 200 caracteres
#------------------------------------------------------
#	PROVINCIA 		= {Provincia}													*Información de las Provincias de Galicia*
#	Provincia 		= @idProvincia + NombreProvincia + (DatosProvincia)				*Información de cada Provincia de Galicia*
#	idProvincia 	= dígito														*Identificador de cada Provincia y clave primaria*
#	NombreProvincia = 1{letra}40													*Nombre de la Provincia*
#	DatosProvincia	= 0{alfanumérico}200											*Información asociada y de interés de la Provincia*
#------------------------------------------------------
create table Provincia (
	idProvincia			int 				AUTO_INCREMENT,
    NombreProvincia		varchar(  40 )		NOT NULL,
    DatosProvincia		varchar( 200 ),
    CONSTRAINT	PK_Provincia				PRIMARY KEY ( idProvincia )
);

#------------------------------------------------------
#	CREACIÓN DE LA TABLA Comarca
#------------------------------------------------------
#	idComarca			clave primaria y autoincrementable
#	NombreComarca		cadena de  40 caracteres, no puede ser nulo
#	DatosComarca		cadena de 200 caracteres
#	Provincia			entero y apunta a Provincia
#------------------------------------------------------
#	COMARCA 		= {Comarca}														*Información de las Comarcas de Galicia*
#	Comarca			= @idComarca + NombreComarca + (DatosComarca) + Provincia		*Información de cada Comarca de Galicia*
#	idComarca		= 1{digito}2													*Identificador de cada Comarca y clave primaria*
#	NombreComarca	= 1{letra}40													*Nombre de cada Comarca*
#	DatosComarca	= 0{alfanumérico}200											*Información asociada y de interés de cada Comarca*
#	Provincia		= dígito														*Identificador de la Provincia a la que pertenece la Comarca*
#------------------------------------------------------
create table Comarca (
	idComarca			int					AUTO_INCREMENT,
    NombreComarca		varchar(  40 )		NOT NULL,
    DatosComarca		varchar( 200 ),
    Provincia			int					NOT NULL,
    CONSTRAINT	PK_Comarca					PRIMARY KEY ( idComarca ),
    CONSTRAINT	FK_Comarca_Provincia		FOREIGN KEY ( Provincia )		REFERENCES	Provincia( idProvincia )
);

#------------------------------------------------------
#	CREACIÓN DE LA TABLA Concello
#------------------------------------------------------
#	idConcello			clave primaria y autoincrementable
#	NombreConcello		cadena de  40 caracteres, no puede ser nulo
#	Superficie			valor decimal de dos caracteres
#	DatosConcello		cadena de 200 caractereso
#	Comarca				entero y apunta a Comarca
#------------------------------------------------------
#	CONCELLO 		= {Concello}																*Información de los Concellos de Galicia*
#	Concello		= @idConcello + NombreConcello + Superficie + (DatosConcello) + Comarca		*Información de cada Comarca de Galicia*
#	idConcello		= 1{digito}2																*Identificador de cada Concello y clave primaria*
#	NombreConcello	= 1{letra}40																*Nombre de cada Concello*
#	Superficie		= 1{digito}8.0{digito}2														*Km^2 del Concello, expresados con un máximo de dos decimales*
#	DatosConcello	= 0{alfanumérico}200														*Información asociada y de interés de cada Concello*
#	Comarca			= 1{digito}2																*Identificador de cada Comarca a la que pertenece el Concello*
#------------------------------------------------------
create table Concello (
	idConcello			int					AUTO_INCREMENT,
    NombreConcello		varchar(   40 )		NOT NULL,
    Superficie			decimal( 10, 2 )		NOT NULL,
    DatosConcello		varchar(  200 ),
    Comarca				int					NOT NULL,
    CONSTRAINT	PK_Concello					PRIMARY KEY ( idConcello ),
    CONSTRAINT	FK_Concello_Comarca			FOREIGN KEY ( Comarca )			REFERENCES	Comarca( idComarca )
);

#------------------------------------------------------
#	CREACIÓN DE LA TABLA Población
#------------------------------------------------------
#	idPoblación			clave primaria y autoincrementable
#	Año					entero tipo YEAR, no puede ser nulo
#	Mujeres				entero positivo,  no puede ser nulo
#	Hombres				entero positivo,  no puede ser nulo
#	OtrosDatos			cadena de 200 caracteres
#	Concello			entero y apunta a Concello
#------------------------------------------------------
#	POBLACIÓN		= {Población}																*Información de los datos de Población de todos los Concellos de Galicia*
#	Población		= @idPoblación + Año + Mujeres + Hombres + (OtrosDatos) + Concello			*Información de los datos de Población de cada Concello de Galicia*
#	idPoblación		= 1{dígito}3																*Identificador de cada tupla con datos de Población en un año para un Concello específico*
#	Año				= 1{dígito}4																*Año de referencia d elos datos*
#	Mujeres			= 1{dígito}6																*Número de mujeres en el Concello*
#	Hombres			= 1{dígito}6																*Número de hombres en el Concello*
#	OtrosDatos		= 0{alfanumérico}200														*Información asociada y de interés sobre la población en el Concello*
#	Concello		= 1{dígito}2																*Identificación del Concello del que se muestra información*
#------------------------------------------------------
create table Población (
	idPoblación			int					AUTO_INCREMENT,
    Año					YEAR				NOT NULL,
    Mujeres				int					NOT NULL,
    Hombres				int					NOT NULL,
    OtrosDatos			varchar( 200 ),
    Concello			int					NOT NULL,
    CONSTRAINT	PK_Población				PRIMARY KEY ( idPoblación ),
    CONSTRAINT	FK_Población_Concello		FOREIGN KEY ( Concello )		REFERENCES	Concello( idConcello ),
    CONSTRAINT	Número_Mujeres_Negativo		CHECK( Mujeres >= 0 ),
    CONSTRAINT	Número_Hombres_Negativo		CHECK( Hombres >= 0 )
);
