package com.shyn.util;

import java.io.Serializable;

public class User implements Serializable{

    private static final long serialVersionUID = 6297385302078200511L;

    private String name;
    private String email;
    private int id;
    private String country;
    private int role;

    public User(String nm, String em, String country, int i, int role){
        this.name=nm;
        this.id=i;
        this.country=country;
        this.email=em;
        this.role=role;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setRole(int role) {this.role = role;}


    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public int getId() {
        return id;
    }

    public String getCountry() {
        return country;
    }

    public int getRole(){ return role;}

    @Override
    public String toString(){
        return "Name="+this.name+", Email="+this.email+", Country="+this.country+", Role="+this.role;
    }
}