import java.util.Arrays;

public class Main {
    public static void main(String[] args) {

        int [] array = {2,60,120,450,100};
        int[][] matrix = {
                {2, 180, 240},
                {15, 120, 50},
                {8, 180, 240}
        };

        System.out.println(getPrimes(5,13));
        System.out.println(getPrice(5,78));
        System.out.println(Arrays.toString(getReverse(array)));
        System.out.println(Arrays.toString(getMultiples(matrix, 15)));
        System.out.println(Arrays.toString(getMaxRow(matrix)));
    }

    public static int getPrimes(int num1, int num2){
        int primeNums = 0;
        if(num1 < num2){
            for (int i = num1 ; i <= num2; i++) {
                if (isPrime(i)) {
                    primeNums++;
                }
            }
        }else {
            for (int i = num2 ; i <= num1; i++) {
                if (isPrime(i)) {
                    primeNums++;
                }
            }
        }
        return primeNums;
    }
    public static boolean isPrime(int num){
        if (num < 2){
            return false;
        }
        if (num > 2) {
            for (int i = 2 ; i < num ; i++) {

                if (num % i == 0) {
                    return false;
                }
            }
        }
        return true;
    }
    public static double getPrice(int num, int age){
        double totalPrice = num * 60;

        if (age>=50){
            totalPrice = totalPrice * 0.6;

        } else if (age >= 35) {
            totalPrice = totalPrice * 0.8;
        }

        return totalPrice;
    }

    public static int[] getReverse(int[] array){

        int length = array.length;
        int reverseCont = length-1;
        int[] arrayReverse = new int [length];

        for (int i = 0; i < length; i++) {
            arrayReverse[i] = array[reverseCont];
            reverseCont--;
        }

        return arrayReverse;
    }

    public static int[] getMultiples(int[][] matrix, int num){
        int contMult = 0;
        for (int i = 0; i < matrix.length ; i++) {
            for (int j = 0; j < matrix[0].length; j++) {
                if (matrix[i][j] % num == 0){
                    contMult++;
                }
            }
        }
        int [] arrayMult = new int[contMult];
        contMult = 0;

        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[0].length; j++) {
                if (matrix[i][j] % num == 0){
                    arrayMult[contMult] = matrix[i][j];
                    contMult++;
                }
            }
        }
        return arrayMult;
    }

    public static int[] getMaxRow(int[][] matrix){

        int [] maxNums = new int[matrix.length];

        for (int i = 0; i < matrix[0].length; i++) {
            int max = 0;

            for (int j = 0; j < matrix.length; j++) {

                if (j == 0){
                    max = matrix[j][i];
                } else if (matrix[j][i] > max) {
                    max = matrix[j][i];
                }
            }
            maxNums[i] = max;
        }

        return maxNums;
    }

}