<?php
class Person{

    public const species = "Homo Sapiens";

    public String $name;
    public int $age;
    public String $occupation;

    public function __construct(String $name, int $age, String $occupation) {
        $this->name = $name;
        $this->age = $age;
        $this->occupation = $occupation;
    
    }

    public function introduce():string
    {
        return "Hello, my name is ". $this->name;
    }

    public function describe_job():string
    {
        return "I am currently working as a(n) ". $this->occupation;
    }
    public static function greet_extraterrestrials( String $species):string
    {
        return "Welcome to Planet Earth ". $species ."!";
    }
    
}
