Algoritmo PideDias
	
	Definir userInput Como Entero;
	Definir contador Como Entero;
	
	Escribir "Introduce un número";
	Leer userInput;
	
	Mientras userInput<> -1 Hacer
		
		si userInput <1 | userInput > 31 Entonces
			Escribir "Error_día invalido";
		SiNo
			contador = contador+1
		FinSi
		
		Escribir "Introduce un número";
		Leer userInput;
	FinMientras
	
	Escribir"Se ha introducido un total de " contador " días validos";
	
FinAlgoritmo
