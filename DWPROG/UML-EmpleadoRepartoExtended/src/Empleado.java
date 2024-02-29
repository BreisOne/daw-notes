import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author nccasares
 */
public abstract class Empleado {
    private String nombre;

    private String DNI;
    private int edad;
    private double salario;

    public final double PLUS = 300;

    Scanner scanner = new Scanner(System.in);

    public Empleado(String nombre, String DNI, int edad, double salario){
       checkNombre(nombre);
       checkDNI(DNI);
       checkEdad(edad);
       checkSalario(salario);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    @Override
    public String toString() {
        return "nombre=" + nombre + ", edad=" + edad + ", salario=" + salario + ", ";
    }

    public abstract boolean plus();

    private void checkNombre(String nombre){
        boolean nombreIsNotCorrect = true;
        while(nombreIsNotCorrect){
            try{
                String regex = "^[a-zA-Z]{1,20}$";
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(nombre);

                if (matcher.matches()){
                    this.nombre = nombre;
                    nombreIsNotCorrect = false;
                }else {
                    throw new CustomException(CustomException.NAME_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir el nombre");
                nombre = scanner.nextLine();
            }

        }

    }
    private void checkEdad(int edad){
        boolean EdadIsNotCorrect = true;
        while(EdadIsNotCorrect){
           try{
               String regex = "^\\d{0,3}$";
               String edadString = Integer.toString(edad);

               Pattern pattern = Pattern.compile(regex);
               Matcher matcher = pattern.matcher(edadString);

               if(matcher.matches()){
                   this.edad = edad;
                   EdadIsNotCorrect = false;
               }else{
                   throw new CustomException(CustomException.AGE_CODE);
               }
           }catch (CustomException e){
               System.out.println(e.getmError());
               System.out.println("Vuelve a introducir la edad");
               edad = scanner.nextInt();
           }

        }
    }
    private void checkDNI(String DNI) {
        boolean DNIIsNotCorrect = true;
        while(DNIIsNotCorrect) {
            try {
                String regex = "^[0-9]{8}[A-Za-z]$";
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(DNI);

                if (matcher.matches()) {
                    this.DNI = DNI;
                    DNIIsNotCorrect = false;
                } else {
                    throw new CustomException(CustomException.DNI_CODE);
                }
            } catch (CustomException e) {
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir el DNI");
                DNI = scanner.nextLine();
            }
        }
    }
    private void checkSalario(double Salario){
        boolean salaryIsNotCorrect = true;
        while(salaryIsNotCorrect){
            try{
                String regex = "^\\d{5}$";
                String salarioString = Double.toString(Salario);

                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(salarioString);

                if(matcher.matches()){
                    this.salario = Salario;
                    salaryIsNotCorrect = false;
                }else{
                    throw new CustomException(CustomException.SALARY_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir un Salario");
                Salario = scanner.nextDouble();
            }
        }
    }
}
