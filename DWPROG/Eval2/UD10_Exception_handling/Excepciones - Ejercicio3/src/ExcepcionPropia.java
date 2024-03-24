import java.lang.Exception;
public class ExcepcionPropia extends Exception{
    private String mensaje;

    public ExcepcionPropia(int codigo){
        switch(codigo){
            case 1:
                this.mensaje = "El color no es esta permitido";
                break;
            case 2:
                this.mensaje = "La matricula no tiene el formato correcto";
                break;
        }
    }

    public String getMensaje(){
        return mensaje;
    }
}
