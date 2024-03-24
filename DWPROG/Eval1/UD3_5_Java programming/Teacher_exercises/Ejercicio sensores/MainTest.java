package org.example;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MainTest {

    double[] sensoresPorb1;
    double[] sensoresPorb2;

    boolean[][] patternBlack;
    boolean[][] objectBlack;
    int[][] patterColour;
    int[][] objectColour;

    int[][] patterColour2;
    int[][] objectColour2;

    @BeforeEach
    void setUp() {
        sensoresPorb1 = new double[]{23.5,18,14,2,9,70,22,55};
        sensoresPorb2 = new double[]{10.5,1,1,2,9,7.5,10.2,0.2};
        patternBlack = new boolean[][]{{true, true, true},{false, true, false}, {true, true, false}, {false, false, false}};
        objectBlack = new boolean[][]{{false, true, false},{false, true, false}, {true, true, false}, {false, true, false}};
        patterColour = new int[][]{{255,255,255},{100, 120, 150},{200, 255,200}, {240, 0, 0}};
        objectColour = new int[][]{{230,235,255},{109, 121, 155},{200, 255,200}, {241, 5, 15}};
        patterColour2 = new int[][]{{255,255,255},{100, 120, 150},{200, 255,200}, {240, 0, 0}};
        objectColour2 = new int[][]{{230,240,255},{109, 111, 151},{211, 255,200}, {240, 0, 0}};

    }

    @Test
    void getDistance() {
        assertEquals(Main.getDistance(400, 2), 400);
        assertEquals(Main.getDistance(235, 0.2), 23.5);
        assertEquals(Main.getDistance(150, 1), 75);
    }

    @Test
    void isValidCar() {
        assertFalse(Main.isValidCar(sensoresPorb1));
        assertTrue(Main.isValidCar(sensoresPorb2));
    }

    @Test
    void checkObjectWithPatternBlackAndWhite() {
        assertEquals(Main.checkObjectWithPatternBlackAndWhite(patternBlack, objectBlack), 25);
    }

    @Test
    void checkObjectWithPatternColour() {
        assertEquals(Main.checkObjectWithPatternColour(patterColour, objectColour), 25);
        assertEquals(Main.checkObjectWithPatternColour(patterColour2, objectColour2), 25);
    }
}