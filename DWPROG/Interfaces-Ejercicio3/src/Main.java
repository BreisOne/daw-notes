import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {

        HashMap<Integer,String> provincias = new HashMap<>();

        provincias.put(36, "Pontevedra");
        provincias.put(27, "Lugo");
        provincias.put(32, "Orense");
        provincias.put(15, "Coruña");

        mostrarPantalla(provincias);
        montrarProvinciaNombre(36, provincias);
        eliminarProvincia(27, provincias);
        montrarProvinciaNombre(27, provincias);
        eliminarProvincia(36, provincias);
        mostrarPantalla(provincias);

    }

    public static void mostrarPantalla(Map<Integer,String> provincias){
        System.out.println("-----El array contiene");

        for (Map.Entry<Integer, String> entry : provincias.entrySet()){

            Integer key = entry.getKey();
            String value = entry.getValue();
            System.out.println("Clave: " + key + ", Valor: " + value);

        }
    }
    public static void montrarProvinciaNombre(int key, Map<Integer, String> provincias){
        if(provincias.containsKey(key)){

            String provincia = provincias.get(key);
            System.out.println("La provincia es: " + provincia);

        }else{
            System.out.println("La provincia no existe en el array");
        }
    }
    public static void eliminarProvincia(int key, Map<Integer, String> provincias){
        provincias.remove(key);
    }

}