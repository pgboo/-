package com.paotui.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Shangjia implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String username;
    private String password;
    private String name;
    private String contact;
    private String phone;
    private String address;
    private Integer status;
    private Date createTime;
}
