public class Senador extends Legislador {
    public Senador (String DNI, String nombre, String apellidos, int edad, String provinciaRepresentada, String camara, boolean esNacional, int anosResidencia){
        super( DNI,  nombre,  apellidos,  edad, provinciaRepresentada, camara, esNacional, anosResidencia);
    }

    public void getCamaraEnQueTraba(){
        System.out.println("Este legislador trabaja en el: "+ camara);
    };
}
