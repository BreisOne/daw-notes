import javax.swing.*;
import java.util.TreeMap;

public class Main {
    public static void main(String[] args) {

        System.out.println("Hello world!");
    }

    public static String decimalToRomano(int decimal){

        int[] decimales = {1000,900,500,400,100,90,50,40,10,9,5,4,1};
        String[] romanos = {"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"};
        String Romano = "";

        TreeMap<Integer, String> decimalsToRoman = new TreeMap<>();

        for (int i = 0; i < decimales.length; i++) {
            decimalsToRoman.put(decimales[i],romanos[i]);
        }

        int miles = decimal/1000;
        int centenas = (decimal%1000)/100;
        int decenas = (decimal%100)/10;
        int unidades = decimal%10;


        for (int i = 0; i < ; i++) {
            
        }
       

        return Romano;
    }


}