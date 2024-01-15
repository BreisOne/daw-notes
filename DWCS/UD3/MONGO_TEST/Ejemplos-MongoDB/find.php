<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once 'util.php';

$collection = (new MongoDB\Client)->test->zips;

//Se filtran los documentos de la colección zips que tengan city y state con esos valores
//Equivaldría a un select * from zips where esas condiciones con and
$cursor = $collection->find(['city' => 'JERSEY CITY', 'state' => 'NJ']);

foreach ($cursor as $document) {
    //Podemos acceder a cada campo individualmente como si fuera un array asociativo
    echo $document['_id'] . ", " . $document['city'] . ", " . $document['state'] . "<br/>";
    //Por defecto devuelve todos los campos
    mostrar($document);
}

echo "Documentos sin _id: ----------";

//Para que no devuelva un campo se puede usar la opción projection
$cursor_sin_id = $collection->find(
    ['city' => 'JERSEY CITY', 'state' => 'NJ'],
    ['projection' => ['_id' => 0]]
);

foreach ($cursor_sin_id as $document) {
    mostrar($document);
   

}