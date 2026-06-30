package com.paotui.service;

import com.paotui.entity.Jiaoyifankui;

import java.util.List;
import java.util.Map;

public interface JiaoyifankuiService {
    int add(Jiaoyifankui record);

    int update(Jiaoyifankui record);

    int delete(Integer id);

    Jiaoyifankui getById(Integer id);

    List<Jiaoyifankui> list(Map<String, Object> params);
}
