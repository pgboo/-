package com.paotui.service;

import com.paotui.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User login(String username, String password);

    int register(User user);

    int add(User user);

    int update(User user);

    int delete(Integer id);

    User getById(Integer id);

    User getByUsername(String username);

    List<User> list(Map<String, Object> params);
}
