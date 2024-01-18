public class Main {
    public static void main(String[] args) {

        // Arrays comunes longitud 7
        String[] nombres = {"Ana", "Juan", "María", "Carlos", "Luisa", "Pedro", "Laura"};
        int[] edades = {25, 15, 22, 120, 28, 40, 26};
        String[] DNIs = {"12345678A", "23456789B", "34567890C", "45678901D", "56789012E", "67890123F", "78901234G"};
        char[] sexos = {'F', 'M', 'F', 'M', 'F', 'M', 'F'};
        double[] pesos = {55.5, 70.2, 60.8, 80.5, 64.0, 75.3, 58.6};
        double[] alturas = {1.65, 1.78, 1.70, 1.85, 1.62, 1.80, 1.68};

        // Arrays docente longitud 2
        String[] materias = {"Matemáticas", "Historia"};

        // Arrays Alumno longitud 3
        String[] escuelas = {"Biología", "Fisolofía", " Medicina"};
        String[] grados = {"Grado CCM", "Grado filosofía", "Grado odontología"};

        // Array Alumno Internacional longitud 1
        String[] paises = {"Canadá"};

        Persona[] personas = new Persona[7];

        for (int i = 0; i < 2 ; i++) {
            personas[i] = new Persona(nombres[i],edades[i], DNIs[i],sexos[i],pesos[i],alturas[i]);
        }

        for (int i = 2; i < 4 ; i++) {
            personas[i] = new Docente(nombres[i],edades[i], DNIs[i],sexos[i],pesos[i],alturas[i], materias[i-2]);
        }

        for (int i = 4; i < 6 ; i++) {
            personas[i] = new Alumno(nombres[i],edades[i], DNIs[i],sexos[i],pesos[i],alturas[i], escuelas[i-4], grados[i-4]);
        }
        for (int i = 6; i <7 ; i++) {
            personas[i] = new AlumnoInternacional(nombres[i],edades[i], DNIs[i],sexos[i],pesos[i],alturas[i], escuelas[i-4], grados[i-4], paises[i-6]);
        }

        for (Persona persona:personas) {
            persona.showInfo();
        }
    }
}