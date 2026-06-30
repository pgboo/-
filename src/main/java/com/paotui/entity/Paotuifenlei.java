package com.paotui.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Paotuifenlei implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String name;
    private Date createTime;
}
