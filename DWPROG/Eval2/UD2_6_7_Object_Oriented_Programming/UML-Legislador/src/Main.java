import  java.util.*;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        List<Legislador> legisladores = new ArrayList<Legislador>();

        legisladores.add(new Diputado("523523523A","Jacinto","Camelio", 47, "Pontevedra","Congreo",true,15));
        legisladores.add(new Diputado("4326423642L","Pedro","Duque", 34, "Lugo","Congreo",false,25));
        legisladores.add(new Senador("2324422223M","Maria","Amelia", 57, "Madrid","Senado",false,22));
        legisladores.add(new Senador("5653463643E","Alfonso","Guerra", 23, "Barcelona","Senado",true,35));

        legisladores.forEach(legislador -> legislador.getCamaraEnQueTraba());

    }


}