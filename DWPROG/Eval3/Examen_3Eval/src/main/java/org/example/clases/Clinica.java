package org.example.clases;

import org.example.db.Creacion;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

public class Clinica implements ClinicaInterface{
    private static String URL = "jdbc:mariadb://localhost:3306";
    private static String user = "root";
    private static String password = "";

    private static String filePath = ".\\src\\main\\java\\org\\example\\bigSalaries.txt";

    public static Statement crearBD(){
        Statement statement = null;
        try{

            Connection connection = DriverManager.getConnection(URL, user , password);
            statement = connection.createStatement();
            Creacion.crearBase(statement);

        }catch (SQLException e){
            e.printStackTrace();
        }

        return statement;
    }

    @Override
    public void insertVet(Statement statement, String dniVet, String nombreVet, int edadVet, String direccion, Double sueldo, String especialidad, String fechaContrat) {
        try{
        String insertVet = "INSERT INTO veterinarios VALUES ('"+ dniVet +"', '"+ nombreVet +"','" + edadVet+"','"+ direccion+ "','"+ sueldo+"','"+ especialidad+"','"+fechaContrat+"');";
        statement.execute(insertVet);

        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    @Override
    public void insertMasc(Statement statement, String nombreMascota, String especie, String raza, String fechaNacimiento, String fechRegistro, String dniVeterinario) {
        try{
            String insertMasc = "INSERT INTO mascotas VALUES (null, '"+ nombreMascota +"','" + especie+"','"+ raza+ "','"+ fechaNacimiento+"','"+ fechRegistro+"','"+dniVeterinario+"');";
            statement.execute(insertMasc);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteVet(Statement statement, String dni) {
        try{
            String deleteMascFromVet = "DELETE FROM mascotas WHERE veterinario = '"+ dni+"';";
            statement.execute(deleteMascFromVet);

            String deleteVet = "DELETE FROM veterinarios WHERE dni = '"+dni+"';";
            statement.execute(deleteVet);

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMasc(Statement statement, int id) {
        try{
            String deleteMasc = "DELETE FROM mascotas where idMascota = '"+id+"';";
            statement.execute(deleteMasc);

        }catch (SQLException e){
            e.printStackTrace();
        }
    }


    @Override
    public void showPetData(Statement statement, String nombreVet) {
        try {
            String petData = "SELECT * FROM mascotas WHERE veterinario = (SELECT dni FROM veterinarios WHERE nombreVet = '"+nombreVet+"');";
            ResultSet petDataResult = statement.executeQuery(petData);


            for (int i = 1; i < petDataResult.getMetaData().getColumnCount(); i++) {
                System.out.print(petDataResult.getMetaData().getColumnName(i) +" ");
            }

            System.out.print("\n");
            while(petDataResult.next()){
                for (int i = 1; i < petDataResult.getMetaData().getColumnCount(); i++) {
                    System.out.print(petDataResult.getString(i) +" ");
                }
                System.out.print("\n");
            }

        }catch( SQLException e){
            e.printStackTrace();
        }
    }
//    public void showVetFromName(Statement statement, String nombreVeterinario){
//        try{
//            String queryVet = "SELECT * FROM veterinarios WHERE nombre = '"+nombreVeterinario+"';";
//            ResultSet results = statement.executeQuery(queryVet);
//
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//    }
    @Override
    public void showVetFromMasc(Statement statement, String nombreMasc, String especie) {
        try {
            String queryVet = "SELECT nombreVet, fechaCont FROM veterinarios WHERE dni IN (SELECT veterinario FROM mascotas WHERE nombreMasc = '" + nombreMasc + "' AND especie ='" + especie + "');";
            ResultSet results = statement.executeQuery(queryVet);

            LocalDate fechaActual = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            while(results.next()){
                LocalDate inicioContrato = LocalDate.parse(results.getString("fechaCont"), formatter);

                int diasContratado = Period.between(inicioContrato, fechaActual).getDays();
                int mesesContratado = Period.between(inicioContrato, fechaActual).getMonths();
                int añosContratado = Period.between(inicioContrato, fechaActual).getYears();

                System.out.println("Su veterinarios es: ");
                System.out.println("Nombre: "+ results.getString("nombreVet") + ", Lleva contratad@: "+ diasContratado+ "días, "+mesesContratado+"meses, "+añosContratado+"años");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public String exportVetHighSalary(Statement statement) {

        try(BufferedWriter writer = Files.newBufferedWriter(Paths.get(filePath))){
            if(!Files.exists(Paths.get(filePath))){
                Files.createFile(Paths.get(filePath));
            }

            String query = "SELECT * FROM veterinarios WHERE sueldo >= 2200";

            ResultSet results = statement.executeQuery(query);

            while(results.next()){
                writer.write( "DNI: " + results.getString("dni") + ", Nombre: " + results.getString("nombreVet") +
                                ", edad: " + results.getString("edad") + ", Direccion: " + results.getString("direccion"));
                writer.newLine();

                String mascotasAsociadas = "SELECT * from mascotas where veterinario = '"+ results.getString("dni")+"';";

                ResultSet resultsMascotas = statement.executeQuery(mascotasAsociadas);

                writer.write("Mascotas asociadas: [");
                writer.newLine();

                while (resultsMascotas.next()){
                    writer.write(resultsMascotas.getString("nombreMasc")+", "+ resultsMascotas.getString("especie")+", "+resultsMascotas.getString("raza"));
                    writer.newLine();
                }
                writer.write("]");
                writer.newLine();
            }

        }catch (IOException | SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void modifyVetSalary(Statement statement, String dniVet, double salario) {
        try{
            String queryUpdate = "UPDATE veterinarios SET sueldo = "+ salario +" WHERE dni = '"+dniVet+"';";
            statement.executeUpdate(queryUpdate);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void modifyVetMasc(Statement statement, String nombre, String especie, String nombreVet) {
        try{
            String queryDNIvet = "SELECT dni FROM veterinarios WHERE nombreVet = '"+nombreVet +"';";

            ResultSet resultSet = statement.executeQuery(queryDNIvet);
            if(resultSet.next()){
                String queryNombreMascota = "UPDATE mascotas SET veterinario = '"+resultSet.getString("dni") + "' WHERE nombreMasc = '"+nombre+"' AND especie = '"+especie+"';";
                statement.executeUpdate(queryNombreMascota);
            }else{
                System.out.println("No hay veterinarios con ese nombre");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
