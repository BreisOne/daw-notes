public class Lavavajillas extends Electrodomestico {
    private final static  int NUMSERVICIOS = 12;
    private int numServicios;

    public  Lavavajillas(){
        this(100, 5, "blanco", 'F', NUMSERVICIOS);
    }
    public Lavavajillas(double precioBase, double peso) {
        this(precioBase, peso,"blanco", 'F',  NUMSERVICIOS);
    }
    public Lavavajillas(double precioBase, double peso, String color, char consumoElectrico, int numServicios) {
        super(precioBase, peso, color, consumoElectrico);
        this.numServicios = numServicios;
    }

    // Getters y setters
    public int getNumServicios(){
        return this.numServicios;
    }
    public void setNumServicios(int numServicios){
        this.numServicios = numServicios;
    }
    //Methods
    public int precioFinal(){
        double precioBase = super.precioFinal();

        if (this.numServicios > 12){
            precioBase += 60;
        }
        super.setPrecioBase(precioBase);

        return (int) precioBase;
    }



}
