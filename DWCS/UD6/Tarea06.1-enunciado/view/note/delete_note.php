<div class="row">
    <?php
    if (isset($dataToView["data"])) {
        $exito = $dataToView["data"];
    }
    if (isset($exito) && ($exito===true)):
        ?>

        <div class="alert alert-success">
            Nota eliminada correctamente. <a href="FrontController.php?controller=nota&action=list">Volver al listado</a>
        </div>
        <?php
    else:
        ?>
        <div class="alert alert-danger">
            Ha ocurrido algún problema y no se ha podido eliminar la nota. <a href="FrontController.php?controller=nota&action=list">Volver al listado</a>
        </div>
    <?php endif;
    ?>
</div>