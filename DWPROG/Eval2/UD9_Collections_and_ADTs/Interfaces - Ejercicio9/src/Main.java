public class Main {
    public static void main(String[] args) {
        //    En un almacén se guardan productos de alimentación y bebidas. Existirán 2 tipos de bebidas:
//    agua mineral y refrescos. De todos los productos nos interesa saber su identificador, nombre, precio, marca y
//    localizacion.
//
//    Para las bebidas necesitaremos también conocer el tipo de envase en el que se presenta.
//
//    Si es agua mineral nos interesa saber también el origen. Por el contrario, para los refrescos,
//    queremos saber su porcentaje de azúcar y si tiene o no alguna promoción
//            (para aplicar un descuento del 15% en el precio).
//
//    El precio del agua mineral variará en función de 2 criterios: en caso de que se presente en envase de cristal,
//    su precio se incrementará un 10%; además, la marca "aguarón" supondrá un plus de 0,30€.
//
//    En el caso de los refrescos, si vienen en lata, valdrán un 5% menos,
//    mientras que si su porcentaje de azúcar es superior al 10%, supondrá un 10% de incremento sobre el precio.
//    Por último, deberá aplicarse el descuento correspondiente en caso de que tenga promoción.
//
//    Los productos de alimentación registrarán su categoría y se deberá indicar si contienen o no gluten.
//
//    Las operaciones del almacén son las siguientes:
//
//    Calcular precio de todas las bebidas: calcula el precio total de todos los productos del almacén.
//    Calcular el precio total de una marca de producto: dada una marca, calcular el precio total de esas bebidas.
//    Agregar producto: agrega un producto en la primera posición libre, si el identificador está repetido en alguno de
//    los productos, no se agregará.
//    Eliminar un producto: dado un ID, eliminar el producto del almacén.
//    Mostrar información: mostramos para cada refresco toda su información.

        AguaMineral lanjaron = new AguaMineral("12","Agua Lanjaron",1.5,"Lanjaron", "Lugo","botella plástico", "Terras gaudas");

        Refresco lataCocaCola = new Refresco("45", "lataCocaCola", 0.9, "CocaCola", "USA", "lata", 15,true);

        Alimento chorizo = new Alimento("37", "chorizo", 5.67, "Torre De Nuñez", "Castilla Leon", "embutido", false);

        Almacen almacen = new Almacen();

        almacen.anhadirProducto(lanjaron);
        almacen.anhadirProducto(lataCocaCola);
        almacen.anhadirProducto(chorizo);


        System.out.println(almacen.precioTotalAlmacen());

        almacen.mostraInformacion();

        System.out.println(almacen.precioTotalBebidas());
        System.out.println(almacen.precioTotalMarca("CocaCola"));

        almacen.eliminarProducto(0);
        almacen.mostraInformacion();

    }
}