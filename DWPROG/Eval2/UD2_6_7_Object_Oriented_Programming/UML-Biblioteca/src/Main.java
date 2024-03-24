public class Main {
    public static void main(String[] args) {
     Libro DonQuijote = new Libro("10032", "Don quijote de la mancha",1900);
     Revista Hola = new Revista( "12321","Hola", 2023, 14);

     System.out.println(DonQuijote.toString());
     System.out.println(DonQuijote.prestar());
     System.out.println(DonQuijote.devolver());

     System.out.println(Hola.toString());
     System.out.println(Hola.prestar());
     System.out.println(Hola.devolver());
    }
}