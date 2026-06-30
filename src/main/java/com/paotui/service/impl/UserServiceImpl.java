package com.paotui.service.impl;

import com.paotui.entity.User;
import com.paotui.mapper.UserMapper;
import com.paotui.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        return userMapper.login(username, password);
    }

    @Override
    public int register(User user) {
        User exist = userMapper.selectByUsername(user.getUsername());
        if (exist != null) {
            throw new RuntimeException("用户名已存在");
        }
        return userMapper.insertSelective(user);
    }

    @Override
    public int add(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public int update(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public int delete(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User getById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public User getByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public List<User> list(Map<String, Object> params) {
        return userMapper.selectAll(params);
    }
}
