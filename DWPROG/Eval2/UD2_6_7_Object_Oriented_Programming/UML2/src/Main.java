public class Main {
    public static void main(String[] args) {

        Peso p1 = new Peso(30, "Lb");
        Peso p2 = new Peso(40, "K");
        Peso p3 = new Peso(60, "Oz");

        System.out.println(p1.getLibras());
        System.out.println(p2.getLingotes());
        System.out.println(p3.getPeso());

    }
}
