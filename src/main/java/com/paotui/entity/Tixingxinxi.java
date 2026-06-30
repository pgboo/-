package com.paotui.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Tixingxinxi implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private Integer shangjiaId;
    private String orderNo;
    private String title;
    private String content;
    private Integer status;
    private Date createTime;

    // 关联字段
    private String statusStr;
}
