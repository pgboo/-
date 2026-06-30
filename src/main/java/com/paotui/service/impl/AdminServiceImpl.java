package com.paotui.service.impl;

import com.paotui.entity.Admin;
import com.paotui.mapper.AdminMapper;
import com.paotui.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(String username, String password) {
        return adminMapper.login(username, password);
    }

    @Override
    public int add(Admin record) {
        return adminMapper.insertSelective(record);
    }

    @Override
    public int update(Admin record) {
        return adminMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(Integer id) {
        return adminMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Admin getById(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Admin> list(Map<String, Object> params) {
        return adminMapper.selectAll(params);
    }
}
