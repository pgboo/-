package com.paotui.service;

import com.paotui.entity.Tixingxinxi;

import java.util.List;
import java.util.Map;

public interface TixingxinxiService {
    int add(Tixingxinxi record);

    int update(Tixingxinxi record);

    int delete(Integer id);

    Tixingxinxi getById(Integer id);

    List<Tixingxinxi> list(Map<String, Object> params);

    int read(Integer id);
}
