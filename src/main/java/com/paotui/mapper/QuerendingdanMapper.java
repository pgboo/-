package com.paotui.mapper;

import com.paotui.entity.Querendingdan;

import java.util.List;
import java.util.Map;

public interface QuerendingdanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Querendingdan record);

    int insertSelective(Querendingdan record);

    Querendingdan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Querendingdan record);

    int updateByPrimaryKey(Querendingdan record);

    List<Querendingdan> selectAll(Map<String, Object> params);

    Querendingdan selectByOrderNo(String orderNo);
}
