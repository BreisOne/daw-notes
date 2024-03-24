package Validaciones;

import java.time.LocalDate;

public class Validaciones {

    public static boolean chequearPrecio(double precio){
        return precio >= 0;
    }

    public static boolean chequearFechaCaducidad (LocalDate fechaCaduciadad){
        LocalDate fechaActual = LocalDate.now();
        return  fechaCaduciadad.isAfter(fechaActual);
    }
}
