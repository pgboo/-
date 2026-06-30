package com.paotui.service.impl;

import com.paotui.entity.Shangjia;
import com.paotui.mapper.ShangjiaMapper;
import com.paotui.service.ShangjiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ShangjiaServiceImpl implements ShangjiaService {

    @Autowired
    private ShangjiaMapper shangjiaMapper;

    @Override
    public Shangjia login(String username, String password) {
        return shangjiaMapper.login(username, password);
    }

    @Override
    public int register(Shangjia shangjia) {
        Shangjia exist = shangjiaMapper.selectByUsername(shangjia.getUsername());
        if (exist != null) {
            throw new RuntimeException("用户名已存在");
        }
        return shangjiaMapper.insertSelective(shangjia);
    }

    @Override
    public int add(Shangjia shangjia) {
        return shangjiaMapper.insertSelective(shangjia);
    }

    @Override
    public int update(Shangjia shangjia) {
        return shangjiaMapper.updateByPrimaryKeySelective(shangjia);
    }

    @Override
    public int delete(Integer id) {
        return shangjiaMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Shangjia getById(Integer id) {
        return shangjiaMapper.selectByPrimaryKey(id);
    }

    @Override
    public Shangjia getByUsername(String username) {
        return shangjiaMapper.selectByUsername(username);
    }

    @Override
    public List<Shangjia> list(Map<String, Object> params) {
        return shangjiaMapper.selectAll(params);
    }
}
