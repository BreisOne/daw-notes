public class RestauranteMexicano {
     private double papas;
     private double chocos;

     public RestauranteMexicano(double papas, double chocos){
         this.papas = papas;
         this.chocos = chocos;
     }

     public int papasConChocos(){
         int clientesPatatas = (int) (papas*3);

         int clienteChocos = (int) (chocos/0.5*3);

         if (clientesPatatas < clienteChocos){
             return clientesPatatas;
         }else {
             return clienteChocos;
         }
     }
}
