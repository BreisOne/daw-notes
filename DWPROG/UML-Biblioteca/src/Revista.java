public class Revista extends Texto implements Prestable{

    private int numero;

    public Revista(String codigo, String titulo, int anhoPublicacion, int numero) {
        super(codigo, titulo, anhoPublicacion);
        this.numero = numero;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String toString() {
        return super.toString() + '\n'+
                "numero=" + numero;
    }

    public String prestar(){
        return "La revista "+ titulo + " ha sido prestada";
    }

    public String devolver(){
        return "La resvista " + titulo + " ha sido devuelta";
    }
}
