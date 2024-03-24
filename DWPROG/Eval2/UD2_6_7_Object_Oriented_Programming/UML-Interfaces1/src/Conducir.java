public interface Conducir{
    //Por defecto las interfaces solo adminten constantes por lo que ya se declaran como public static final no es necesario añadirlo
     int velocidadMaxima = 120;

    //Por defecto los metodos son siempre publicos en las interfaces, no es necesario declararlos
    void  acelerar(int velocidad);
    void frenar(int velocidad);

}
