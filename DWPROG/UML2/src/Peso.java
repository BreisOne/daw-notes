public class Peso {
    private double peso;
    private String medida;
    private double pesoKilogramos;

    public Peso(double peso, String medida){
        this.peso = peso;
        this.medida = medida;
        pesoKilogramos = toKilogramos(peso, medida);
    }

    public double getLibras(){
        return pesoKilogramos/0.453;
    }

    public double getLingotes(){
        return pesoKilogramos/14.59;
    }
    public String getPeso(){
        return peso + " " + medida;
    }
    private double toKilogramos(double peso, String medida){
            switch (medida.toLowerCase()){
                case "lb":
                    return peso*0.453;
                case "li":
                    return peso*14.59;
                case "oz":
                    return peso*0.02835;
                case"p":
                    return peso*0.00155;
                case"g":
                    return peso*1000;
                case"q":
                    return peso*43.3;
                default:
                    return peso;
            }



    }
}
