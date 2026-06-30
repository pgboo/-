package com.paotui.service.impl;

import com.paotui.entity.Dongtaifenxiang;
import com.paotui.mapper.DongtaifenxiangMapper;
import com.paotui.service.DongtaifenxiangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DongtaifenxiangServiceImpl implements DongtaifenxiangService {

    @Autowired
    private DongtaifenxiangMapper dongtaifenxiangMapper;

    @Override
    public int add(Dongtaifenxiang record) {
        return dongtaifenxiangMapper.insertSelective(record);
    }

    @Override
    public int update(Dongtaifenxiang record) {
        return dongtaifenxiangMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return dongtaifenxiangMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Dongtaifenxiang getById(Integer id) {
        return dongtaifenxiangMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Dongtaifenxiang> list(Map<String, Object> params) {
        return dongtaifenxiangMapper.selectAll(params);
    }

    @Override
    public int addViewCount(Integer id) {
        Dongtaifenxiang record = dongtaifenxiangMapper.selectByPrimaryKey(id);
        if (record != null) {
            record.setViewCount(record.getViewCount() == null ? 1 : record.getViewCount() + 1);
            return dongtaifenxiangMapper.updateByPrimaryKeySelective(record);
        }
        return 0;
    }
}
