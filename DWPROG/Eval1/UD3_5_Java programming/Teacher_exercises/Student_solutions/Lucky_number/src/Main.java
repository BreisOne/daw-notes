import java.util.Arrays;
import java.util.stream.IntStream;

public class Main {
    public static void main(String[] args) {
        int sum = luckyNumberStreams("1999-20-6");
        System.out.println(sum);
        int sum2 = LuckyNumber("1999-20-6");
        System.out.println(sum2);
    }

    public static int luckyNumberStreams(String date){
         String []dateArray = date.split("-");
         Integer sumElementsDate = Arrays.stream(dateArray)
                                .mapToInt(Integer::parseInt).sum();

            String sumElementsDateString = sumElementsDate.toString();
            Integer sum1 = sumElementsDateString.chars()
                                .mapToObj(a -> Character.digit(a, 10))
                                .reduce(0, Integer::sum);

            String sum2 = sum1.toString();
            Integer finalSum = sum2.chars()
                                .mapToObj(a -> Character.digit(a, 10))
                                .reduce(0, Integer::sum);


        return finalSum;
    }
    public static int LuckyNumber(String date){
        String []dateArray = date.split("-");
        int sum = 0;
        for (int i = 0; i < dateArray.length ; i++) {

                sum += Integer.valueOf(dateArray[i]);
        }

        while (sum >9){
            int tempSum = 0;
            while (sum >0) {
                tempSum += sum % 10;
                sum /= 10;
            }
            sum = tempSum;
        }
        return sum;
    }
    public static int LuckyNumberAdri(String date){
        String []dateArray = date.split("-");



    }
}