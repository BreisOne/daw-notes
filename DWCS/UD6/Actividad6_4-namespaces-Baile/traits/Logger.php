<?php
namespace traits;

trait Logger{
public function log(string $msg)
{

        $info = [
            "__CLASS__" => __CLASS__,
            " get_class()" => get_class(),
            "get_called_class()" => get_called_class(),
            "get_class_methods(__CLASS__)"=>get_class_methods(__CLASS__),
            "get_class_methods(get_called_class())"=>get_class_methods(get_called_class()),
            "get_class_vars(__CLASS__)"=>get_class_vars(__CLASS__),
            "get_class_vars(get_called_class())"=>get_class_vars(get_called_class()),
            "get_declared_traits()"=>get_declared_traits()
        ];

        echo '<pre style="color:red">';
        echo date('Y-m-d h:i:s') . ':' .                      
                         $msg . '<br/>';                      
        print_r($info);
        echo '</pre>';
    }

}
