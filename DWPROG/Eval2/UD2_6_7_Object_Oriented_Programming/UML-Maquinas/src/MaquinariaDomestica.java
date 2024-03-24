public class MaquinariaDomestica extends Maquinaria{
    public MaquinariaDomestica(String numSerie, String modelo, double horasFuncionamiento){
        super(numSerie, modelo, horasFuncionamiento);
    }

    public void encender(){
        System.out.println("Maquinaria domestica encendida");
    }
    public void apagar(){
        System.out.println("Maquinaria domestica apagada");
    }
}
