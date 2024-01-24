<?php
function showFilesInfo($filesKey) {
    echo "<ol>";
    foreach ($_FILES[$filesKey] as $paramName => $paramArray) {
        if (is_array($paramArray)) {
            echo "<li>$paramName:</li><ul>";
            foreach ($paramArray as $index => $value) {
                echo "<li>[$index] => $value</li>";
            }
            echo "</ul>";
        } else {
            echo "<li>$paramName => $paramArray</li>";
        }
    }
    echo "</ol>";
}
?>
