public class Serie implements objetoVideoClub {
    private String titulo;
    private int numeroTemporadas;
    private boolean entregado;
    private String genero;
    private String creador;

    public Serie(){
        this("", " ");
        this.genero = "";
        this.numeroTemporadas = 3;
        this.entregado = false;
    }
    public Serie(String titulo, String creador){
        this(titulo, 3, "", creador);
        this.entregado = false;
    }
    public Serie(String titulo, int numeroTemporadas, String genero, String creador){
        this.titulo = titulo;
        this.numeroTemporadas = numeroTemporadas;
        this.genero = genero;
        this.creador = creador;
    }

    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public int getNumeroTemporadas() {
        return numeroTemporadas;
    }
    public void setNumeroTemporadas(int numeroTemporadas) {
        this.numeroTemporadas = numeroTemporadas;
    }
    public String getGenero() {
        return genero;
    }
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public String getCreador() {
        return creador;
    }
    public void setCreador(String creador) {
        this.creador = creador;
    }
    public String toString() {
        return "Serie{" +
                "titulo='" + titulo + '\'' +
                ", numeroTemporadas=" + numeroTemporadas +
                ", entregado=" + entregado +
                ", genero='" + genero + '\'' +
                ", creador='" + creador + '\'' +
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
