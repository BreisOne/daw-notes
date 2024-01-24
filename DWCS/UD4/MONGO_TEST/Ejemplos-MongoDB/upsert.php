<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once 'util.php';


$collection = (new MongoDB\Client)->test->users;
$collection->drop();

$updateResult = $collection->updateOne(
    ['name' => 'Bob'],
    ['$set' => ['state' => 'ny']],
    ['upsert' => true]
);

printf("Matched %d document(s)<br/>", $updateResult->getMatchedCount());
printf("Modified %d document(s)<br/>", $updateResult->getModifiedCount());
printf("Upserted %d document(s)<br/>", $updateResult->getUpsertedCount());

//The ID (i.e. _id field value) of the upserted document. If no document was upserted, null will be returned.
$oid = $updateResult->getUpsertedId();
$upsertedDocument = $collection->findOne([
    '_id' =>$oid,
]);

mostrar($upsertedDocument);