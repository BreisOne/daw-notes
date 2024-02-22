import java.util.HashMap;
import java.util.Map;

public class Agenda implements AgendaInterface {
    private  HashMap<Integer, Contacto> listaContactos = new HashMap<>();

    public void insertarNuevaEntrada(int key, Contacto contacto) {
      listaContactos.put(key, contacto);
    }

    public void buscarContactoPorNombre(String nombre) {
        boolean existeContacto = true;

        for(Map.Entry<Integer, Contacto> entry: listaContactos.entrySet()){
            Contacto contacto = entry.getValue();
            String nombreContacto = contacto.getNombre();

            int tlf = contacto.getTlf();
            if (nombreContacto.equals(nombre)){
                System.out.println("El contacto existe en la agenda");
                System.out.println("El numero es: "+ tlf);
            }
        }
    }

    @Override
    public String eliminarContactoPorNombre(String nombre) {
        boolean existeContacto = true;

        for(Map.Entry<Integer, Contacto> entry: listaContactos.entrySet()){

            Contacto contacto = entry.getValue();
            String nombreContacto = contacto.getNombre();

            if (nombreContacto.equals(nombre)){
                int key = entry.getKey();
                listaContactos.remove(key);
                return "El contacto se ha eliminado en la agenda";
            }else {
                existeContacto = false;
            }
        }

        if(!existeContacto){
            return "El contacto no existe en la agenda";
        }else{
            return "";
        }
    }

    @Override
    public void listarContacto() {
        for(Map.Entry<Integer, Contacto> entry: listaContactos.entrySet()){
            System.out.println(entry.getValue().toString());
        }
    }

    @Override
    public void listasTodosContactosConUnaLetra(String letra) {
        for(Map.Entry<Integer, Contacto> entry: listaContactos.entrySet()){
            String nombreContacto = entry.getValue().getNombre();
            if (nombreContacto.contains(letra)){
                System.out.println(entry.getValue().toString());
            }
        }
    }


}
