public class Satelite {
    private double meridiano;
    private double paralelo;
    private double distancia;

    public Satelite(double meridiano, double paralelo, double distancia){
        this.meridiano = meridiano;
        this.paralelo = paralelo;
        this.distancia = distancia;
    }

    //Getters

    public double getAltura(){
        return distancia;
    }
    public double getMeridiano(){
        return meridiano;
    }
    public double getParalelo(){
        return paralelo;
    }

    //Methods
    public void variaAltura(double desplazamiento){
        double nuevaDistancia = distancia + desplazamiento;
        if (nuevaDistancia >0){
            distancia = nuevaDistancia;
        }else {
            distancia = 0;
        }

    }
    public boolean enOrbit(){
        return distancia > 0;
    }

    public void variaPosicion(double variap, double variam){
        paralelo +=variap;
        meridiano+=variam;
    }


}
