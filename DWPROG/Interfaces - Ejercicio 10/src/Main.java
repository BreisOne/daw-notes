import java.util.ArrayList;
import java.util.Comparator;

public class Main {
    public static void main(String[] args) {

        ArrayList<Serie> series = new ArrayList<Serie>();
        ArrayList<Videojuego> videojuegos = new ArrayList<Videojuego>();

        series.add(new Serie("Friends", 50, "Comedia", "Alguien"));
        series.add(new Serie("Hanna Montana", 46, "infantil", "tu"));
        series.add(new Serie("Patrulla Canina", 20, "intantil", "yo"));
        series.add(new Serie("Arrow", 15, "accion", ""));
        series.add(new Serie("Ataque de los titanes", 5, "anime", "el"));


        videojuegos.add(new Videojuego("Spiderman", 50, "accion", "Fox"));
        videojuegos.add(new Videojuego("Batman Arkan asilum", 150, "accion", "DC"));
        videojuegos.add(new Videojuego("Dragon Ball", 300, "accion", "Bandai"));
        videojuegos.add(new Videojuego("Resident Evil", 450, "Terror", "Umbrella Crop"));

        for(Serie serie : series){
            if(serie.getNumeroTemporadas()<30) {
                serie.entregar();
            }
        }
        for(Videojuego videojuego: videojuegos){
            if(videojuego.getHorasEstimandas()>150) {
                videojuego.entregar();
            }
        }
        for(Videojuego videojuego: videojuegos){
            if(videojuego.getHorasEstimandas()>150) {
                videojuego.entregar();
            }
        }

        for(Videojuego videojuego: videojuegos){
            if(videojuego.getHorasEstimandas()>150) {
                videojuego.entregar();
            }
        }

        System.out.println(contarSeriesDevueltas(series));
        System.out.println(contarVideoJuDevueltos(videojuegos));
        System.out.println(serieMasTemporadas(series));
        System.out.println(videojuegoMasHoras(videojuegos));

    }
    public static int contarSeriesDevueltas(ArrayList<Serie> arrayList){
        int cont = 0;
        for(Serie element : arrayList){
            if(element.isEntregado()){
                cont++;
            }else {
                element.entregar();
            }
        }
        return cont;
    }

    public static int contarVideoJuDevueltos(ArrayList<Videojuego> arrayList){
        int cont = 0;
        for(Videojuego element : arrayList){
            if(element.isEntregado()){
                cont++;
            }else {
                element.entregar();
            }
        }
        return cont;
    }

    public static String serieMasTemporadas(ArrayList<Serie> arraylist){

        arraylist.sort(Comparator.comparing(Serie::getNumeroTemporadas).reversed());
        return arraylist.getFirst().toString();
    }
    public static String videojuegoMasHoras(ArrayList<Videojuego> arraylist){

        arraylist.sort(Comparator.comparing(Videojuego::getHorasEstimandas).reversed());
        return arraylist.getFirst().toString();
    }
}