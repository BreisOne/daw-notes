select nombre, precio from producto;
select * from empleado;
SELECT codigo, nombre FROM departamento;
SELECT nombre, presupuesto FROM departamento;
SELECT * FROM comercial;
SELECT nombre, apellido1, apellido2 FROM comercial;
SELECT * FROM pedido;
SELECT * FROM equipos;
SELECT * FROM estadisticas;
SELECT * FROM jugadores;
SELECT * FROM partidos;
SELECT nombre, division FROM equipos;
SELECT temporada, tapones_por_partido FROM estadisticas;
SELECT nombre, procedencia FROM jugadores;
SELECT temporada, equipo_local, puntos_local, equipo_visitante, puntos_visitante FROM partidos;
SELECT categoria, titulo FROM categoria;
SELECT nombre_cliente, nombre_contacto, apellido_contacto FROM cliente;
SELECT * FROM detalle_pedido;
SELECT nombre, apellido1, apellido2, email, puesto FROM empleado;
SELECT gama, descripcion_texto FROM gama_producto;
SELECT codigo_oficina, ciudad FROM oficina;
SELECT * FROM pago;
SELECT * FROM pedido;
SELECT nombre, gama, dimensiones, proveedores, descripcion, cantidad_en_stock, precio_venta, precio proveedor FROM producto;

/*Conjuntos*/

SELECT * FROM fabricante WHERE codigo between 2 and 7;
SELECT * FROM fabricante WHERE codigo IN (2, 4, 6);
SELECT * FROM fabricante WHERE codigo IN (1, 3, 4, 7);

SELECT * FROM departamento WHERE nombre IN ('Desarrollo', 'Sistemas', 'Contabilidad');
SELECT * FROM departamento WHERE presupuesto NOT IN (0);
SELECT * FROM departamento WHERE codigo IN (2,4,5);
SELECT * FROM empleado WHERE apellido1 IN ('Ruiz', 'Salas') OR apellido2 IN ('Ruiz', 'Salas');

SELECT * FROM cliente WHERE nombre IN ('Maria', 'Adela');
SELECT * FROM comercial WHERE apellido1 IN ('Gómez', 'Domínguez');
SELECT * FROM pedido WHERE id_cliente IN (1, 2, 6);
SELECT * FROM pedido WHERE id_comercial NOT IN (1,2,6);

SELECT nombre, ciudad FROM equipos WHERE division IN('Central', 'Pacific');
SELECT jugador, puntos_por_partido, asistencias_por_partido FROM estadisticas WHERE Rebotes_por_partido IN (3,5);
SELECT nombre, procedencia FROM jugadores WHERE Procedencia IN





