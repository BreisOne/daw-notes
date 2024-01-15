import javax.sound.midi.SysexMessage;

public class Main {
    public static void main(String[] args) {
        int importe = 650;
        ContarBilletes(importe);
    }

    public static void ContarBilletes(int importe){
        int []billetes = {200,100,50,20,10,5};
        int cont = 0;

        for (int billete:billetes) {
            while (importe >= billete){
                cont ++;
                importe -= billete;
            }
            if (cont != 0){
                System.out.println(cont + " billetes de " + billete);
                cont = 0;
            }
        }

        if (importe > 0) {
            System.out.println("Sobran " + importe + " €");
        }
    }
}