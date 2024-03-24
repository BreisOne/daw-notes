package Exceptions;

public class ExceptionPrice extends Exception{
    @Override
    public String getMessage() {
        return "El precio introducido no es valido. Debe ser un número mayor que 0";
    }
}
