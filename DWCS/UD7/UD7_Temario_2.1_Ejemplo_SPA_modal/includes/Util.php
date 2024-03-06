<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */

class Util {

    CONST OPERATION_OK = 0;
    CONST OPERATION_NOK = 1;
    CONST NO_OPERATION = 2;
    CONST IMAGE_ERROR = 3;

    /*
     * Transforma un array asociativo en un objeto de la clase $class siempre y cuando el array y la clase tengan claves y nombres de propiedades iguales
     * El  $obj_como_array_asoc es un array asociativo como por ejemplo: 
     * array("id" => 1,
     *  "titulo" => 'Este es el titulo',
     *  "contenido" => "content..."));
     * Los nombres de las propiedades de la clase $class y de las claves del $obj_como_array_asoc deben tener el mismo nombre;
     */

    static function json_decode_array_to_class(array $obj_como_array_asoc, string $class) {
        //https://www.php.net/manual/en/book.reflection.php
        //Crea una clase reflection (una representación de los datos de la clase) que entra como parámetro
        $reflection = new ReflectionClass($class);

        //Crea un objeto de la clase sin llamar al constructor
        $instance = $reflection->newInstanceWithoutConstructor();

        //Toma las propiedades de la clase:     //https://www.php.net/manual/es/reflectionclass.getproperties.php
        $properties = $reflection->getProperties();

       

        //$key es clave numérica, $property es un objeto ReflectionProperty https://www.php.net/manual/es/class.reflectionproperty.php#reflectionproperty.constants.modifiers

        $claves_obj = array_keys($obj_como_array_asoc);

        foreach ($properties as $key => $property) {
            //no necesario a partir  php8.1
            $property->setAccessible(true);

            if (in_array($property->getName(), $claves_obj)) {

                //Fix para array de objetos Rol
                if ($property->getName() == "roles") {
                    $array_objtect_roles = [];
                    foreach ($obj_como_array_asoc["roles"] as $key => $rol) {
                        $rol_object = self::json_decode_array_to_class($rol, "Rol");
                        array_push($array_objtect_roles, $rol_object);
                    }

                    //Establecemos en el objeto de $class, la propiedad con el mismo nombre  de la clave de $obj_como_array_asoc
                    $property->setValue($instance, $array_objtect_roles);
                } else {
                    //Establecemos en el objeto de $class, la propiedad con el mismo nombre  de la clave de $obj_como_array_asoc
                    $property->setValue($instance, $obj_como_array_asoc[$property->getName()]);
                }
            }
        }
        return $instance;
    }

}
