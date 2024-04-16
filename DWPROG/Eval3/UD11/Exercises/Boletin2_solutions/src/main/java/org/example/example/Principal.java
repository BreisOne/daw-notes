package org.example.example;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.Unmarshaller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Principal {

    public static void main(String[] args) throws JAXBException, IOException {

        // Se crean los objetos Java
        ArrayList empleados = new ArrayList();

        Empleado empleado1 = new Empleado();
        empleado1.setDni("12345678A");
        empleado1.setNombre("Alba Perez Pereira");
        empleado1.setEdad(29);

        Empleado empleado2 = new Empleado();
        empleado2.setDni("22222222B");
        empleado2.setNombre("Mario Gomez Ruiz");
        empleado2.setEdad(31);

        Empresa empresa = new Empresa();
        empresa.setCif("A11122233");
        empresa.setRazonsocial("IES DE TEIS");
        empleados.add(empleado1);
        empleados.add(empleado2);
        empresa.setEmpleados(empleados);

        // Se crea el contexto
        JAXBContext context = JAXBContext.newInstance(Empresa.class);
        // Se crea el serializador
        Marshaller m = context.createMarshaller();

        // Indicamos que introduzca el contenido en el documento con indentaciones
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

        // Se podría mostrar por pantalla o volcarlo a un fichero (indicando su ruta)
        m.marshal(empresa, System.out);

        m.marshal(empresa, new File("empresa.xml"));

        /*
        Writer w = null;
        try {
            w = new FileWriter("empresa.xml");
            m.marshal(empresa, w);
        } finally {
            try {
                w.close();
            } catch (Exception e) {
            }
        }*/

        // Ahora leemos el XML e instanciamos las clases Java
        System.out.println("Salida desde el fichero XML: ");
        Unmarshaller um = context.createUnmarshaller();
        Empresa empresa2 = (Empresa) um.unmarshal(new FileReader("empresa.xml"));

        for (int i = 0; i < empresa2.getEmpleados().toArray().length; i++) {
            System.out.println("Empleado " + (i + 1) + ": " + ((Empleado) empresa2.getEmpleados().get(i)).getNombre() + " con DNI " + ((Empleado) empresa2.getEmpleados().get(i)).getDni() + " y " + ((Empleado) empresa2.getEmpleados().get(i)).getEdad() + " años");
        }
    }
}
