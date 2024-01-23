public class Main {
    public static void main(String[] args) {

         Motocicleta motoYamaha = new Motocicleta("Yamaha 550FR","4324324ERF",80);
         Motocicleta motoSuzuki = new Motocicleta("Suzuki 460GT","7635232GRT",95);
         Turismo cocheToyota = new Turismo("Toyota Corola","4324324ERF",40);
         Turismo cocheMazda = new Turismo("Mazda MX","7635232GRT",120);

         motoYamaha.acelerar(40);
         motoSuzuki.frenar(30);
         cocheToyota.acelerar(110);
         cocheMazda.frenar(115);
    }
}