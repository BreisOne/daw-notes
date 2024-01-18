public class Alumno extends Persona{
    private String escuela;
    private String grado;

    public Alumno(String nombre, int edad, String DNI, char sexo, double peso, double altura, String escuela, String grado){

        super(nombre, edad, DNI, sexo, peso, altura);
        if(super.comprobarEdad(edad) && super.comprobarSexo(sexo)){
            this.escuela = escuela;
            this.grado = grado;
        }else {
            return;
        }
    }

    public void showInfo(){
        super.showInfo();
        System.out.println("escuela:" + escuela);
        System.out.println("grado:" + grado);
    }


}
