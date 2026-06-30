package com.paotui.mapper;

import com.paotui.entity.Tixingxinxi;

import java.util.List;
import java.util.Map;

public interface TixingxinxiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tixingxinxi record);

    int insertSelective(Tixingxinxi record);

    Tixingxinxi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tixingxinxi record);

    int updateByPrimaryKey(Tixingxinxi record);

    List<Tixingxinxi> selectAll(Map<String, Object> params);
}
