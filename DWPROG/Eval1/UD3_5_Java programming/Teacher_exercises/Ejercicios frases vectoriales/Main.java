import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
    }

    public static String getSentence(char[] array) {
        return String.valueOf(array);
    }

    public static boolean checkWord(char[] array, String secuencia) {
        String str = getSentence(array);
        return str.contains(secuencia);
    }

    public static boolean checkWords(char[] array, String[] secuencia) {
        String str = getSentence(array);
        for (int i = 0; i < secuencia.length; i++) {
            if (!str.contains(secuencia[i]))
                return false;
        }
        return true;
    }

    public static boolean checkSentence(char[] array, String sentence) {
        return sentence.equals(getSentence(array));
    }
}
