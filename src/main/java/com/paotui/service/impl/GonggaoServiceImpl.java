package com.paotui.service.impl;

import com.paotui.entity.Gonggao;
import com.paotui.mapper.GonggaoMapper;
import com.paotui.service.GonggaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GonggaoServiceImpl implements GonggaoService {

    @Autowired
    private GonggaoMapper gonggaoMapper;

    @Override
    public int add(Gonggao record) {
        return gonggaoMapper.insertSelective(record);
    }

    @Override
    public int update(Gonggao record) {
        return gonggaoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return gonggaoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Gonggao getById(Integer id) {
        return gonggaoMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Gonggao> list(Map<String, Object> params) {
        return gonggaoMapper.selectAll(params);
    }
}
