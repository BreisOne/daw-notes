<div class="row">
	<form class="form" action="FrontController.php?controller=nota&action=delete" method="POST">
		<input type="hidden" name="id" value="<?php echo $dataToView["data"]->getId(); ?>" />
		<div class="alert alert-warning">
			<b>¿Confirma que desea eliminar esta nota?:</b>
			<i><?php echo $dataToView["data"]->getTitulo(); ?></i>
		</div>
		<input type="submit" value="Eliminar" class="btn btn-danger"/>
		<a class="btn btn-outline-success" href="FrontController.php?controller=nota&action=list">Cancelar</a>
	</form>
</div>