package com.paotui.service;

import com.paotui.entity.Paotuixiangmu;

import java.util.List;
import java.util.Map;

public interface PaotuixiangmuService {
    int add(Paotuixiangmu record);

    int update(Paotuixiangmu record);

    int delete(Integer id);

    Paotuixiangmu getById(Integer id);

    List<Paotuixiangmu> list(Map<String, Object> params);

    List<Paotuixiangmu> listCanJiedan(String keyword, Integer fenleiId);

    int updateStatus(Integer id, Integer status);
}
