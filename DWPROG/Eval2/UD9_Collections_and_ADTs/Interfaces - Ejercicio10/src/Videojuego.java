public class Videojuego implements objetoVideoClub {
    private String titulo;
    private double horasEstimandas;
    private boolean entregado;
    private String genero;
    private  String companhia;

    public Videojuego(){
        this.titulo = "";
        this.genero = "";
        this.companhia = "";
        this.horasEstimandas = 10;
        this.entregado = false;
    }
    public Videojuego(String titulo, double horasEstimandas){
        this(titulo, horasEstimandas, "", "");
        this.entregado = false;
    }
    public Videojuego(String titulo, double horasEstimandas, String genero, String companhia){
        this.titulo = titulo;
        this.horasEstimandas = horasEstimandas;
        this.genero = genero;
        this.companhia = companhia;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public double getHorasEstimandas() {
        return horasEstimandas;
    }

    public void setHorasEstimandas(double horasEstimandas) {
        this.horasEstimandas = horasEstimandas;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCompanhia() {
        return companhia;
    }

    public void setCompanhia(String companhia) {
        this.companhia = companhia;
    }

    public String toString() {
        return "Videojuego{" +
                "titulo='" + titulo + '\'' +
                ", horasEstimandas=" + horasEstimandas +
                ", entregado=" + entregado +
                ", genero='" + genero + '\'' +
                ", companhia='" + companhia + '\'' +
                '}';
    }

    public void entregar() {
        this.entregado =true;
    }

    public void devolver() {
        this.entregado = false;
    }
    public boolean isEntregado() {
        return entregado;
    }
}
