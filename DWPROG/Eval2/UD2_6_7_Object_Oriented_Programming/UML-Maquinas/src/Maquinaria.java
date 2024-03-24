public abstract class Maquinaria {
    private String numSerie;
    private String modelo;
    private double horasFuncionamiento;

    public Maquinaria(String numSerie, String modelo, double horasFuncionamiento){
        this.numSerie = numSerie;
        this.modelo = modelo;
        this.horasFuncionamiento = horasFuncionamiento;

    }
    //Getters y setters;

    public String getNumSerie(){
        return numSerie;
    }
    public void setNumSerie(String numSerie){
        this.numSerie = numSerie;
    }

    public String getModelo(){
        return modelo;
    }
    public void setModelo(String modelo){
        this.modelo = modelo;
    }
    public double getHorasFuncionamiento(){
        return horasFuncionamiento;
    }

    public void setHorasFuncionamiento(double horasFuncionamiento){
        this.horasFuncionamiento = horasFuncionamiento;
    }

    public abstract void encender();
    public abstract void apagar();
}
