<?php

interface IUsuarioRepository extends IBaseRepository{

    public function findUsuarioByEmail($email): Usuario;

}
