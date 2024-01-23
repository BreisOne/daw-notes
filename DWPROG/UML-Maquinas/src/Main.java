public class Main {
    public static void main(String[] args) {
        MaquinariaDomestica televisor = new MaquinariaDomestica("4323223432","Samsung",600);
        MaquinariInsdustrial excavadora = new MaquinariInsdustrial("421425532432","CAT",50000,5454355);

        televisor.encender();
        televisor.apagar();
        excavadora.encender();
        excavadora.apagar();
    }
}