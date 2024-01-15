import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

public class Main {
    public static void main(String[] args) {
        conversorMorse("Hola Que ase");
    }

    public static String letraToMorse(String frase, HashMap<Character, String> morseCodeMap){
        String traduccion ="";
        String [] palabras = frase.toUpperCase().split(" ");
        for (String palabra:palabras) {
            char[] letras = palabra.toCharArray();
            for (char letra:letras) {
                String tempVar = morseCodeMap.get(letra);
                traduccion += tempVar;
                traduccion+= " ";
            }
            traduccion+= "/";
        }
        return traduccion;
    }
    public static String morseToLetra(String frase, HashMap<String, Character> morseCodeMap ){
        String traduccion = "";
        String [] palabras = frase.split("/");

        for (String palabra:palabras) {
            String[] letras = palabra.split(" ");
            for (String letra:letras) {
                char tempVar = morseCodeMap.get(letra);
                traduccion += tempVar;
            }
            traduccion+=" ";
        }
        return traduccion.toLowerCase();
    }
    public static void conversorMorse (String frase){
        HashMap<Character, String> morseCodeMap = new HashMap<>();
        HashMap<String, Character> morseDecodeMap = new HashMap<>();
        String traduccion = "";

        morseCodeMap.put('A', ".-");
        morseCodeMap.put('B', "-...");
        morseCodeMap.put('C', "-.-.");
        morseCodeMap.put('D', "-..");
        morseCodeMap.put('E', ".");
        morseCodeMap.put('F', "..-.");
        morseCodeMap.put('G', "--.");
        morseCodeMap.put('H', "....");
        morseCodeMap.put('I', "..");
        morseCodeMap.put('J', ".---");
        morseCodeMap.put('K', "-.-");
        morseCodeMap.put('L', ".-..");
        morseCodeMap.put('M', "--");
        morseCodeMap.put('N', "-.");
        morseCodeMap.put('O', "---");
        morseCodeMap.put('P', ".--.");
        morseCodeMap.put('Q', "--.-");
        morseCodeMap.put('R', ".-.");
        morseCodeMap.put('S', "...");
        morseCodeMap.put('T', "-");
        morseCodeMap.put('U', "..-");
        morseCodeMap.put('V', "...-");
        morseCodeMap.put('W', ".--");
        morseCodeMap.put('X', "-..-");
        morseCodeMap.put('Y', "-.--");
        morseCodeMap.put('Z', "--..");

        for(HashMap.Entry<Character, String> entry : morseCodeMap.entrySet()){
            morseDecodeMap.put(entry.getValue(), entry.getKey());
        }

        String normalMorse = letraToMorse(frase, morseCodeMap);
        System.out.println(normalMorse);
        String morseDecoded = morseToLetra(normalMorse, morseDecodeMap);
        System.out.println(morseDecoded);



    }
}