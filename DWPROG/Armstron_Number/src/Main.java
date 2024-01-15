public class Main {
    public static void main(String[] args) {

        System.out.print(armstromNumber("153"));
    }

    public static boolean armstromNumber(String num){
        char [] nums = num.toCharArray();
        int numValue = Integer.valueOf(num);
        int totalNumbers = nums.length;
        int sum = 0;

        for (char number : nums){
            int numberValue = Integer.valueOf(String.valueOf(number));
            int tempNum = (int) Math.pow(numberValue, totalNumbers);
            sum += tempNum;
        }

        return sum == numValue;
    }
}