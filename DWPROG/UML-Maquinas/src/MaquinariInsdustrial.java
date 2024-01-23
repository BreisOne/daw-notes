public class MaquinariInsdustrial extends Maquinaria{
    private double potenciaConsumo;

    public MaquinariInsdustrial(String numSerie, String modelo, double horasFuncionamiento, double potenciaConsumo){
        super(numSerie, modelo, horasFuncionamiento);
        this.potenciaConsumo = potenciaConsumo;
    }

    public double getPotenciaConsumo(){
        return potenciaConsumo;
    }
    public void setPotenciaConsumo(double potenciaConsumo){
        this.potenciaConsumo = potenciaConsumo;
    }

    public void encender(){
        System.out.println("Maquinaria industrial encendida");
    }

    public  void apagar(){
        System.out.println("Maquinaria industrial apagada");
    }
}
