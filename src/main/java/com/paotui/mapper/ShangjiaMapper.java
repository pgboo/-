package com.paotui.mapper;

import com.paotui.entity.Shangjia;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ShangjiaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shangjia record);

    int insertSelective(Shangjia record);

    Shangjia selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shangjia record);

    int updateByPrimaryKey(Shangjia record);

    Shangjia login(@Param("username") String username, @Param("password") String password);

    Shangjia selectByUsername(String username);

    List<Shangjia> selectAll(Map<String, Object> params);
}
