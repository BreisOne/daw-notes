public class AlumnoInternacional extends Alumno{
    private String pais;

    public AlumnoInternacional(String nombre, int edad, String DNI, char sexo, double peso, double altura, String escuela, String grado, String pais){
        super(nombre, edad, DNI, sexo, peso, altura,escuela,grado);
        if(super.comprobarEdad(edad) && super.comprobarSexo(sexo)){
            this.pais = pais;
        }else {
            return;
        }
    }

    public void showInfo(){
        super.showInfo();
        System.out.println("pais:" + pais);
    }
}
