<?php
//crea una llamada a la poke api en php que te traiga un pokemon aleatorio
$pokemon = file_get_contents('https://pokeapi.co/api/v2/pokemon/' . rand(1, 898));
$pokemon = json_decode($pokemon, true);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adivina la habilidad del Pokémon</title>
</head>
<body>
    <h1>Adivina la habilidad del Pokémon</h1>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <img src="<?php echo $pokemon['sprites']['front_default']; ?>" class="card-img-top" alt="<?php echo $pokemon['name']; ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo ucfirst($pokemon['name']); ?></h5>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <h2>Adivina la habilidad de <?php echo ucfirst($pokemon['name']); ?></h2>
                <form action="index.php" method="post" class="mt-3">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="guess" placeholder="Adivina la habilidad del Pokémon">
                    </div>
                    <button type="submit" class="btn btn-primary">Adivinar</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>