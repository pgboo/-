package com.paotui.entity;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class Jiedanxinxi implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String orderNo;
    private Integer projectId;
    private Integer userId;
    private Integer paotuiId;
    private String paotuiName;
    private String paotuiPhone;
    private String targetAddress;
    private BigDecimal fee;
    private Integer status;
    private Date jiedanTime;
    private Date updateTime;

    // 关联字段
    private String projectTitle;
    private String userName;
    private String statusStr;
}
