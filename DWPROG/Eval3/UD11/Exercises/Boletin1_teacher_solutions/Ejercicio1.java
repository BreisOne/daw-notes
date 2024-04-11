package ActividadesStreams.Boletin;

import java.io.*;

public class Ejercicio1 {
    public static void main(String[] args) {
        String[] nombres = {"Andrés", "Juan", "Marta", "Ana"};
        try (FileWriter fw = new FileWriter("datos.txt")){
            for (String n : nombres) {
                fw.write(n + "\n");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        try (FileReader fr = new FileReader("datos.txt");
             BufferedReader br = new BufferedReader(fr)) {
            String s;
            int i = 1;
            while ((s = br.readLine()) != null) {
                System.out.println(i + ". " + s);
                i++;
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
