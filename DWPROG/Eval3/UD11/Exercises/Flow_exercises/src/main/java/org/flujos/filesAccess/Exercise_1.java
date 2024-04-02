package org.flujos.filesAccess;

import javax.swing.plaf.synth.SynthTextAreaUI;
import java.io.File;
import java.util.Scanner;

public class Exercise_1 {

    public static void execute(){
        Scanner scanner = new Scanner(System.in);

        System.out.println("Añade el path de una carpeta:");
        String path = scanner.nextLine();

        File filePath = new File(path);

        String[] files = filePath.list();
    }
}
