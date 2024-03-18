<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prueba práctica UD/</title>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script> -->

    <link rel="stylesheet" href="css/bootstrap.min.css">        
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container-fluid">
        <h1>Prueba práctica UD7</h1>

        <section id="notas-section">
            <h2>Listado de notas</h2>
            <div id="notas">
            </div>

           

            <!-- loading spinner -->

            <div class="d-flex flex-column justify-content-center" id="loading-div">
                <div class="spinner-grow text-primary align-self-center" role="status" role="status"></div>
                <div class="align-self-center">
                    <strong>Cargando notas...</strong>
                </div>
            </div>


            <button type="button" id="btnCrearNota" class="btn btn-primary">Crear nota</button>

        </section>

        <section id="crear-section" class="d-none">
            <h2>Crear nota</h1>

                <!-- formulario de creación de nota -->
                <form id="crearForm">
                    <div class="form-group">
                        <label for="title">Título</label>
                        <input class="form-control" id="title" placeholder="Title" required>

                    </div>
                    <button type="submit" class="btn btn-secondary mt-3">Crear</button>
                </form>




        </section>


        <!-- mensaje de info/error/éxito -->
        <div class="alert alert-info d-none mt-3" role="alert" id="div-msg">
        </div>


        <!-- Modal -->
        <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modal_title">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id='modal_msg'>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                            id='opt_cancel'>Cancelar</button>
                        <button type="button" class="btn btn-primary" id='opt_ok'>Aceptar</button>
                    </div>
                </div>
            </div>
        </div>



        <script src="js/global.js" type="text/javascript"></script>
        <script src="js/index.js" type="text/javascript"></script>
        <script src="js/crear.js" type="text/javascript"></script>
        <script src="js/modal.js" type="text/javascript"></script>







    </div>
</body>

</html>