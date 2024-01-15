<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once 'util.php';



$collection = (new MongoDB\Client)->test->zips;

//Devuelve el primer documento que encaje con el filtro o null en otro caso.
$document_zip = $collection->findOne(["zip" => '94301']);
$document = $collection->findOne(['_id' => new MongoDB\BSON\ObjectId('5c8eccc1caa187d17ca6ed16')]);
//Esto no funcionaría:
$document2 = $collection->findOne(['_id' =>  '5c8eccc1caa187d17ca6ed16']);


mostrar($document_zip);
mostrar($document);
mostrar($document2);
