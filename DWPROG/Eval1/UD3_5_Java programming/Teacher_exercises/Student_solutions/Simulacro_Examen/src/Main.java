import java.lang.reflect.Array;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {

        String [] phrases = {
                "hola me llamo gilberto",
                "como esta señor gilberto",
                "Estoy muy bien amigo"
        };

        int [][] matrix = { {3,4,7},
                            {7,8,9},
                            {9,16,14}
        };

        System.out.println(countContainerWords(phrases, "amigo"));
        System.out.println(getFinalNum(10, 60.5));
        System.out.println(Arrays.toString(getFirstRow(matrix, 3)));
    }

    public static int countContainerWords(String[] phrases, String word){
        int cont = 0;
        for (String phrase:phrases) {
            if (phrase.toLowerCase().contains(word.toLowerCase())){
                cont++;
            }
        }
        return cont;
    }

    public static double getFinalNum(int num, double percentage){
        double result = num * 0.01 * percentage;
        if (result < 1000 && result >=100)
            return result/3;
        if (result<100 && result>=10)
            return  result;
        if (result<10)
            return result*3;
        else
            return result;
    }

    public static int[] getFirstRow (int[][] matrix, int columns){
        int [] array = new int[columns];
        for (int i = 0; i < columns; i++) {
                array[i] = matrix[0][i];
        }
        return array;
    }
}