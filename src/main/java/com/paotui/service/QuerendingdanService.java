package com.paotui.service;

import com.paotui.entity.Querendingdan;

import java.util.List;
import java.util.Map;

public interface QuerendingdanService {
    int add(Querendingdan record);

    int update(Querendingdan record);

    int delete(Integer id);

    Querendingdan getById(Integer id);

    Querendingdan getByOrderNo(String orderNo);

    List<Querendingdan> list(Map<String, Object> params);

    int confirm(Querendingdan record);

    int pay(Integer id);
}
