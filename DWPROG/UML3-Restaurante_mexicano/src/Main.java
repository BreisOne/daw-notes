public class Main {
    public static void main(String[] args) {
        double[] preciosBase = {100, 50, 60, 70, 80, 99, 50, 75, 95, 120};
        double[] pesos = {100, 50, 60, 70, 80, 99, 50, 75, 95, 120};
        String[] colores = {"blanco", "gris", "rojo", "azul", "negro", "blanco", "gris", "rojo", "azul", "negro"};
        char[] consumosElectricos = {'F', 'A', 'B', 'D', 'C', 'F', 'A', 'B', 'D', 'C'};

        int[] pulgadas = {32, 40, 54};

        boolean[] sintonizadoresTDT = {true, false, true};

        int[] numerosServicios = {6, 14,16};

        Electrodomestico[] electrodomesticos = new Electrodomestico[10];

        for (int i = 0; i < 3; i++) {
            electrodomesticos[i] = new Televisor(preciosBase[i], pesos[i], colores[i], consumosElectricos[i], pulgadas[i], sintonizadoresTDT[i]);
        }
        for (int i = 3; i < 6; i++) {
            electrodomesticos[i] = new Lavavajillas(preciosBase[i], pesos[i], colores[i], consumosElectricos[i], numerosServicios[i - 3]);
        }
        for(int i=6; i<10; i++){
            electrodomesticos[i] = new Electrodomestico(preciosBase[i], pesos[i], colores[i], consumosElectricos[i]);
        }

        double precioTelevisores = 0;
        double precioLavavajillas = 0;


        for (Electrodomestico electrodomestico : electrodomesticos) {
            double precioElectrodomestico = electrodomestico.precioFinal();

            System.out.println(precioElectrodomestico);

            if (electrodomestico instanceof Televisor) {
                precioTelevisores += precioElectrodomestico;

            }
            if (electrodomestico instanceof Lavavajillas) {
                precioLavavajillas += precioElectrodomestico;
            }

        }
        System.out.println(precioTelevisores);
        System.out.println(precioLavavajillas);
    }
}