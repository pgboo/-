package com.paotui.mapper;

import com.paotui.entity.Gonggao;

import java.util.List;
import java.util.Map;

public interface GonggaoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Gonggao record);

    int insertSelective(Gonggao record);

    Gonggao selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Gonggao record);

    int updateByPrimaryKeyWithBLOBs(Gonggao record);

    int updateByPrimaryKey(Gonggao record);

    List<Gonggao> selectAll(Map<String, Object> params);
}
