package com.paotui.service;

import com.paotui.entity.Shangjia;

import java.util.List;
import java.util.Map;

public interface ShangjiaService {
    Shangjia login(String username, String password);

    int register(Shangjia shangjia);

    int add(Shangjia shangjia);

    int update(Shangjia shangjia);

    int delete(Integer id);

    Shangjia getById(Integer id);

    Shangjia getByUsername(String username);

    List<Shangjia> list(Map<String, Object> params);
}
