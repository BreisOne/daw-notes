import lombok.*;

public class Alquiler {
    @Getter @Setter
    private Cliente personaAlquila;
    @Getter @Setter
    private Vehiculo vehiculoAlquilado;
    @Getter @Setter
    private String fechaAlquiler;
    @Getter @Setter
    private int tiempoAlquiler;


    public  Alquiler (Cliente personaAlquila, Vehiculo vehiculoAlquilado, String fechaAlquiler, int tiempoAlquiler){
        this.personaAlquila = personaAlquila;
        this.vehiculoAlquilado = vehiculoAlquilado;
        this.fechaAlquiler = fechaAlquiler;
        this.tiempoAlquiler = tiempoAlquiler;
    }
    //Getters y setters


}
