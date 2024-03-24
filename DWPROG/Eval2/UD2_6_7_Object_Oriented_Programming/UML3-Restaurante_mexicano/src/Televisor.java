public class Televisor extends Electrodomestico {
    private int pulgadas;
    final static int PULGADAS = 32;
    private boolean sintonizadorTDT;

    public  Televisor(){
        this(100, 5, "blanco", 'F', PULGADAS, false);
    }
    public Televisor(double precioBase, double peso) {
        this(precioBase, peso, "blanco", 'F', PULGADAS, false);
    }
    public Televisor(double precioBase, double peso, String color, char consumoElectrico, int pulgadas, boolean sintonizadorTDT) {
        super(precioBase, peso, color, consumoElectrico);
        this.pulgadas = pulgadas;
        this.sintonizadorTDT = sintonizadorTDT;
    }

    //Getters y Setters
     public int getPulgadas(){
        return pulgadas;
     }
     public void setPulgadas(int pulgadas){
        this.pulgadas = pulgadas;
     }
     public boolean getSintonizadorTDT(){
        return sintonizadorTDT;
     }
     public void setSintonizadorTDT( boolean sintonizadorTDT){
        this.sintonizadorTDT = sintonizadorTDT;
     }

     //Methods
    public double precioFinal(){
        double precioBase = super.precioFinal();

        if(pulgadas > 40){
            precioBase+= precioBase/0.3;
        }
        if(sintonizadorTDT){
            precioBase += 50;
        }

        return precioBase;

    }}
