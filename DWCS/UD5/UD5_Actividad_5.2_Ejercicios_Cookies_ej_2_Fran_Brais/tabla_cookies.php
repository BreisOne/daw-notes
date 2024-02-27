<?php


function table_cookies()
{
    echo "<h2>Cookies creadas</h2>";

    echo '<table class="table table-striped">';
    echo "<thead>";
    echo "<tr>";
    echo "<th scope=\"col\">Cookie name</th>";
    echo "<th scope=\"col\">Cookie Cookie value</th>";
    echo "</tr>";

    foreach ($_COOKIE as $key => $value) {

        echo "<tr>";
        echo "<td>$key</td>";
        echo "<td>$value</td>";
        echo "</tr>";
    }
    echo "</table>";
}
