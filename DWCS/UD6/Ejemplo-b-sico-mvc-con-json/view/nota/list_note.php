<div class="row">
    <div class="col-md-12 text-right">
        <a href="FrontController.php?controller=Nota&action=edit" class="btn btn-outline-primary">Crear nota</a>
        <hr/>
    </div>
    <?php
    if (count($dataToView["data"]) > 0) {
        foreach ($dataToView["data"] as $note) {
            ?>
            <div class="col-md-3 card border border-secondary rounded m-2">
                <img src="<?= "..".DIRECTORY_SEPARATOR. FILES_FOLDER. DIRECTORY_SEPARATOR."no_picture.jpg"?>" class="card-img-top" alt="No picture">
                <div class="card-body ">
                    <h5 class="card-title"><?php echo $note->getTitulo(); ?></h5>

                    <div class="card-text"><?php echo nl2br($note->getContenido()); ?></div>
                    <hr class="mt-1"/>
                    <a href="FrontController.php?controller=Nota&action=edit&id=<?php echo $note->getId(); ?>" class="btn btn-primary">Editar</a>
                    <a href="FrontController.php?controller=Nota&action=confirmDelete&id=<?php echo $note->getId(); ?>" class="btn btn-danger">Eliminar</a>
                </div>
            </div>
            <?php
        }
    } else {
        ?>
        <div class="alert alert-info">
            Actualmente no existen notas.
        </div>
        <?php
    }
    ?>
</div>