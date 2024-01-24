<?php
require_once __DIR__ . '/vendor/autoload.php';



$collection = (new MongoDB\Client)->test->users;
$collection->drop();
//
$collection->insertOne(['name' => 'Bob', 'state' => 'ny']);
$collection->insertOne(['name' => 'Alice', 'state' => 'ny']);
$updateResult = $collection->updateOne(
    ['state' => 'ny'],
    ['$set' => ['country' => 'us']]
);
//aunque los dos cumplen la condición, getMatchedCount devuelve solo un único valor.
//Estp esa así porque se usa updateOne
printf("Matched %d document(s)<br/>", $updateResult->getMatchedCount());
printf("Modified %d document(s)<br/>", $updateResult->getModifiedCount());

