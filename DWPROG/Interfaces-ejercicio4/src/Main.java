import java.util.HashMap;

public class Main {

    public static void main(String[] args) {

        Alumno[] alumnos = new Alumno[5];

        alumnos[0] = new Alumno("12345678A", "Juan", 20, "Calle A");
        alumnos[1] = new Alumno("98765432B", "María", 22, "Calle B");
        alumnos[2] = new Alumno("56789012C", "Pedro", 21, "Calle C");
        alumnos[3] = new Alumno("34567890D", "Laura", 19, "Calle D");
        alumnos[4] = new Alumno("87654321E", "Carlos", 23, "Calle E");

        int[] codigosExpedientes = {12345, 67890, 54321, 98765, 45678};

        for (int i = 0; i < 5; i++) {
            insertarAlumno(codigosExpedientes[i], alumnos[i]);
        }

        contarAlumnos();
        getAlumnoPorExpediente(codigosExpedientes[1]);
        eliminarAlumno(codigosExpedientes[1]);
        getAlumnoPorExpediente(codigosExpedientes[1]);

        for (int i = 0; i < 4; i++) {
            Alumno alumno = alumnado.get(codigosExpedientes[i]);

            String resultado = alumno!= null ? alumno.toString(): null;

            System.out.println(resultado);
        }
    }

    static HashMap<Integer, Alumno> alumnado = new HashMap<>();
    public static void insertarAlumno(Integer numExpediente, Alumno alumno){
        alumnado.put(numExpediente, alumno);
    }
    public static void contarAlumnos(){
        System.out.println(alumnado.size());
    }
    public static void getAlumnoPorExpediente(Integer numExpediente){
        Alumno alumno = alumnado.get(numExpediente);

        if (alumno != null){
            System.out.println(alumno.getNombre());
        }else{
            System.out.println("No existe ese alumno en el registro");
        }
    }
    public static void eliminarAlumno(Integer numExpediente){
        alumnado.remove(numExpediente);
    }

}