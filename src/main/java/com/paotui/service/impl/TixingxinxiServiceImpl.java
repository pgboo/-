package com.paotui.service.impl;

import com.paotui.entity.Tixingxinxi;
import com.paotui.mapper.TixingxinxiMapper;
import com.paotui.service.TixingxinxiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TixingxinxiServiceImpl implements TixingxinxiService {

    @Autowired
    private TixingxinxiMapper tixingxinxiMapper;

    @Override
    public int add(Tixingxinxi record) {
        return tixingxinxiMapper.insertSelective(record);
    }

    @Override
    public int update(Tixingxinxi record) {
        return tixingxinxiMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return tixingxinxiMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Tixingxinxi getById(Integer id) {
        return tixingxinxiMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Tixingxinxi> list(Map<String, Object> params) {
        return tixingxinxiMapper.selectAll(params);
    }

    @Override
    public int read(Integer id) {
        Tixingxinxi record = new Tixingxinxi();
        record.setId(id);
        record.setStatus(1);
        return tixingxinxiMapper.updateByPrimaryKeySelective(record);
    }
}
