import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws ExcepcionPropia {

        Vehiculo coche = new Vehiculo("ferrari", 1987);
        Vehiculo furgoneta = new Vehiculo("volkswagen", 2007);
        Vehiculo caminoneta = new Vehiculo("Ford Raptor", 2023);
        Vehiculo camion = new Vehiculo("Skadia", 2018);
        Vehiculo patinete = new Vehiculo("Xaomi", 2013);

        ArrayList<Vehiculo> vehiculos = new ArrayList<>();
        vehiculos.add(coche);
        vehiculos.add(furgoneta);
        vehiculos.add(caminoneta);
        vehiculos.add(camion);
        vehiculos.add(patinete);

        vehiculos.forEach(vehiculo -> {
            try {
                vehiculo.setColor("amarillo");
            } catch (ExcepcionPropia e) {
               System.out.println(e.getMensaje());
            }
        });

        vehiculos.forEach(vehiculo -> {
            try {
                vehiculo.setMatricula("543543543543");
            } catch (ExcepcionPropia e) {
                System.out.println(e.getMensaje());
            }
        });

        try {
            camion.setMatricula("4567EDL");
            System.out.println(camion.getMatricula());

        }catch (ExcepcionPropia e) {
            System.out.println(e.getMensaje());
        }

        try {
            camion.setColor("rojo");
            System.out.println(camion.getColor());

        } catch (ExcepcionPropia e) {
            System.out.println(e.getMensaje());
        }

    }
}