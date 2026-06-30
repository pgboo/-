package com.paotui.service;

import com.paotui.entity.Dongtaifenxiang;

import java.util.List;
import java.util.Map;

public interface DongtaifenxiangService {
    int add(Dongtaifenxiang record);

    int update(Dongtaifenxiang record);

    int delete(Integer id);

    Dongtaifenxiang getById(Integer id);

    List<Dongtaifenxiang> list(Map<String, Object> params);

    int addViewCount(Integer id);
}
