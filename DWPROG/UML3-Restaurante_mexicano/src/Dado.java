public class Dado extends Sorteo {

    Dado(){
        posibilidades = 6;
    }
    public int lanzar(){
        return (int) (Math.random()*posibilidades+1);
    }
}
