#*******************************************************************************************
#	CREACIÓN Y USO DE LA BASE DE DATOS 'ConcellosGalicia'
#*******************************************************************************************

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
