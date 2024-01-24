<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Zodiaco</title>
    </head>
    <body>

        <?php
        const CAPRICORNIO = "Capricornio";
        const ACUARIO = "Acuario";
        const PISCIS = "Piscis";
        const ARIES = "Aries";
        const TAURO = "Tauro";
        const GEMINIS = "Géminis";
        const CANCER = "Cáncer";
        const LEO = "Leo";
        const VIRGO = "Virgo";
        const LIBRA = "Libra";
        const ESCORPIO = "Escorpio";
        const SAGITARIO = "Sagitario";

        const MIN_DIA = 1;
        const MAX_DIA = 31;

        //Las claves del día de corte van incluídas. Por ejemplo: los nacidos hasta el 20/01 son capricornio
        $zodiaco = array(
            //enero  
            1 => array(20 => CAPRICORNIO,
                "else" => ACUARIO),
            //febrero
            2 => array(19 => ACUARIO,
                "else" => PISCIS),
            //marzo
            3 => array(20 => PISCIS,
                "else" => ARIES),
            //abril
            4 => array(19 => ARIES,
                "else" => TAURO),
            //mayo
            5 => array(20 => TAURO,
                "else" => GEMINIS),
            //junio
            6 => array(20 => GEMINIS,
                "else" => CANCER),
            //julio
            7 => array(22 => CANCER,
                "else" => LEO),
            //agosto
            8 => array(22 => LEO,
                "else" => VIRGO),
            //septiembre
            9 => array(22 => VIRGO,
                "else" => LIBRA),
            //octubre
            10 => array(22 => LIBRA,
                "else" => ESCORPIO),
            //noviembre
            11 => array(22 => ESCORPIO,
                "else" => SAGITARIO),
            //diciembre
            12 => array(22 => SAGITARIO,
                "else" => CAPRICORNIO),
                //completar aquí...
        );

        $meses = array(
            //enero  
            1 => "enero",
            //febrero
            2 => "febrero",
            //marzo
            3 => "marzo",
            //abril
            4 =>"abril",
            //mayo
            5 => "mayo",
            //junio
            6 => "junio",
            //julio
            7 => "julio",
            //agosto
            8 => "agosto",
            //septiembre
            9 => "septiembre",
            //octubre
            10 =>"octubre",
            //noviembre
            11 => "noviembre",
            //diciembre
            12 => "diciembre",
                //completar aquí...
        );

        if (isset($_POST["dia"]) && isset($_POST["mes"])) {
            $dia = $_POST["dia"];
            $mes = $_POST["mes"];
        }
        ?>

        <form  method="post" >

            Selecciona tu día y mes de nacimiento:

            <p>
                <label for="dia">Día:</label>
                <select name="dia" id="dia" required>
                    <?php
                        for ($i=MIN_DIA; $i <=MAX_DIA ; $i++) {
                            $selected = (isset($_POST["dia"]) && $i==$dia) ? "selected":"";
                            echo "<option value='$i' $selected>$i</option>";
                            
                            
                            /*    if (isset($_POST["dia"]) && $i==$dia) {
                                echo "<option value='$i' selected>$i</option>";
                            } else {
                                echo "<option value='$i'>$i</option>";
                            } */
                        };
                        ?>
                </select>
                
                <label for="mes">Mes</label>
                <select name="mes" id="mes" required>
                    
                <?php
                foreach ($meses as $key => $value) {
                    $selected = (isset($_POST["mes"]) && $key==$mes) ? "selected":"";
                    echo "<option value='$key' $selected>$value</option>";
                    
                    /* if (isset($_POST["mes"]) && $key == $mes) {
                        echo "<option value='$key' selected>$value</option>";
                    } else {
                        echo "<option value='$key'>$value</option>";
                    } */
                };  
                ?>
                </select>
            </p>
            <p>
                <input type="submit" value="Enviar" />
            </p>

        </form>

        <?php
        if (isset($_POST["dia"]) && isset($_POST["mes"])) {
           
            echo "Día: $dia, mes : $mes";

            $array_mes = $zodiaco[$mes];

            echo "<pre>";
            print_r($array_mes);
            echo "</pre>";
            
           foreach ($zodiaco as $key => $value) {
                if ($mes == $key) {
                    foreach ($value as $i => $value2) {
                        if ($dia <= $i) {
                            echo " <p> Eres $value2 </p>";
                            break;
                        }
                    } 
                }
            }

            foreach ($array_mes as $key => $value) {
                if ($dia <= $key) {
                    echo " <p> Eres $value </p>";
                    break;
                    }  
            }

            if ($dia <= array_key_first($array_mes)) {
                echo "Eres del signo: " . reset($array_mes);
            }else{
                echo "Eres: " . $array_mes["else"];
            }

        }
        ?>
       





    </body>
</html>