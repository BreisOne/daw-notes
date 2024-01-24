<?php
require_once __DIR__ . '/vendor/autoload.php';

$collection = (new MongoDB\Client)->test->users;

//inserción con _id
//si se ejecuta más de una vez, se lanzará una excepción
// Uncaught MongoDB\Driver\Exception\BulkWriteException: E11000 duplicate key error collection: test.users index: _id_ dup key: { _id: 1 }
$insertOneResult = $collection->insertOne(
        ['_id' => 1, 
            'name' => 'Alice']);

printf("Inserted %d document(s)\n",
        $insertOneResult->getInsertedCount());

var_dump($insertOneResult->getInsertedId());