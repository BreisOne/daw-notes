package ActividadesStreams.Boletin;

import java.io.*;

public class Ejercicio6 {
    public static void main(String[] args) {
        File fic = new File ("datosEj6.txt");
        File fic2 = new File ("datosEj6_mayus.txt");
        try (FileReader fr = new FileReader(fic);
        BufferedReader br = new BufferedReader(fr);
        FileWriter fw = new FileWriter(fic2)) {
            String s;
            while ((s = br.readLine()) != null) {
                if (s.toUpperCase().equals(s)) {
                    fw.write(s);
                }
            }
            System.out.println("Copia realizada");
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
