package com.paotui.service;

import com.paotui.entity.Paotui;

import java.util.List;
import java.util.Map;

public interface PaotuiService {
    Paotui login(String username, String password);

    int register(Paotui paotui);

    int add(Paotui paotui);

    int update(Paotui paotui);

    int delete(Integer id);

    Paotui getById(Integer id);

    Paotui getByUsername(String username);

    List<Paotui> list(Map<String, Object> params);
}
