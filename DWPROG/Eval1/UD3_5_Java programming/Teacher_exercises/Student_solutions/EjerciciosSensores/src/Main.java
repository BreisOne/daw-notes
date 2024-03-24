public class Main {
    public static void main(String[] args) {

        System.out.println("Hello world!");
    }

    public static double getDistance(double speed, double time){
        double distance = speed * (time/2);
        return distance;
    }

    public static boolean isValidCar(double[] sensorProbability){
        double sumProb = 0;
        for (double probability:sensorProbability) {
            sumProb += probability;
        }
        double meanProb = sumProb/sensorProbability.length;
        return (meanProb<10);
    }
    public static double checkObjectWithPatternBlackAndWhite(boolean[][] pattern, boolean[][] object){
        double contPixDistintos = 0;
        double contPixTotal = 0;
        if (pattern.length == object.length && pattern[0].length == object[0].length){
            for (int i = 0; i < pattern.length; i++) {
                for (int j = 0; j < pattern[0].length; j++) {
                    if (pattern[i][j] != object[i][j]){
                        contPixDistintos++;
                    }
                    contPixTotal++;
                }
            }
        }

        double Prob = (contPixDistintos/contPixTotal)*100;

        return Prob;
    }
    public static double checkObjectWithPatternColour(int[][] pattern, int[][] object){

        double contPixDistintos = 0;
        double contPixTotal = 0;
        if (pattern.length == object.length && pattern[0].length == object[0].length){
            for (int i = 0; i < pattern.length; i++) {
                for (int j = 0; j < pattern[0].length; j++) {
                    if (Math.abs(pattern[i][j] - object[i][j]) > 10){
                        contPixDistintos++;
                    }
                    contPixTotal++;
                }
            }
        }

        double Prob = (contPixDistintos/contPixTotal)*100;

        return Prob;

    }
}