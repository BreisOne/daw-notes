public class Main {
    public static void main(String[] args) {
        double[] salaries = {700,100,400,300,500};

        System.out.println(getSalaryMean(salaries));
        System.out.println(getSalaryMedian(salaries));

        double salary = 20000;
        int children = 2;
        double percentage = 15;
        boolean disability = true;
        System.out.println(getPayroll( salary,children,percentage,disability));

        double[][] matrix2 = {
                {1, 2, 4},
                {4, 1, 3},
                {0, 0, 1}
        };
        System.out.println(transposeMatrix(matrix2));

    }

    public static double getSalaryMean(double[] salaries){
        double suma = 0;
        int denom = salaries.length;
        for (int i = 0; i < denom; i++) {
            suma += salaries[i];
        }
        double mean = suma/denom;
        return mean;
    }
    public static double getSalaryMedian(double[] salaries){
        int mitLeng  =  (salaries.length/2)-1;
        double median = 0;
        if (salaries.length % 2 == 0){
            double mitad1 = salaries[mitLeng];
            double mitad2 = salaries[mitLeng +1];
            
            median = (mitad1+mitad2)/2;
        }else {
            median = salaries[mitLeng+1];
        }
        return median;
    }
    
    public static double getPayroll(double salary, int children, double percentage, boolean disability){
        if (children < 3){
            percentage = percentage - (1*children);
            System.out.println(percentage);
        }
        if (children >= 3){
            children = children-2;
            percentage = percentage-2-(3*children);
        }

        salary= salary-(salary*percentage/100);

        if (disability){
            salary = salary +500;
        }
        return salary;
    }
    
    public static double [][] transposeMatrix(double[][] matrix){
        int cols = matrix[0].length;
        int rows = matrix.length;
        double [][] matrixTranposed = new double[cols][rows];
        for (int i = 0; i <rows ; i++) {
            for (int j = 0; j <cols ; j++) {
                matrixTranposed[i][j] = matrix[j][i];
            }
        }
        
        return matrixTranposed;
    }
    
    
}