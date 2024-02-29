public class CustomException extends Exception{
    static final int NAME_CODE = 1;
    static final int DNI_CODE = 2;
    static final int AGE_CODE = 3;
    static final int SALARY_CODE = 4;

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
                 mError = "El salario no es correct0";
                break;
        }
    }

    public String getmError() {
        return mError;
    }
}
