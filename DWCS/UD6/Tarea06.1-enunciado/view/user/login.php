<div class="container-fluid">
    
     <?php
            
            $loginViewData = $dataToView["data"];
            if(($loginViewData!=null) && ($loginViewData->getStatus()=== Util::OPERATION_NOK)) {
                ?>

                <div class="alert alert-danger" role="alert">
                    <?=LOGIN_ERROR_MSG; ?>
            </div>
            <?php }  ?>

    <div class="row justify-content-center">
        <div class="col-sm-12 col-md-6">
            <form method="post" action="FrontController.php?controller=Usuario&action=login">
                <!-- Email input -->
                <div class="form-group mb-4 ">
                    <label class="form-label" for="email">Email address</label>
                    <input type="email" id="email" class="form-control" name="email"  required/>

                </div>

                <!-- Current Password input -->
                <div class="form-group mb-4">
                    <label class="form-label" for="currentPwd">Contraseña actual</label>
                    <input type="password" id="currentPwd" class="form-control" name="pwd" required/>

                </div>
                
                 <div class="form-group mb-4">
                            <label class="form-label" for="rol">Seleccione el rol:</label>

                            <select name="rol" id="rol" required>
                                <?php 
                                      //b) permitir seleccionar entre los 2 roles de la aplicación: admin y user 
                                $app_roles = $dataToView["data"]->getAppRoles();
                                foreach ($app_roles as $rol) { ?>


                                    <option value="<?= $rol->getId() ?>"> <?= $rol->getName() ?> </option>
                                <?php } ?>
                            </select>              </div>
                
                <!-- Submit button -->
                <input type="submit" class="btn btn-primary btn-block mb-4" value="Iniciar sesión"></button>


            </form>        
           
        </div>
    </div>
</div>



