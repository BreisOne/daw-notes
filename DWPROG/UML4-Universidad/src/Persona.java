public class Persona {
    private String nombre;
    private int edad;
    private String DNI;
    private char sexo;
    private double peso;
    private double altura;

    public Persona(String nombre, int edad, String DNI, char sexo, double peso, double altura){
        if(comprobarEdad(edad) && comprobarSexo(sexo)){
            this.nombre = nombre;
            this.edad = edad;
            this.DNI = DNI;
            this.sexo = sexo;
            this.peso = peso;
            this.altura = altura;

        }else {
            return;
        }

    }
    //Methods
    protected boolean comprobarEdad(int edad){
        return edad >= 18 && edad<100;
    }
    protected boolean comprobarSexo(char sexo){
        return sexo == 'F' || sexo =='M';
    }

    public void showInfo(){
        System.out.println("-------------");
        System.out.println("Información Persona");
        System.out.println("nombre:" + nombre);
        System.out.println("edad:" + edad);
        System.out.println("DNI:" + DNI);
        System.out.println("sexo:"+ sexo);
        System.out.println("peso:" + peso);
        System.out.println("altura:" + altura);
    }
}
