public class Main {
    public static void main(String[] args) {
        System.out.println(esOmirp(1597));
        System.out.println(esOmirp(4));
    }

    public static int esPrimo(int num){
        double sqrtNum = Math.sqrt(num);
        int cont = 0;

        for (int i = 2; i < sqrtNum; i++) {
            if(sqrtNum % i == 0){
                cont++;
            }
        }
        return cont;
    }
    public static boolean esOmirp(int num ){

        int reverseNum = Integer.reverse(num);

        int verif1=esPrimo(num);
        System.out.println(verif1);

        int verif2=esPrimo(reverseNum);
        System.out.println(verif2);

        return (verif1==0 && verif2==0);
    }

}