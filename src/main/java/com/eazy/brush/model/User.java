package com.eazy.brush.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class User implements Serializable {

    private static final long serialVersionUID = 1473242945384450906L;

    private Integer id;
    private String name;
    private String password;
    private Date create_time;
    private String status;
    private String email;
    private String desc;

    public User() {

    }

    public User(String name, String password, String email) {
        super();
        this.name = name;
        this.password = password;
        this.email = email;
    }

    public User(Integer id, String name, String password) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
    }

    public User(String name, String password) {
        super();
        this.name = name;
        this.password = password;
    }
}
