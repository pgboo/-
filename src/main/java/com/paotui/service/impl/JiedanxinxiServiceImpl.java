package com.paotui.service.impl;

import com.paotui.entity.Jiedanxinxi;
import com.paotui.mapper.JiedanxinxiMapper;
import com.paotui.service.JiedanxinxiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class JiedanxinxiServiceImpl implements JiedanxinxiService {

    @Autowired
    private JiedanxinxiMapper jiedanxinxiMapper;

    @Override
    public int add(Jiedanxinxi record) {
        return jiedanxinxiMapper.insertSelective(record);
    }

    @Override
    public int update(Jiedanxinxi record) {
        return jiedanxinxiMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return jiedanxinxiMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Jiedanxinxi getById(Integer id) {
        return jiedanxinxiMapper.selectByPrimaryKey(id);
    }

    @Override
    public Jiedanxinxi getByOrderNo(String orderNo) {
        return jiedanxinxiMapper.selectByOrderNo(orderNo);
    }

    @Override
    public Jiedanxinxi selectByProjectIdAndPaotuiId(Integer projectId, Integer paotuiId) {
        return jiedanxinxiMapper.selectByProjectIdAndPaotuiId(projectId, paotuiId);
    }

    @Override
    public List<Jiedanxinxi> list(Map<String, Object> params) {
        return jiedanxinxiMapper.selectAll(params);
    }

    @Override
    public int accept(Integer id) {
        Jiedanxinxi record = new Jiedanxinxi();
        record.setId(id);
        record.setStatus(1);
        return jiedanxinxiMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int reject(Integer id) {
        Jiedanxinxi record = new Jiedanxinxi();
        record.setId(id);
        record.setStatus(2);
        return jiedanxinxiMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int deliver(Integer id) {
        Jiedanxinxi record = new Jiedanxinxi();
        record.setId(id);
        record.setStatus(4);
        return jiedanxinxiMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int complete(Integer id) {
        Jiedanxinxi record = new Jiedanxinxi();
        record.setId(id);
        record.setStatus(3);
        return jiedanxinxiMapper.updateByPrimaryKeySelective(record);
    }
}
