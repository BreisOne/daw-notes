public class Main {
    public static void main(String[] args) {

        int[][] table_bidimensional = new int[5][5];

        for (int i = 0; i < 5; i++) {
            for (int j = 0; j <5 ; j++) {
                table_bidimensional[i][j] = i+j;
            }
        }
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j <5 ; j++) {
                System.out.println("Position fila(i) = " + i + " position columna(j) = "+ j +" valor posicion = "+ table_bidimensional[i][j]);
            }
        }


    }
}