#------------------------------------------------------------------------------------
#	CREACIÓN DE LA BASE DE DATOS EMPRESA
#------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS	Empresa;
CREATE DATABASE 		Empresa;
USE 					Empresa;

#------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA OFICINA
#------------------------------------------------------------------------------------
CREATE TABLE Oficina (
	Oficina		VARCHAR(  4 )	NOT NULL,
    Título		VARCHAR( 30 ),
	Dimensión	INT				NOT NULL,
	Mesas		INT				NOT NULL,
	CONSTRAINT  PK_Oficina			PRIMARY KEY( Oficina )
);

#------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA SALARIO
#------------------------------------------------------------------------------------
CREATE TABLE Salario (
	PuestoTrabajo		VARCHAR( 20 )		NOT NULL,
    SueldoBase			INT					NOT NULL,
    IncrementoXAño		INT					NOT NULL,
    Gratificación		INT					NOT NULL,
    CONSTRAINT	PK_Salario		PRIMARY KEY( PuestoTrabajo )
);

#------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA EMPLEADO
#------------------------------------------------------------------------------------
CREATE TABLE Empleado (
	idEmpleado		INT,
    Nombre			VARCHAR( 40 )		NOT NULL,
    Apellidos		VARCHAR( 90 )		NOT NULL,
	Oficina			VARCHAR(  4 ),
    PuestoTrabajo	VARCHAR( 20 ),
    Antigüedad		INT					NOT NULL,
    Jefe			INT,
    CONSTRAINT	PK_Empleado			PRIMARY KEY( idEmpleado ),
    CONSTRAINT	FK_Empleado_Jefe	FOREIGN KEY( Jefe )				REFERENCES	Empleado( idEmpleado ),
    CONSTRAINT	FK_Empleado_Oficina	FOREIGN KEY( Oficina )			REFERENCES	Oficina( Oficina ),
    CONSTRAINT	FK_Empleado_Salario	FOREIGN KEY( PuestoTrabajo )	REFERENCES	Salario( PuestoTrabajo )
);

#------------------------------------------------------------------------------------
#	AGREGACIÓN DE LOS DATOS DE LAS OFICINAS DE LA EMPRESA
#------------------------------------------------------------------------------------
INSERT INTO Oficina	VALUES 	(  "OF01", "Dirección", 100,  5 ),
							(  "OF02", "Dirección de departamentos", 120, 30 ),
							(  "OF03", "Asesoría", 150, 40 ),
							(  "OF04", "Oficina A", 100, 20 ),
                            (  "OF05", "Oficina B", 200, 23 ),
                            (  "OF06", "Sala de reunión", 80, 15 ),
                            (  "OF07", NULL, 70, 16 ),
                            (  "OF08", "Almacén", 60, 18 );

#------------------------------------------------------------------------------------
#	AGREGACIÓN DE LOS DATOS DE LOS SALARIOS DE CADA PUESTO DE TRABAJO
#------------------------------------------------------------------------------------
INSERT INTO Salario VALUES	( "Director General",	50000,	3500, 	10000 ),
							( "Director Ventas", 	41000, 	2800,	 8500 ),
                            ( "Director Compras",	45000,	2500,	 9000 ),
                            ( "Asesor",				45000,	3000,	 7000 ),
                            ( "Oficinista",			12000,	 700,	 1400 );

#------------------------------------------------------------------------------------
#	AGREGACIÓN DE LOS DATOS DE LOS EMPLEADOS DE LA EMPRESA
#------------------------------------------------------------------------------------
INSERT INTO Empleado	VALUES 	(  1, "Fulgencio", 		"De la costa Feliz", 	"OF01", "Director General",	9, NULL ),
								(  2, "Guillermino", 	"Feliz Amado", 			"OF02", "Director Ventas", 	9, 1 ),
                                (  3, "Pancracio", 		"Gonzapota Alegre", 	"OF02", "Director Compras", 8, 1 ),
                                (  4, "Luzdivino", 		"Ponte Alegre",			"OF03", "Asesor",			9, 1 ),
                                (  5, "Bonifacio", 		"Viejobueno Llagaria", 	"OF04", "Oficinista", 		7, 2 ),
                                (  6, "Laureano", 		"Nuero Perfume", 		"OF04", "Oficinista", 		6, 2 ),
                                (  7, "Arnulfo", 		"Sin Chincurreta", 		"OF05", "Oficinista", 		6, 3 ),
                                (  8, "Floripondio", 	"Gandul Piernabierta", 	"OF05", "Oficinista", 		4, 3 ),
                                (  9, "Euquerio", 		"Marco Gol",			NULL, 	"Oficinista",		1, 3 ),
                                ( 10, "Tesifonte",		"Susunaga Sorní",		NULL,	"Oficinista",		1, 3 );

#------------------------------------------------------------------------------------
#	1.	CONSULTA BÁSICA
#------------------------------------------------------------------------------------
#	SELECT	*						-	Muestra todos los valores de los atributos de la tabla
#	SELECT	atributo1, abtributo2	-	Muestra valores de dos atributos de la tabla
#	SELECT 	DISTINCT	atributo1	-	Muestra los distintos valores del atributo atributo1
#------------------------------------------------------------------------------------
#	Ejemplo  1. Muesta toda la información de los Empleados


#	Ejemplo  2. Muesta toda la información de las Oficinas

    
#	Ejemplo  3. Muestra nombre y apellidos de cada Empleado junto con su puesto de trabajo


#	Ejemplo  4. Muestra nombre y apellidos de cada Empleado junto con su puesto de trabajo


#	Ejemplo  5. Muestra los puestos de trabajo que hay en cada oficina, sin repetirse


#	Ejemplo  6. Muestra sólo la dimensión de todas las Oficinas de la empresa, sin repetirse

    
#------------------------------------------------------------------------------------
#	2.	CONSULTAS DE FILTROS
#------------------------------------------------------------------------------------
#	2.1.	USO DE FILTROS					=, >=, <=, <>, !=, <, >
#------------------------------------------------------------------------------------
#	=  >=  <=  <>	-	Comprueba si el valor de un atributo cumple una restricción
#	!=  <  >			especificada por un filtro
#	AND  OR  NOT	-	Une filtros
#------------------------------------------------------------------------------------
#	Ejemplo  7. Muestra la información del empleado número 3


#	Ejemplo  8. Muestra la información de las oficinas cuya dimensión sea, al menos, de 120 m2


#	Ejemplo  9. Muestra los empleados que sean Oficinistas y que trabajen en la oficina 'OF04'


#	Ejemplo 10. Muestra las oficinas cuyo número de mesas no sea superior a 20 ni su dimensión superior a 80

    
#	Ejemplo 11. Muestra los empleados con el puesto de trabajo de Director General o Director Ventas


#	Ejemplo 12. Muestra la oficinas cuya dimensión sea mayor de 80 m2 y su código sea 'OF03', 'OF06' o 'OF07'

    
#------------------------------------------------------------------------------------
#	2.2.	PERTENENCIA A UN CONJUNTO		IN
#------------------------------------------------------------------------------------
#	IN				-	Comprueba si un atributo está incluido dentro de en unos 
#						valores determinados
#------------------------------------------------------------------------------------
#	Ejemplo 13. Muestra los empleados que trabajen en la oficina  'OF04'

    
#	Ejemplo 14. Muestra las oficinas cuya dimensión no sea de 100 m2


#	Ejemplo 15. Muestra los empleados que trabaja en las oficinas cuyo identificador sea 'OF01', 'OF04' o 'OF06'


#	Ejemplo 16. Muestra las oficinas cuyo número de mesas no sea impar


#	Ejemplo 17. Muestra los empleados que no trabajen como Asesor ni Oficinista


#	Ejemplo 18. Muestra las oficinas cuya dimensión estén entre 100 y 120 m2

    
#------------------------------------------------------------------------------------
#	2.3.	RANGO DE VALORES				BETWEEN
#------------------------------------------------------------------------------------
#	BETWEEN			-	Comprueba que los valores de un atributo se hallan incluido
#						en el rango especificado entre <valor> AND <valor>
#------------------------------------------------------------------------------------
#	Ejemplo 19. Muestra los empleados con el identificador de Jefe que oscile entre 1 y 2


#	Ejemplo 20. Muestra las oficinas cuya dimensión oscile entre 80 y 140 m2

    
#	Ejemplo 21. Muestra los empleados cuyos identificadores no sean 4, 5 ni 6

    
#	Ejemplo 22. Muestra las oficinas que tengan más de 18 mesas

    
#	Ejemplo 23. Muestra las oficinas en las que trabajan los empleados cuyo identificador esté entre el 2 y el 9

    
#	Ejemplo 24. Muestra el nombre de las oficinas con dimensión inferior a 90 m2 y número de mesas superior a 16

#------------------------------------------------------------------------------------
#	2.4.	VALOR NULO						NULL
#------------------------------------------------------------------------------------
#	IS NULL			-	Comprueba si el atributo especificado toma un valor nulo
#------------------------------------------------------------------------------------
#	Ejemplo 25. Muestra los empleados que no tengan jefe

    
#	Ejemplo 26. Muestra las oficinas que todavía no tengan título

    
#	Ejemplo 27. Muestra los empleados que todavía no tengan oficina de trabajo

    
#	Ejemplo 28. Muestra las oficinas que tengan un número de mesas ya definido

    
#	Ejemplo 29. Muestra los empleados que tengan un puesto de trabajo

    
#	Ejemplo 30. Muestra las oficinas que tienen ya una dimensión conocida

#------------------------------------------------------------------------------------
#	2.5.	PATRÓN							LIKE
#------------------------------------------------------------------------------------
#	LIKE			-	Busca atributos que cumplan un patrón muy breve
#						_	puede ser cualquier carácter
#						%	puede ser cualquier número de caracteres
#------------------------------------------------------------------------------------
#	Ejemplo 31. Muestra los empleados cuyo puesto de trabajo sea el de director


#	Ejemplo 32. Muestra las oficinas con veinti tantas mesas


#	Ejemplo 33. Muestra los empleados cuya segunda letra del nombre sea una 'u' y acaben en 'o'.


#	Ejemplo 34. Muestra las oficinas cuyo título contenga 'i' o 'u', pero no contenga 'a' ni 's'


#	Ejemplo 35. Muestra los empleados cuyos apellidos contengan 'er' o bien sus nombres no acaben en 'o'


#	Ejemplo 36. Muestra las oficinas cuya dimensión sea de ciento y pico m2 y el número de mesas oscile entre las 10 y 30


#------------------------------------------------------------------------------------
#	2.6.	NÚMERO DE REGISTROS				LIMIT
#------------------------------------------------------------------------------------
#	LIMIT			-	Fija el número de atributos mostrados en origen (inicio) y cantidad
#						origen   -> primer valor, el registro siguiente al valor especificado
#						cantidad -> segundo valor, o valor especificado si es único
#------------------------------------------------------------------------------------
#	Ejemplo 37. Muestra los cinco primeros empleados


#	Ejemplo 38. Muestra las cinco últimas oficinas


#	Ejemplo 39. Muestra los datos de los empleados con los identificadores 3, 4 y 5


#	Ejemplo 40. Muestra los datos de la única oficina sin nombre asignado


#	Ejemplo 41. Muestra los datos de los empleados que sean oficinistas


#	Ejemplo 42. Muestra los datos de las oficinas cuyo nombre sea Oficina (tanto la A como la B)


#------------------------------------------------------------------------------------
#	2.7.	EXPRESIONES REGULARES			REGEXP
#------------------------------------------------------------------------------------
#	REGEXP			-	Busca atributos que cumplan un patrón específico
#------------------------------------------------------------------------------------
#	Ejemplo 43. Muestra los datos de los empleados cuyos apellidos no empiecen por 'g' ni 'p', pero acaben por vocal


#	Ejemplo 44. Muestra los datos de las oficinas cuyo nombre sea Oficina (tanto la A como la B)


#	Ejemplo 45. Muestra los datos de los empleados cuyo nombre sea Fulgencio, Bonifacio, Arnulfo o Tesifonte.


#	Ejemplo 46. Muestra los datos de las oficinas cuyo título sea Oficina (tanto la A como la B), pero con el tiempo van a aumentar


#	Ejemplo 47. Muestra los datos de los empleados cuyo apellido tenga tres aes (o más) y su nombre acabe en 'cio'.


#	Ejemplo 48. Muestra los datos de las oficinas cuyo número de mesas empiece por '1', '3' o '5', pueda contener cualquier número consecutivo de '7' y pueda acabar con más letras, 
#	además su dimensión ha de ser múltiplo de 20


#------------------------------------------------------------------------------------
#	3.	CONSULTAS DE ORDENACIÓN				ORDER BY
#------------------------------------------------------------------------------------
#	ORDER BY		-	Clasifica los valores del (los) atributo(s) especificado(s)
#						de forma ascendente (ASC) o descendente (DESC)
#------------------------------------------------------------------------------------
#	Ejemplo 49. Muestra los datos de los empleados ordenados por apellidos de forma ascendente


#	Ejemplo 50. Muestra los datos de las oficinas ordenados por su dimensión de forma descendente


#	Ejemplo 51. Muestra los datos de los empleados ordenados ascendentemente por Jefe y Oficina


#	Ejemplo 52. Muestra los datos de las oficinas ordenados por el número de mesas y su dimensión descendentemente


#	Ejemplo 53. Muestra los datos de los empleados ordenados por oficina de forma descendente y por apellidos ascendentemente


#	Ejemplo 54. Muestra los datos de las oficinas ordenados por su dimensión de forma ascendente y por su nombre descendentemente


#------------------------------------------------------------------------------------
#	4.	CONSULTAS DE RESUMEN				GROUP BY
#------------------------------------------------------------------------------------
#	GROUP BY		-	Crea grupos bajo el mismo valor en el(los) atributo(s) especificado(s)
#------------------------------------------------------------------------------------
#	Ejemplo 55. Muestra los empleados agrupados por puesto de trabajo, indicando su número


#	Ejemplo 56. Muestra el tamaño mínimo, medio y máximo de las oficinas


#	Ejemplo 57. Muestra los empleados por oficina, indicando su número


#	Ejemplo 58. Muestra el tamaño de las oficinas y la media del número de mesas en ellos


#	Ejemplo 59. Muestra los empleados agrupados por Jefe y oficina, indicando el número de trabajadores por oficina


#	Ejemplo 60. Muestra el tamaño mínimo, medio y máximo de las oficinas


#------------------------------------------------------------------------------------
#	5.	CONSULTAS MULTITABLA
#------------------------------------------------------------------------------------
#	5.1.	COMPOSICIÓN INTERNA				INNER JOIN,	NATURAL JOIN
#------------------------------------------------------------------------------------
#	NATURAL JOIN	-	Unión de los datos de las tablas por campos comunes (con el mismo nombre)
#						sin duplicidad del campo común. En este ejemplo el campo 'Oficina'
#------------------------------------------------------------------------------------
#	Ejemplo 61. Muestra el resultado de la unión natural entre las tablas Empleado y Oficina


#	Ejemplo 62. Muestra el resultado de la unión natural entre las tablas Oficina y Empleado


#	Ejemplo 63. Muestra el resultado de la unión natural entre las tablas Empleado, Oficina y Salario

    
#	Ejemplo 64. Muestra el resultado de la unión natural entre las tablas Oficina, Empleado y Salario

    
#------------------------------------------------------------------------------------
#	INNER JOIN		-	Unión de los datos de las tablas por campos especificados en ON
#						con duplicidad del campo común. En este ejemplo el campo 'Oficina'
#------------------------------------------------------------------------------------
#	Ejemplo 65. Muestra el resultado de la unión con INNER entre las tablas Empleado y Oficina


#	Ejemplo 66. Muestra el resultado de la unión con INNER entre las tablas Oficina y Empleado


#	Ejemplo 67. Muestra el resultado de la unión con INNER entre las tablas Empleado y Salario


#	Ejemplo 68. Muestra todos los atributos sin repetir a partir de la unión con INNER entre las tablas Empleado y Oficina


#	Ejemplo 69. Muestra todos los atributos sin repetir a partir de la unión con INNER entre las tablas Oficina y Empleado


#	Ejemplo 70. Muestra todos los atributos sin repetir a partir de la unión con INNER entre las tablas Empleado y Salario


#------------------------------------------------------------------------------------
#	5.2.	COMPOSICIÓN EXTERNA				RIGHT JOIN, LEFT JOIN, FULL JOIN, NATURAL RIGHT JOIN, NATURAL LEFT JOIN
#------------------------------------------------------------------------------------
#	RIGHT OUTER JOIN	-	Unión de los datos de la tabla de la derecha (RIGHT) con 
#							los datos de la tabla de la izquierda que cumplan la condición, SINO aparece NULL
#------------------------------------------------------------------------------------
#	Ejemplo 71. Muestra todas las tuplas de Oficina y asócialas a los empleados que trabajan en ellas.
#				Si no trabaja ningún empleado muestra NULL

    
#	Ejemplo 72. Muestra todas las tuplas de Empleados y asócialas a las oficinas en las que trabajan.
#				Si el empleado no tiene asignado una oficina muestra NULL

    
#	Ejemplo 73. Muestra todas las tuplas de Salario y asócialas a los empleados.
#				Si hay algún salario no especificaco a ningún puesto de trabajo muestra NULL    

    
#	Ejemplo 74. Muestra todas las tuplas de Salario y asócialas a Empleado (si hay empleados sin puesto de trabajo muestra NULL)
#	Oficina y asócialas a los empleados que trabajan en ellas.


#	Ejemplo 75. Muestra todas las tuplas de Oficina y asócialas a Empleado (si hay empleados sin puesto de trabajo muestra NULL)
#	Oficina y asócialas al Salario que cobra cada Empleado.

	
#------------------------------------------------------------------------------------
#	LEFT OUTER JOIN		-	Unión de los datos de la tabla de la izquierda (LEFT) con 
#							los datos de la tabla de la derecha que cumplan la condición, SINO aparece NULL
#------------------------------------------------------------------------------------
#	Ejemplo 76. Muestra todas las tuplas de Empleados y asócialas a las oficinas en las que trabajan.
#				Si el empleado no tiene asignado una oficina muestra NULL

   
#	Ejemplo 77. Muestra todas las tuplas de Oficina y asócialas a los empleados que trabajan en ellas.
#				Si no trabaja ningún empleado muestra NULL


#	Ejemplo 78. Muestra todas las tuplas de Salario y asócialas a los empleados.
#				Si hay algún salario no especificaco a ningún puesto de trabajo muestra NULL    

    
#	Ejemplo 79. Muestra todas las tuplas de Salario y asócialas a Empleado (si hay empleados sin puesto de trabajo muestra NULL)
#	Oficina y asócialas a los empleados que trabajan en ellas.


#	Ejemplo 80. Muestra todas las tuplas de Oficina y asócialas a Empleado (si hay empleados sin puesto de trabajo muestra NULL)
#	Oficina y asócialas al Salario que cobra cada Empleado.

    
#------------------------------------------------------------------------------------
#	FULL OUTER JOIN		-	Unión de los datos de la tabla de la derecha (RIGHT) con los datos de la tabla de
#							la izquierda que cumplan la condición, SINO aparece NULL más la unión de los datos 
#							de la tabla de la izquierda (LEFT) con los datos de la tabla de la derecha que cumplan
#							la condición, SINO aparece NULL
#------------------------------------------------------------------------------------
#	Ejemplo 81. Muestra todas las tuplas de Oficina y asócialas a los empleados que trabajan en ellas.
#				Si no trabaja ningún empleado muestra NULL. En Las tuplas de los Empleados sin asociación 
#				con Oficinas muestra NULL


#	Ejemplo 82. Muestra todas las tuplas de Empleados y asócialas a las oficinas en las que trabajan.
#				Si no trabaja en ninguna oficia muestra NULL. En Las tuplas de los Oficinas sin asociación 
#				con Empleados muestra NULL


#------------------------------------------------------------------------------------
#	NATURAL RIGHT JOIN	-	Unión de los datos de la tabla de la derecha (RIGHT) con los datos de la tabla
#							de la izquierda en función de atributos con el mismo nombre, SINO aparece NULL
#------------------------------------------------------------------------------------
#	Ejemplo 83. Muestra las oficinas con los empleados que trabajan o no trabajan en ellas

    
#	Ejemplo 84. Muestra las oficinas en las que no trabaje ningún empleado


#	Ejemplo 85. Muestra la información del salario de cada Empleado


#	Ejemplo 86. Muestra los empleados con información de las oficinas en las que trabajan y si no trabajan NULL


#	Ejemplo 87. Muestra los empleados que no estén asignados a ninguna oficina


#	Ejemplo 88. ¿Cuál o cuáles de las siguientes instrucciones ofrece el menor número de tuplas?
    SELECT *	FROM Empleado	NATURAL RIGHT JOIN	Oficina		NATURAL RIGHT JOIN	Salario;
    SELECT *	FROM Empleado	NATURAL RIGHT JOIN	Salario		NATURAL RIGHT JOIN	Oficina;
    SELECT *	FROM Oficina	NATURAL RIGHT JOIN	Empleado	NATURAL RIGHT JOIN	Salario;
    SELECT *	FROM Oficina	NATURAL RIGHT JOIN	Salario		NATURAL RIGHT JOIN	Empleado;
    SELECT *	FROM Salario	NATURAL RIGHT JOIN	Empleado	NATURAL RIGHT JOIN	Oficina;
    SELECT *	FROM Salario	NATURAL RIGHT JOIN	Oficina		NATURAL RIGHT JOIN	Empleado;
    
#	Ejemplo 89. ¿Cuál o cuáles de las siguientes instrucciones ofrece el mayor número de tuplas?
    SELECT *	FROM Empleado	NATURAL RIGHT JOIN	Oficina		NATURAL RIGHT JOIN	Salario;
    SELECT *	FROM Empleado	NATURAL RIGHT JOIN	Salario		NATURAL RIGHT JOIN	Oficina;
    SELECT *	FROM Oficina	NATURAL RIGHT JOIN	Empleado	NATURAL RIGHT JOIN	Salario;
    SELECT *	FROM Oficina	NATURAL RIGHT JOIN	Salario		NATURAL RIGHT JOIN	Empleado;
    SELECT *	FROM Salario	NATURAL RIGHT JOIN	Empleado	NATURAL RIGHT JOIN	Oficina;
    SELECT *	FROM Salario	NATURAL RIGHT JOIN	Oficina		NATURAL RIGHT JOIN	Empleado;

#------------------------------------------------------------------------------------
#	NATURAL LEFT JOIN	-	Unión de los datos de la tabla de la izquierda (LEFT) con los datos de la tabla
#							de la derecha que cumplan la condición, SINO aparece NULL
#------------------------------------------------------------------------------------
#	Ejemplo 90. Muestra las oficinas con los empleados que trabajan o no trabajan en ellas

    
#	Ejemplo 91. Muestra las oficinas en las que no trabaje ningún empleado


#	Ejemplo 92. Muestra la información del salario de cada Empleado


#	Ejemplo 93. Muestra los empleados con información de las oficinas en las que trabajan y si no trabajan NULL


#	Ejemplo 94. Muestra los empleados que no estén asignados a ninguna oficina


#	Ejemplo 95. ¿Cuál o cuáles de las siguientes instrucciones ofrece el menor número de tuplas?
    SELECT *	FROM Empleado	NATURAL LEFT JOIN	Oficina		NATURAL RIGHT JOIN	Salario;
    SELECT *	FROM Empleado	NATURAL LEFT JOIN	Salario		NATURAL RIGHT JOIN	Oficina;
    SELECT *	FROM Oficina	NATURAL LEFT JOIN	Empleado	NATURAL RIGHT JOIN	Salario;
    SELECT *	FROM Oficina	NATURAL LEFT JOIN	Salario		NATURAL RIGHT JOIN	Empleado;
    SELECT *	FROM Salario	NATURAL LEFT JOIN	Empleado	NATURAL RIGHT JOIN	Oficina;
    SELECT *	FROM Salario	NATURAL LEFT JOIN	Oficina		NATURAL RIGHT JOIN	Empleado;
    
#	Ejemplo 96. ¿Cuál o cuáles de las siguientes instrucciones ofrece el mayor número de tuplas?
    SELECT *	FROM Empleado	NATURAL LEFT JOIN	Oficina		NATURAL RIGHT JOIN	Salario;
    SELECT *	FROM Empleado	NATURAL LEFT JOIN	Salario		NATURAL RIGHT JOIN	Oficina;
    SELECT *	FROM Oficina	NATURAL LEFT JOIN	Empleado	NATURAL RIGHT JOIN	Salario;
    SELECT *	FROM Oficina	NATURAL LEFT JOIN	Salario		NATURAL RIGHT JOIN	Empleado;
    SELECT *	FROM Salario	NATURAL LEFT JOIN	Empleado	NATURAL RIGHT JOIN	Oficina;
    SELECT *	FROM Salario	NATURAL LEFT JOIN	Oficina		NATURAL RIGHT JOIN	Empleado;

#------------------------------------------------------------------------------------
#	6.	SUBCONSULTAS
#------------------------------------------------------------------------------------
#	6.1.	SUBCONSULTAS DE COMPARACIÓN					=, >=, <=, <>, !=, <, >
#------------------------------------------------------------------------------------
#	SUBCONSULTA DE COMPARACIÓN	-	Filtra los valores de un atributo según el tipo de
#							comparación con el valor generado en la subconsulta
#------------------------------------------------------------------------------------
#	Ejemplo 97. Muestra los datos de las oficinas cuyo número de mesas es menor o igual a la media por oficina


#	Ejemplo 98. Muestra los datos de los empleados que trabajen en las oficinas dirigidas por el jefe número 2


#	Ejemplo 99. Muestra los datos de las oficinas en las que no trabaje nadie


#	Ejemplo 100. Muestra los datos de los empleados cuyo jefe es el Director de Compras


#	Ejemplo 101. Muestra los datos de las oficinas en las que no trabaja Pancracio


#	Ejemplo 102. Muestra los datos de los jefes de los empleados cuyos identificadores son 3, 5 y 7

	
#------------------------------------------------------------------------------------
#	6.2.	SUBCONSULTAS DE PERTENENCIA A UN CONJUNTO	IN
#------------------------------------------------------------------------------------
#	SUBCONSULTA DE PERTENENCIA A UN CONJUNTO	-	filtrar los valores de un atributo 
#							según si están incluidos en los devueltos en la subconsulta
#------------------------------------------------------------------------------------
#	Ejemplo 103. Muestra los datos de las oficinas cuyo número de mesas es menor o igual a la media por oficina


#	Ejemplo 104. Muestra los datos de los empleados que trabajen en las oficinas dirigidas por el jefe número 2

    
#	Ejemplo 105. Muestra los datos de las oficinas en las que no trabaje nadie


#	Ejemplo 106. Muestra los datos de los empleados cuyo jefe es el Director de Compras


#	Ejemplo 107. Muestra los datos de las oficinas en las que no trabaja Pancracio


#	Ejemplo 108. Muestra los datos de los jefes de los empleados cuyos identificadores son 3, 5 y 7


#------------------------------------------------------------------------------------
#	6.3.	SUBCONSULTAS DE CUANTIFICACIÓN				ALL, ANY
#------------------------------------------------------------------------------------
#	SUBCONSULTA DE CUANTIFICACIÓN	-	filtra  los valores de un atributo con respecto
#							a todos (ALL) o algunos (ANY) de los devueltos en la subconsulta
#------------------------------------------------------------------------------------
#	Ejemplo 109. Muestra los datos de las oficinas cuyo número de mesas es menor o igual a la media por oficina


#	Ejemplo 110. Muestra los datos de los empleados que trabajen en las oficinas dirigidas por el jefe número 2

    
#	Ejemplo 111. Muestra los datos de las oficinas en las que no trabaje nadie


#	Ejemplo 112. Muestra los datos de los empleados cuyo jefe es el Director de Compras


#	Ejemplo 113. Muestra los datos de las oficinas en las que no trabaja Pancracio


#	Ejemplo 114. Muestra los datos de los jefes de los empleados cuyos identificadores son 3, 5 y 7


#------------------------------------------------------------------------------------
#	6.4.	SUBCONSULTAS DE EXISTENCIA					EXISTS
#------------------------------------------------------------------------------------
#	SUBCONSULTA DE EXISTENCIA	-	filtra los valores de un atributo en función de si
#							la subconsulta genera algún tipo de respuesta
#------------------------------------------------------------------------------------
#	Ejemplo 115. Muestra los datos de las oficinas cuyo número de mesas es menor o igual a la media por oficina


#	Ejemplo 116. Muestra los datos de los empleados que trabajen en las oficinas dirigidas por el jefe número 2

    
#	Ejemplo 117. Muestra los datos de las oficinas en las que no trabaje nadie


#	Ejemplo 118. Muestra los datos de los empleados cuyo jefe es el Director de Compras


#	Ejemplo 119. Muestra los datos de las oficinas en las que no trabaja Pancracio


#	Ejemplo 120. Muestra los datos de los jefes de los empleados cuyos identificadores son 3, 5 y 7

    
#------------------------------------------------------------------------------------
#	7. CONSULTA REFLEXIVA
#------------------------------------------------------------------------------------
#	CONSULTA REFLEXIVA		-	Consulta realizada dentro de una tabla a datos de esa
#								misma tabla y requiere dos nombres distintos de la 
#								misma tabla
#------------------------------------------------------------------------------------
#	Ejemplo 121. Muestra el nombre de los jefes y el de sus empleados


#	Ejemplo 122. Muestra el nombre de las oficinas y el del jefe de los empleados que trabajan en cada una


#	Ejemplo 123. Muestra el identificador y el nombre de cada oficina, junto con el nombre completo de su jefe y el de sus trabajadores


#	Ejemplo 124. Muestra el identificador y el nombre de cada oficina, junto con el nombre completo de su Jefe


#	Ejemplo 125. Muestra identificador, nombre y dimensión de cada Oficina indicando que tiene más superficie que la superficie de otras oficinas, con identificador y nombre


#	Ejemplo 126. Muestra identificador, nombre y dimensión de cada Oficina indicando que tiene más superficie que la superficie de otras oficinas, con identificador y nombre


#------------------------------------------------------------------------------------
#	8. CONSULTA DERIVADA
#------------------------------------------------------------------------------------
#	CONSULTA DERIVADA		-	Consulta realizada a una tabla creada en el FROM de una
#								consulta y que requiere un nombre
#------------------------------------------------------------------------------------
#	Ejemplo 127. Muestra los empleados (identificador, nombre y apellidos) de los trabajadores de la Oficina 'OF03'


#	Ejemplo 128. Muestra los empleados (identificador, nombre y apellidos) que trabajen en la misma oficina que el Director de Compras


#	Ejemplo 129. Muestra los empleados y los salarios base de los empleados de la oficina 'OF04'


#	Ejemplo 130. Muestra los empleados y sus antigüedades de la oficina 'OF05'


#	Ejemplo 131. Muestra el sueldo base, su incremento anual y la antigüedad de cada Empleado con identificador, nombre y apellidos



