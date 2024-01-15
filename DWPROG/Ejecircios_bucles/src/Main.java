public class Main {
    public static void main(String[] args) {
    }

    public static void menorMayor(int a, int b, int c){

        if (a>b && b>c){
            System.out.println("Mayor es: " + a);
            System.out.println("Menor es: " + c);
        }else if (a<b && b<c){
            System.out.println("Mayor es: " + c);
            System.out.println("Menor es: " + a);
        } else if (a<b && b>c) {
            System.out.println("Mayor es: " + b);
            System.out.println("Menor es: " + a);
        }else if (a>c && b<c) {
            System.out.println("Mayor es: " + a);
            System.out.println("Menor es: " + b);
        } else if (a<c && b<a){
            System.out.println("Mayor es: " + c);
            System.out.println("Menor es: " + b);
        } else if (a>c && b>a) {
            System.out.println("Mayor es: " + b);
            System.out.println("Menor es: " + c);
        }
    }

    public static void bulce1(){
        String star = "*";
        for (int i = 0; i < 4; i++) {
            star = star.concat("*");
        }
    }

    public static void Rombo(){
        String space = " ";
        String star = "*";

        for (int i = 0; i < ; i++) {
            
        }

    }
}