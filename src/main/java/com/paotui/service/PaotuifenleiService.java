package com.paotui.service;

import com.paotui.entity.Paotuifenlei;

import java.util.List;
import java.util.Map;

public interface PaotuifenleiService {
    int add(Paotuifenlei record);

    int update(Paotuifenlei record);

    int delete(Integer id);

    Paotuifenlei getById(Integer id);

    List<Paotuifenlei> list(Map<String, Object> params);

    List<Paotuifenlei> all();
}
