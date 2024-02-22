import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("Introduce el número de alumnos que tiene la clase:");
        int numAlumnos = scanner.nextInt();
        scanner.nextLine();

        PriorityQueue<Alumno> alumnos = new PriorityQueue<>(Comparator.comparing(Alumno::getApellido1)
                                                                      .thenComparing(Alumno::getApellido2)
                                                                      .thenComparing(Alumno::getNombre));

        for (int i = 0; i < numAlumnos ; i++) {
            int contAlum = i+1;

            System.out.println("Nombre del Alumno "+contAlum+":");
            String nombre = scanner.nextLine();

            System.out.println("Apellido1 del Alumno "+contAlum+":");
            String apellido1 = scanner.nextLine();

            System.out.println("Apellido2 del Alumno "+contAlum+":");
            String apellido2 = scanner.nextLine();

            System.out.println("Nacionalidad del Alumno "+contAlum+":");
            String nacionalidad = scanner.nextLine();

            Alumno alumno = new Alumno(nombre, apellido1, apellido2, nacionalidad);

            alumnos.add(alumno);

        }

        for(Alumno alumno: alumnos){
            System.out.println("------------------------");
            System.out.println(alumno.toString());

        }

    }
}