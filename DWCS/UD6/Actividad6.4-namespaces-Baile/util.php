<?php



function getNomesBailes( $baile){
    return $baile->getNome();
}

function mostrarImporte($alumno) {
    $cuotaA1 = $alumno->aPagar();
    echo "Alumno/a: " . $alumno->getNome() . " debe pagar $cuotaA1 €<br/>";
}

