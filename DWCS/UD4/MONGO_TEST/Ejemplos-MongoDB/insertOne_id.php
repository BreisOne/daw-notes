<?php
require_once __DIR__ . '/vendor/autoload.php';

$collection = (new MongoDB\Client)->test->users;

//Si no se indica _id, se le asigna uno
$insertOneResult = $collection->insertOne([
    'username' => 'admin',
    'email' => 'admin@example.com',
    'name' => 'Admin User',
]);

printf("Inserted %d document(s)\n", $insertOneResult->getInsertedCount());

var_dump($insertOneResult->getInsertedId());