import java.security.PublicKey;

public class Finanzas {
    private double euros;
    private double dolares;
    private String moneda;
    final static double TASACAMBIO = 1.36;
    private double tasaCambio;

    public Finanzas(){
        tasaCambio = TASACAMBIO;
    }
    public Finanzas(double tasaCambio){
        this.tasaCambio = tasaCambio;
    }

    //Methods
    public double eurosToDollars(double euros){
        return euros / tasaCambio;
    }
    public  double dollarsToEuros(double dollars){
        return dollars * tasaCambio;
    }


}
