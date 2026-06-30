package com.paotui.service.impl;

import com.paotui.entity.Paotuixiangmu;
import com.paotui.mapper.PaotuixiangmuMapper;
import com.paotui.service.PaotuixiangmuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PaotuixiangmuServiceImpl implements PaotuixiangmuService {

    @Autowired
    private PaotuixiangmuMapper paotuixiangmuMapper;

    @Override
    public int add(Paotuixiangmu record) {
        return paotuixiangmuMapper.insertSelective(record);
    }

    @Override
    public int update(Paotuixiangmu record) {
        return paotuixiangmuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return paotuixiangmuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Paotuixiangmu getById(Integer id) {
        return paotuixiangmuMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Paotuixiangmu> list(Map<String, Object> params) {
        return paotuixiangmuMapper.selectAll(params);
    }

    @Override
    public List<Paotuixiangmu> listCanJiedan(String keyword, Integer fenleiId) {
        return paotuixiangmuMapper.selectCanJiedan(keyword, fenleiId);
    }

    @Override
    public int updateStatus(Integer id, Integer status) {
        Paotuixiangmu record = new Paotuixiangmu();
        record.setId(id);
        record.setStatus(status);
        return paotuixiangmuMapper.updateByPrimaryKeySelective(record);
    }
}
