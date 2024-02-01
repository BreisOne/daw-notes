public class Libro extends Texto implements Prestable {
    private boolean prestamo;


    public Libro(String codigo, String titulo, int anhoPublicacion) {
        super(codigo, titulo, anhoPublicacion);
        prestamo = false;

    }

    public Libro(String codigo, String titulo, int anhoPublicacion, boolean prestamo) {
        super(codigo, titulo, anhoPublicacion);
        this.prestamo = prestamo;
    }

    public boolean isPrestamo() {
        return prestamo;
    }

    public void setPrestamo(boolean prestamo) {
        this.prestamo = prestamo;
    }

    public String toString() {
        return super.toString() + '\n'+
                "prestamo=" + prestamo;
    }

    public String prestar(){
        if(prestamo){
            return "Lo sentimos el libro " + titulo + " ya se ha prestado";
        }else {
            prestamo = true;
            return "El libro " + titulo + " esta disposible y puedes llevartelo";
        }
    }
    public  String devolver(){
        if (prestamo){
            prestamo = false;
            return "Gracias por devolver el libro " + titulo;
        }else {
            return "El libro " + titulo + " ya se ha devuelto";
        }
    }
}
