<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title id="headTitle">Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</head>

<body>

    <section class="container-fluid" id="spa">
        <header class="mb-5">
            <div class="p-5 text-center bg-light" style="margin-top: 58px;">
                <h1 class="mb-3" id="pageTitle">Login</h1>
            </div>

            <div class="d-flex  justify-content-end  align-items-center d-none" id="userHeader">
                <div class="d-flex mx-2 align-items-center justify-content-end">
                    <p class="lead">¡Hola <span class='d-none' id='email_header'></span>!</p>
                </div>

                <form method="post" class="d-flex mx-2 align-items-center justify-content-start">
                    <input type="submit" class="btn btn-primary btn-block" value="Cerrar sesión" name="btnCerrar"
                        id="btnCerrar"></button>
                </form>
            </div>
        </header>



        <section id="login" class="row justify-content-center">

            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-6">
                    <form method="post" id="formLogin">
                        <!-- Email input -->
                        <div class="form-group mb-4 ">
                            <label class="form-label" for="email">Email address</label>
                            <input type="email" id="email" class="form-control" name="email" required />

                        </div>

                        <!-- Current Password input -->
                        <div class="form-group mb-4">
                            <label class="form-label" for="pwd">Contraseña actual</label>
                            <input type="password" id="pwd" class="form-control" name="pwd" required />

                        </div>

                        <div class="form-group mb-4">
                            <label class="form-label" for="rol">Seleccione el rol:</label>

                            <select name="rol" id="rol" required>

                            </select>
                        </div>

                        <div class="form-group mb-4 alert alert-danger d-none" id="errorLogin" role="alert">
                        </div>
                        <!-- Submit button -->
                        <input type="submit" class="btn btn-primary btn-block mb-4" value="Iniciar sesión">

                    </form>

                </div>
            </div>
        </section>


        <!-- d-none => display:none  https://getbootstrap.com/docs/5.3/utilities/display/ -->
        <main id="main" class="d-none">
            <!-- Aquí la vista particular -->
            <h2>Esto es el main</h2>

        </main>


        <!-- Modal -->
        <div class="modal fade" id="spa_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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



    </section>

    <script src="../js/global.js" type="text/javascript"></script>
    <script src="../js/modal.js" type="text/javascript"></script>
    <script src="../js/cargarDatos.js" type="text/javascript"></script>
    <script src="../js/manejarSesion.js" type="text/javascript"></script>
    </script>
</body>

</html>