<?php



/**
 * Description of LoginViewData
 *
 * @author wadmin
 */
class LoginViewData {
    use ViewData;
    
    private array $appRoles;
    
    public function __construct(array $appRoles) {
        $this->appRoles = $appRoles;
    }

    public function getAppRoles(): array {
        return $this->appRoles;
    }

    public function setAppRoles(array $appRoles): void {
        $this->appRoles = $appRoles;
    }


}
