package XML.Empresa;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.PropertyException;

import java.io.File;
import java.util.ArrayList;

public class Principal2 {
    public static void main(String[] args) throws JAXBException {
        JAXBContext contexto = JAXBContext.newInstance(Empresa.class);

        generarXML(contexto);

    }

    public static void generarXML(JAXBContext contexto) {
        ArrayList empleados = new ArrayList();

        Empleado empleado1 = new Empleado();
        empleado1.setDni("12345678C");
        empleado1.setNombre("Carlos Pérez Ruíz");
        empleado1.setEdad(29);

        Empresa empresa = new Empresa();
        empresa.setCif("A58818501");
        empresa.setRazonsocial("TECNOMUR S.L.");
        empleados.add(empleado1);
        empresa.setEmpleados(empleados);

        try {
            // Serializa el contenido del objeto para pasarlo al documento XML
            Marshaller serializador = contexto.createMarshaller();

            // Indicamos que introduzca el contenido con indentaciones
            serializador.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
            // Se podría mostrar por pantalla o volcarlo a un fichero
            serializador.marshal(empresa, new File("empresa.xml"));
        } catch (PropertyException e) {
            e.printStackTrace();
        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }
}
