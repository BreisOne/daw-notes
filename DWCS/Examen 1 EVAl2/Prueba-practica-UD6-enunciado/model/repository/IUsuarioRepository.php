<?php



/**
 *
 * @author wadmin
 */
interface IUsuarioRepository extends IBaseRepository{
  //Para permitir que devuelva null, hay que permitir que el tipo sea nullable con el ? 
  public function findUsuarioByEmail($email): ?Usuario;
}
