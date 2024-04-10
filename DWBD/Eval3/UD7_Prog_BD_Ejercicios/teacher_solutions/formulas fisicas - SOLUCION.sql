use nba;

set @G = 6.67 * power( 10, -11 );
set @K = 9 	  * power( 10, 9 );

#---------------------------------------------------------------------
#	F = m x a
#---------------------------------------------------------------------
#	F 	fuerza en Newtons
#	m 	masa en Kg
#	a	aceleracion en m/s^2
#---------------------------------------------------------------------
delimiter //
	drop function if exists fuerza //
	create function fuerza( masa decimal( 10, 2 ), aceleracion decimal( 10, 2 ) )
		returns decimal( 10, 2 )
		deterministic
    
		begin
            declare resultado decimal( 10, 2 );
        
			set resultado = masa * aceleracion;
        
			return resultado;
		end //
delimiter ;
#---------------------------------------------------------------------
#	F = G x M x m / r^2
#---------------------------------------------------------------------
delimiter //
	drop function if exists fuerzaAtraccionCuerpos //
    create function fuerzaAtraccionCuerpos( masa1 float8, masa2 float8, radio float8 )
		returns float8
        deterministic
        
        begin
			declare FuerzaAtraccion float8;
            
            set FuerzaAtraccion = @G * masa1 * masa2 / ( radio * radio );
            return FuerzaAtraccion;
        end //
delimiter ;
#---------------------------------------------------------------------
#	F = K x Q x q / r^2
#---------------------------------------------------------------------
delimiter //
	drop function if exists fuerzaAtraccionCargas //
    create function fuerzaAtraccionCargas( masa1 float8, masa2 float8, radio float8 )
		returns float8
        deterministic
        
        begin
			declare FuerzaAtraccion float8;
            
            set FuerzaAtraccion = @K * masa1 * masa2 / ( radio * radio );
            return FuerzaAtraccion;
        end //
delimiter ;
#---------------------------------------------------------------------
#	velocidadEscape = raiz( 2G x M / r )
#---------------------------------------------------------------------
delimiter //
	drop function if exists velocidadEscape //
	create function velocidadEscape( Masa float8, radio float )
		returns float8
		deterministic
    
		begin
            declare resultado float8;
        
			set resultado = power( 2 * @G * Masa / radio, 0.5 );
                    
			return resultado;
		end //
delimiter ;
#---------------------------------------------------------------------
#	g = G x M / r^2
#---------------------------------------------------------------------
#	g	gravedad en m/s^2
#	G 	constante de gravitación universal 6,67*10^(-11) Nm^2/Kg
#	M	masa del planeta en Kg
#	r 	radio del planeta en Km
#---------------------------------------------------------------------
delimiter //
	drop function if exists gravedad //
	create function gravedad( Masa float8, radio float )
		returns float8
		deterministic
    
		begin
            declare resultado float8;
        
			set resultado = @G * Masa;
            set resultado = resultado / ( radio*radio );
        
			return resultado;
		end //
delimiter ;








set @masa = 10, @aceleracion = 2.3;
select concat( "Fuerza = ", 10, ' kg * ', 2.3, ' m/s^2 = ', fuerza( 10, 2.3 ), ' N' ) as '';
select concat( "Fuerza = ", @masa, ' kg * ', @aceleracion, ' m/s^2 = ', fuerza( @masa, @aceleracion ), ' N' ) as '';

set @masa = 60, @aceleracion = 9.8;
select concat( "Fuerza = ", @masa, ' kg * ', @aceleracion, ' m/s^2 = ', fuerza( @masa, @aceleracion ), ' N' ) as '';

set @masaTierra = 5.972*power(10,24), @radioTierra = 6378.1*power(10,3);
select gravedad( @masaTierra, @radioTierra );

set @masaTierra = 5.972*power(10,24), @masaLuna = 7.3477 *power( 10, 22 ), @distanciaTierraLuna = 3.844 * power(10,8);
select fuerzaAtraccionCuerpos( @masaTierra, @masaLuna, @distanciaTierraLuna );

set @carga1 = 5.972*power(10,24), @carga2 = 7.3477 *power( 10, 22 ), @distanciaCargas = 3.844 * power(10,8);
select fuerzaAtraccionCargas( @carga1, @carga2, @distanciaCargas );

select velocidadEscape( @masaTierra, @radioTierra );