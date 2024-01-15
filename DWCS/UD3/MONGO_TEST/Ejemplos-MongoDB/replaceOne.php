<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once 'util.php';


$collection = (new MongoDB\Client)->test->users;
$collection->drop();
//creamos un documento
$insertOneResult = $collection->insertOne(['name' => 'Bob', 'state' => 'ny']);


//recuperamos el oid
$bob_oid = $insertOneResult->getInsertedId();
printf(
    "Inserted  document(s)<br/>",
 
);
var_dump($bob_oid);

//reemplazamos los datos del documento creado anteriormente
$updateResult = $collection->replaceOne(
    ['name' => 'Bob'],
    ['name' => 'Robert', 'otro' => 'ca']
);

printf("Matched %d document(s)<br/>", $updateResult->getMatchedCount());
printf("Modified %d document(s)<br/>", $updateResult->getModifiedCount());
//comprobamos que han cambiado los datos name y otro, pero se mantiene el id
$document = $collection->findOne(['_id' => new MongoDB\BSON\ObjectId($bob_oid)]);
mostrar($document);