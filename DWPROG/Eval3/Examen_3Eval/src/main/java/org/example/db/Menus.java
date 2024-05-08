package org.example.db;
public class Menus {


    public static void showOptions() {
        System.out.println("**** MENU ****\n"
                + "[1] Insertar elementos\n"
                + "[2] Eliminar elementos\n"
                + "[3] Consultas\n"
                + "[4] Modificaciones\n"
                + "[5] Exit\n");
    }
    public static void showOptionsInsert() {
        System.out.println("**** MENU INSERCIONES ****\n"
                + "[1] Insertar mascota\n"
                + "[2] Insertar veterinario\n"
                + "[3] Exit\n");
    }
    public static void showOptionsDelete() {
        System.out.println("**** MENU ELIMINAR ****\n"
                + "[1] Eliminar mascota\n"
                + "[2] Eliminar veterinario\n"
                + "[3] Exit\n");
    }
    public static void showOptionsQueries() {
        System.out.println("**** MENU CONSULTAS ****\n"
                + "[1] Mostrar mascotas de un veterinario\n"
                + "[2] Mostrar veterinario de una mascota\n"
                + "[3] Exportar a fichero los datos de veterinarios con salario alto\n"
                + "[4] Exit\n");
    }
    public static void showOptionsModify() {
        System.out.println("**** MENU MODIFICACIONES ****\n"
                + "[1] Modificar salario de veterinario\n"
                + "[2] Modificar veterinario asignado a mascota\n"
                + "[3] Exit\n");
    }
}
