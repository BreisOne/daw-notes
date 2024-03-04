-- Base de datos Tienda Informática (2 tablas)

-- 1 Muestra los datos de los fabricantes cuyos códigos van del 2 al 7.
	SELECT * FROM fabricante WHERE codigo between 2 and 7;
-- 2 Muestra los datos de los fabricantes cuyos códigos no sean el 2, 4 y 6.
	SELECT * FROM fabricante WHERE codigo  IN (2, 4, 6);
-- 3 Muestra los datos de los productos cuyos códigos son 1, 3, 4, y 7.
	SELECT * FROM fabricante WHERE codigo  IN (1, 3, 4, 7);

-- Base de datos Gestión de Empleados (2 tablas)

-- 1 Muestra los datos de los departamentos Desarrollo, Sistemas y Contabilidad.
	SELECT * FROM departamento WHERE nombre IN ('Desarrollo', 'Sistemas', 'Contabilidad');
-- 2 Muestra los datos de los departamentos cuyo presupuesto no sea 0.
	SELECT * FROM departamento WHERE presupuesto NOT IN (0);
-- 3 Muestra los datos de los empleados cuyo departamento sea el 2, 4 ó 5.
	SELECT * FROM departamento WHERE codigo IN (2,4,5);
-- 4 Muestra los datos de los empleados apellidados Ruiz o Salas.
	SELECT * FROM empleado WHERE apellido1 IN ('Ruiz', 'Salas') OR apellido2 IN ('Ruiz', 'Salas');

-- 1 Base de datos Gestión de Ventas (3 tablas)

-- 2 Muestra los datos de los clientes que se llamen Maria o Adela.
	SELECT * FROM cliente WHERE nombre IN ('Maria', 'Adela');
-- 3 Muestra los datos de los comerciales que tengan como primer apellido Gómez o Domínguez.
	SELECT * FROM comercial WHERE apellido1 IN ('Gómez', 'Domínguez');
-- 4 Muestra los datos de los pedidos realizados por los clientes con los códigos 1, 2 y 6.
	SELECT * FROM pedido WHERE id_cliente IN (1, 2, 6);
-- 5 Muestra los datos de los pedidos realizados por los comerciales cuyo códigos no sean 1, 2 ó 6.
	SELECT * FROM pedido WHERE id_comercial NOT IN (1,2,6);

-- Base de datos NBA (4 tablas)

-- 1 Muestra los nombres y las ciudades de los equipos cuya división sea la Central o la Pacific.
	SELECT nombre, ciudad FROM equipos WHERE division IN('Central', 'Pacific');
-- 2 Muestra el jugador, puntos y asistencias por partido, de los jugadores que hayan realizado 3 ó 5 rebotes de media por partido.
	SELECT jugador, puntos_por_partido, asistencias_por_partido FROM estadisticas WHERE Rebotes_por_partido IN (3,5);
-- 3 Muestra el nombre y procedencia de los jugadores que procedan de Utah, Michigan, Villanova o Utah.
	SELECT nombre, procedencia FROM jugadores WHERE procedencia IN ('Utah', 'Michigan', 'Villanova');
-- 4 Muestra los equipos locales que hayan logrado 74, 86, 90 ó 100 puntos.
	SELECT distinct(equipo_local) FROM partidos WHERE puntos_locaL IN (74, 86,90, 100);

-- Base de datos DepartamentoOficinas (5 tablas)

-- 1 Muestra el salario de las categorías de Administrativo y Comercial.
	SELECT titulo, salario FROM categoria WHERE titulo IN ('Administrativo','Comercial');
    
-- 2 Muestra los empleados de las categorías 1, 3 y 5.
	SELECT * FROM empleado WHERE categoria IN (1, 3, 5);
-- 3 Muestra los datos de la oficina 11 que aparecen en la tabla dpto_oficinas.
	SELECT * FROM dpto_oficinas WHERE oficina IN (11);

-- Base de datos Jardinería (8 tablas)

-- 1 Muestra el nombre del cliente y el del contacto, siendo la ciudad del cliente Barcelona, Madrid o Miami.
	SELECT  nombre_cliente, nombre_contacto FROM cliente WHERE ciudad IN ('Barcelona', 'Madrid', 'Miami');
-- 2 Muestra el código de los productos vendidos cuyo precio por unidad sea 12, 15, 19 ó 25.
	SELECT codigo_producto FROM detalle_pedido WHERE precio_unidad IN (12,15, 19, 25);
-- 3 Muestra nombre, apellidos, email y puesto de los empleados que no sean Director de oficina ni Representante de ventas.
	SELECT nombre, apellido1, apellido2, email, puesto FROM empleado WHERE puesto NOT IN ('Director Oficina', 'Representante Ventas');
-- 4 Muestra el tipo de gama de producto y la descripción de las gamas que no sean ni aromáticas ni ornamentales.
	SELECT gama, descripcion_texto FROM gama_producto WHERE gama NOT IN ('Aromáticas', 'Ornamentales');
-- 5 Muestra el código de las oficinas y de sus ciudades, ubicadas en Estados Unidos o en España.
	SELECT codigo_oficina, ciudad FROM oficina WHERE pais IN ('EEUU', 'España');
-- 6 Muestra el detalle de los pagos que no se hayan realizado por PayPal.
	SELECT * FROM pago WHERE forma_pago NOT IN ('PayPal');
-- 7 Muestra el detalle de los pedidos que no se hayan entregado.

-- 8 Muestra el detalle de los productos, salvo su código, de aquellos cuyo precio de venta sea 12, 15, 19 ó 25.