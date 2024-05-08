package org.example.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Creacion {
    public static void crearBase(Statement sentencia) {
        try {
            String bd = "ClinicaVetBD";

            sentencia.execute("CREATE DATABASE IF NOT EXISTS " + bd + ";");
            sentencia.execute("USE " + bd + ";");

            sentencia.execute("CREATE TABLE IF NOT EXISTS ESPECIALIDADES"
                    + "(idEsp int(3) not null,"
                    + "nombreEsp VARCHAR(30) not null,"
                    + "Primary Key (idEsp))"
                    + "ENGINE INNODB;");

            sentencia.execute("CREATE TABLE IF NOT EXISTS VETERINARIOS"
                    + "(dni char(9) not null,"
                    + "nombreVet VARCHAR(30) not null,"
                    + "edad int(3) not null,"
                    + "direccion VARCHAR(30) not null,"
                    + "sueldo float not null,"
                    + "esp int(3) not null,"
                    + "fechaCont date null,"
                    + "Primary Key (dni),"
                    + "Foreign key (esp) references ESPECIALIDADES(idEsp))"
                    + "ENGINE INNODB;");

            sentencia.execute("CREATE TABLE IF NOT EXISTS MASCOTAS"
                    + "(idMascota INT(5) unsigned zerofill not null auto_increment,"
                    + "nombreMasc VARCHAR(30) not null,"
                    + "especie VARCHAR(30) not null,"
                    + "raza VARCHAR(30) not null,"
                    + "fechaNac date null,"
                    + "fechaAlta date null,"
                    + "veterinario char(9) null,"
                    + "Primary Key (idMascota),"
                    + "Foreign key (veterinario) references VETERINARIOS(dni)"
                    + " on delete SET NULL "
                    + "on update SET NULL)"
                    + "ENGINE INNODB;");
            sentencia.execute("INSERT INTO values()");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
