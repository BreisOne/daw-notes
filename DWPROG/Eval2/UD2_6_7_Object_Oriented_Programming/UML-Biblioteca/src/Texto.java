public class Texto {
    private String codigo;
    protected String titulo;
    private int anhoPublicacion;

    public Texto(){
        codigo = "1235";
        titulo = "titulo por defecto";
        anhoPublicacion =  1997;
    }
    public  Texto(String codigo, String titulo, int anhoPublicacion){
        this.codigo = codigo;
        this.titulo = titulo;
        this.anhoPublicacion = anhoPublicacion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getAnhoPublicacion() {
        return anhoPublicacion;
    }

    public void setAnhoPublicacion(int anhoPublicacion) {
        this.anhoPublicacion = anhoPublicacion;
    }

    public String toString() {
        return "------------------"+ '\n' +
                "codigo=" + codigo + '\n' +
                "titulo=" + titulo + '\n' +
                "anhoPublicacion=" + anhoPublicacion;
    }
}
