public class Cuenta {

    private Titular titular;
    private double cantidad;

    public Cuenta(Titular titular) {
        this(titular, 0);
    }
    public Cuenta(Titular titular, double cantidad) {
        this.titular = titular;
        this.cantidad = cantidad;
    }

    //Getters y setters de la clase
    public Titular getTitular(){

        return this.titular;
    }
    public void setTitular(Titular titular){

        this.titular = titular;
    }
    public double getCantidad(){

        return this.cantidad;
    }
    public void setCantidad(double cantidad){

        this.cantidad = cantidad;
    }

    //Metodos ingresas retirar

    public void ingresar(double cantidad) {
        if (cantidad > 0) {
            this.cantidad += cantidad;
        }
    }

    public void retirar(double cantidad) {
        double nuevaCantidad = this.cantidad - cantidad;
        if (nuevaCantidad < 0) {
            this.cantidad = 0;
        } else {
            this.cantidad = nuevaCantidad;
        }
    }

    public String toString() {
        return "El titular " + titular.getNombre() + " tiene " + cantidad + " euros en la cuenta";
    }
}