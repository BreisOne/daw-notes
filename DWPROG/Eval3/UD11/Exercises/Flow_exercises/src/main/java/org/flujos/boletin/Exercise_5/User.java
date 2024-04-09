package org.flujos.boletin.Exercise_5;

import java.io.Serializable;

public class User implements Serializable{
    //private static final long serialVersionUID = 1L;
    String name;
    String address;
    int tlf;

    public User(){
        name = "";
        address = "";
        tlf = 0;
    }
    public User( String name, String address, int tlf){
        this.name = name;
        this.address = address;
        this.tlf = tlf;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", adress='" + address + '\'' +
                ", tlf=" + tlf +
                '}';
    }
}
