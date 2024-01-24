<?php
/**
 * Summary of checkUser
 * Comprobación 1
 */

function checkUser(String $email, array $usuarios):bool{
    
    return  array_key_exists($email, $usuarios);
}
/**
 * Summary of checkPwd
 * Comprobación 2
 */
function checkPwd(String $currrentPwd, String $email, array $usuarios):bool{

    return $usuarios[$email]["pwd"] == $currrentPwd;
        
}
/**
 * Summary of samePwd
 * Comprobación 3
 */
 function pwd1Equalpwd2(String $newPwd1, String $newPwd2):bool{

    return $newPwd1 == $newPwd2;
}
/**
 * Summary of samePwd
 * Comprobación 4
 */
function minimunLength(String $newPwd1):bool{
    
    return strlen($newPwd1) >= MIN_LENGH;
}
/**
 * Summary of pwdUsed
 * Comprobación 5
 */
function pwdUsed(String $newPwd1, array $usuarios, String $email){

    return $newPwd1 != $usuarios[$email]["pwd-1"] || $newPwd1 != $usuarios[$email]["pwd-2"];

}

/**
 * Summary of pwdContainsUpperCase
 * Comprobación 6
 */
 function containsUpperCase(String $newPwd1):bool{

    return preg_match('/[A-Z]/', $newPwd1);

 }
/**
 * Summary of containsNumber
 * Comprobación 7
 */
function containsNumber(array $numeros, String $newPwd1):bool{

    return preg_match('/[0-9]/', $newPwd1);

}
/**
 * Summary of containsSymbols
 * Comprobación 8
 */
function containsSymbols(array $simbolos, String $newPwd1):bool{
    
    return preg_match('/[\.?@]/', $newPwd1);

}
?>