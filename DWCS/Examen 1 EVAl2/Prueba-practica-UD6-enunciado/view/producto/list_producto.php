<div class="row">
    <?php if (isset($_SESSION["error"])) {

        if ($_SESSION["error"] === true) {
            ?>
            <div class="alert alert-danger" role="alert">
                Hubo un error y no se ha podido eliminar el producto
            </div>
            <?php
        } else { ?>
            <div class="alert alert-success" role="alert">
                Se ha eliminado el producto con éxito.
            </div>
        <?php }

        unset($_SESSION["error"]);
    } ?>



    <?php if (count($dataToView["data"]) > 0): ?>

        <table class="table">
            <thead>
                <tr>

                    <th scope="col">Nombre</th>
                    <th scope="col">PVP</th>
                    <th scope="col">Familia</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($dataToView["data"] as $producto) { ?>
                    <tr>
                        <td>
                            <?= $producto->getNombre() ?>
                        </td>
                        <td>
                            <?= $producto->getPvp(); ?>
                        </td>
                        <td>
                            <?= $producto->getFamilia();

                            ?>
                        </td>
                        <td>
                            <form action="FrontController.php?controller=Producto&action=delete" method="POST">
                                <input type="hidden" name="id" value="<?= $producto->getId() ?>">
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                        </td>
                        </form>
                    </tr>
                    <?php
                }
                ?>
            </tbody>
        </table>
    <?php endif;

    if (count($dataToView["data"]) === 0): ?>

        <div class="alert alert-info">
            Actualmente no existen productos.
        </div>
        <?php
    endif;
    ?>
</div>