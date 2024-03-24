/* Este codigo ha sido generado por el modulo psexport 20180802-w32 de PSeInt.
Es posible que el codigo generado no sea completamente correcto. Si encuentra
errores por favor reportelos en el foro (http://pseint.sourceforge.net). */

// En java, el nombre de un archivo fuente debe coincidir con el nombre de la clase que contiene,
// por lo que este archivo deber�a llamarse "PIDEDIAS.java."

import java.io.*;
import java.util.Scanner;

public class PideDias {

	public static void main(String args[]) {
		int contador = 0;
		int userInput;

		Scanner scanner = new Scanner(System.in);

		System.out.println("Introduce un numero");
		userInput = scanner.nextInt();

		while (userInput!=-1) {
			if (userInput<1 || userInput>31) {
				System.out.println("Error: dia invalido");
			} else {
				contador = contador+1;
			}
			System.out.println("Introduce un numero");
			userInput = scanner.nextInt();
		}
		System.out.println("Se ha introducido un total de "+contador+" dias validos");
	}


}

