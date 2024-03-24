public class Main {
    public static void main(String[] args) {
        int t = 3050000;
        TimeConvertion(t);
        TimeConvertion2(t);
    }

    public static void TimeConvertion(int t){
            System.out.println(t + " segundos son:");
            int hours = t/3600;
            t = (t-hours*3600);
            int minutes = t/60;
            t = t-(minutes*60);

            System.out.println(hours+ " horas, "
                    + minutes+ " minutos "
                    + t + " segundos");
    }

    public static  void TimeConvertion2(int t){
        for (int i = 2; i >=0; i--) {

            int tempTime= (int) (t/Math.pow(60,i));
            t = (int) (t-(tempTime*Math.pow(60,i)));
            System.out.println(tempTime);
        }
    }
}