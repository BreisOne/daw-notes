import java.util.Arrays;

public class Main {
    public static void main(String[] args) {

        int [][] matrix = {
                {8,8,5},
                {1,2,8},
                {5,3,12}
        };

        int [] array = {150,15,78,7};

        System.out.println(Arrays.toString(getMinColumNum(matrix)));
        System.out.println(Arrays.toString(getMaxNums(matrix)));
        System.out.println(getMax(array));

    }
    public static int[] getMinColumNum(int[][] matrix){
        int[]minCols = new int [matrix[0].length];
        int min = 0;

        for (int i = 0; i < matrix[0].length; i++) {
            for (int j = 0; j < matrix.length; j++) {

                if (j == 0){
                    min = matrix[j][i];

                } else if (matrix[j][i] < matrix[j-1][i]) {
                    min = matrix[j][i];
                }
            }
            minCols[i] = min;
        }
        return minCols;
    }

    public static int[] getMaxNums(int[][] matrix){
        int cont = 0;
        for (int i = 0; i < matrix[0].length ; i++) {
            for (int j = 0; j < matrix.length ; j++) {
                if (matrix[i][j] > 10){
                    cont++;
                }
            }
        }

        int []numMay = new int [cont];

        cont = 0;

        for (int i = 0; i < matrix[0].length ; i++) {
            for (int j = 0; j < matrix.length ; j++) {
                if (matrix[i][j] > 10){
                    numMay[cont] = matrix[i][j];
                    cont ++;
                }
            }
        }

        return numMay;
    }
    public static int getMax(int[] array){
        int max = 0;

        for (int i = 0; i < array.length; i++) {
            if (i == 0){
                max = array[i];
            } else if (array[i] > max) {
                max = array[i];
            }
        }
        return max;

    }
}