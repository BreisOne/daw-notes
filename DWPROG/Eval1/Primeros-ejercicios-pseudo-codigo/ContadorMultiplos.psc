Proceso ContadorMultiplos
	Definir N1 Como Entero;
	Definir N2 Como Entero;
	Definir aux Como Entero;
	Definir cont Como Entero;
	
	Escribir "Ingrese un número primer número: ";
	Leer N1;
	Escribir "Ingrese un número segundo número: ";
	Leer N2;
	
	aux <- 0;
	
	Si (N1<N2) Entonces
		Para cont <- N1 Hasta N2 Con Paso 1 Hacer
			Si cont mod 5 = 0 Entonces
				aux <- aux+1;
			FinSi
		FinPara
		
		Escribir "Existen ", aux, " múltiplos de 5 entre ", N1, " y ", N2;
	FinSi
	
	
	
FinProceso
