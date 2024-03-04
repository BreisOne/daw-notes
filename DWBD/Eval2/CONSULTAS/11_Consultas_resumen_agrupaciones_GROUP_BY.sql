-- Base de datos Tienda Informática (2 tablas).

-- 1 Muestra el número de productos de la tienda.
	SELECT COUNT(codigo) FROM producto;
-- 2 Muestra el precio más barato de un producto.
	SELECT MIN(precio) FROM producto;
-- 3 Muestra el precio medio de los productos de la tienda.
	SELECT ROUND(AVG(precio)) FROM producto;

-- ______________________________


-- Base de datos Gestión de Empleados (2 tablas).

-- 1 Obtén la suma del presupuesto de todos los departamentos.
	SELECT SUM(presupuesto) FROM departamento;
-- 2 Obtén la media del presupuesto de todos los departamentos.
	SELECT round(AVG(presupuesto)) FROM departamento;
-- 3 Calcula el valor mínimo del presupuesto de todos los departamentos.
	SELECT MIN(presupuesto) FROM departamento;
-- 4 Obtén el nombre del departamento y su presupuesto, sabiendo que su presupuesto es el menor.
	SELECT nombre, presupuesto FROM departamento WHERE presupuesto = (SELECT MIN(presupuesto) FROM departamento);
-- 5 Obtén el número total de empleados que hay en la empresa.
	SELECT count(codigo) FROM empleado;
-- 6 Obtén el número de empleados sin segundo apellido.

-- 7 Obtén el número de empleados que hay en cada departamento.

-- 8 Obtén el nombre de los departamentos con más de dos empleados, mostrando el número de empleados.

-- 9 Obtén el número de empleados que trabajan en cada uno de los departamentos que tienen un presupuesto mayor a 200.000€.


-- ______________________________


-- Base de datos Gestión de Ventas (3 tablas).

-- 1 Calcula la cantidad total que aparecen en todos los pedidos.

-- 2 Calcula la cantidad media que aparecen en todos los pedidos.

-- 3 Calcula el número total de comerciales distintos que han participado en algún pedido.

-- 4 Calcula el número total de clientes de la tabla cliente.

-- 5 Obtén la mayor cantidad de dinero gastada de la tabla pedidos.

-- 6 Obtén la menor cantidad de dinero gastada de la tabla pedidos.

-- 7 Calcula el valor máximo de categoría para cada una de las ciudades que aparecen en la tabla cliente.

-- 8 Calcula el valor máximo de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquéllos cuya cantidad sea superior a 2000€.


-- ______________________________


-- Base de datos NBA (4 tablas).

-- 1 Muestra el peso del jugador más pesado.

-- 2 Muestra la altura del jugador más bajo.

-- 3 Muestra cuántos jugadores tienen los Lakers.

-- 4 Muestra el peso medio de los jugadores de los Bulls.


-- ______________________________


-- Base de datos DepartamentoOficinas (5 tablas).

-- 1 Muestra el número y la edad media de los trabajadores.

-- 2 Muestra las fechas de contrato más antigua y más moderna.


-- ______________________________


-- Base de datos Jardinería (8 tablas).

-- 1 ¿Cuántos empleados hay en la compañía?

-- 2 ¿Cuántos clientes tiene cada país?

-- 3 ¿Cuál fue el pago medio en 2009?

-- 4 ¿Cuántos pedidos hay en cada estado? Ordénalos de forma descendente.

-- 5 Calcula el precio de venta del producto más caro y más barato.

-- 6 Obtén el número de clientes de la empresa.

-- 7 ¿Cuántos clientes tiene la ciudad de Madrid?

-- 8 Calcula el número de clientes que tiene cada ciudad que empieza por M.

-- 9 Muestra el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

-- 10 Obtén el número de clientes sin representante de ventas.
