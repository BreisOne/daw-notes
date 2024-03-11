<?php

/* Default options */
const DEFAULT_CONTROLLER = "Producto";
const DEFAULT_ACTION = "list";

/*classes folder */
const CONTROLLERS_FOLDER = "controller";
const MODELS_FOLDER = "model";
const REPOSITORIES_FOLDER = MODELS_FOLDER . DIRECTORY_SEPARATOR . "repository";
const ENTITIES_FOLDER = MODELS_FOLDER . DIRECTORY_SEPARATOR . "entity";
const SERVICES_FOLDER = MODELS_FOLDER . DIRECTORY_SEPARATOR . "service";
const VIEWDATA_FOLDER = MODELS_FOLDER . DIRECTORY_SEPARATOR . "viewData";

const INCLUDES_FOLDER = "includes";
const TRAITS_FOLDER = MODELS_FOLDER . DIRECTORY_SEPARATOR . "traits";

const IMAGES_FOLDER = "files";
const IMAGE_DEFAULT = "no-picture.jpg";



const LOGIN_ERROR_MSG = "No se ha podido iniciar sesión";

const ADMIN_ROLE = "admin";
const USER_ROLE = "user";


const CONFIG_FOLDER = "config";

const DATABASE_INI_FILE =   CONFIG_FOLDER . DIRECTORY_SEPARATOR . "database.ini";
?>