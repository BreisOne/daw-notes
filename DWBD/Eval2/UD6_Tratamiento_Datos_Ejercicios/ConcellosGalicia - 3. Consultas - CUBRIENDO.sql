#*******************************************************************************************
#	UTILIZACIÓN DE LA BASE DE DATOS 'ConcellosGalicia'
#*******************************************************************************************
USE ConcellosGalicia;

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
#select 	__ as 'Concello', 
#		__ as 'Nombre',
#        __ as 'Superficie',
#        ( select mujeres from Poblacion where idConcello = Concello.idConcello limit 1 ) as 'Mujeres',
#		__ as 'Hombres',
#        __ as 'Comarca',
#        __ as 'Provincia'
#        from Concello;
#        
#CREATE VIEW	DatosConcellos	AS	__;
#
select * from Concello;
select 	T1.idConcello as 'Concello', 
		nombre 				as 'Nombre',
        superficie 			as 'Superficie',
        ( select mujeres from Poblacion as T2 where T2.idConcello = T1.idConcello limit 1 ) as 'Mujeres',
		( select hombres from Poblacion where idConcello = T1.idConcello limit 1 ) as 'Hombres',
        ( select nombre  from Comarca   where idComarca  = T1.idComarca  limit 1 ) as 'Comarca',
        ( select nombre	 from Provincia where idProvincia = 
						( select idProvincia  from Comarca   where idComarca  = T1.idComarca ) ) as 'Provincia'
        from concello AS T1;

DROP VIEW IF EXISTS VistaDatosConcellos;
CREATE VIEW	VistaDatosConcellos	AS	select 	nombre 				as 'Concello',
        superficie 			as 'Superficie',
        ( select mujeres from Poblacion as T2 where T2.idConcello = T1.idConcello limit 1 ) as 'Mujeres',
		( select hombres from Poblacion where idConcello = T1.idConcello limit 1 ) as 'Hombres',
        ( select nombre  from Comarca   where idComarca  = T1.idComarca  limit 1 ) as 'Comarca',
        ( select nombre	 from Provincia where idProvincia = 
											( select idProvincia  from Comarca   where idComarca  = T1.idComarca ) ) as 'Provincia'
        from concello AS T1;

# Mostramos los datos de la vista creada
SELECT * FROM VistaDatosConcellos;

# Mostramos los datos de los Concellos con menor superficie
SELECT * FROM VistaDatosConcellos WHERE superficie = (SELECT MIN(superficie) FROM VistaDatosConcellos);
SELECT * FROM VistaDatosConcellos WHERE superficie IN (SELECT MIN(superficie) FROM VistaDatosConcellos);
SELECT * FROM VistaDatosConcellos WHERE superficie <= ALL (SELECT superficie FROM VistaDatosConcellos);
SELECT * FROM VistaDatosConcellos WHERE superficie = ANY (SELECT MIN(superficie) FROM VistaDatosConcellos);

# Mostramos los datos de los Concellos con mayor superficie
SELECT * FROM VistaDatosConcellos WHERE superficie = (SELECT MAX(superficie) FROM VistaDatosConcellos);
SELECT * FROM VistaDatosConcellos WHERE superficie IN (SELECT MAX(superficie) FROM VistaDatosConcellos);
SELECT * FROM VistaDatosConcellos WHERE superficie >= ALL (SELECT superficie FROM VistaDatosConcellos);
SELECT * FROM VistaDatosConcellos WHERE superficie = ANY (SELECT MAX(superficie) FROM VistaDatosConcellos);

#  Concello con mayor diferencia entre mujeres y hombres
SELECT ABS(mujeres-hombres), nombre FROM VistaDatosConcellos ORDER BY 1 DESC LIMIT 1;
SELECT ABS(mujeres-hombres), nombre FROM VistaDatosConcellos WHERE ABS(mujeres-hombres) =
		(SELECT MAX(ABS(mujeres-hombres)) FROM VistaDatosConcellos);

#  Concello con menos diferencia entre mujeres y hombres
SELECT ABS(mujeres-hombres), nombre FROM VistaDatosConcellos ORDER BY 1 ASC LIMIT 5;
SELECT ABS(mujeres-hombres), nombre FROM VistaDatosConcellos WHERE ABS(mujeres-hombres) =
		(SELECT MIN(ABS(mujeres-hombres)) FROM VistaDatosConcellos);

#  Concello con más mujeres que hombres
SELECT mujeres-hombres, nombre FROM VistaDatosConcellos ORDER BY 1 DESC LIMIT 1;
SELECT mujeres-hombres, nombre FROM VistaDatosConcellos WHERE mujeres-hombres =
		(SELECT MAX(mujeres-hombres) FROM VistaDatosConcellos);

#  Concello con más hombres que mujeres
SELECT hombres-mujeres, nombre FROM VistaDatosConcellos ORDER BY 1 DESC LIMIT 1;
SELECT hombres-mujeres, nombre FROM VistaDatosConcellos WHERE hombres-mujeres =
		(SELECT MAX(hombres-mujeres) FROM VistaDatosConcellos);

#  Concello con más mujeres porcentualmente que hombres
SELECT (mujeres-hombres)/(mujeres+hombres), nombre, mujeres, hombres, provincia, comarca FROM VistaDatosConcellos ORDER BY 1 DESC LIMIT 1;
SELECT (mujeres-hombres)/(mujeres+hombres), nombre FROM VistaDatosConcellos WHERE (mujeres-hombres)/(mujeres+hombres) =
		(SELECT MAX((mujeres-hombres)/(mujeres+hombres)) FROM VistaDatosConcellos);

#  Concello con menos mujeres porcentualmente que hombres
SELECT (mujeres-hombres)/(mujeres+hombres), nombre, mujeres, hombres, provincia, comarca FROM VistaDatosConcellos ORDER BY 1 ASC LIMIT 1;
SELECT (mujeres-hombres)/(mujeres+hombres), nombre FROM VistaDatosConcellos WHERE (mujeres-hombres)/(mujeres+hombres) =
		(SELECT MIN((mujeres-hombres)/(mujeres+hombres)) FROM VistaDatosConcellos);


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
#select 	__ as 'Comarca', 
#		__ as 'Nombre',
#		__ as 'Superficie',
#        __ as 'Mujeres',
#        __ as 'Hombres',
#        __ as 'Provincia'
#        from Comarca;
#
#CREATE VIEW DatosComarcas	AS	__;
#


select * from VistaDatosConcellos;
#------------------------------------------------------
# Consulta hecha a partir de la VISTA ANTERIOR
#------------------------------------------------------
select 	Comarca as 'Nombre',
		round( (select sum(superficie) 	from VistaDatosConcellos where Comarca = VDC1.Comarca ), 2 )			as 'Superficie',
        ( select sum(mujeres) 			from VistaDatosConcellos where Comarca = VDC1.Comarca ) 				as 'Mujeres',
        ( select sum(hombres) 			from VistaDatosConcellos where Comarca = VDC1.Comarca ) 				as 'Hombres',
        ( select distinct Provincia	  	from VistaDatosConcellos where Comarca = VDC1.Comarca ) 				as 'Provincia'
        from VistaDatosConcellos AS VDC1
        GROUP BY Comarca;

DROP VIEW IF EXISTS VistaDatosComarcas;
CREATE VIEW VistaDatosComarcas	AS	select 	Comarca as 'Comarca',
		round( (select sum(superficie) 	from VistaDatosConcellos where Comarca = VDC1.Comarca ), 2 )			as 'Superficie',
        ( select sum(mujeres) 			from VistaDatosConcellos where Comarca = VDC1.Comarca ) 				as 'Mujeres',
        ( select sum(hombres) 			from VistaDatosConcellos where Comarca = VDC1.Comarca ) 				as 'Hombres',
        ( select distinct Provincia	  	from VistaDatosConcellos where Comarca = VDC1.Comarca ) 				as 'Provincia'
        from VistaDatosConcellos AS VDC1
        GROUP BY Comarca;

select * from VistaDatosConcellos;
select * from VistaDatosComarcas;
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
#select 	__ as 'Provincia', 
#		__ as 'Nombre',
#		__ as 'Superficie',
#        __ as 'Mujeres',
#        __ as 'Hombres'
#        from Provincia;
#
#CREATE VIEW	DatosProvincias	AS __;


select 	Provincia as 'Nombre',
		round( (select sum(superficie) 	from VistaDatosComarcas where Provincia = VDC1.Provincia ), 2 )			as 'Superficie',
        ( select sum(mujeres) 			from VistaDatosComarcas where Provincia = VDC1.Provincia ) 				as 'Mujeres',
        ( select sum(hombres) 			from VistaDatosComarcas where Provincia = VDC1.Provincia ) 				as 'Hombres'
        from VistaDatosConcellos AS VDC1
        GROUP BY Provincia;

DROP VIEW IF EXISTS VistaDatosProvincias;
CREATE VIEW VistaDatosProvincias AS select 	Provincia as 'Provincia',
		round( (select sum(superficie) 	from VistaDatosComarcas where Provincia = VDC1.Provincia ), 2 )			as 'Superficie',
        ( select sum(mujeres) 			from VistaDatosComarcas where Provincia = VDC1.Provincia ) 				as 'Mujeres',
        ( select sum(hombres) 			from VistaDatosComarcas where Provincia = VDC1.Provincia ) 				as 'Hombres'
        from VistaDatosConcellos AS VDC1
        GROUP BY Provincia;

select * from VistaDatosConcellos;
select * from VistaDatosComarcas;
select * from VistaDatosProvincias;

#*******************************************************************************************
#	 1.	Concello con mayor superficie
#*******************************************************************************************
Select * FROM VistaDatosConcellos 
	ORDER BY Superficie DESC
    LIMIT 1;
    
SELECT * FROM VistaDatosConcellos
	WHERE Superficie =   (SELECT MAX(Superficie) FROM VistaDatosConcellos);
#*******************************************************************************************
#	 2.	Concello con menor superficie
#*******************************************************************************************
Select * FROM VistaDatosConcellos 
	ORDER BY Superficie ASC
    LIMIT 1;
    
SELECT * FROM VistaDatosConcellos
	WHERE Superficie =   (SELECT MIN(Superficie) FROM VistaDatosConcellos);
SELECT * FROM VistaDatosConcellos
	WHERE Superficie IN  (SELECT MIN(Superficie) FROM VistaDatosConcellos);
    
#*******************************************************************************************
#	 3.	Concellos con mayor y menor superficie
#*******************************************************************************************
	SELECT	( SELECT MIN( Superficie ) from VistaDatosConcellos )	AS 'Superficie Mínima',
			( SELECT Concello FROM VistaDatosConcellos where superficie = ( SELECT MIN( Superficie ) from VistaDatosConcellos ) )	AS 'Concello',
			( SELECT MAX( Superficie ) from VistaDatosConcellos )	AS 'Superficie Máxima',
			( SELECT Concello FROM VistaDatosConcellos where superficie = ( SELECT MAX( Superficie ) from VistaDatosConcellos ) )	AS 'Concello';

	CREATE VIEW MAX_Superficie_Concellos	AS SELECT MAX( Superficie ) FROM VistaDatosConcellos;
   	CREATE VIEW MIN_Superficie_Concellos	AS SELECT MIN( Superficie ) FROM VistaDatosConcellos;

	SELECT	( SELECT * FROM	MIN_Superficie_Concellos )	AS 'Superficie Mínima',
			( SELECT Concello FROM VistaDatosConcellos where superficie = ( SELECT * FROM MIN_Superficie_Concellos ) )	AS 'Concello',
			( SELECT * FROM MAX_Superficie_Concellos )	AS 'Superficie Máxima',
			( SELECT Concello FROM VistaDatosConcellos where superficie = ( SELECT * FROM MAX_Superficie_Concellos ) )	AS 'Concello';
#*******************************************************************************************
#	 4.	Comarcas con mayor y menor superficie
#*******************************************************************************************
SELECT * FROM VistaDatosComarcas;

	SELECT	( SELECT MIN( Superficie ) from VistaDatosComarcas )	AS 'Superficie Mínima',
			( SELECT Comarca FROM VistaDatosComarcas where superficie = ( SELECT MIN( Superficie ) from VistaDatosComarcas ) )	AS 'Comarca',
			( SELECT MAX( Superficie ) from VistaDatosComarcas )	AS 'Superficie Máxima',
			( SELECT Comarca FROM VistaDatosComarcas where superficie = ( SELECT MAX( Superficie ) from VistaDatosComarcas ) )	AS 'Comarca';

	CREATE VIEW MAX_Superficie_Comarcas		AS SELECT MAX( Superficie ) FROM VistaDatosComarcas;
   	CREATE VIEW MIN_Superficie_Comarcas		AS SELECT MIN( Superficie ) FROM VistaDatosComarcas;

	SELECT	( SELECT * FROM	MIN_Superficie_Comarcas )	AS 'Superficie Mínima',
			( SELECT Comarca FROM VistaDatosComarcas where superficie = ( SELECT * FROM MIN_Superficie_Comarcas ) )	AS 'Comarcas',
			( SELECT * FROM MAX_Superficie_Comarcas )	AS 'Superficie Máxima',
			( SELECT Comarca FROM VistaDatosComarcas where superficie = ( SELECT * FROM MAX_Superficie_Comarcas ) )	AS 'Comarcas';

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
#	20.	Concello/s con mayor densidad de poblacion
#*******************************************************************************************
SELECT * FROM VistaDatosConcellos;
SELECT Concello, round((Mujeres + Hombres)/(Superficie), 2 ) AS 'Densidad de Población' 
	FROM VistaDatosConcellos
    ORDER BY 2 DESC;



#*******************************************************************************************
#	BORRAR VISTAS
#*******************************************************************************************

	drop view DatosConcellos;
	drop view DatosComarcas;
    drop view DatosProvincias;
