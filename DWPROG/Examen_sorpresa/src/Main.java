import java.util.List;

public class Main {
    public static void main(String[] args) {

        String user_word = "Alberto";
        checkWordLength(user_word);
        System.out.println(checkWordLength(user_word));
        System.out.println(NumOfVowels(user_word));

        int [] user_numbers = {1,3,4,6,7,13,11,5,8};
        System.out.println(checkNumberOfPrimes(user_numbers));

        int[][] matrix2 = {
                {1, 0, 0},
                {0, 1, 0},
                {0, 0, 1}
        };
        System.out.println(isIdentityMatrix(matrix2));
    }
    public static int checkWordLength(String word){
         return word.length();
    }
    public static int NumOfVowels(String word){

        String Word = word.toLowerCase();
        int contVocales = 0;

        for (int i = 0; i < word.length(); i++) {
            char letter = Word.charAt(i);

            if ((letter == 'a')||(letter == 'e')||
                    (letter == 'i')||(letter == 'o')||
                    (letter == 'u')){
                contVocales ++;
            }
        }

        return contVocales;
    }
    public static int checkNumberOfPrimes(int[] numbers){
        int contPrimes = 0;
        for (int num: numbers) {
            if (isPrime(num)){
                contPrimes ++;
            }
        }
        return contPrimes;
    }

    public static boolean isPrime(int num){
        if(num<=1){
            return false;
        }
        if (num == 2) {
            return true;
        }
        if (num % 2 == 0) {
            return false;
        }
        for(int i=3;i<= Math.sqrt(num);i++){
            if((num % i)==0)
                return  false;
        }
        return true;
    }
    public static boolean  isIdentityMatrix(int[][] matrix){

        int rows = matrix.length;
        if (rows == 0) {
            return false;
        }
        int cols = matrix[0].length;
        if (rows != cols) {
            return false;
        }

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (i==j & matrix [i][j] != 1){
                    return false;
                } else if (i!=j & matrix [i][j] != 0) {
                    return false;
                }
            }
        }
        return true;
    }

}