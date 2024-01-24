<!DOCTYPE html>
<html lang="es" data-bs-theme="dark">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <title>Crear libro</title>
</head>

<body >
    <?php
    require_once 'conexion.php';
    require_once 'util.php';

    $pdate = null;
    $isbn = null;
    $pub_Id = null;
    //todos los autores disponibles en BD
    $authors = null;
    //los ids de los autores del libro
    $book_author_ids = null;
    $title = "";
    $exito = true;

    

        $publishers = findAllPublishers();
        $authors = findAllAuthors();

        if (isset($_POST["title"])) {
            if (isNotEmpty($_POST["title"])) {
                $title = $_POST["title"];
            }

            if (isset($_POST["isbn"]) &&  isNotEmpty($_POST["isbn"])) {
                $isbn = $_POST["isbn"];
            }

            if (isset($_POST["pdate"]) &&  isNotEmpty($_POST["pdate"])) {
                $pdate = $_POST["pdate"];
                // $pdate_converted = DateTimeImmutable::createFromFormat("Y-m-d", $pdate);
                // if ($pdate_converted !== false) {
                //     $pdate = $pdate_converted;
                // }
            }

            if (isset($_POST["publisher"]) &&  isNotEmpty($_POST["publisher"])) {
                $pub_Id = $_POST["publisher"];
            }
            if (isset($_POST["author_ids"])) {
                $book_author_ids = $_POST["author_ids"];
            }

            if (isset($_POST["title"]) &&  isNotEmpty($_POST["publisher"])) {
            createNewBook($title, $isbn, $pdate, $pub_Id, $book_author_ids);
            }


           
        }
    
    ?>
    <div class="container-fluid">
        <header class="mb-5">
            <div class="p-5 text-center " style="margin-top: 58px;">
                <h1 class="mb-3"> Crear libro </h1>

            </div>
        </header>
        <form class='form-control ' method="post" >
            <div>
                <label for="title" class="form-label col-3">Título</label>
                <input name="title" type="text" class="form-control col-9" id="title" pattern="^(?!\s*$).+" required />
            </div>
            <div>
                <label for="isbn" class="form-label col-3">ISBN</label>
                <input name="isbn" type="text" class="form-control col-9" id="isbn" pattern="^(?!\s*$).+" />
            </div>

            <div>
                <label for="pdate" class="form-label col-3">Fecha de publicación</label>
                <input name="pdate" type="date" class="form-control col-9" id="pdate" />
            </div>

            <div class='row form-group my-3'>
                <label for="publisher" class="col-form-label col-2">Editorial</label>
                <div class='col-6'>
                    <select name="publisher" id="publisher" class="form-control col-3" required>

                        <option value="" disabled>----</option>
                        <?php
                        if (count($publishers) > 0) :
                            foreach ($publishers as $publisher):
                        ?>
                                <option value="<?= $publisher["publisher_id"] ?>"><?= $publisher["name"] ?></option>
                        <?php
                            endforeach;
                        endif;
                        ?>


                    </select>
                </div>
            </div>

            <div class="form-group row my-3">
                <label for="authors" class="col-form-label col-2">Autor</label>

                <div class="col-6">
                    <select name="author_ids[]" id="authors" class="form-control" multiple>

                        <option value="">----</option>
                        <?php
                            if (count($authors) > 0) :
                                foreach ($authors as $author) :
                            ?>
                                    <option value="<?= $author["author_id"] ?>"><?= $author["full_name"]?></option>
                            <?php
                                endforeach;
                            endif;
                            ?>

                    </select>
                </div>


            </div>
            <div class="row d-flex justify-content-center">
                <button type="submit" class="btn btn-primary my-3 col-3">Crear libro</button>
            </div>

        </form>
        <a href="listado.php" class="btn btn-link mt-2">Volver</a>

        <?php if (($exito) && isset($_POST["title"])) : ?>
            <div class="alert alert-success" role="alert">
                El libro se ha creado correctamente
            </div>

        <?php endif;

        
        /**
         * findAllPublishers
         * Crea una consulta con PDO y obtiene todos los datos de la tabla publishers
         * @return array Array con todas las tuplas de la tabla publishers como array asociativo
         */
        function findAllPublishers(): array
        {
            $conProyecto = getConnection();

            $pdostmt = $conProyecto->prepare("SELECT *FROM publishers ORDER BY name");

            $pdostmt->execute();
            $array = $pdostmt->fetchAll(PDO::FETCH_ASSOC);

          
            return $array;
        }

        /**
         * Summary of findAllAuthors
         * @return array
         */
        function findAllAuthors(): array
        {
            //completar
            $conProyecto = getConnection();
            $pdostmt = $conProyecto->prepare("SELECT author_id, TRIM(Concat(coalesce(first_name, ' ') , coalesce(middle_name, ' '), coalesce(last_name, ' '))) as full_name FROM authors ORDER BY last_name");

            $pdostmt->execute();
            $array = $pdostmt->fetchAll(PDO::FETCH_ASSOC);

            return $array;
        }

        /**
         * Summary of createNewBook
         * @param mixed $title
         * @param mixed $isbn
         * @param mixed $pdate
         * @param mixed $pub_Id
         * @param mixed $book_author_ids
         * @return bool
         */
        function createNewBook($title, $isbn, $pdate, $pub_Id, $book_author_ids):bool{

            $exito = false;

                try {
                    //completar
                    $conProyecto = getConnection();
                    $conProyecto -> beginTransaction();

                    $insertBook = "INSERT INTO books (title, isbn, published_date, publisher_id) VALUES (:title, :isbn, :pdate, :publisher)";
                    
                    $stmt = $conProyecto->prepare($insertBook);

                    $stmt ->bindParam(":title", $title, PDO::PARAM_STR);
                    $stmt ->bindParam(":isbn", $isbn, PDO::PARAM_STR);
                    $stmt ->bindParam(":pdate", $pdate, PDO::PARAM_STR);
                    $stmt ->bindParam(":publisher", $pub_Id, PDO::PARAM_STR);

                   $exito = $stmt-> execute();

                   if($book_author_ids!=null||$book_author_ids!=""){

                    $pdostmt = $conProyecto->prepare("SELECT MAX(book_id) as ultimo_id FROM books");

                    $pdostmt->execute();

                    $lastId = $pdostmt->fetch(PDO::FETCH_ASSOC);

                        for ($i=0; $i < count($book_author_ids); $i++) { 
                            
                            $insertAuthor = "INSERT INTO book_authors (book_id, author_id) VALUES (:book_id, :author_id)";
                            
                            $stmt = $conProyecto->prepare($insertAuthor);

                            $stmt ->bindParam(":book_id", $lastId['ultimo_id'], PDO::PARAM_STR);
                            $stmt ->bindParam(":author_id", $book_author_ids[$i], PDO::PARAM_STR);
                            $exito = $stmt-> execute();
                        }
                    }

                    if ($exito) {
                        $conProyecto->commit();
                    }else{
                        $conProyecto->rollback();
                        $exito = false;
                        echo "El libro no se ha creado";
                    }

                } catch (PDOException $e) {
                    $conProyecto -> rollBack();
                    $exito = false;
                    echo "Ocurrio un error al crear el libro";
                
                }

                return $exito;

            }     

        ?>




    </div>
</body>

</html>