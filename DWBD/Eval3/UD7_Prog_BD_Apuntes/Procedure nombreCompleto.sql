use Jardineria;

DELIMITER //
	DROP PROCEDURE IF EXISTS nombreCompleto //
    CREATE PROCEDURE nombreCompleto()
		BEGIN
            CALL agregarNombre();
            CALL agregarPrimerApellido();
            CALL agregarSegundoApellido();
        END
// DELIMITER ;

DELIMITER // 
	DROP PROCEDURE IF EXISTS agregarNombre // -- Nos aseguramos que no exista una función con este nombre
    CREATE PROCEDURE agregarNombre()
		BEGIN
			SET @nombre = 'Fulgencio';
        END
// DELIMITER ;

DELIMITER // 
	DROP Function IF EXISTS nombre_Completo // -- Nos aseguramos que no exista una función con este nombre
    CREATE FUNCTION nombre_Completo( nombre varchar(50), primerApellido varchar(50), segundoApellido varchar(50) )
		RETURNS varchar(200)
        DETERMINISTIC
		BEGIN
			DECLARE nombreCompleto varchar(200);
            SET nombreCompleto = CONCAT( nombre, ' ', primerApellido, ' ', segundoApellido );
            return nombreCompleto;
        END
// DELIMITER ;
DELIMITER // 
	DROP Function IF EXISTS nombre_completo_Ingles // -- Nos aseguramos que no exista una función con este nombre
    CREATE FUNCTION nombre_completo_Ingles( nombre varchar(50), primerApellido varchar(50), segundoApellido varchar(50) )
		RETURNS varchar(200)
        DETERMINISTIC
		BEGIN
			DECLARE nombreCompleto varchar(200);
            SET nombreCompleto = CONCAT( primerApellido, ' ', segundoApellido, ', ', nombre );
            return nombreCompleto;
        END
// DELIMITER ;

-- --------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------
DELIMITER // 
	DROP PROCEDURE IF EXISTS agregarPrimerApellido //
    CREATE PROCEDURE agregarPrimerApellido()
		BEGIN
			SET @nombre = CONCAT( @nombre, ' ', 'Guillermino' );
        END
// DELIMITER ;

DELIMITER // 
	DROP PROCEDURE IF EXISTS agregarSegundoApellido //
    CREATE PROCEDURE agregarSegundoApellido()
		BEGIN
			SET @nombre = CONCAT( @nombre, ' ', 'Pancracio' );
        END
// DELIMITER ;

DELIMITER // 
	DROP FUNCTION IF EXISTS sumarEnteros //
    CREATE FUNCTION sumarEnteros( a integer, b integer )
		RETURNS integer
        DETERMINISTIC
		BEGIN
          DECLARE  Resultado integer;	-- 
          SET Resultado = a + b;
			return Resultado;
        END
// DELIMITER ;
DELIMITER // 
	DROP FUNCTION IF EXISTS sumarDecimales //
    CREATE FUNCTION sumarDecimales( a double, b double )
		RETURNS double
        DETERMINISTIC
		BEGIN
          DECLARE  Resultado double;	-- 
          SET Resultado = a + b;
			return Resultado;
        END
// DELIMITER ;

delimiter !!
	drop procedure if exists calculos !!
    create procedure calculos( a int, b int, c int )
		begin
			declare r double;
            set r = a + b + c;
            set r = r / 3;
             select 'Valor medio:' + r;
        end
!! delimiter ;

delimiter //
	drop procedure if exists tablaMultiplicar //
    create procedure tablaMultiplicar( numero int )
		begin
			declare indice int;
            declare cadena varchar( 255 );
            set indice = 1;
            set cadena = '';
            mult:	while indice < 11 do
				set cadena = concat( cadena, '\n', concat( indice, ' * ', numero, ' = ', indice * numero ) );
                set indice = indice + 1;
            end while mult;
           select cadena;
        end
// delimiter ;


#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
delimiter !!
    drop procedure if exists numeroRomano !!
    create procedure numeroRomano( numero int )
		begin
			declare cadena varchar( 255 );
            set cadena = "";
			M:	while numero >= 1000 do
				set cadena = concat( cadena, 'M' );
                set numero = numero - 1000;
            end while M;
            
            if ( numero >= 900 ) then
				set cadena = concat( cadena, 'CM' );
                set numero = numero - 900;
            end if;
            
			D:	while numero >= 500 do
				set cadena = concat( cadena, 'D' );
                set numero = numero - 500;
            end while D;
            
            if ( numero >= 400 ) then
				set cadena = concat( cadena, 'CD' );
                set numero = numero - 400;
            end if;
            
			C:	while numero >= 100 do
				set cadena = concat( cadena, 'C' );
                set numero = numero - 100;
            end while C;
            
            if ( numero >= 90 ) then
				set cadena = concat( cadena, 'XC' );
                set numero = numero - 90;
            end if;

			L:	while numero >= 50 do
				set cadena = concat( cadena, 'L' );
                set numero = numero - 50;
            end while L;
            
            if ( numero >= 40 ) then
				set cadena = concat( cadena, 'XL' );
                set numero = numero - 40;
            end if;

			X:	while numero >= 10 do
				set cadena = concat( cadena, 'X' );
                set numero = numero - 10;
            end while X;
            
            if ( numero >= 9 ) then
				set cadena = concat( cadena, 'IX' );
                set numero = numero - 9;
            end if;

            if ( numero >= 5 ) then
				set cadena = concat( cadena, 'V' );
                set numero = numero - 5;
            end if;

            if ( numero = 4 ) then
				set cadena = concat( cadena, 'IV' );
                set numero = numero - 4;
            end if;

			I:	while numero >= 1 do
				set cadena = concat( cadena, 'I' );
                set numero = numero - 1;
            end while I;

            SELECT Cadena;
        end
!! delimiter ;

#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------


SET @nombre = '';
call nombreCompleto();
select @nombre;

select sumar(1,2);


set @res = sumarEnteros( 10.4, 45 );	select @res;
set @res = sumarDecimales( 10.1, 8.8 );	select @res;
select nombre_Completo( 'Fulgencio', 'Guillermino', 'Pancracio' );
select nombre_completo_Ingles( 'Fulgencio', 'Guillermino', 'Pancracio' );
select nombre_Completo( 'Fulgencio', 'Guillermino', 'Pancracio' ), nombre_completo_Ingles( 'Fulgencio', 'Guillermino', 'Pancracio' );
call calculos(1,2,4);
call tablaMultiplicar( 6 );
call numeroRomano( 555 );
call numeroRomano( 2024 );
