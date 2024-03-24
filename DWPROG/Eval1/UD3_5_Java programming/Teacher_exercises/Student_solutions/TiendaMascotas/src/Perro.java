public class Perro extends Animal{

    private String raza;

    public Perro(float peso, float altura, String raza) {
        super(peso, altura);
        this.raza = raza;
    }

    public String hacerRuido() {
        return "GUAU, GUAU!";
    }
}
