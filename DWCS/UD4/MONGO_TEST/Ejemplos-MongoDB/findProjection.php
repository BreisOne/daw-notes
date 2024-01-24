<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once 'util.php';
$collection_name="sample restaurants";

$collection = (new MongoDB\Client)->test->$collection_name;
//De los restaurantes que cumplan con las 2 condiciones,
//solo se seleccionan 3 columnas y el _id que si no se excluye también se aporta
//Se limita el resultado a 4 documentos
//Se ordenan descendentemente (-1) por name
$cursor = $collection->find(
    [
        'cuisine' => 'Italian',
        'borough' => 'Manhattan',
    ],
    [
        'projection' => [
            'name' => 1,
            'borough' => 1,
            'cuisine' => 1
        ],
        'limit' => 4,
        'sort' => ['name' => -1]
    ]
);

foreach($cursor as $restaurant) {
    mostrar($restaurant);
};