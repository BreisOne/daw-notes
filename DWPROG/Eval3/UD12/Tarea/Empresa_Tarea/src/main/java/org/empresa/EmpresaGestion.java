package org.empresa;

import java.sql.*;
import java.util.Scanner;

public class EmpresaGestion {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/Empresa";

    static final String USER = "root";
    static final String PASS = "123";

    static Connection conn = null;
    static Statement stmt = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();

            crearBaseDeDatosSiNoExiste();

            int opcion;
            do {
                mostrarMenu();
                opcion = scanner.nextInt();
                scanner.nextLine(); // Limpiar el buffer

                switch (opcion) {
                    case 0:
                        crearBaseDeDatosSiNoExiste();
                        break;
                    case 1:
                        insertarNuevaFila();
                        break;
                    case 2:
                        borrarFilas();
                        break;
                    case 3:
                        consultar();
                        break;
                    case 4:
                        modificar();
                        break;
                    case 5:
                        System.out.println("Saliendo...");
                        break;
                    default:
                        System.out.println("Opción no válida. Inténtalo de nuevo.");
                }
            } while (opcion != 5);

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    static void crearBaseDeDatosSiNoExiste() throws SQLException {
        ResultSet resultSet = conn.getMetaData().getCatalogs();
        boolean baseDatosExiste = false;
        while (resultSet.next()) {
            String databaseName = resultSet.getString(1);
            if (databaseName.equalsIgnoreCase("Empresa")) {
                baseDatosExiste = true;
                break;
            }
        }
        resultSet.close();

        if (!baseDatosExiste) {
            String crearBaseDatosSQL = "CREATE DATABASE Empresa";
            stmt.executeUpdate(crearBaseDatosSQL);

            String crearTablaEmpleadosSQL = "CREATE TABLE Empleados (" +
                    "Dni VARCHAR(9) PRIMARY KEY," +
                    "Nombre VARCHAR(10)," +
                    "Estudios VARCHAR(10)," +
                    "Dir VARCHAR(10)," +
                    "Fecha_alt DATE," +
                    "Salario INT," +
                    "Comision INT," +
                    "Nu_dept VARCHAR(2)," +
                    "FOREIGN KEY (Nu_dept) REFERENCES Departamentos(Nu_dept)" +
                    ")";
            stmt.executeUpdate(crearTablaEmpleadosSQL);

            String crearTablaDepartamentosSQL = "CREATE TABLE Departamentos (" +
                    "Nu_dept INT PRIMARY KEY AUTO_INCREMENT," +
                    "Dnombre VARCHAR(10) UNIQUE," +
                    "Localidad VARCHAR(10)" +
                    ")";
            stmt.executeUpdate(crearTablaDepartamentosSQL);

            System.out.println("Base de datos Empresa creada correctamente.");
        } else {
            System.out.println("La base de datos Empresa ya existe.");
        }
    }


    static void insertarNuevaFila() throws SQLException {
        System.out.println("Seleccione el tipo de inserción:");
        System.out.println("a. Inserción de un nuevo Departamento.");
        System.out.println("b. Inserción de un nuevo Empleado.");

        String opcion = scanner.nextLine().toLowerCase();
        switch (opcion) {
            case "a":
                insertarNuevoDepartamento();
                break;
            case "b":
                insertarNuevoEmpleado();
                break;
            default:
                System.out.println("Opción no válida.");
        }
    }

    static void insertarNuevoDepartamento() throws SQLException {
        System.out.println("Introduce el nombre del departamento:");
        String nombreDepartamento = scanner.nextLine();

        System.out.println("Introduce la localidad del departamento:");
        String localidadDepartamento = scanner.nextLine();

        String insertarDepartamentoSQL = "INSERT INTO Departamentos (Dnombre, Localidad) VALUES (?, ?)";
        pstmt = conn.prepareStatement(insertarDepartamentoSQL);
        pstmt.setString(1, nombreDepartamento);
        pstmt.setString(2, localidadDepartamento);
        pstmt.executeUpdate();

        System.out.println("Nuevo departamento insertado correctamente.");
    }

    static void insertarNuevoEmpleado() throws SQLException {
        System.out.println("Introduce el DNI del empleado:");
        String dniEmpleado = scanner.nextLine();

        System.out.println("Introduce el nombre del empleado:");
        String nombreEmpleado = scanner.nextLine();

        System.out.println("Introduce los estudios del empleado:");
        String estudiosEmpleado = scanner.nextLine();

        System.out.println("Introduce la dirección del empleado:");
        String direccionEmpleado = scanner.nextLine();

        System.out.println("Introduce la fecha de alta del empleado (yyyy-MM-dd):");
        String fechaAltaStr = scanner.nextLine();
        Date fechaAlta = Date.valueOf(fechaAltaStr);

        System.out.println("Introduce el salario del empleado:");
        int salarioEmpleado = scanner.nextInt();
        scanner.nextLine(); // Limpiar el buffer

        System.out.println("Introduce la comisión del empleado:");
        int comisionEmpleado = scanner.nextInt();
        scanner.nextLine(); // Limpiar el buffer

        System.out.println("Introduce el número de departamento al que pertenece el empleado:");
        String numeroDepartamento = scanner.nextLine();

        // Verificar si el departamento existe
        String verificarDepartamentoSQL = "SELECT * FROM Departamentos WHERE Nu_dept = ?";
        pstmt = conn.prepareStatement(verificarDepartamentoSQL);
        pstmt.setString(1, numeroDepartamento);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            // El departamento existe, se puede insertar el empleado
            String insertarEmpleadoSQL = "INSERT INTO Empleados (Dni, Nombre, Estudios, Dir, Fecha_alt, Salario, Comision, Nu_dept) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertarEmpleadoSQL);
            pstmt.setString(1, dniEmpleado);
            pstmt.setString(2, nombreEmpleado);
            pstmt.setString(3, estudiosEmpleado);
            pstmt.setString(4, direccionEmpleado);
            pstmt.setDate(5, fechaAlta);
            pstmt.setInt(6, salarioEmpleado);
            pstmt.setInt(7, comisionEmpleado);
            pstmt.setString(8, numeroDepartamento);
            pstmt.executeUpdate();

            System.out.println("Nuevo empleado insertado correctamente.");
        } else {
            System.out.println("El departamento especificado no existe. Por favor, asegúrate de insertar primero el departamento.");
        }
    }


    static void borrarFilas() throws SQLException {
        System.out.println("Seleccione el tipo de borrado:");
        System.out.println("a. Borrado de un Empleado.");
        System.out.println("b. Borrado de un Departamento.");

        String opcion = scanner.nextLine().toLowerCase();
        switch (opcion) {
            case "a":
                borrarEmpleado();
                break;
            case "b":
                borrarDepartamento();
                break;
            default:
                System.out.println("Opción no válida.");
        }
    }

    static void borrarEmpleado() throws SQLException {
        System.out.println("Introduce el DNI del empleado que deseas borrar:");
        String dniEmpleado = scanner.nextLine();

        String borrarEmpleadoSQL = "DELETE FROM Empleados WHERE Dni = ?";
        pstmt = conn.prepareStatement(borrarEmpleadoSQL);
        pstmt.setString(1, dniEmpleado);
        int filasAfectadas = pstmt.executeUpdate();

        if (filasAfectadas > 0) {
            System.out.println("Empleado borrado correctamente.");
        } else {
            System.out.println("No se encontró ningún empleado con ese DNI.");
        }
    }

    static void borrarDepartamento() throws SQLException {
        System.out.println("Introduce el número del departamento que deseas borrar:");
        String numeroDepartamento = scanner.nextLine();

        // Verificar si existen empleados en el departamento
        String verificarEmpleadosSQL = "SELECT * FROM Empleados WHERE Nu_dept = ?";
        pstmt = conn.prepareStatement(verificarEmpleadosSQL);
        pstmt.setString(1, numeroDepartamento);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            System.out.println("No se puede borrar el departamento porque tiene empleados asignados.");
        } else {
            String borrarDepartamentoSQL = "DELETE FROM Departamentos WHERE Nu_dept = ?";
            pstmt = conn.prepareStatement(borrarDepartamentoSQL);
            pstmt.setString(1, numeroDepartamento);
            int filasAfectadas = pstmt.executeUpdate();

            if (filasAfectadas > 0) {
                System.out.println("Departamento borrado correctamente.");
            } else {
                System.out.println("No se encontró ningún departamento con ese número.");
            }
        }
    }


    static void consultar() throws SQLException {
        System.out.println("Seleccione el tipo de consulta:");
        System.out.println("a. Consulta de empleados por nombre de departamento.");
        System.out.println("b. Consulta de departamento y localidad por DNI de empleado.");

        String opcion = scanner.nextLine().toLowerCase();
        switch (opcion) {
            case "a":
                consultarEmpleadosPorDepartamento();
                break;
            case "b":
                consultarDepartamentoYLocalidadPorDni();
                break;
            default:
                System.out.println("Opción no válida.");
        }
    }

    static void consultarEmpleadosPorDepartamento() throws SQLException {
        System.out.println("Introduce el nombre del departamento:");
        String nombreDepartamento = scanner.nextLine();

        String consultarEmpleadosSQL = "SELECT * FROM Empleados WHERE Nu_dept IN (SELECT Nu_dept FROM Departamentos WHERE Dnombre = ?)";
        pstmt = conn.prepareStatement(consultarEmpleadosSQL);
        pstmt.setString(1, nombreDepartamento);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            System.out.println("Empleados del departamento " + nombreDepartamento + ":");
            do {
                String dni = rs.getString("Dni");
                String nombre = rs.getString("Nombre");
                String estudios = rs.getString("Estudios");
                String dir = rs.getString("Dir");
                Date fechaAlt = rs.getDate("Fecha_alt");
                int salario = rs.getInt("Salario");
                int comision = rs.getInt("Comision");
                String nuDept = rs.getString("Nu_dept");

                System.out.println("DNI: " + dni + ", Nombre: " + nombre + ", Estudios: " + estudios + ", Dirección: " + dir +
                        ", Fecha de Alta: " + fechaAlt + ", Salario: " + salario + ", Comisión: " + comision + ", Número de Departamento: " + nuDept);
            } while (rs.next());
        } else {
            System.out.println("No se encontraron empleados para el departamento especificado.");
        }
    }

    static void consultarDepartamentoYLocalidadPorDni() throws SQLException {
        System.out.println("Introduce el DNI del empleado:");
        String dniEmpleado = scanner.nextLine();

        String consultarDepartamentoSQL = "SELECT Dnombre, Localidad FROM Departamentos WHERE Nu_dept = (SELECT Nu_dept FROM Empleados WHERE Dni = ?)";
        pstmt = conn.prepareStatement(consultarDepartamentoSQL);
        pstmt.setString(1, dniEmpleado);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String nombreDepartamento = rs.getString("Dnombre");
            String localidadDepartamento = rs.getString("Localidad");
            System.out.println("El empleado con DNI " + dniEmpleado + " pertenece al departamento " + nombreDepartamento + " ubicado en " + localidadDepartamento + ".");
        } else {
            System.out.println("No se encontró ningún empleado con ese DNI.");
        }
    }


    static void modificar() throws SQLException {
        System.out.println("Seleccione el tipo de modificación:");
        System.out.println("a. Modificar salario o comisión de un empleado por DNI.");
        System.out.println("b. Modificar la localidad de un departamento por nombre.");

        String opcion = scanner.nextLine().toLowerCase();
        switch (opcion) {
            case "a":
                modificarSalarioOComision();
                break;
            case "b":
                modificarLocalidadDepartamento();
                break;
            default:
                System.out.println("Opción no válida.");
        }
    }

    static void modificarSalarioOComision() throws SQLException {
        System.out.println("Introduce el DNI del empleado:");
        String dniEmpleado = scanner.nextLine();

        System.out.println("Seleccione el campo que desea modificar:");
        System.out.println("1. Salario");
        System.out.println("2. Comisión");

        int campo = scanner.nextInt();
        scanner.nextLine(); // Limpiar el buffer

        String campoStr;
        if (campo == 1) {
            campoStr = "Salario";
        } else if (campo == 2) {
            campoStr = "Comision";
        } else {
            System.out.println("Opción no válida.");
            return;
        }

        System.out.println("Introduce el nuevo valor para " + campoStr + ":");
        int nuevoValor = scanner.nextInt();
        scanner.nextLine(); // Limpiar el buffer

        String modificarEmpleadoSQL = "UPDATE Empleados SET " + campoStr + " = ? WHERE Dni = ?";
        pstmt = conn.prepareStatement(modificarEmpleadoSQL);
        pstmt.setInt(1, nuevoValor);
        pstmt.setString(2, dniEmpleado);
        int filasAfectadas = pstmt.executeUpdate();

        if (filasAfectadas > 0) {
            System.out.println("Empleado modificado correctamente.");
        } else {
            System.out.println("No se encontró ningún empleado con ese DNI.");
        }
    }

    static void modificarLocalidadDepartamento() throws SQLException {
        System.out.println("Introduce el nombre del departamento:");
        String nombreDepartamento = scanner.nextLine();

        System.out.println("Introduce la nueva localidad del departamento:");
        String nuevaLocalidad = scanner.nextLine();

        String modificarDepartamentoSQL = "UPDATE Departamentos SET Localidad = ? WHERE Dnombre = ?";
        pstmt = conn.prepareStatement(modificarDepartamentoSQL);
        pstmt.setString(1, nuevaLocalidad);
        pstmt.setString(2, nombreDepartamento);
        int filasAfectadas = pstmt.executeUpdate();

        if (filasAfectadas > 0) {
            System.out.println("Localidad del departamento modificada correctamente.");
        } else {
            System.out.println("No se encontró ningún departamento con ese nombre.");
        }
    }

    static void mostrarMenu() {
        System.out.println("MENÚ DE LA APLICACIÓN");
        System.out.println("0- Creación de la base de datos (si no existe).");
        System.out.println("1- Inserción de nuevas filas.");
        System.out.println("2- Borrado de filas.");
        System.out.println("3- Consultas.");
        System.out.println("4- Modificaciones.");
        System.out.println("5- Salir.");
        System.out.println("Seleccione una opción:");
    }
}
