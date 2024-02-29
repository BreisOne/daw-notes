/**
 *
 * @author nccasares
 */

import java.util.ArrayList;
import java.util.Scanner;

/**
 * Implementar un programa que gestione empleados.
 *
 * Características:
 * Nombre
 * Edad
 * Salario
 * También existirá una constante llamada PLUS, que tendrá un valor de 300€
 *
 * La clase empleado no necesitará ser instanciada.
 * Existen dos tipos de empleados: repartidor y comercial.
 *
 * El comercial, aparte de los atributos anteriores, tiene uno propio llamado comisión (double).
 *
 * El repartidor, aparte de los atributos de empleado, tiene otro propio zona (String).
 *
 * Crea sus constructores, getters and setters y toString.
 *
 * Las clases tendrán un método llamado plus, que según en cada clase tendrá una implementación distinta.
 * En comercial, si tiene más de 30 años y cobra una comisión de más de 200 euros, se le aplicará el plus.
 * En repartidor, si tiene menos de 25 y reparte en la “zona 3”, recibirá el plus.
 *
 * Crea una clase ejecutable donde crees distintos empleados y le apliques el plus para comprobar que funciona.
 * */

public class Principal {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        ArrayList<Empleado> empleados = new ArrayList<>();

        while(true){


                System.out.println("Teclea 1 para añadir un nuevo empleado");
                System.out.println("Teclea 2 para añadir un nuevo empleado");
                int userOption = scanner.nextInt();

                if (userOption == 1){
                    System.out.println("El empleado es un repartidos o un comercial:");
                    String employeeType = scanner.nextLine();

                    System.out.println("Introduce el nombre del empleado:");
                    String employeeName = scanner.nextLine();

                    System.out.println("Introduce su edad:");
                    int employeeAge = scanner.nextInt();
                    scanner.nextLine();

                    System.out.println("Cual es su DNI");
                    String employeeDNI = scanner.nextLine();

                    System.out.println("Cunto gana");
                    double employeeSalary = scanner.nextDouble();
                    scanner.nextLine();

                    if(employeeType.contains("comercial")){

                        System.out.println("Cual el su comision");
                        double employeeComission = scanner.nextDouble();
                        scanner.nextLine();

                        Comercial employeeComercial = new Comercial(employeeComission, employeeName, employeeDNI, employeeAge , employeeSalary);
                        empleados.add(employeeComercial);


                    } else if (employeeType.contains("repartidos")) {

                        System.out.println("Cual el su zona");
                        String employeeZone = scanner.nextLine();

                        Repartidor employeeDelivery = new Repartidor(employeeZone, employeeName, employeeDNI, employeeAge , employeeSalary);
                        empleados.add(employeeDelivery);

                    }else{
                        System.out.println("Elige un tipo de empleado valido");
                    }

                } else if (userOption == 2) {
                    empleados.forEach(empleado -> System.out.println(empleado.toString()));

                }else{
                    System.out.println("Elige una opción correcta");

                }
        }
    }
}

