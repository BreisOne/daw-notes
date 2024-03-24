package org.instituto;

public class CustomException extends Exception{
    static final int NAME_CODE = 1;
    static final int DNI_CODE = 2;
    static final int AGE_CODE = 3;
    static final int SALARY_CODE = 4;
    static final int DATE_CODE = 5;
    static final int JORNADA_CODE = 6;
    static final int MATRICULA_CODE = 7;


    private String mError;

    public CustomException(int code){
        switch (code){
            case 1:
                 mError = "El nombre está mal formateado";
                break;
            case 2:
                 mError = "El dni está mal formateado";
                break;
            case 3:
                 mError = "La edad tiene un formato incorrecto";
                break;
            case 4:
                 mError = "El salario no es correcto";
                break;
            case 5:
                mError = "La fecha no es correcta";
                break;
            case 6:
                mError = "La jornada no es correcta";
                break;
            case 7:
                mError = "El importe de la matricula no es correcta";
                break;

        }
    }

    public String getmError() {
        return mError;
    }
}
