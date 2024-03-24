public class Consumo {

    private double kms;
    private double litros;
    private double vmed;
    private double pgas;

    public Consumo (double kms, double litros, double vmed, double pgas){
        this.kms = kms;
        this.litros = litros;
        this.vmed = vmed;
        this.pgas = pgas;
    }

    //Getters y setters;

    public double getKms(){
        return this.kms;
    }
    public void setKms(double kms){
        this.kms = kms;
    }
    public double getLitros(){
        return this.litros;
    }
    public void setLitros(double litros){
        this.litros = litros;
    }
    public double getVmed(){
        return this.vmed;
    }
    public void setVmed(double vmed){
        this.vmed = vmed;
    }
    public double getPgas(){
        return this.pgas;
    }
    public void setPgas(double pgas){
        this.pgas = pgas;
    }

    //Methods
    public double getTime(){
        return this.kms/this.vmed;
    }
    public double consumoMedio(){
        return (this.litros/this.kms)*100;
    }
    public double consumoEuros(){
        return this.consumoMedio()*this.pgas;
    }
}
