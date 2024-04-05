USE Jardineria;
#-------------------------------------------------------------------------------------------
#	1. Crea una vista de los empleados con código, nombre completo, email, puesto de trabajo, extensión y oficina
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Empleados AS
	SELECT codigo_empleado AS 'Código', CONCAT(nombre, ' ', apellido1, ' ', apellido2) as 'Nombre completo', email, puesto AS 'Puesto de trabajo', extension AS 'Extensión',  codigo_oficina AS 'Oficina'
	FROM Empleado;

#-------------------------------------------------------------------------------------------
#	2. Crea una vista de Clientes y estado de los pedidos, mostrando nombre de la empresa cliente, teléfono, código del pedido y estado en el que se halla
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Pedidos_Clientes AS
	SELECT Cliente.nombre_cliente AS 'Empresa Cliente', Cliente.telefono AS 'Teléfono', Pedido.codigo_pedido AS 'Código de Pedido', Pedido.fecha_pedido AS 'Fecha de pedido', Pedido.estado AS 'Estado'
	FROM Cliente JOIN Pedido ON Cliente.codigo_cliente = Pedido.codigo_cliente;

#-------------------------------------------------------------------------------------------
#	3. Crea una vista de los productos que se hallen en stock, mostrando código y nombre del producto y su cantidad en stock
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Productos_en_Stock AS
	SELECT codigo_producto AS 'Código', nombre AS 'Producto', cantidad_en_stock AS 'Cantidad'
	FROM producto
	WHERE cantidad_en_stock > 0;

#-------------------------------------------------------------------------------------------
#	4. Crea una vista sobre los pagos realizados, mostrando el nombre de la empresa cliente, la transacción efectuada, el tipo, fecha y total de pago abonada
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Pagos_Realizados AS
	SELECT Cliente.nombre_cliente AS 'Empresa cliente', Pago.id_transaccion AS 'Transacción', Pago.forma_pago AS 'Tipo de pago', Pago.fecha_pago AS 'Fecha', Pago.total AS 'Cantidad abonada'
	FROM Cliente JOIN Pago ON Cliente.codigo_cliente = Pago.codigo_cliente;

#-------------------------------------------------------------------------------------------
#	5. Crea una vista de los pedidos pendientes de atender, mostrando código de pedido, fecha de realización del pedido y fecha esperada de recepción
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Pedidos_Pendientes AS
	SELECT codigo_pedido AS 'Código de pedido', fecha_pedido AS 'Fecha de realización', fecha_esperada AS 'Fecha eperada de recepción'
	FROM Pedido
	WHERE estado = 'Pendiente';

#-------------------------------------------------------------------------------------------
#	6. Crea una vista de ventas en función de la gama del producto, mostrando la gama, número de ventas efectuadas y total del dinero obtenido en cada gama
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Ventas_por_Gama AS
	SELECT Gama_producto.gama AS 'Gama', COUNT(Detalle_pedido.codigo_pedido) as "Ventas", sum(cantidad * precio_unidad) AS 'Importe total'
	FROM Gama_producto LEFT JOIN Producto ON Gama_producto.gama = Producto.gama
	LEFT JOIN detalle_pedido ON Producto.codigo_producto = Detalle_pedido.codigo_producto
	GROUP BY Gama_producto.gama;

#-------------------------------------------------------------------------------------------
#	7. Crea una vista mostrando el nombre del país y el número total de clientes que tiene cada uno
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Clientes_por_Pais AS
	SELECT pais AS 'País', COUNT(codigo_cliente) as 'Número de Clientes'
	FROM cliente
	GROUP BY pais;

#-------------------------------------------------------------------------------------------
#	8. Crea una vista que muestre el código y nombre del producto que se hallen agotados
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Productos_Agotados AS
	SELECT codigo_producto AS 'Código', nombre AS 'Producto'
	FROM Producto
	WHERE cantidad_en_stock = 0;

#-------------------------------------------------------------------------------------------
#	9. Crea una vista sobre el detalle de pedido asociado a los productos, mostrando, código de pedido, nombre producto, cantidad, precio por unidad y precio final
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Detalle_Pedido_Productos AS
	SELECT Detalle_pedido.codigo_pedido AS 'Pedido', Producto.nombre as 'Producto', cantidad AS 'Cantidad', precio_unidad AS 'ppu', cantidad * precio_unidad AS 'Precio Final'
	FROM Detalle_pedido JOIN Producto ON Detalle_pedido.codigo_producto = Producto.codigo_producto;

#-------------------------------------------------------------------------------------------
#	10. Crea una vista entre empleados y oficinas, mostrando código y nombre completo del empleado, puesto de trabajo que realiza, y ciudad y país en donde trabaja
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Empleados_Oficinas AS
	SELECT Empleado.codigo_empleado AS 'Código', CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS 'Empleado', Empleado.puesto AS 'Puesto de trabajo', Oficina.ciudad AS 'Ciudad', Oficina.pais AS 'País'
	FROM Empleado JOIN Oficina ON Empleado.codigo_oficina = Oficina .codigo_oficina;

#-------------------------------------------------------------------------------------------
#  11. Crea una vista con los clientes que han excedido su límite de crédito, mostrando en cuánto han excedido ese límite
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Clientes_Limite_Excedido AS
	SELECT Cliente.nombre_cliente AS 'Cliente', SUM(Detalle_pedido.cantidad * Detalle_pedido.precio_unidad) - Cliente.limite_credito AS exceso_limite
		FROM Cliente LEFT JOIN Pedido ON Cliente.codigo_cliente = Pedido.codigo_cliente
		LEFT JOIN Detalle_pedido ON Pedido.codigo_pedido = Detalle_pedido.codigo_pedido
		GROUP BY Cliente.nombre_cliente, Cliente.limite_credito
		HAVING exceso_limite > 0;

#-------------------------------------------------------------------------------------------
#  12. Crea una vista del número de ventas efectuadas por ciudad
#-------------------------------------------------------------------------------------------
CREATE VIEW vista_ventas_por_ciudad AS
	SELECT Oficina.ciudad AS 'Ciudad', COUNT(Pedido.codigo_pedido) AS 'Ventas efectuadas'
	FROM Pedido JOIN Cliente ON Pedido.codigo_cliente = Cliente.codigo_cliente
	JOIN Empleado ON Cliente.codigo_empleado_rep_ventas = Empleado.codigo_empleado
	JOIN Oficina ON Empleado.codigo_oficina = Oficina.codigo_oficina
	GROUP BY Oficina.ciudad;

#-------------------------------------------------------------------------------------------
#  13. Crea una vista que muestre el número de productos que hay por cada Proveedor
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Productos_por_Proveedor AS
	SELECT Proveedor AS 'Proveedro', COUNT(codigo_producto) as 'Número productos'
	FROM producto
	GROUP BY proveedor;

#-------------------------------------------------------------------------------------------
#  14. Crea una vista que muestre el nombre de la empresa cliente y el número de órdenes de compra asociadas
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Clientes_Ordenes_Compra AS
	SELECT Cliente.nombre_cliente AS 'Empresa cliente', COUNT(Pedido.codigo_pedido) AS 'Órdenes de compra'
	FROM Cliente LEFT JOIN Pedido ON Cliente.codigo_cliente = Pedido.codigo_cliente
	GROUP BY Cliente.codigo_cliente, Cliente.nombre_cliente;

#-------------------------------------------------------------------------------------------
#  15. Crea una vista que muestre el número de pedidos por estado en el que se hallen
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Pedidos_por_Estado AS
	SELECT estado AS 'Estado', COUNT(codigo_pedido) as 'Número de pedidos'
	FROM Pedido
	GROUP BY estado;

#-------------------------------------------------------------------------------------------
#  16. Crea una vista que asocie empleados, con identificador y nombre completo, y el número de clientes asignados
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Empleados_Clientes_Asignados AS
	SELECT Empleado.codigo_empleado AS 'Identificador', CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS 'Empleado',
    COUNT(Cliente.codigo_cliente) as 'Clientes asignados'
	FROM Empleado LEFT JOIN Cliente ON Empleado.codigo_empleado = Cliente.codigo_empleado_rep_ventas
	GROUP BY Empleado.codigo_empleado, empleado;

#-------------------------------------------------------------------------------------------
#  17. Crea una vista de los productos vendidos, mostrando código de producto, nombre y unidades vendidas
#-------------------------------------------------------------------------------------------
CREATE VIEW Vista_Productos_Vendidos AS
	SELECT Producto.codigo_producto AS 'Código', Producto.nombre AS 'Producot', SUM(Detalle_pedido.cantidad) AS 'Unidades vendidas'
	FROM Producto
	JOIN Detalle_pedido ON Producto.codigo_producto = Detalle_pedido.codigo_producto
	GROUP BY Producto.codigo_producto, Producto.nombre;

#-------------------------------------------------------------------------------------------
#  18. Crea una vista mostrando el número de pagos efectuados en cada forma de pago
#-------------------------------------------------------------------------------------------
CREATE VIEW vista_pagos_por_forma_pago AS
	SELECT forma_pago AS 'Forma de pago', COUNT(codigo_cliente) AS 'Número de pagos'
	FROM pago
	GROUP BY forma_pago;

#-------------------------------------------------------------------------------------------
#  19.
#-------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------------------
#  20.
#-------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------------------
#  21.
#-------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------------------
#  22.
#-------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------------------
#  23.
#-------------------------------------------------------------------------------------------

