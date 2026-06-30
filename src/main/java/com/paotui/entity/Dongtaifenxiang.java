package com.paotui.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Dongtaifenxiang implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String title;
    private String content;
    private String images;
    private Integer userId;
    private String userName;
    private Integer viewCount;
    private Date createTime;
}
