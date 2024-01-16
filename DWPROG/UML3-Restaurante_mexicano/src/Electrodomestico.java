import java.util.HashMap;

public class Electrodomestico {
    private double precioBase;
    private String color;
    private char consumoElectrico;
    private double peso;

    private String consumos = "ABCDEF";
    private String colores = "blanco negro rojo azul gris";

    public Electrodomestico(){
        this (100, 5, "blanco", 'F');

    }
    public Electrodomestico(double precioBase, double Peso){
        this(precioBase, Peso, "blanco", 'F');
    }
    public Electrodomestico(double precioBase, double peso, String color, char consumoElectrico){
        this.precioBase = precioBase;
        this.color = color;
        this.peso = peso;
        this.consumoElectrico = comprobarConsumoEléctrico(consumoElectrico);
        this.color = comprobarColor(color);
    }

    //Getters y Setters.

    public double getPrecioBase(){
        return this.precioBase;
    }
    public void setPrecioBase(double precioBase){
        this.precioBase = precioBase;
    }
    public String getColor(){
        return this.color;
    }
    public void setColor(String color){
        this.color = color;
    }
    public char getConsumoElectrico(){
        return  this.consumoElectrico;
    }

    public void setConsumElectrico(char consumElectrico){
        this.consumoElectrico = consumElectrico;
    }
    public double getPeso(){
        return this.peso;
    }

    public void setPeso(double peso){
        this.peso = peso;
    }

    //Methods:

    private char comprobarConsumoEléctrico(char letra){
        if(consumos.contains(Character.toString(letra))){
            this.consumoElectrico = letra;
        }else {
            this.consumoElectrico = 'F';
        }
        return this.consumoElectrico;
    }
    private String comprobarColor(String color){
        if(colores.contains(color)){
            this.color = color;
        }else{
            this.color = "blanco";
        }
        return this.color;
    }

    public int precioFinal(){
        // Definir dos arrays para las claves y los valores
        char[] claves = consumos.toCharArray();
        int[] valores = {100, 80, 60, 50, 30, 10};

        // Crear un HashMap con claves de tipo Character y valores de tipo Integer
        HashMap<Character, Integer> hashMap = new HashMap<>();

        // Utilizar un bucle for para agregar las claves y valores al HashMap
        for (int i = 0; i < claves.length; i++) {
            hashMap.put(claves[i], valores[i]);
        }

        precioBase += hashMap.get(consumoElectrico);
        return (int) precioBase;
    }

    public static void main(String[] args) {

        Electrodomestico tv = new Electrodomestico(100, 50, "amarillo", 'Z');
        System.out.println(tv.getConsumoElectrico());
        System.out.println(tv.getColor());
        System.out.println(tv.precioFinal());

    }


}
