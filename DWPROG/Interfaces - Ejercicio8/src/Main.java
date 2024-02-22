import java.util.*;
public class Main {
    public static void main(String[] args) {

        LinkedList<String> listStrings = createListStrings();

        loadNames(listStrings);

        printList(listStrings);

        deleteName("Juan", listStrings);

        printList(listStrings);

        int index = nameIndex("Pedro", listStrings);

        System.out.println(index);
    }

    public static LinkedList<String> createListStrings(){

        LinkedList<String> listStrings = new LinkedList<String>();
        return listStrings;
    }

    public static LinkedList<String> loadNames (LinkedList<String> listStrings){
                listStrings.add("Juan");
                listStrings.add("Pedro");
                listStrings.add("Jaime");
                return listStrings;
    }
    public static void printList(LinkedList<String> listStrings){
        for (int i = 0; i < listStrings.size(); i++) {
            System.out.println("Índice " + i + ": " + listStrings.get(i));
        }
    }

    public  static int nameIndex(String name, LinkedList<String> listStrings){
        return listStrings.indexOf(name);
    }
    public static void deleteName(String name, LinkedList<String> listStrings){
        listStrings.remove(name);
    }


}