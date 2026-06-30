package com.paotui.service.impl;

import com.paotui.entity.Jiaoyifankui;
import com.paotui.mapper.JiaoyifankuiMapper;
import com.paotui.service.JiaoyifankuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class JiaoyifankuiServiceImpl implements JiaoyifankuiService {

    @Autowired
    private JiaoyifankuiMapper jiaoyifankuiMapper;

    @Override
    public int add(Jiaoyifankui record) {
        return jiaoyifankuiMapper.insertSelective(record);
    }

    @Override
    public int update(Jiaoyifankui record) {
        return jiaoyifankuiMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return jiaoyifankuiMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Jiaoyifankui getById(Integer id) {
        return jiaoyifankuiMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Jiaoyifankui> list(Map<String, Object> params) {
        return jiaoyifankuiMapper.selectAll(params);
    }
}
