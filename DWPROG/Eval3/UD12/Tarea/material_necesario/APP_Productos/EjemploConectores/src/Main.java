import java.sql.*;
import java.util.Scanner;

public class Main {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        Statement sentencia = null;
        Connection conexion = null;


        int op = 0;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mariadb://localhost:3306/?user=root&password=abc123.";
        //String url = "jdbc:mariadb://localhost:3306/?user=root&password=1234";
        try {
            conexion = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println("No hay ningún driver que reconozca la URL especificada");
        } catch (Exception e) {
            System.out.println("Se ha producido algún otro error");
        }

        try {
            sentencia = conexion.createStatement();
        } catch (SQLException e) {
            System.out.println("Error");
        }

        Creacion.crearBase(sentencia);

        do {
            System.out.println("**** MENU ****\n"
                    + "[1] Insertar Producto\n"
                    + "[2] Listar Productos\n"
                    + "[3] Modificar Producto\n"
                    + "[4] Eliminar Producto\n"
                    + "[5] Exit\n");
            op = sc.nextInt();
            sc.nextLine();

            switch (op) {
                case 1:
                    insertar(sentencia);
                    break;

                case 2:
                    listar(sentencia);
                    break;
                case 3:
                    modificar(sentencia);
                    break;
                case 4:
                    eliminar(sentencia);
                    break;
            }

        } while (op != 5);
    }

    private static void insertar(Statement sentencia) {
        System.out.println("Dame nombre de producto");
        String nombre = sc.nextLine();
        System.out.println("Dame precio del producto");
        float precio = sc.nextFloat();
        sc = new Scanner(System.in);

        try {
            sentencia.executeUpdate("INSERT INTO PRODUCTOS (nombreProducto, precio) VALUES('" + nombre + "'," + precio + ")");
        } catch (SQLException e) {
            System.err.println("Se ha producido un error al insertar");
        }
    }

    public static void listar(Statement sentencia) {
        int cont = 0;

        try {
            ResultSet result = sentencia.executeQuery("Select * from productos");

            while (result.next()) {
                cont++;
                System.out.println("Producto " + cont + ": ");

                System.out.println("ID: " + result.getInt("idProd"));
                System.out.println("Nombre: " + result.getString("nombreProducto"));
                System.out.println("Precio: " + result.getFloat("precio"));
                System.out.println("-----------------------------------------\n");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void modificar(Statement sentencia) {

        System.out.println("Dame nombre del producto a modificar");
        ResultSet res = buscarProducto(sentencia);
        if (res != null) {
            System.out.println("Introduzca nuevo nombre de producto:");
            String nombre = sc.nextLine();
            System.out.println("Introduzca nuevo precio de producto:");
            float precio = sc.nextFloat();
            sc = new Scanner(System.in);
            try {
                sentencia.executeUpdate("UPDATE productos set nombreProducto='" + nombre + "', precio=" + precio +" where idProd = '" + res.getInt("idProd") + "';");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("El producto no se encuentra en la base de datos");
        }
    }

    public static void eliminar(Statement sentencia) {
        System.out.println("Dame nombre del producto a eliminar");
        ResultSet res = buscarProducto(sentencia);
        if (res != null) {
            try {
                sentencia.execute("DELETE from productos where idProd="+ res.getInt("idProd") +";");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("El producto no se encuentra en la base de datos");
        }

    }

    public static ResultSet buscarProducto(Statement sentencia) {
        String nomProd = null;

        try {
            nomProd = sc.nextLine();

            ResultSet result = sentencia.executeQuery("Select * from productos where nombreProducto = '" + nomProd + "';");

            if (result.next()) {
                System.out.println("Los datos del producto buscado son: ");

                System.out.println(" ID Producto: " + result.getInt("idProd"));
                System.out.println(" Nombre: " + result.getString("nombreProducto"));
                System.out.println(" Precio: " + result.getFloat("precio"));
                System.out.println("-----------------------------------------");

                return result;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

}