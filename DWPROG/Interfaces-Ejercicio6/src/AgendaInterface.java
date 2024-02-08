public interface AgendaInterface {
    void insertarNuevaEntrada(int key, Contacto contacto);
    void buscarContactoPorNombre( String nombre);
    String eliminarContactoPorNombre(String nombre);
    void listarContacto();
    void listasTodosContactosConUnaLetra(String letra);
}
