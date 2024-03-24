public class Turismo extends Vehiculo implements Conducir {
    public Turismo (String modelo, String matricula, int velocidad){
        super( modelo, matricula, velocidad);
    }
    public void acelerar(int velocidad){
        this.velocidad += velocidad;
        if(this.velocidad > velocidadMaxima){
            this.velocidad = velocidadMaxima;
        }
        System.out.println("El turismo ha aumentado su velocidad "+ velocidad+" Km/h." +
                            "Su velodaidad actual es: "+this.velocidad);
    }
    public void frenar(int velocidad){
        this.velocidad -= velocidad;
        if(this.velocidad < 0){
            this.velocidad = 0;
        }
        System.out.println("El turismo ha disminuido su velocidad "+ velocidad+" Km/h." +
                "Su velodaidad actual es: "+this.velocidad);
    }
}
