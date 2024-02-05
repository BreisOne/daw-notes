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
    
    /**
     * Get the value of name
     */ 
    public function getName()
    {
        return $this->name;
    }
    /**
     * Set the value of name
     *
     * @return  self
     */ 
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get the value of age
     */ 
    public function getAge()
    {
        return $this->age;
    }

    /**
     * Set the value of age
     *
     * @return  self
     */ 
    public function setAge($age)
    {
        $this->age = $age;

        return $this;
    }

    /**
     * Get the value of occupation
     */ 
    public function getOccupation()
    {
        return $this->occupation;
    }

    /**
     * Set the value of occupation
     *
     * @return  self
     */ 
    public function setOccupation($occupation)
    {
        $this->occupation = $occupation;

        return $this;
    }
}
