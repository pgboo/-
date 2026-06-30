package com.paotui.mapper;

import com.paotui.entity.Paotui;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PaotuiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Paotui record);

    int insertSelective(Paotui record);

    Paotui selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Paotui record);

    int updateByPrimaryKey(Paotui record);

    Paotui login(@Param("username") String username, @Param("password") String password);

    Paotui selectByUsername(String username);

    List<Paotui> selectAll(Map<String, Object> params);
}
