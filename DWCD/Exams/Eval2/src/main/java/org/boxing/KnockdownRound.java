package org.boxing;

public class KnockdownRound implements Round{
    private String roundScore = "";
    private byte redBoxerScore = 0;
    private byte blueBoxerScore = 0;

    KnockdownRound(String roundScoreScore){
        this.roundScore = roundScoreScore;
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
    @Override
    public String toString() {
        return "KnockdownRound{" +
                "roundScore='" + roundScore + '\'' +
                '}';
    }
}
