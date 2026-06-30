package com.paotui.service;

import com.paotui.entity.Jiedanxinxi;

import java.util.List;
import java.util.Map;

public interface JiedanxinxiService {
    int add(Jiedanxinxi record);

    int update(Jiedanxinxi record);

    int delete(Integer id);

    Jiedanxinxi getById(Integer id);

    Jiedanxinxi getByOrderNo(String orderNo);

    Jiedanxinxi selectByProjectIdAndPaotuiId(Integer projectId, Integer paotuiId);

    List<Jiedanxinxi> list(Map<String, Object> params);

    int accept(Integer id);

    int reject(Integer id);

    int deliver(Integer id);

    int complete(Integer id);
}
