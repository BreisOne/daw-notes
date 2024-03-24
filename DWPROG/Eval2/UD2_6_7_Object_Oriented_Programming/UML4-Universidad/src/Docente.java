public class Docente extends Persona{
    private String materia;

    public Docente(String nombre, int edad, String DNI, char sexo, double peso, double altura, String materia){
        super(nombre, edad, DNI, sexo, peso, altura);
        if(super.comprobarEdad(edad) && super.comprobarSexo(sexo)){
            this.materia = materia;
        }else {
            return;
        }
    }
    public void showInfo(){
        super.showInfo();
        System.out.println("materia:" + materia);
    }
}
