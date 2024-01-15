<?php

const CERO = 0;
$a=22;

$b= $a + "1.3€";
echo "\$b es : $b <br/>";


$GLOBALS["b"]=4;
echo 'Valor de \$GLOBALS["b"] es '. $GLOBALS["b"];

$c=$b/CERO;




