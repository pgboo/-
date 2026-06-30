package com.paotui.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Jiaoyifankui implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String orderNo;
    private Integer projectId;
    private String content;
    private Integer paotuiId;
    private String paotuiName;
    private Date createTime;

    // 关联字段
    private String projectTitle;
}
