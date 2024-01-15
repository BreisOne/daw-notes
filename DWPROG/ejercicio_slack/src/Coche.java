public class Coche extends Vehiculo{

    public Coche( String marca, int puertas, int ruedas, String motor, int estadoMotor, String matricula){
        super(marca, puertas, ruedas, motor, estadoMotor, matricula);
    }

    public float Reparar() {
        workHours = ((10 - estadoMotor)/2)* motor
    }
}