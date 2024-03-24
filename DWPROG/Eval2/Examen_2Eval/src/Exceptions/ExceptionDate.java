package Exceptions;

public class ExceptionDate extends Exception{
    @Override
    public String getMessage() {
        return "La fecha de caducidad introducida es previa al la fecha actual";
    }
}
