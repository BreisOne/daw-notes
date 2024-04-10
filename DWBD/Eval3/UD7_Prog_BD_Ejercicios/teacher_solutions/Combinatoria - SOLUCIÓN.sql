use DatosGalicia;



#---------------------------------------------------------------------
#	Funciones y procedimientos de combinatoria
#---------------------------------------------------------------------
#	Permutaciones, variaciones y combinaciones.
#	Sin repetición y con repetición.
#---------------------------------------------------------------------
#	Permutaciones(n)				=		n!
#
#											n!
#	PermutacionesRepeticion(n,a,b)	=    --------
#					 				      a!  b!
#
#											m!
#	Variaciones(m,n)				=    --------
#									     (m - n)!
#
#						 					 n
#	VariacionesRepeticion(m,n)		=		m
#
#
#											m!			Variaciones(m,n)
#	Combinaciones(m,n)				=   ---------- 	=   ---------------
#					    				(m-n)!  n!		Permutaciones(n)
#
#					     				(m+n-1)!
#	CombinacionesRepeticion(m,n)	=   ----------
#					     				n! (m-1)!
#
#---------------------------------------------------------------------
#---------------------------------------------------------------------
delimiter //
	drop function if exists factorial //
	create function 		factorial( numero INT )
		returns int8
		deterministic
    
		begin
            declare resultado int8;
            
            if( numero >= 0 ) then           
				set resultado = 1;
				while( numero > 1 ) DO
					set resultado = resultado * numero;
					set numero = numero - 1 ;
				end while;
            end if;
        
			return resultado;
		end //
delimiter ;
#---------------------------------------------------------------------
#	FUNCIONES
#---------------------------------------------------------------------
delimiter //
	drop function if exists Permutacion //
    create function			Permutacion( n INT )
		returns int8
        deterministic
        
        begin
			declare resultado int8;
            set resultado = factorial( n );
            return  resultado;
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop function if exists PermutacionRepeticion //
    create function			PermutacionRepeticion( n INT, a INT, b INT )
		returns int8
        deterministic
        
        begin
			declare resultado int8;
            set resultado = factorial( n )/( factorial(a) * factorial(b) );
            return  resultado;
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop function if exists Variacion //
    create function			Variacion( m INT, n INT )
		returns int8
        deterministic
        
        begin
			declare resultado int8;
            set resultado = factorial( m ) / factorial( m - n );
            return  resultado;
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop function if exists VariacionRepeticion //
    create function			VariacionRepeticion( m INT, n INT )
		returns int8
        deterministic
        
        begin
			declare resultado int8;
            set resultado = pow( m, n );
            return  resultado;
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop function if exists Combinacion//
    create function			Combinacion( m INT, n INT )
		returns int8
        deterministic
        
        begin
			declare resultado int8;
            set resultado = Variacion( m, n ) / Permutacion( n );
            return  resultado;
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop function if exists CombinacionRepeticion//
    create function			CombinacionRepeticion( m INT, n INT )
		returns int8
        deterministic
        
        begin
			declare resultado int8;
            set resultado = Permutacion( m + n - 1 ) / ( Permutacion( n ) * Permutacion( m - 1 ) );
            return  resultado;
        end //
delimiter ;
#---------------------------------------------------------------------
#	PROCEDIMIENTOS
#---------------------------------------------------------------------
delimiter //
	drop procedure if exists PermutacionProcedure //
    create procedure		 PermutacionProcedure( IN n INT, OUT resultado int8 )

        begin
			set resultado = factorial( n );
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop procedure if exists PermutacionRepeticionProcedure //
    create procedure		 PermutacionRepeticionProcedure( IN n INT, IN a INT, IN b INT, OUT resultado int8 )

        begin
            set resultado = factorial( n )/( factorial(a) * factorial(b) );
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop procedure if exists VariacionProcedure //
    create procedure		 VariacionProcedure( IN m INT, IN n INT, OUT resultado int8 )
        
        begin
            set resultado = factorial( m ) / factorial( m - n );
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop procedure if exists VariacionRepeticionProcedure //
    create procedure		 VariacionRepeticionProcedure( IN m INT, IN n INT, OUT resultado int8 )
        
        begin
            set resultado = pow( m, n );
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop procedure if exists CombinacionProcedure //
    create procedure		 CombinacionProcedure( IN m INT, IN n INT, OUT resultado int8 )
        
        begin
            set resultado = Variacion( m, n ) / Permutacion( n );
        end //
delimiter ;
#---------------------------------------------------------------------
delimiter //
	drop procedure if exists CombinacionRepeticionProcedure//
    create procedure		 CombinacionRepeticionProcedure( IN m INT, IN n INT, OUT resultado int8 )
        
        begin
            set resultado = Permutacion( m + n - 1 ) / ( Permutacion( n ) * Permutacion( m - 1 ) );
        end //
delimiter ;
#---------------------------------------------------------------------



select Permutacion( 5 ) 	as 'Permutacion', 	PermutacionRepeticion( 5, 3, 2 ) 	as 'Permutacion con repeticion', 
		Variacion( 5, 3 ) 	as 'Variacion', 	VariacionRepeticion( 5, 2 ) 		as 'Variacion con repeticion', 
        Combinacion( 5, 2) 	as 'Combinacion', 	CombinacionRepeticion( 5, 2 ) 		as 'Combinacion con repeticion';

call PermutacionProcedure( 5, @resultadoPermutacionProcedure );	
call PermutacionRepeticionProcedure( 5, 3, 2, @resultadoPermutacionRepeticionProcedure ); 
call VariacionProcedure( 5 , 3, @resultadoVariacionProcedure );
call VariacionRepeticionProcedure( 5 , 2, @resultadoVariacionRepeticionProcedure ); 	
call CombinacionProcedure( 5, 2, @resultadoCombinacionProcedure ); 				
call CombinacionRepeticionProcedure( 5, 2, @resultadoCombinacionRepeticionProcedure ); 	
select 	@resultadoPermutacionProcedure 				as 'Permutacion', 	
		@resultadoPermutacionRepeticionProcedure 	as 'Permutacion con repeticion', 
		@resultadoVariacionProcedure 				as 'Variacion', 	
        @resultadoVariacionRepeticionProcedure 		as 'Variacion con repeticion', 
        @resultadoCombinacionProcedure 				as 'Combinacion', 	
        @resultadoCombinacionRepeticionProcedure 	as 'Combinacion con repeticion';
