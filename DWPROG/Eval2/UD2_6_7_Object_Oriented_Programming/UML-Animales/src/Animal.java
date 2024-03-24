public class Animal extends SerVivo {
    private double peso;
    private double altura;

    public Animal(String nombreCientifico, String nombreComun, double peso, double altura){
        super(nombreCientifico, nombreComun);
        this.peso = peso;
        this.altura = altura;
    }
    public double getPeso(){
        return peso;
    }
    public void setPeso(double peso){
        this.peso = peso;
    }

    public double getAltura(){
        return altura;
    }
    public void setAltura(double altura){
        this.altura = altura;
    }

    public void alimentarse(){
        System.out.println("Heterotrofo");
    }

}
