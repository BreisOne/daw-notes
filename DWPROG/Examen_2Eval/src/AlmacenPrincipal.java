import Comerciales.Comercial;
import Comerciales.RegistroComercial;
import Exceptions.ExceptionDate;
import Exceptions.ExceptionPrice;
import Productos.Producto;
import Productos.ProductoComestible;
import Productos.ProductoDeBazar;
import Validaciones.Validaciones;

import java.time.LocalDate;
import java.util.*;

public class AlmacenPrincipal {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcion;

        ArrayList<Producto> productos = new ArrayList<>();
        ArrayList<Comercial> comerciales = new ArrayList<>();

        do {
            menu();
            opcion = sc.nextInt();
            sc.nextLine();
            switch (opcion){
                case 1:
                    Producto producto = altaProducto();
                    productos.add(producto);
                    break;
                case 2:
                    Comercial comercial = altaComercial(productos);
                    comerciales.add(comercial);
                    break;
                case 3:
                    eliminarProductosLimpieza(productos);
                    break;
                case 4:
                    especialidadComerciales(comerciales);
                    break;
                case 5:
                    costeProductosComestibles(productos);
                    break;
                case 6:
                    productosCaducidadProxima(productos);
                    break;
                default:
                    System.out.println("No has elegido una opción entre la 1 o la 6. Adios!!!");
            }
        }
        while (opcion != 7);
    }

    private static void menu() {
        //Encabezado
        System.out.println("--------------------");
        System.out.println("Menú de Almacen");
        System.out.println("--------------------");

        System.out.println("Seleccione lo que desea realizar:");
        System.out.println("1: Alta productos");
        System.out.println("2: Alta comerciales");
        System.out.println("3: Eliminar productos de Limpieza");
        System.out.println("4: Mostrar especialidades de los comerciales");
        System.out.println("5: Coste medio de comestibles");
        System.out.println("6: Productos de caducidad próxima");
        System.out.println("7: Salir");
    }

    private static Producto altaProducto() {
        Scanner sc = new Scanner(System.in);
        Producto producto = null;
        double precio;
            try {
                String nombre, categoria;
                System.out.println("-------- Alta productos ---------");

                System.out.println("Introduzca nombre");
                nombre = sc.nextLine();

                sc = new Scanner(System.in);
                System.out.println("Introduzca precio");
                precio = sc.nextDouble();

                if(Validaciones.chequearPrecio(precio)){

                    sc = new Scanner(System.in);
                    System.out.println("Introduzca categoría (Comestible/Bazar)");
                    categoria = sc.nextLine();

                    if (categoria.equalsIgnoreCase("comestible")) {
                        System.out.println("Introduzca una fecha de caducidad en formado yyyy-mm-dd");
                        LocalDate fechaCaducidad = LocalDate.parse(sc.nextLine());

                        if(Validaciones.chequearFechaCaducidad(fechaCaducidad)){

                            producto = new ProductoComestible(nombre, precio, fechaCaducidad);
                            System.out.println("El producto "+ producto.getNombre() +" se ha creado correctamente");

                        }else{

                            throw new ExceptionDate();
                        }
                    } else if (categoria.equalsIgnoreCase("Bazar")) {
                        System.out.println("Introduzca el tipo del producto de bazar");
                        String tipo = sc.nextLine();
                        producto = new ProductoDeBazar(nombre, precio, tipo);

                        System.out.println("El producto "+ producto.getNombre() +" se ha creado correctamente");
                    } else {
                        System.out.println("No ha introducido una categoria valida");
                        producto = new Producto();
                    }
                }else{
                    throw new ExceptionPrice();
                }

            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        return producto;
    }

    private static Comercial altaComercial( ArrayList<Producto> productos) {
        Scanner sc = new Scanner(System.in);
        Comercial comercial = new Comercial();
        int edad;
        String nombre, apellidos, zona;

        try{
            System.out.println("-------- Alta comerciales ---------");

            System.out.println("Introduzca nombre");
            nombre = sc.nextLine();

            System.out.println("Introduzca apellidos");
            apellidos = sc.nextLine();

            System.out.println("Introduzca zona");
            zona = sc.nextLine();

            System.out.println("Introduzca edad");
            edad = sc.nextInt();
            comercial = new Comercial(nombre, apellidos, edad, zona, crearRegistroComercial(productos));

            System.out.println("El comercial "+ comercial.getNombre() +" se ha dado de alta correctamente");

        }catch (Exception e){

            System.out.println(e.getMessage());

        }
        return comercial;
    }

    // En el siguiente método, cambiar tipo de dato de retorno al tipo de colección elegida para el registro de los comerciales
    // Los elementos en el registro pueden introducirse manualmente, sin necesidad de solicitarlos por teclado.
    private static RegistroComercial crearRegistroComercial(ArrayList<Producto> productos) {
        RegistroComercial registrosProducto = new RegistroComercial()  ;
        registrosProducto.añadirProducto(0, productos.get(0));
        registrosProducto.añadirProducto(1, productos.get(1));
        registrosProducto.añadirProducto(2, productos.get(2));
        return registrosProducto;
    }

    private static void eliminarProductosLimpieza(ArrayList<Producto> productos) {

        for (int i = 0; i <productos.size() ; i++) {
            Producto producto = productos.get(i);
            if (producto instanceof ProductoDeBazar) {
                if (((ProductoDeBazar) producto).getTipo().equalsIgnoreCase("Limpieza")) {
                    productos.remove(producto);
                    System.out.println("Se ha eliminado el producto " + producto.getNombre());
                }
            }
        }
    }

    private static void especialidadComerciales(ArrayList<Comercial> comerciales) {
        int indexComercial = 0;
        for (Comercial comercial: comerciales){
             int productosBazar = 0;
             int productosComestibles = 0;
             HashMap <Integer,Producto>registroComercial = comercial.getRegistrosProductos().getRegistroProductos();

            for (int i = 0; i < registroComercial.size(); i++) {
                if (registroComercial.get(i) instanceof ProductoDeBazar){
                    productosBazar++;
                }else{
                    productosComestibles++;
                }
            }

            if(productosBazar > productosComestibles){
                System.out.println("El comercial "+ comerciales.get(indexComercial).getNombre()+ " esta especalizado en productos de Bazar");
            } else if (productosBazar < productosComestibles) {
                System.out.println("El comercial "+ comerciales.get(indexComercial).getNombre()+ " esta especalizado en productos comestibles");
            }else{
                System.out.println("El comercial "+ comerciales.get(indexComercial).getNombre()+ " no esta especializado en ningún tipo de productos");
            }
            indexComercial++;
        }
    }

    private static void costeProductosComestibles(ArrayList<Producto> productos) {
        double costeTotalComestibles = 0;
        int contProductosComestibles = 0;
        for(Producto producto: productos){
            if (producto instanceof ProductoComestible){
                costeTotalComestibles += producto.getPrecio();
                contProductosComestibles++;
            }
        }
        double precioMedio = costeTotalComestibles/contProductosComestibles;
        System.out.println("El precio medio de los productos comestibles es " + precioMedio);
    }

    private static void productosCaducidadProxima(ArrayList<Producto> productos) {
        int contProductosCad = 0;
        for(Producto producto: productos){
           if(producto instanceof ProductoComestible){

               LocalDate fechaCaducidad = ((ProductoComestible) producto).getFechaCaducidad();
               LocalDate fechActual = LocalDate.now();

               int diffFechas = fechaCaducidad.compareTo(fechActual);

               if (diffFechas < 5){
                   contProductosCad++;
               }
           }
        }
        System.out.println("El total de productos del almacen con una fecha de caducidad inferior a 5 días es " + contProductosCad);
    }
}
