<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php

    const RATIO_PULGADAS_CM = 2.54;
    const RATIO_PULGADAS_PIES = 12;
    //cm
    $altura = 172;
    $pulgadas = $altura / RATIO_PULGADAS_CM;
    $pies = $pulgadas/RATIO_PULGADAS_PIES;

    echo "<p>La altura de $altura en cm es ". round($pulgadas, 2)." pulgadas y ". round($pies, 2) ." pies</p>";

    ?>
</body>

</html>