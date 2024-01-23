public abstract class Legislador extends Persona {
    private String provinciaRepresentada;
    protected String camara;
    private boolean esNacional;
    private int anosResidencia;

    public Legislador(String DNI, String nombre, String apellidos, int edad, String provinciaRepresentada, String camara, boolean esNacional, int anosResidencia){
        super( DNI,  nombre,  apellidos,  edad);
        this.provinciaRepresentada = provinciaRepresentada;
        this.camara = camara;
        this.esNacional = esNacional;
        this.anosResidencia = anosResidencia;
    }

    public abstract void getCamaraEnQueTraba();

}
