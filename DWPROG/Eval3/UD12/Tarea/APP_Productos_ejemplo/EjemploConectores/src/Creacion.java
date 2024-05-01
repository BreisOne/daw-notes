import java.sql.SQLException;
import java.sql.Statement;

public class Creacion {
        public static void crearBase(Statement sentencia)
        {
            try
            {
                String bd = "productos";

                sentencia.execute("CREATE DATABASE IF NOT EXISTS " + bd + ";");
                sentencia.execute("USE "+ bd +";");

                sentencia.execute("CREATE TABLE IF NOT EXISTS PRODUCTOS"
                        + "(idProd INT(3) unsigned zerofill not null auto_increment,"
                        + "nombreProducto VARCHAR(30) not null,"
                        + "precio float not null,"
                        + "Primary Key (idProd))"
                        + "ENGINE INNODB;");
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
        }
}
