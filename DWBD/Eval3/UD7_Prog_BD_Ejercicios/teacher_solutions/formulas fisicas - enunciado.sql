use __;

#---------------------------------------------------------------------
#	F = m x a
#---------------------------------------------------------------------
#	F 	fuerza en Newtons
#	m 	masa en Kg
#	a	aceleracion en m/s^2
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#	F = G x M x m / r^2
#---------------------------------------------------------------------
#	F = K x Q x q / r^2
#---------------------------------------------------------------------



#---------------------------------------------------------------------
#	g = G x M / r^2
#---------------------------------------------------------------------
#	g	gravedad en m/s^2
#	G 	constante de gravitación universal 6,67*10^(-11) Nm^2/Kg
#	M	masa del planeta en Kg
#	r 	radio del planeta en Km
#---------------------------------------------------------------------





set @masa = 10, @aceleracion = 2.3;
select concat( "Fuerza = ", 10, ' kg * ', 2.3, ' m/s^2 = ', fuerza( 10, 2.3 ), ' N' ) as '';
select concat( "Fuerza = ", @masa, ' kg * ', @aceleracion, ' m/s^2 = ', fuerza( @masa, @aceleracion ), ' N' ) as '';

set @masa = 60, @aceleracion = 9.8;
select concat( "Fuerza = ", @masa, ' kg * ', @aceleracion, ' m/s^2 = ', fuerza( @masa, @aceleracion ), ' N' ) as '';

set @masa = 5.972*power(10,24), @radio = 6378.1*power(10,3);
select gravedad( @masa, @radio );


set @masaTierra = 5.972*power(10,24), @masaLuna = 7.3477 *power( 10, 22 ), @distanciaTierraLuna = 3.844 * power(10,8);
# Calcula la fuerza de atracción entre la Tierra y la Luna

set @radio = 3,476 km
# Calcula la gravedad lunar