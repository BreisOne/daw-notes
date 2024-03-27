package org.boxing;

import javax.swing.*;

public class RegularRound implements Round{
    String roundScore = "";
    private byte redBoxerScore = 0;
    private byte blueBoxerScore = 0;

    RegularRound(String roundScore){
        this.roundScore = roundScore;
    }

    @Override
    public byte getredBoxerScore() {
        return redBoxerScore;
    }

    @Override
    public byte getblueBoxerScore() {
        return blueBoxerScore;
    }

    @Override
    public void boxerRoundScore() {
        String [] arrayRoundScore = roundScore.split("-");

        String redScoreChar = arrayRoundScore[0].trim();
        String blueScoreChar = arrayRoundScore[1].trim();

        byte redScore = Byte.parseByte(redScoreChar);
        byte blueScore = Byte.parseByte(blueScoreChar);

        this.redBoxerScore = redScore;
        this.blueBoxerScore = blueScore;
    }

    @Override
    public String toString() {
        return "RegularRound{" +
                "roundScore='" + roundScore + '\'' +
                '}';
    }
}
