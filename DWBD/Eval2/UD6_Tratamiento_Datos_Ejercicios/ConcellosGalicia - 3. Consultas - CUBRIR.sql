#*******************************************************************************************
#	UTILIZACIÓN DE LA BASE DE DATOS 'ConcellosGalicia'
#*******************************************************************************************


#*******************************************************************************************
#	CONCELLOS CON CÓDIGO, NOMBRE, SUPERFICIE, MUJERES Y HOMBRES
#*******************************************************************************************
#		Crea una vista llamada 'DatosConcellos' en función de la consulta de
#			- identificador del Concello
#			- nombre del Concello
#			- superficie del Concello
#			- mujeres del Concello
#			- hombres del Concello
#			- comarca a la que pertenece el Concello
#			- provincia a la que pertenece el Concello
#*******************************************************************************************
select 	__ as 'Concello', 
		__ as 'Nombre',
        __ as 'Superficie',
        ( select mujeres from Poblacion where idConcello = Concello.idConcello limit 1 ) as 'Mujeres',
		__ as 'Hombres',
        __ as 'Comarca',
        __ as 'Provincia'
        from Concello;
        
CREATE VIEW	DatosConcellos	AS	__;
#*******************************************************************************************
#	COMARCAS CON CÓDIGO, NOMBRE, SUPERFICIE, MUJERES Y HOMBRES
#*******************************************************************************************
#		Crea una vista llamada 'DatosComarcas' en función de la consulta de
#			- identificador de la Comarca
#			- nombre de la Comarca
#			- superficie de la Comarca
#			- mujeres de la Comarca
#			- hombres de la Comarca
#			- provincia a la que pertenece la Comarca
#*******************************************************************************************
select 	__ as 'Comarca', 
		__ as 'Nombre',
		__ as 'Superficie',
        __ as 'Mujeres',
        __ as 'Hombres',
        __ as 'Provincia'
        from Comarca;

CREATE VIEW DatosComarcas	AS	__;
#*******************************************************************************************
#	PROVINCIAS CON CÓDIGO, NOMBRE, SUPERFICIE, MUJERES Y HOMBRES
#*******************************************************************************************
#		Crea una vista llamada 'DatosProvincias' en función de la consulta de
#			- identificador de la Provincia
#			- nombre de la Provincia
#			- superficie de la Provincia
#			- mujeres de la Provincia
#			- hombres de la Provinica
#*******************************************************************************************
select 	__ as 'Provincia', 
		__ as 'Nombre',
		__ as 'Superficie',
        __ as 'Mujeres',
        __ as 'Hombres'
        from Provincia;

CREATE VIEW	DatosProvincias	AS __;


#*******************************************************************************************
#	 1.	Concello con mayor superficie
#*******************************************************************************************

#*******************************************************************************************
#	 2.	Concello con menor superficie
#*******************************************************************************************

#*******************************************************************************************
#	 3.	Concellos con mayor y menor superficie
#*******************************************************************************************

#*******************************************************************************************
#	 4.	Comarcas con mayor y menor superficie
#*******************************************************************************************

#*******************************************************************************************
#	 5.	Provincias con mayor y menor superficie
#*******************************************************************************************

#*******************************************************************************************
#	 6.	Concellos agrupados por Comarcas con mayor y menor superficie
#*******************************************************************************************

#*******************************************************************************************
#	 7.	Comarcas agrupadas por Provincias con mayor y menor superficie
#*******************************************************************************************

            


#*******************************************************************************************
#	BORRAR VISTAS
#*******************************************************************************************

	drop view DatosConcellos;
	drop view DatosComarcas;
    drop view DatosProvincias;
