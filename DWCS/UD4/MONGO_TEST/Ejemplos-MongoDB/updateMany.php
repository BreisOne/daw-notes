<?php
require_once __DIR__ . '/vendor/autoload.php';





$collection = (new MongoDB\Client)->test->users;
$collection->drop();

$collection->insertOne(['name' => 'Bob', 'state' => 'ny', 'country' => 'us']);
$collection->insertOne(['name' => 'Alice', 'state' => 'ny']);
$collection->insertOne(['name' => 'Sam', 'state' => 'ny']);
$updateResult = $collection->updateMany(
    ['state' => 'ny'],
    ['$set' => ['country' => 'us']]
);

//Si una operación de actualización/reemplazo no produce ningún cambio en el documento (por ejemplo, establece el valor de un campo en su valor actual), el valor devuelto por getMatchedCount() puede ser mayor que el valor devuelto por getModifiedCount().
printf("Matched %d document(s)<br/>", $updateResult->getMatchedCount());
printf("Modified %d document(s)<br/>", $updateResult->getModifiedCount());