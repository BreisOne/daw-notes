package org.boxing;

public class RoundFactory {

    public static Round getRound ( String roundScore){
        Round round = new RegularRound( roundScore);
        Round roundKnockdown = new KnockdownRound(roundScore);
        Round PointsDeducted = new PointsDeducted(roundScore);
        return round;
    }
}
