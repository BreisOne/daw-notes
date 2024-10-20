<?php
// index.php

// Consultar un Pokémon de la PokeAPI
$pokemonId = rand(1, 898); // Generar un ID aleatorio de Pokémon
$response = file_get_contents("https://pokeapi.co/api/v2/pokemon/{$pokemonId}");
$pokemon = json_decode($response, true);

// Obtener la habilidad más significativa
$ability = $pokemon['abilities'][0]['ability']['name'];

// Manejar la adivinanza (se moverá a AJAX)
$guess = '';
$message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['guess'])) {
    $guess = strtolower(trim($_POST['guess']));
    if ($guess === strtolower($pokemon['name'])) {
        $message = "¡Correcto! El Pokémon es " . ucfirst($pokemon['name']) . ".";
    } else {
        $message = "Incorrecto. Intenta de nuevo.";
    }
    echo json_encode(['message' => $message]);
    exit; // Terminar el script después de enviar la respuesta
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adivina el Pokémon</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>Adivina el Pokémon</h1>
    <p>Habilidad más significativa: <?php echo ucfirst($ability); ?></p>
    
    <form id="guessForm">
        <input type="text" name="guess" placeholder="Adivina el Pokémon" required>
        <button type="submit">Adivinar</button>
    </form>
    
    <p id="result"></p>

    <script>
        $(document).ready(function() {
            $('#guessForm').on('submit', function(e) {
                e.preventDefault(); // Evitar el envío normal del formulario
                $.ajax({
                    type: 'POST',
                    url: '', // URL del mismo archivo
                    data: $(this).serialize(),
                    dataType: 'json',
                    success: function(response) {
                        $('#result').text(response.message); // Mostrar el mensaje en el elemento con id "result"
                    }
                });
            });
        });
    </script>
</body>
</html>
