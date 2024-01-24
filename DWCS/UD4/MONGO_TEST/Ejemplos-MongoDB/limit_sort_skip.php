<?php
require_once __DIR__ . '/vendor/autoload.php';

$collection = (new MongoDB\Client)->test->zips;

$cursor = $collection->find(
    [], //no se filtra por nada
    [
        'limit' => 5,
        'sort' => ['pop' => -1],
        'skip' => 3
    ]
);

foreach ($cursor as $document) {
    printf("%s: %s, %s, %d<br/>", $document['_id'], $document['city'], $document['state'], $document['pop']);
}