<?php
/**
 * Summary of checkUser
 * Comprobación 1
 */
function checkUser($email, $usuarios, $errors){
    
    foreach ($usuarios as $usuario => $pwds) {
        if ($usuario == $email) {
            $userExist = true;
        }
    }

    if (!$userExist) {
        array_push($errors, USER_DOES_NOT_EXIST);
    }
    return $errors;
}
/**
 * Summary of checkPwd
 * Comprobación 2
 */
function checkPwd($currrentPwd, $email, $usuarios, $errors){
    if ($usuarios[$email]["pwd"] != $currrentPwd) {
        array_push($errors, PWD_INCORRECT);
    }
    return $errors;

}
/**
 * Summary of samePwd
 * Comprobación 3
 */
 function pwd1Equalpwd2($newPwd1, $newPwd2, $errors){
    if ($newPwd1 != $newPwd2) {

        array_push($errors, PWD_MISMATCH);
    }
    return $errors;
}
/**
 * Summary of samePwd
 * Comprobación 4
 */
function minimunLength($newPwd1, $errors){
    if (count_chars($newPwd1) < MIN_LENGH) {

        array_push($errors, MIN_LENGTH_ERROR);
    }
    return $errors;

}
/**
 * Summary of pwdUsed
 * Comprobación 5
 */
function pwdUsed($newPwd1, $usuarios, $email, $errors){
    if ($newPwd1 == $usuarios[$email]["pwd-1"] || $newPwd1== $usuarios[$email]["pwd-2"]) {
        array_push($errors, PWD_USED);
    }
    return $errors;
}

/**
 * Summary of pwdContainsUpperCase
 * Comprobación 6
 */
 function containsUpperCase($newPwd1, $errors){
    if (ctype_upper($newPwd1)) {
        array_push($errors, UPPER_CASE_NEEDED);
    }
    return $errors;

 }
/**
 * Summary of containsNumber
 * Comprobación 7
 */
function containsNumber($numeros, $newPwd1, $containsNumbers, $errors){
    foreach ($numeros as $numero) {
        if (str_contains($newPwd1, $numero)) {
            $containsNumbers = true;
        }
    }

    if (!$containsNumbers) {
        array_push($errors, NUMBER_NEEDED);
    }

    return $errors;
}
/**
 * Summary of containsSymbols
 * Comprobación 8
 */
function containsSymbols($simbolos, $newPwd1, $containsSymbol, $errors){
    foreach ($simbolos as $simbolo) {
        if (str_contains($newPwd1, $simbolo)) {
            $containsSymbol = true;
        }
    }

    if (!$containsSymbol) {
        array_push($errors, SYMBOL_NEEDED);
    }

    return $errors;

}
?>