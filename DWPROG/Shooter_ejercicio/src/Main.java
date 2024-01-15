public class Main {
    public static void main(String[] args) {

        System.out.println("Hello world!");
    }

    public static int getDamage(int speed, int armor, int distance) {
        int Damage = 0;

        if (distance <= 3) {
            Damage = speed / 10;
        } else if (speed > 500 && distance < 20) {
            Damage = speed / 10;
        } else if (speed > 500 && distance > 20) {
            Damage = ((speed / 10) - armor);
        } else {
            Damage = ((speed / 10) - (armor + (distance / 10)));
        }

        if (Damage < 0) {
            Damage = 0;
        }
        return Damage;

    }

    public static boolean isDeadByBodyShot(int life, int damage) {
        life = life - damage;
        return life <= 0;
    }

    public static int getNumObjects(boolean[][] map) {
        int contObjects = 0;
        int cols = map[0].length;
        int rows = map.length;

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (map[i][j] == true) {
                    contObjects++;
                }
            }
        }
        return contObjects;
    }

    public static boolean isHit(boolean[][] screen, int y, int x) {
        return screen[y][x];
    }

    public static boolean isHeadShot(boolean[][] screen, int y, int x) {

        if (y == 0) {
            return (screen[y][x] == true && screen[y][x - 1] == true && screen[y][x + 1] == true);
        } else {
            return (screen[y][x] == true && screen[y - 1][x] == false
                    && screen[y][x - 1] == true && screen[y][x + 1] == true);
        }

    }

    public static int[] getEnemyPosition(boolean[][] screen) {
        int cols = screen[0].length;
        int rows = screen.length;
        int[] position = {0, 0};

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (screen[i][j] == true) {
                    position[0] = i + 2;
                    position[1] = j + 1;
                    return position;
                }
            }
        }
        return position;
    }
}