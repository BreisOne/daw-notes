<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    $a = 3;
    $b = -5;
    $c = 1;

    $d = $b ** 2 - 4 * $a * $c;

    $aa = 2 * $a;

    if ($d >= 0) {
        $dd = sqrt($d);
        $x1 = (-$b + $dd) / $aa;
        $x2 = (-$b - $dd) / $aa;

        echo "<p>La ecuación tiene raíces reales: ". round($x1, 2). " y ". round($x2, 2) ."<p/>";
        printf("<p>La ecuación tiene raíces reales:  %.2f y %.2f",  $x1, $x2 );
    } else {
        $dd = sqrt(-$d);
        $re = -$b / $aa;
        $im = $dd / $aa; //A2 = 2*a = $aa

        echo "<p>La ecuación tiene raíces complejas conjugadas</p>";
        echo "<p>Parte real: $re</p>";
        echo "<p>Parte imaginaria: " . round($im, 2) . "</p>";
        //Para mostrar un float con 2 decimales
        printf("<p> Parte imaginaria: %.2f </p>", $im);
    }
    ?>


</body>

</html>