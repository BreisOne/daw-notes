public class Vehiculo {
    private String modelo;
    private String matricula;
    protected int velocidad;

    public Vehiculo ( String modelo, String matricula, int velocidad){
        this.modelo = modelo;
        this.matricula = matricula;
        this.velocidad = velocidad;

    }

    public  String  getModelo(){
        return modelo;
    }
    public  void setModelo(String modelo){
        this.modelo = modelo;
    }
    public  String getMatricula(){
        return matricula;
    }
    public  void setMatricula(String matricula){
        this.matricula = matricula;
    }
    public  int getVelocidad(){
        return velocidad;
    }

    public void setVelocidad(int velocidad){
        this.velocidad = velocidad;
    }
}
