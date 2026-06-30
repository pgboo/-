package com.paotui.service.impl;

import com.paotui.entity.Paotui;
import com.paotui.mapper.PaotuiMapper;
import com.paotui.service.PaotuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PaotuiServiceImpl implements PaotuiService {

    @Autowired
    private PaotuiMapper paotuiMapper;

    @Override
    public Paotui login(String username, String password) {
        return paotuiMapper.login(username, password);
    }

    @Override
    public int register(Paotui paotui) {
        Paotui exist = paotuiMapper.selectByUsername(paotui.getUsername());
        if (exist != null) {
            throw new RuntimeException("用户名已存在");
        }
        return paotuiMapper.insertSelective(paotui);
    }

    @Override
    public int add(Paotui paotui) {
        return paotuiMapper.insertSelective(paotui);
    }

    @Override
    public int update(Paotui paotui) {
        return paotuiMapper.updateByPrimaryKeySelective(paotui);
    }

    @Override
    public int delete(Integer id) {
        return paotuiMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Paotui getById(Integer id) {
        return paotuiMapper.selectByPrimaryKey(id);
    }

    @Override
    public Paotui getByUsername(String username) {
        return paotuiMapper.selectByUsername(username);
    }

    @Override
    public List<Paotui> list(Map<String, Object> params) {
        return paotuiMapper.selectAll(params);
    }
}
