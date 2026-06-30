package com.paotui.mapper;

import com.paotui.entity.Paotuifenlei;

import java.util.List;
import java.util.Map;

public interface PaotuifenleiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Paotuifenlei record);

    int insertSelective(Paotuifenlei record);

    Paotuifenlei selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Paotuifenlei record);

    int updateByPrimaryKey(Paotuifenlei record);

    List<Paotuifenlei> selectAll(Map<String, Object> params);
}
