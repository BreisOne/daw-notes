<?php
$id = $title = $contenido = $img = "";
if (isset($dataToView["data"])) {
    $nota = $dataToView["data"];

    if ($nota->getId() !== null) {
        $id = $nota->getId();
    }
    if ($nota->getTitulo() !== null) {
        $titulo = $nota->getTitulo();
    }
    if ($nota->getContenido() !== null) {
        $contenido = $nota->getContenido();
    }

    if ($nota->getImagePath() !== "") {
        $img = $nota->relativePathToView($nota->getImagePath());
    }
}
?>
<div class="row">
    <!--Solo se establece un campo "error" si se ha realizado un (save) exitoso o no-->
    <?php
    if (isset($nota) && ($nota->getStatus() === Util::OPERATION_OK )):
        ?>
        <div class="alert alert-success">
            Operación realizada correctamente. <a href="FrontController.php?controller=nota&action=list">Volver al listado</a>
        </div>
        <?php
    elseif (isset($nota) && ($nota->getStatus() === Util::OPERATION_NOK )):
        ?>
        <div class="alert alert-danger">
            Ha ocurrido algún problema y no se ha podido guardar la nota. <a href="FrontController.php?controller=nota&action=list">Volver al listado</a>
        </div>
        <?php
    elseif (isset($nota) && ($nota->getStatus() === Util::IMAGE_ERROR )):
        ?>
        <div class="alert alert-danger">
            Ha ocurrido algún problema con la imagen. <a href="FrontController.php?controller=nota&action=list">Volver al listado</a>
        </div>
        <?php
    elseif (isset($nota) && ($nota->getStatus() === Util::NO_OPERATION)):
        ?>
        <form class="form" action="FrontController.php?controller=Nota&action=save" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<?php echo $id; ?>" />
            <div class="form-group">
                <label>Título</label>
                <input class="form-control" type="text" name="title" value="<?php echo $titulo; ?>" />
            </div>
            <div class="form-group mb-2">
                <label>Contenido</label>
                <textarea class="form-control" style="white-space: pre-wrap;" name="content"><?php echo $contenido; ?></textarea>
            </div>

            <div class="form-group mb-2">
                <label>Imagen</label>


                <input class="form-control" type="file" id="fichero" name="fichero"  accept=".jpg,.jpeg,.webp,.png" onchange="preview()">

                <img id="frame" src="<?php echo $img ?>" class="img-fluid" width="100px" />
            </div>

            <input type="submit" value="Guardar" class="btn btn-primary"/>
            <a class="btn btn-outline-danger" href="FrontController.php?controller=Nota&action=list">Cancelar</a>
        </form>
        <script>
            function preview() {
                frame.src = URL.createObjectURL(event.target.files[0]);
            }
  
        </script>
    <?php endif; ?>
</div>