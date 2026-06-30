package com.paotui.service.impl;

import com.paotui.entity.Paotuifenlei;
import com.paotui.mapper.PaotuifenleiMapper;
import com.paotui.service.PaotuifenleiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PaotuifenleiServiceImpl implements PaotuifenleiService {

    @Autowired
    private PaotuifenleiMapper paotuifenleiMapper;

    @Override
    public int add(Paotuifenlei record) {
        return paotuifenleiMapper.insertSelective(record);
    }

    @Override
    public int update(Paotuifenlei record) {
        return paotuifenleiMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return paotuifenleiMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Paotuifenlei getById(Integer id) {
        return paotuifenleiMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Paotuifenlei> list(Map<String, Object> params) {
        return paotuifenleiMapper.selectAll(params);
    }

    @Override
    public List<Paotuifenlei> all() {
        return paotuifenleiMapper.selectAll(new HashMap<>());
    }
}
