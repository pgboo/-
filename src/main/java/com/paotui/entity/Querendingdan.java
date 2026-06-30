package com.paotui.entity;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class Querendingdan implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String orderNo;
    private Integer projectId;
    private Integer userId;
    private String userName;
    private String userPhone;
    private Integer paotuiId;
    private String paotuiName;
    private String targetAddress;
    private BigDecimal fee;
    private Date confirmTime;
    private Integer score;
    private Integer isPay;
    private Date payTime;
    private String remark;
    private Date createTime;

    // 关联字段
    private String projectTitle;
    private String payStr;
}
