package com.paotui.service.impl;

import com.paotui.entity.Querendingdan;
import com.paotui.mapper.QuerendingdanMapper;
import com.paotui.service.QuerendingdanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class QuerendingdanServiceImpl implements QuerendingdanService {

    @Autowired
    private QuerendingdanMapper querendingdanMapper;

    @Override
    public int add(Querendingdan record) {
        return querendingdanMapper.insertSelective(record);
    }

    @Override
    public int update(Querendingdan record) {
        return querendingdanMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return querendingdanMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Querendingdan getById(Integer id) {
        return querendingdanMapper.selectByPrimaryKey(id);
    }

    @Override
    public Querendingdan getByOrderNo(String orderNo) {
        return querendingdanMapper.selectByOrderNo(orderNo);
    }

    @Override
    public List<Querendingdan> list(Map<String, Object> params) {
        return querendingdanMapper.selectAll(params);
    }

    @Override
    public int confirm(Querendingdan record) {
        record.setConfirmTime(new Date());
        return querendingdanMapper.insertSelective(record);
    }

    @Override
    public int pay(Integer id) {
        Querendingdan record = new Querendingdan();
        record.setId(id);
        record.setIsPay(1);
        record.setPayTime(new Date());
        return querendingdanMapper.updateByPrimaryKeySelective(record);
    }
}
