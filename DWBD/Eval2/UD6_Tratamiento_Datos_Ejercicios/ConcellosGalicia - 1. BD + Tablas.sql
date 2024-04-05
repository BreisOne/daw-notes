#*******************************************************************************************
#	CREACIÓN Y USO DE LA BASE DE DATOS 'ConcellosGalicia'
#*******************************************************************************************
drop database if exists	ConcellosGalicia;
create database 		ConcellosGalicia;
use 					ConcellosGalicia;
#*******************************************************************************************
#	CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#*******************************************************************************************
#		TABLA Provincia
#*******************************************************************************************
#		idProvincia		int				auto_increment
#		nombre			varchar( 20 )		
#
#		Llave primaria 					->	idProvincia
#		Valor único    					->	nombre
#		Comprobación de Valor no nulo	->	nombre
#		Comprobación de Valor no vacío	->	nombre
#		Índice							->	nombre
#*******************************************************************************************
create table Provincia (
	idProvincia		int							AUTO_INCREMENT,
    nombre 			varchar( 20 ),
    Constraint		PK_Provincia				Primary Key( idProvincia ),
    Constraint		UK_Nombre_Provincia			Unique Key( nombre ),
    Constraint		Nombre_Provincia_NO_NULO		check( nombre IS NOT NULL ),
    Constraint		Nombre_Provincia_NO_VACÍO		check( nombre != '' ),
    Index 			idNombre_Provincia( nombre )
);
	ALTER TABLE Provincia	AUTO_INCREMENT = 10;

#*******************************************************************************************
#		TABLA Comarca
#*******************************************************************************************
#		idComarca		int				auto_increment
#		nombre			varchar( 30 )		
#		idProvincia		int
#
#		Llave primaria 					->	idComarca
#		Llave foránea					->	idProvincia		->		Provincia( idProvincia )
#		Valor único    					->	nombre
#		Comprobación de Valor no nulo	->	nombre, idProvincia
#		Comprobación de Valor no vacío	->	nombre, idProvincia
#		Índice							->	nombre
#*******************************************************************************************
create table Comarca (
	idComarca		int							AUTO_INCREMENT,
    nombre			varchar( 30 ),
    idProvincia		int,
    Constraint		PK_Comarca					Primary Key( idComarca ),
    Constraint		FK_Comarca_Provincia		Foreign Key( idProvincia )	REFERENCES	Provincia( idProvincia ),
    Constraint		UK_Nombre_Comarca			Unique Key( nombre ),
    Constraint		Nombre_Comarca_NO_NULO			check( nombre 		IS NOT NULL ),
    Constraint		idProvincia_Comarca_NO_NULO		check( idProvincia	IS NOT NULL ),
    Constraint		Nombre_Comarca_NO_VACÍO			check( nombre 		!= '' ),
    Constraint		idProvincia_Comarca_NO_VACÍO	check( idProvincia  != '' ),
    Index 			idNombre_Comarca( nombre )
);
#*******************************************************************************************
#		TABLA Concello
#*******************************************************************************************
#		idConcello		int				auto_increment
#		nombre			varchar( 30 )		
#		superficie		double
#		idComarca		int
#
#		Llave primaria 					->	idConcello
#		Llave foránea					->	idComarca		->		Comarca( idComarca )
#		Valor único    					->	nombre
#		Comprobación de Valor no nulo	->	nombre, superficie, idComarca
#		Comprobación de Valor no vacío	->	nombre, superficie, idComarca
#		Índice							->	nombre
#*******************************************************************************************
create table Concello (
	idConcello		int							AUTO_INCREMENT,
    nombre			varchar( 30 ),
    superficie		double,
    idComarca		int,
    Constraint		PK_Concello					Primary Key( idConcello ),
    Constraint		FK_Concello_Comarca			Foreign Key( idComarca )	REFERENCES	Comarca( idComarca ),
    Constraint		UK_Nombre_Concello			Unique Key( nombre ),
    Constraint		Nombre_Concello_NO_NULO			check( nombre 		IS NOT NULL ),
    Constraint		Superficie_Concello_NO_NULO		check( superficie 	IS NOT NULL ),
    Constraint		idComarca_Concello_NO_NULO		check( idComarca 	IS NOT NULL ),
    Constraint		Nombre_Concello_NO_VACÍO		check( nombre 		!= '' ),
    Constraint		Superficie_Concello_NO_VACÍO	check( superficie 	!= '' ),
    Constraint		idComarca_Concello_NO_VACÍO		check( idComarca 	!= '' ),
    Index 			idNombre_Concello( nombre )
);
#*******************************************************************************************
#		TABLA Poblacion
#*******************************************************************************************
#		idPoblacion		int				auto_increment
#		año				int
#		idConcello		int
#		mujeres			int
#		hombres			int
#
#		Llave primaria 					->	idPoblacion
#		Llave foránea					->	idConcello		->		Concello( idConcello )
#		Valor único    					->	idConcello
#		Comprobación de Valor no nulo	->	idConcello, mujeres, hombres
#		Comprobación de Valor no vacío	->	idConcello, mujeres, hombres
#		Índice							->	idConcello
#*******************************************************************************************
create table Poblacion (
	idPoblacion		int							AUTO_INCREMENT,
    año				int,
    idConcello		int,
    mujeres			int,
    hombres			int,
    Constraint		PK_Poblacion				Primary Key( idPoblacion ),
    Constraint		FK_Poblacion_Concello		Foreign Key( idConcello )	REFERENCES	Concello( idConcello ),
    Constraint		UK_Nombre_Concello			Unique Key( idConcello ),
    Constraint		idConcello_NO_NULO				check( idConcello	IS NOT NULL ),
    Constraint		mujeres_NO_NULO					check( mujeres		IS NOT NULL ),
    Constraint		hombres_NO_NULO					check( hombres		IS NOT NULL ),
    Constraint		idConcello_NO_VACÍO				check( idConcello	!= '' ),
    Constraint		mujeres_NO_VACÍO				check( mujeres		!= '' ),
    Constraint		hombres_NO_VACÍO				check( hombres		!= '' ),
    Index 			idÍndice_Concello( idConcello )
);
