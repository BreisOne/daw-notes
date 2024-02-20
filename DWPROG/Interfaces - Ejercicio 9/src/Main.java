public class Main {
    public static void main(String[] args) {

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