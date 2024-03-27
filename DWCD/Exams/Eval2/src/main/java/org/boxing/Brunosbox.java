
package org.boxing;
import com.github.freva.asciitable.AsciiTable;

public class Brunosbox 
{
    public static void main( String[] args ) {

        System.out.println("\n - I see three of them out there." + 
                           "\n - Hit the one in the middle.- Rocky Balboa\n");

        String[] headers = {"Round 1", "Round 2", "Round 3", "Round 4", "Round 5", 
                            "Round 6", "Round 7", "Round 8", "Round 9", "Round 10"};

        String[][] data = {

            //  White ScoreCard
            {"9 - 10", 
             "9 - 10", 
             "9 - 10", 
             "9 - 10",
             "10 - 9",
             "10 - 9",
             "10 - 9", 
             "9 - 10", 
             "10 - 9", 
             "9 - 10"},
            
             // Blue ScoreCard
            {"9 - 10", 
             "9 - 10", 
             "9 - 10", 
             "8 - 10", // knockdown
             "10 - 8", // knockdown
             "10 - 8",
             "10 - 9", 
             "9 - 10", 
             "10 - 9", 
             "10 - 9"},

            // Pink ScoreCard
            {"9 - 10", 
             "9 - 10", 
             "9 - 10", 
             "1, 8 - 10", // referee point deduction
             "10 - 8",    // knockdown
             "10 - 8 ,1", // referee point deduction
             "10 - 9", 
             "9 - 10", 
             "10 - 9", 
             "10 - 8" // knockdown
            }

        };

        System.out.println(AsciiTable.getTable(headers, data));


        /**
         * Crea una tarjeta de puntos de boxeo
         * a partir de la tarjeta blanca entregada
         * por el juez blanco.
         */

        //ScoreCard whiteScoreCard = new ScoreCard("WHITE");

        /**
         * Asigna el nombre de los pugiles
         * Rocky Balboa (red) vs Apollo Creed (blue)
         */
        
        //whiteScoreCard.setRCorner("Rocky Balboa");
        //whiteScoreCard.setBCorner("Apollo Creed");

        /**
         * Muestra la tarjeta por consola con
         * el formato que se propone en el enunciado
         * del ejercicio.
         */

        //System.out.println(whiteScoreCard);


        /**
         * Crea una clase llamada RegularRound
         * que implemente la interfaz Round.
         * 
         * Crea un round del tipo "10 - 9" o "9 - 10".
         * Muestra la puntuación obtenida por
         * cada boxeador.
         * 
         * En Round la puntuacion se almacena
         * como un número entero, no como un String.
         * 
         * Pasa el caso test que propongo.
         */

        //RegularRound round = new RegularRound("10 - 9");
        //round.boxerRoundScore();
        //System.out.println("\n\t Regular round\t" + round.getRedBoxerScore() +
          //                  " - " + round.getBlueBoxerScore());

        /**
         * Carga en la tarjeta blanca 
         * los puntos de todos los rounds
         * de la primera tarjeta del array data.
         * 
         * Cada round es un objeto del tipo RegularRound.
         * La tarjeta blanca es una colección de objetos
         * de tipo Round.
         * 
         * Al mostrar la tarjeta se observan los 
         * puntos obtenidos por cada pugil en cada round.
         * Se llaman round score.
         */

        //whiteScoreCard.loadJudgeScoreCard(data[0]);
        //System.out.println(whiteScoreCard);

        /**
         * Calcula el final score o puntuación total
         * de cada pugil y muestralo en la tarjeta.
         */
        
        //System.out.println("\t FINAL SCORE: " + whiteScoreCard.getRedBoxerFinalScore() +
         //                  " - " + whiteScoreCard.getBlueBoxerFinalScore() + " FINAL SCORE");

        /**
         * Calcula los puntos acumulados en cada
         * round de cada pugil y muestralo en la tarjeta.
         * Se llaman score total.
         */

        //System.out.println(whiteScoreCard);
        //System.out.println("\t FINAL SCORE: " + whiteScoreCard.getRedBoxerFinalScore() +
        //" - " + whiteScoreCard.getBlueBoxerFinalScore() + " FINAL SCORE");

        /**
         * Crea una clase llamada KnockdownRound
         * que implemente la interfaz Round.
         * 
         * Crea un round del tipo "10 - 8" o "8 -10".
         * Muestra la puntuación obtenida por
         * cada boxeador.
         * 
         * En KnockdownRound la puntuacion se almacena
         * como un número entero, no como un String.
         */

        //KnockdownRound knockdownRound = new KnockdownRound("10 - 8");
        //knockdownRound.boxerRoundScore();
        //System.out.println("\n\t knockdown round\t" + knockdownRound.getRedBoxerScore() +
         //                    " - " + knockdownRound.getBlueBoxerScore());
                        
        /**
         * Crea una clase RoundFactory que crea
         * un objeto de tipo RegularRound o KnockdownRound
         * segun si la puntuación indicada por el /la juez
         * es "10 - 9" o "10 - 8".
         * 
         * Si el metodo getRound() no construye el tipo indicado
         * en el casting, las siguientes líneas daran error
         * en tiempo de ejecución.
         */

        //RegularRound regular = (RegularRound) RoundFactory.getRound("9 - 10");
        //System.out.println("\t regular round: " + regular);
        //KnockdownRound knockdown = (KnockdownRound) RoundFactory.getRound("8 - 10");
        //System.out.println("\t knockdown round: " + knockdown);

 
        /**
         * Carga en la tarjeta blue 
         * los puntos de todos los rounds
         * de la segunda tarjeta del array data.
         * 
         * Cada round es un objeto del tipo RegularRound o KnockdownRound.
         * La tarjeta azul es una colección de objetos
         * de tipo Round.
         * 
         * El metodo loadJudgeScoreCard() hace uso del
         * metodo getRound() de la clase RoundFactory
         * para obtener el tipo de round indicado en la 
         * tarjeta del juez.
         * 
         * Al mostrar la tarjeta se observan los 
         * puntos obtenidos por cada pugil en cada round.
         * Se llaman round score.
         * 
         * Calcula los puntos acumulados en cada
         * round de cada pugil y muestralo en la tarjeta.
         * Se llaman score total.
         */

        //ScoreCard blueScoreCard = new ScoreCard("BLUE");
        //blueScoreCard.setRCorner("Rocky Balboa");
        //blueScoreCard.setBCorner("Apollo Creed");
 
        //blueScoreCard.loadJudgeScoreCard(data[1]);
        //System.out.println(blueScoreCard);

        /**
         * Calcula el final score o puntuación total
         * de cada pugil y muestralo en la tarjeta.
         */
        
        //System.out.println("\t FINAL SCORE: " + blueScoreCard.getRedBoxerFinalScore() +
         //" - " + blueScoreCard.getBlueBoxerFinalScore() + " FINAL SCORE");

        /**
         * Crea una clase llamada PointsDeducted
         * que implemente la interfaz Round.
         * 
         * Crea un round del tipo "10 - 8 1" o "1 8 -10".
         * Muestra la puntuación obtenida por
         * cada boxeador.
         * 
         * En PointsDeducted la puntuacion se almacena
         * como un número entero, no como un String.
         */

        //PointsDeducted deducted = new PointsDeducted("10 - 8 ,1");
        //deducted.boxerRoundScore();
        //System.out.println("\n\t points deducted round\t" + deducted.getRedBoxerScore() +
          //                    " - " + deducted.getBlueBoxerScore());
        
        //deducted = new PointsDeducted("1, 8 - 10");
        //deducted.boxerRoundScore();
        //System.out.println("\n\t points deducted round\t" + deducted.getRedBoxerScore() +
        //" - " + deducted.getBlueBoxerScore());
        
         /**
         * Extiende o modifica la clase RoundFactory para crear
         * un objeto de tipo PointsDeducted
         * si la puntuación indicada por el /la juez
         * es "10 - 8 ,1" o "1, 8 - 10".
         * 
         * Si el metodo getRound() no construye el tipo indicado
         * en el casting, las siguiente línea dará error
         * en tiempo de ejecución.
         */

        //PointsDeducted pointsDeducted = (PointsDeducted) RoundFactory.getRound("1, 8 - 10");
        //System.out.println("\n\t factory deducted round: " + pointsDeducted);

        /**
         * Carga en la tarjeta pink 
         * los puntos de todos los rounds
         * de la tercera tarjeta del array data.
         * 
         * Cada round es un objeto del tipo RegularRound, 
         * KnockdownRound o PointsDeducted.
         * La tarjeta rosa es una colección de objetos
         * de tipo Round.
         * 
         * El metodo loadJudgeScoreCard() hace uso del
         * metodo getRound() de la clase RoundFactory
         * para obtener el tipo de round indicado en la 
         * tarjeta del juez.
         * 
         * Al mostrar la tarjeta se observan los 
         * puntos obtenidos por cada pugil en cada round.
         * Se llaman round score.
         * 
         * Calcula los puntos acumulados en cada
         * round de cada pugil y muestralo en la tarjeta.
         * Se llaman score total.
         */

        //ScoreCard pinkScoreCard = new ScoreCard("PINK");
        //pinkScoreCard.setRCorner("Rocky Balboa");
        //pinkScoreCard.setBCorner("Apollo Creed");
  
        //pinkScoreCard.loadJudgeScoreCard(data[2]);
        //System.out.println(pinkScoreCard);

        /**
         * Calcula el final score o puntuación total
         * de cada pugil y muestralo en la tarjeta.
         */
        
         //System.out.println("\t FINAL SCORE: " + pinkScoreCard.getRedBoxerFinalScore() +
         //" - " + pinkScoreCard.getBlueBoxerFinalScore() + " FINAL SCORE");

    }
}
