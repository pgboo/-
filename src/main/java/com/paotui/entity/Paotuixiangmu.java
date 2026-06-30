package com.paotui.entity;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Paotuixiangmu implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String title;
    private Integer fenleiId;
    private String content;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date requireTime;
    private BigDecimal fee;
    private String cover;
    private Integer userId;
    private Integer shangjiaId;
    private Integer status;
    private Date createTime;
    private Date updateTime;

    // 关联字段
    private String fenleiName;
    private String userName;
    private String shangjiaName;
    private String statusStr;
}
