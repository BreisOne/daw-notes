-- 1. Base de datos Tienda Informática (2 tablas).
-- Muestra un listado de los fabricantes con los productos asociados, los tengan o no.
	SELECT * FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante; 
-- Muestra un listado de los fabricantes que no tengan ningún producto asociado.
	SELECT * FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NULL; 

---------------------------------------------------------------

-- 2. Base de datos Gestión de Empleados (2 tablas).
-- Muestra los empleados con los datos del departamento en que trabajan, así como también información de los empleados que no trabajen en ningún departamento.

-- Muestra un listado de los empleados sin departamento asociado.
	SELECT * FROM empleado LEFT JOIN departamento ON empleado.codigo_departamento =  departamento.codigo  WHERE departamento.codigo IS NULL;
-- Muestra los departamentos sin ningún empleado asociado.

-- Muestra los empleados y los departamentos en los que trabajan, así como también los empleados que no trabajan en ningún departamento y los departamentos en los que no trabaja ningún empleado.

-- Muestra los empleados que no están asociados a ningún departamento y los departamentos sin empleados asociados.

---------------------------------------------------------------

-- 3. Base de datos Gestión de Ventas (3 tablas).
-- Muestra un listado de los TODOS clientes con los datos de sus pedidos realizados, también deben aparecer los clientes sin pedidos.
	SELECT * FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente;
-- Muestra un listado de TODOS los comerciales con los datos de los pedidos realizados, también deben aparecer los comerciales sin pedidos.
    SELECT * FROM comercial LEFT JOIN pedido ON comercial.id = pedido.id_comercial;
-- Muestra un listado con solamente los clientes que no hayan realizado ningún pedido.alter.
	SELECT * FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente WHERE pedido.id_cliente IS NULL;
-- Muestra un listado en el que aparezcan los comerciales que no hayan realizado ningún pedido.

-- Muestra un listado con los clientes que no hayan solicitado un pedido y los comerciales que no hayan participado en ningún pedido.

---------------------------------------------------------------

-- 4. Base de datos NBA (4 tablas).
-- Muestra los nombres de los jugadores agrupados por conferencia y división.
	SELECT jugadores.nombre, equipos.Conferencia, equipos.Division FROM jugadores LEFT JOIN equipos ON jugadores.Nombre_equipo = equipos.Nombre;
    SELECT jugadores.nombre, equipos.Conferencia, equipos.Division FROM jugadores, equipos WHERE jugadores.Nombre_equipo = equipos.Nombre;
-- Muestra los puntos por partido y los nombres de los jugadores ordenados descendentemente.
	SELECT estadisticas.puntos_por_partido, jugadores.Nombre FROM estadisticas LEFT JOIN jugadores ON estadisticas.jugador = jugadores.codigo ORDER BY estadisticas.Puntos_por_partido DESC; 

---------------------------------------------------------------

-- 5. Base de datos DepartamentoOficinas (5 tablas).
-- Une las tablas dpto_oficinas y oficina con LEFT OUTER JOIN, mostrando datos sólo de la ciudad de Pontevedra.

-- Une las tablas dpto_oficinas y oficina con RIGHT OUTER JOIN, mostrando datos sólo de la ciudad de Pontevedra.

---------------------------------------------------------------

-- 6. Base de datos Jardinería (8 tablas).
-- Muestra un listado con los clientes que NO han realizado ningún pago.

-- Muestra un listado con los clientes que NO han realizado ningún pedido.
	
-- Muestra un listado con los clientes que NI han realizado ningún pago NI ningún pedido.
   SELECT nombre_cliente FROM cliente AS c LEFT JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente LEFT JOIN pedido AS pe ON pe.codigo_cliente = c.codigo_cliente WHERE p.id_transaccion IS NULL AND pe.codigo_pedido IS NULL;
-- Muestra un listado con los empleados sin oficina asociada.

-- Muestra un listado con los empleados sin ningún cliente asociado.
	SELECT nombre, apellido1, apellido2, codigo_cliente FROM empleado LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas WHERE cliente.codigo_cliente IS NULL;
-- Muestra un listado de los empleados sin cliente asociado, junto con los datos de la oficina en la que trabajan.
	SELECT empleado.nombre, empleado.apellido1, empleado.apellido2, oficina.* FROM empleado  LEFT JOIN  cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas LEFT JOIN oficina ON empleado.codigo_oficina= oficina.codigo_oficina WHERE cliente.codigo_empleado_rep_ventas IS NULL;
-- Muestra un listado con los productos sin ningún pedido asociado.

-- Muestra un listado con las oficinas en las que NO trabajen ningún empleado que haya sido representante de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
 SELECT oficina.* FROM oficina WHERE oficina.codigo_oficina NOT IN(SELECT codigo_oficina FROM empleado LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
																										  LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
                                                                                                          LEFT JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
                                                                                                          LEFT JOIN producto ON producto.codigo_producto = detalle_pedido.codigo_producto
                                                                                                          LEFT JOIN gama_producto ON gama_producto.gama = producto.gama
                                                                                                          WHERE gama_producto.gama IN ('Frutales'));
-- Muestra un listado con empleados sin clientes asociados, junto con el nombre de su jefe.
 SELECT CONCAT(E1.nombre,' ', E1.apellido1,' ', E1.apellido2) AS nombre_empleado, 
        CONCAT(E2.nombre,' ', E2.apellido1,' ', E2.apellido2) AS nombre_jefe, cliente.codigo_cliente  
																							 FROM empleado E1 LEFT JOIN cliente ON E1.codigo_empleado = cliente.codigo_empleado_rep_ventas 
																											  LEFT JOIN empleado E2 ON E1.codigo_jefe= E2.codigo_empleado WHERE cliente.codigo_cliente IS NULL;