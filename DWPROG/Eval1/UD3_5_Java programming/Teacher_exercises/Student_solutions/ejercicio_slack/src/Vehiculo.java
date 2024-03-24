public abstract class Vehiculo {

    private String marca;
    private int puertas;
    private int ruedas;
    private String motor;
    private int estadoMotor;
    private String matricula;

    public Vehiculo(String marca, int puertas, int ruedas, String motor, int estadoMotor, String matricula){
        this.marca = marca;
        this.puertas = puertas;
        this.ruedas = ruedas;
        this.motor = motor;
        this.estadoMotor = estadoMotor;
        this.matricula = matricula;
    }

    public String getMarca() {
        return marca;
    }
    public int getPuertas() {
        return puertas;
    }
    public int getRuedas() {
        return ruedas;
    }

    public abstract float Reparar(){

    }
}
