public abstract class Aparato {
    private double consumoElectrico;
    public static double consumoTotal;
    private boolean encendido;

    public Aparato(double consumoElectrico){
        this.consumoElectrico = consumoElectrico;
        this.encendido = false;
    }

    public void encender(){
        encendido = true;
        consumoTotal += consumoElectrico;
    }
    public void apagar(){
        encendido = false;
        consumoTotal -= consumoElectrico;
    }
    public double getConsumo(){
        return consumoTotal;
    }


}
