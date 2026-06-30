package com.paotui.mapper;

import com.paotui.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User login(@Param("username") String username, @Param("password") String password);

    User selectByUsername(String username);

    List<User> selectAll(Map<String, Object> params);
}
