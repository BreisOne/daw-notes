package org.boxing;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class RegularRoundTest {

    @Test // este para el alumnado
    public void boxerRoundScoreToIntTest() {
      RegularRound round = new RegularRound("10 - 9");
        round.boxerRoundScore();
        assertEquals(10, round.getredBoxerScore());
        assertEquals(9, round.getblueBoxerScore());
    }
}
