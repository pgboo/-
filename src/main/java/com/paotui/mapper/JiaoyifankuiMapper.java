package com.paotui.mapper;

import com.paotui.entity.Jiaoyifankui;

import java.util.List;
import java.util.Map;

public interface JiaoyifankuiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Jiaoyifankui record);

    int insertSelective(Jiaoyifankui record);

    Jiaoyifankui selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Jiaoyifankui record);

    int updateByPrimaryKeyWithBLOBs(Jiaoyifankui record);

    int updateByPrimaryKey(Jiaoyifankui record);

    List<Jiaoyifankui> selectAll(Map<String, Object> params);
}
