<?php

$valor = getenv("Path");
echo "$valor";

foreach($_ENV as $clave => $valor){
    echo "$clave => $valor<br/>";

}