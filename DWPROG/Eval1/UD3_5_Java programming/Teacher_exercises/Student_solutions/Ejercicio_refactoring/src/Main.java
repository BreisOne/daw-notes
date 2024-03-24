import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;

public class Main {
    public static void main(String[] args) {
        int [] numbers = {2,9,7,10,12};
        triple(numbers);
        int [] centimeters = {100,102000, 100};
        distance(centimeters);
        vowelCounter("patata"); //Después prueba con patata

        String[] frutas = {"Pera", "Pera", "Manzana", "Naranja"};
        String[] frutas2 = {"Pera", "Pera", "Manzana", "Naranja"};
        fruits(frutas);
        fruits(frutas2);

    }
    //Cambia el siguiente método para que pueda recibir como parámetro un array de números para
    //que sean multiplcados por 3
    public static void triple(int[] numbers){
        for (int i = 0; i < numbers.length ; i++) {
             numbers[i] = numbers[i]*3;
             System.out.println(numbers[i]);
        }
    }
    //Cambia el siguiente método para se le pueda pasar un array de centrimetros.
    public static void distance(int[] centimeters){
        for (int i = 0; i < centimeters.length ; i++) {
            int km = centimeters[i]/100000;
            int m = (centimeters[i]%100000)/100;
            int cm = (centimeters[i]%100);

            System.out.println(km +" Kilometros " + m + " metros " + cm + " centimetros");
        }

    }

    //Arregla este método. Está raro.
    public static void vowelCounter(String palabra){
        int counter = 0;
        char[] palabraArray = palabra.toLowerCase().toCharArray();

        for (int i = 0; i < palabraArray.length ; i++) {
            if (palabraArray[i] == 'a'|| palabraArray[i] == 'e'||
                    palabraArray[i] == 'i'|| palabraArray[i] == 'o'||
                    palabraArray[i] == 'u')
                counter++;
        }

        System.out.println("Número de vocales: " + counter);
    }

    //Nuestro programador no sabe como obtener el número de frutas iguales que están las bolsas
    public static void fruits(String[] fruits){
        //El siguiente tipo de estructura de datos se llama diccionario, HashMap o clave/valor.
        //Permite encontrar un valor buscando por su clave.
        HashMap<String, Integer> fruitsCounter = new HashMap<>();

        for (int i = 0; i <fruits.length ; i++) {
            if (!fruitsCounter.containsKey(fruits[i])){

                String findFruit = fruits[i];
                Integer countFruit = (int) Arrays.stream(fruits).filter(fruit -> fruit.equals(findFruit)).count();
                fruitsCounter.put(findFruit, countFruit);
                System.out.println("Hay " + fruitsCounter.get(findFruit) +" "+ findFruit);

            }
        }

    }





}