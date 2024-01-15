public class Electrodomestico {
    private double precioBase;
    private String color;
    private char consumElectrico;
    private double peso;

    public Electrodomestico(){
        this.precioBase = 100;
        this.consumElectrico = 'F';
        this.color = "Blanco";
        this.peso = 5;
    }
    public Electrodomestico(double precioBase, double Peso){
        this.precioBase = precioBase;
        this.consumElectrico = 'F';
        this.color = "Blanco";
        this.peso = Peso;
    }
    public Electrodomestico(double precioBase,String color, char consumoElectrico, double peso){
        this.precioBase = precioBase;
        this.consumElectrico = consumoElectrico;
        this.color = color;
        this.peso = peso;
    }

    //Getters y Setters.





}
