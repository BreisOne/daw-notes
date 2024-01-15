import java.util.Locale;

public class Main {
    public static void main(String[] args) {

        System.out.println("Hello world!");
    }

    public static String getSentence(char[] array) {

        //return new String(array); #forma más eficiente

        String sentence = "";

        for (int i = 0; i < array.length ; i++) {
            sentence += array[i];
        }
        return sentence.toLowerCase();

    }

    public static boolean checkWord(char[] array, String word ){

        return getSentence(array).contains(word);

    }

    public static boolean checkWords(char[] array, String[] words){

        for (int i = 0; i < words.length ; i++) {
            if (!getSentence(array).contains(words[i]))
                return false;
        }
        return true;
    }

    public static boolean checkSentence(char[] array, String Sentence){

        return (getSentence(array).equals(Sentence.toLowerCase()));

    }

}