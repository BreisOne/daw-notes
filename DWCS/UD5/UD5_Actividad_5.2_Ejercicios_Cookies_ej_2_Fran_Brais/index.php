<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    <section class="container-sm">
    <h1>Introduzca datos para crear una cookie</h1>
    <form method="post">
        <div class="form-group">
        <label for="cookie_name">Cookie name</label>
        <input type="text" class="form-control" name ="cookie_name" id="cookie_name" placeholder="Enter a cookie name" required>
        </div>
        <div class="form-group">
        <label for="cookie_value">Cookie value</label>
        <input type="text" class="form-control" name ="cookie_value"id="cookie_value" placeholder="Cookie value" required>
        </div>
        <div class="form-group">
        <label for="cookie_value">Cookie expiration seconds</label>
        <input type="number" class="form-control" name ="cookie_expiration"id="cookie_expiration">
        </div>

        <button type="submit" class="btn btn-primary mt-3">Submit</button>
        
    </form>
    </section>
    <?php 
    require_once 'cookies.php';
    require_once 'tabla_cookies.php';

    if(isset($_POST['cookie_name'])&&isset($_POST['cookie_value'])){
        setearCookies($_POST);
        header('Location: index.php');
    }
    if(count($_COOKIE) > 0){
        table_cookies();
    }




    ?>
</body>
</html>