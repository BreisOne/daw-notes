public class Main {
    public static void main(String[] args) {

        Animal perro = new Animal("Canis", "perro", 50, 60);
        Vegetal girasol = new Vegetal("Girasolis", "Girasol", 150);

        perro.alimentarse();
        girasol.alimentarse();
    }
}