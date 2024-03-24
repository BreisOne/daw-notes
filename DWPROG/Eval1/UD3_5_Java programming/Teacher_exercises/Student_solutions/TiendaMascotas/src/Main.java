import java.util.ArrayList;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {


        ArrayList<Animal> animales = new ArrayList<>();
        Util util = new Util();


        Perro perro = new Perro(20.5F, 1.05F, "Gran Danes");
        Gato gato = new Gato(20.5F, 1.05F);

        animales.add(perro);
        animales.add(gato);



        for (Animal animal: animales) {
            System.out.println(animal.hacerRuido());
        }


        System.out.println(util.calcularIMC(perro.getPeso(), perro.getAltura()));



    }
}