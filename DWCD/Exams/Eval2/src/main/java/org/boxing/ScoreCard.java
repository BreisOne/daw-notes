package org.boxing;

import java.util.ArrayList;

public class ScoreCard {
    private String color = "";
    private String redCorner ="";
    private String blueCorner = "";
    private String [] judgeScoreCard = {};
    public ArrayList<Round> rounds = new ArrayList<>();

    public ScoreCard(String Color){
        this.color = color;
    }

    public void setRedCorner(String boxerName) {
        this.redCorner = boxerName;
    }

    public void setBlueCorner(String boxerName) {
        this.blueCorner = boxerName;
    }

    public void loadJudgeScoreCard (String [] judgeScoreCard){
        this.judgeScoreCard = judgeScoreCard;
    }

    public byte getNumRounds(){
        return 0;
    }
    public int getRedBoxerFinalScore(){
        return 0;
    }
    public int getBlueBoxerFinalScore(){
        return 0;
    }
    @Override
    public String toString() {
        return "ScoreCard{" +
                "color='" + color + '\'' +
                ", redCorner='" + redCorner + '\'' +
                ", blueCorner='" + blueCorner + '\'' +
                ", judgeScoreCard='" + judgeScoreCard + '\'' +
                '}';
    }
    private String viewRounds(){
        return "";
    }
}
