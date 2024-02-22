import java.security.PublicKey;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Vehiculo {
    private String color;
    private String modelo;
    private String matricula;
    private int anhoFabricacion;

    public  Vehiculo (String modelo, int anhoFabricacion){
        this.modelo = modelo;
        this.anhoFabricacion = anhoFabricacion;
    }

    public String getColor() {
        return color;
    }
    public void setColor(String color) throws ExcepcionPropia {
        if(checkColor(color)){
            this.color = color;
        };
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) throws ExcepcionPropia {

        if(checkMatricula(matricula)){
            this.matricula = matricula;
        }
    }

    public int getAnhoFabricacion() {
        return anhoFabricacion;
    }

    public void setAnhoFabricacion(int anhoFabricacion) {
        this.anhoFabricacion = anhoFabricacion;
    }

    private boolean checkColor(String color) throws  ExcepcionPropia{
        String coloresPermiditos = "rojo azul blanco gris negro";

        if(coloresPermiditos.contains(color)){
            return true;
        } else {
             throw new ExcepcionPropia(1);
        }
    }
    private boolean checkMatricula(String matricula) throws ExcepcionPropia {
        String regex = "^.{4}[a-zA-Z]{3}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(matricula);

        if(matcher.matches()){
            return true;
        }else {
            throw new ExcepcionPropia(2);
        }
    }

}
