package org.edu.gorilas;

public class Main {
    public static void main(String[] args) {

        System.out.println("Hello world!");
    }
    public static int[] getMinColumNum(int[][] matrix){
        int[]minCols = new int [matrix[0].length];
        int min;

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

        for (int i = 0; i < matrix[0].length ; i++) {
            for (int j = 0; j < matrix.length ; j++) {
                if (matrix[i][j] > 10){
                    numMay[i+j] = matrix[i][j]
                }
            }
        }

        return numMay;
    }
    public static int getMax(int[] array){
        int max;

        for (int i = 0; i < array.length; i++) {
            if (i == 0){
                max = array[i];
            } else if (array[i]> matrix[i-1]) {
                max = array[i];
            }
        }
        return max;

    }
}