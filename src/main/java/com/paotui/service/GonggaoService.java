package com.paotui.service;

import com.paotui.entity.Gonggao;

import java.util.List;
import java.util.Map;

public interface GonggaoService {
    int add(Gonggao record);

    int update(Gonggao record);

    int delete(Integer id);

    Gonggao getById(Integer id);

    List<Gonggao> list(Map<String, Object> params);
}
