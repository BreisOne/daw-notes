Algoritmo  RecuentoNumeros
	Definir N1 Como Entero;
	Definir aux Como Entero;
	Definir cont Como Entero;
	
	aux <- 0;
	Hacer
		Escribir "Introduce un número: ";
		Leer N1;
		Si N1 <> -999
			Si N1 >= 0
				Escribir "Es un número positivo";
			SiNo
				Escribir "Es un número negativo";
				aux <- aux +1;
				Escribir " Se han instroducido ", aux, "números negativos";
			FinSi
		FinSi
	Mientras Que N1 <> -999;
	
FinAlgoritmo

