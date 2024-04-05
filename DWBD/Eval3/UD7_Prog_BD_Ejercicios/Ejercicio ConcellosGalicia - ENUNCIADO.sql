#*******************************************************************************************
#	USO DE LA BASE DE DATOS 'ConcellosGalicia'
#*******************************************************************************************
	use 					ConcellosGalicia;
#*******************************************************************************************
#	Procedure Concellos de cada provincia pasada como parámetro
#*******************************************************************************************

call mostrarComarcas( 'A Coruña' );
call mostrarConcellos( 'A Coruña' );
call mostrarComarcasDeConcello( 'Betanzos' );
