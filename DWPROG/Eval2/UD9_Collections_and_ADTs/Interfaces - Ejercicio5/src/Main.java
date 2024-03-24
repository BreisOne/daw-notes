public class Main {
    public static void main(String[] args) {

        Agenda agenda = new Agenda();
        Contacto padre = new Contacto("Jaime", 678345902);
        Contacto madre = new Contacto("Lola", 987456342);

        agenda.insertarNuevaEntrada(1,padre);
        agenda.insertarNuevaEntrada(2, madre);

        agenda.buscarContactoPorNombre("Jaime");

        System.out.println("-----------------");

        agenda.listasTodosContactosConUnaLetra("a");
        agenda.listasTodosContactosConUnaLetra("o");

        System.out.println("-----------------");

        agenda.eliminarContactoPorNombre("Jaime");
        agenda.listarContacto();
    }
}