package com.paotui.mapper;

import com.paotui.entity.Dongtaifenxiang;

import java.util.List;
import java.util.Map;

public interface DongtaifenxiangMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dongtaifenxiang record);

    int insertSelective(Dongtaifenxiang record);

    Dongtaifenxiang selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dongtaifenxiang record);

    int updateByPrimaryKeyWithBLOBs(Dongtaifenxiang record);

    int updateByPrimaryKey(Dongtaifenxiang record);

    List<Dongtaifenxiang> selectAll(Map<String, Object> params);
}
