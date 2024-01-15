use tienda;
#1 Muestra los nombres y precios en euros de todos los productos.
SELECT Nombre, Precio FROM PRODUCTO;
#mas profesional
SELECT Nombre as "Nombre producto", Precio FROM PRODUCTO;

#2 Muestra todos los comerciales.
SELECT * from Fabricante;

#3 Muestra los nombres en mayúsculas  y precios de todos los productos.
SELECT UPPER(Nombre), Precio from Producto;




use empleados;
# Ejercicio 2 -Base de datos Gestión de Empleados (2 tablas).

# 1 Muestra los datos de todos los Empleados.
	SELECT * FROM empleado;

# 2 Muestra el código y el nombre de todos los departamentos de la empresa.
	SELECT codigo, nombre FROM departamento;

# 3 Muestra los primeros apellidos sin repetición de los Empleados.
	SELECT distinct apellido1 from empleado;
    
# 4 Muestra el nombre del departamento y su presupuesto.
	SELECT nombre, presupuesto FROM departamento;



use ventas;
# Ejercicio 3 - Base de datos Gestión de Ventas (3 tablas).

# 1 Muestra de todos los clientes.
	Select * FROM cliente;

# 2 Muestra nombre y apellidos de los clientes.
	SELECT Nombre, Apellido1, Apellido2  FROM cliente;

# 3 Muestra de todos los comerciales.
	Select * FROM comercial;
    
# 4 Muestra nombre y apellidos de los clientes.
	SELECT Nombre, Apellido1, Apellido2  FROM cliente;
 
# 5  Muestra todos los pedidos realizados.
	SELECT * FROM pedido;






use nba;
# Ejercicio 4 - Base de datos NBA (4 tablas)

# 1 Muestra todas las tablas de la base de datos NBA.
SHOW tables;

# 2 Muestra todos los datos de cada tabla de la base de datos NBA.
	SELECT * FROM equipos, estadisticas, jugadores, partidos;

# 3 Muestra el nombre y la división de cada Equipo.
	SELECT Nombre, Division from Equipos;
    
# 4 Muestra el número de tapones por partido de cada jugador y temporada de la tabla Estadisticas.
	SELECT Tapones_por_partido, Jugador, Temporada from estadisticas; 
    
# 5  Muestra el nombre y de donde procedejugador cada Jugador.
	SELECT Nombre, Procedencia FROM jugadores;

# 6 Muestra temporada, equipo local y puntuación, y equipo visitante y puntuación de la tabla Partidos.
	SELECT temporada, equipO_local, puntos_local, equipo_visitante, puntos_visitante from partidos;



use departamentooficinas;
# Ejercicio 5 - Base de datos Departamento Oficinas (5 tablas).

# 1 Muestra toda la información de la tabla empleados.
	SELECT * FROM empleado;

# 2 Muestra toda la información de la tabla departamento.
	SELECT * FROM departamento;

# 3 Muestra el código y nombre de las categorías del personal.
	SELECT categoria, titulo from Categoria;



use jardineria;
# Ejercicio 6 - Base de datos NBA (4 tablas)

# 1 Muestra el nombre del cliente y el nombre completo del contacto.


# 2 Muestra los detalles de todos los productos contenidos en la tabla detalle_pedido.
	

# 3 Muestra el nombre, apellidos, email y puesto de cada empleado.

    
# 4 Muestra el tipo de gama de producto y su descripción.
	
    
# 5 Muestra el código de cada oficina junto con la ciudad en la que está.
	

# 6 Muestra el detalle de todos los pagos.

# 7 Muestra el detalle de todos los pedidos.


# 8 Muestra el detalle de todos los productos, salvo su código.

