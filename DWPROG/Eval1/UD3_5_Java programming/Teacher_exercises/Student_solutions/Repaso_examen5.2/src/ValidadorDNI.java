public class ValidadorDNI {

    public ValidadorDNI() {
    }

    public boolean validar(String dni){
        char[] dni_array = new char[dni.length()];
        boolean[] validaciones_array = new boolean[dni.length()];
        if ((dni == "00000000T") || (dni == "00000001R") || (dni == "99999999R") || (dni.length() != 9)){

            return false;
        }else{
            for (int i = 0; i < dni.length(); i++) {

                dni_array[i] = dni.charAt(i);
                validaciones_array[i] = Character.isDigit(dni_array[i]);
            }
            for (int i = 0; i < dni.length()-1; i++) {
                if (!Character.isDigit(dni_array[i])){
                    return false;
                }
            }
            if(Character.isDigit(dni_array[8])){
                return false;
            }else{
                return true;
            }
        }

    }

}