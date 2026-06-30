package com.paotui.mapper;

import com.paotui.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin login(@Param("username") String username, @Param("password") String password);

    List<Admin> selectAll(Map<String, Object> params);
}
