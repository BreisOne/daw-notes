<?php
function mostrar($document)
{
    if ($document == null) {
        var_dump($document);
    }
    echo "<pre>";
    print_r($document);
    echo "<pre>";
}