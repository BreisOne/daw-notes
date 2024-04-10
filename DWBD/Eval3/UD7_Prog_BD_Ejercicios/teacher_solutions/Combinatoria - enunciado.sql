USE DatosGalicia;



#---------------------------------------------------------------------
#	Funciones y procedimientos de combinatoria
#---------------------------------------------------------------------
#	Permutaciones, variaciones y combinaciones.
#	Sin repetición y con repetición.
#---------------------------------------------------------------------
#	Permutaciones(n)		=	n!
#
#											n!
#	PermutacionesRepeticion(n,a,b)	=    --------
#					      				  a!  b!
#
#									m!
#	Variaciones(m,n)		=    --------
#					     		 (m - n)!
#
#						 			 n
#	VariacionesRepeticion(m,n)	=	m
#
#
#									m!		Variaciones(m,n)
#	Combinaciones(m,n)		=   ---------- = ----------
#					    		(m-n)!  n!	Permutaciones(n)
#
#					     				(m+n-1)!
#	CombinacionesRepeticion(m,n)	=   ----------
#					     				n! (m-1)!
#
#---------------------------------------------------------------------
DELIMITER //
	DROP FUNCTION IF EXISTS factorial //
    CREATE FUNCTION factorial( numero INT8 )	RETURNS INT8
		DETERMINISTIC
        BEGIN
			DECLARE resultado INT8;
            SET resultado = 1;
            WHILE( numero > 1 ) DO
				SET resultado = resultado * numero;
                SET numero = numero - 1;
            END WHILE;
            RETURN resultado;
        END
// DELIMITER ;

SELECT factorial( -5 );
#---------------------------------------------------------------------
#	Permutaciones(n)		=	n!
#---------------------------------------------------------------------
	DELIMITER ^^
		DROP 	FUNCTION IF EXISTS	Permutacion ^^
        CREATE	FUNCTION Permutacion( n INT )	RETURNS INT8
			DETERMINISTIC
            BEGIN
				RETURN factorial( n );
            END;
    ^^ DELIMITER ;

	SELECT Permutacion( 3 );
#---------------------------------------------------------------------
#											n!
#	PermutacionesRepeticion(n,a,b)	=    --------
#					      				  a!  b!
#---------------------------------------------------------------------
	DELIMITER ,,
		DROP FUNCTION IF EXISTS PermutacionRepeticion ,,
        CREATE FUNCTION PermutacionRepeticion( n INT, a INT, b INT )	RETURNS FLOAT
			DETERMINISTIC
            BEGIN
				RETURN factorial(n) / ( factorial(a) * factorial(b) );
            END;
    ,, DELIMITER ;

	SELECT PermutacionRepeticion(5,3,2)
#---------------------------------------------------------------------
#									m!
#	Variaciones(m,n)		=    --------
#					     		 (m - n)!
#---------------------------------------------------------------------
	DELIMITER ##
		DROP FUNCTION IF EXISTS Variacion ##
        CREATE FUNCTION Variacion( m INT, n INT )	RETURNS FLOAT
			DETERMINISTIC
            BEGIN
				RETURN factorial( m ) / factorial( m - n );
            END;
    ## DELIMITER ;

	SELECT Variacion( 3, 2 );
#---------------------------------------------------------------------
#						 			 n
#	VariacionesRepeticion(m,n)	=	m
#---------------------------------------------------------------------
	DELIMITER ))
		DROP FUNCTION IF EXISTS VariacionRepeticion ))
        CREATE FUNCTION VariacionRepeticion( m INT, n INT )	RETURNS INT8
			DETERMINISTIC
            BEGIN
				RETURN POW( m , n );
            END;
    )) DELIMITER ;

	SELECT VariacionRepeticion( 3, 2 );
#---------------------------------------------------------------------
#									m!		Variaciones(m,n)
#	Combinaciones(m,n)		=   ---------- = ----------
#					    		(m-n)!  n!	Permutaciones(n)
#---------------------------------------------------------------------
	DELIMITER  $$
		DROP FUNCTION IF EXISTS Combinacion $$
        CREATE FUNCTION Combinacion( m INT, n INT )	RETURNS FLOAT 
			DETERMINISTIC
            BEGIN
				RETURN Variacion( m, n ) / Permutacion( n );
            END;
    $$ DELIMITER ;

	SELECT Combinacion( 3 , 2 );
#---------------------------------------------------------------------
#					     				(m+n-1)!
#	CombinacionesRepeticion(m,n)	=   ----------
#					     				n! (m-1)!
#---------------------------------------------------------------------
	DELIMITER ||
		DROP FUNCTION IF EXISTS CombinacionRepeticion ||
        CREATE FUNCTION CombinacionRepeticion( m INT, n INT ) 	RETURNS FLOAT 
			DETERMINISTIC
            BEGIN
				RETURN Permutacion( m + n - 1 ) / (Permutacion( n ) * Permutacion ( m - 1 ) );
            END;
    || DELIMITER ;

	SELECT CombinacionRepeticion( 3 , 2 );
    
    
    
    
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#	F = m x a
#---------------------------------------------------------------------
#	F 	fuerza en Newtons
#	m 	masa en Kg
#	a	aceleracion en m/s^2
#---------------------------------------------------------------------
	DELIMITER //
		DROP FUNCTION IF EXISTS fuerza //
        CREATE FUNCTION fuerza( masa INT, aceleracion FLOAT )	RETURNS FLOAT
			DETERMINISTIC
            BEGIN
				DECLARE fuerza 	FLOAT;
                SET fuerza = masa * aceleracion;
                RETURN fuerza;
            END;
    // DELIMITER ;
    
    SET @masa = 10, @aceleracion = 2.3;
    SELECT fuerza( @masa, @aceleracion );
    
    
#---------------------------------------------------------------------
#	F = G x M x m / r^2
#---------------------------------------------------------------------
	SET @G = 6.67 * POWER( 10, -11 );
    
    DELIMITER //
		DROP FUNCTION IF EXISTS FuerzaAtraccionCuerpos //
        CREATE FUNCTION FuerzaAtraccionCuerpos( masa1 FLOAT8, masa2 FLOAT8, radio FLOAT8 )	RETURNS FLOAT8
			DETERMINISTIC
            BEGIN
				RETURN @G * masa1 * masa2 / (radio * radio);
            END;
    // DELIMITER ;

	SET @masaTierra = 5.972 * power( 10, 24 );
    SET @masaLuna = 7.4 * power( 10, 22 );
    SET @radioTierra = 6378.1 * power( 10, 3 );
    SET @radioLuna = 1737.1 * power( 10, 3 );
    SET @distanciaTierraLuna = 384 * power( 10, 6 );
    
    SELECT FuerzaAtraccionCuerpos( @masaTierra, @masaLuna, @distanciaTierraLuna );
    
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

SELECT gravedad( @masaTierra, @radioTierra );
SELECT gravedad( @masaLuna, @radioLuna );

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

	SET @radioSol = 695.7 * power( 10, 6 );
    SET @masaSol = 1.989 * power( 10, 30 );

SELECT velocidadEscape( @masaTierra, @radioTierra );
SELECT velocidadEscape( @masaLuna, @radioLuna );
SELECT velocidadEscape( @masaSol, @radioSol );
