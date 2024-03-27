package org.boxing;

public class PointsDeducted implements Round{
    private String roundScore = "";
    private byte redBoxerScore = 0;
    private byte blueBoxerScore = 0;

    PointsDeducted(String roundScore){
        this.roundScore = roundScore;
    }

    @Override
    public byte getredBoxerScore() {

        return 0;
    }

    @Override
    public byte getblueBoxerScore() {
        return 0;
    }

    @Override
    public void boxerRoundScore() {

    }

    private Byte parseComaBlue(String score){
        return 0;
    }

    private Byte parseComaRed(String score){
        return 0;
    }
    @Override
    public String toString() {
        return "PointsDeducted{" +
                "roundScore='" + roundScore + '\'' +
                '}';
    }
}
