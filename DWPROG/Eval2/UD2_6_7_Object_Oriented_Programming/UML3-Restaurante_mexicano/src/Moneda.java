public class Moneda extends Sorteo {

    Moneda(){
        posibilidades = 2;
    }

    public int lanzar(){
        int lanzamiento = (int) Math.random()*posibilidades+1;

        if(lanzamiento == 1){
            System.out.println("Cara");
        }else {
            System.out.println("Cruz");
        }
        return lanzamiento;
    }


}
