package com.paotui.service;

import com.paotui.entity.Admin;

import java.util.List;
import java.util.Map;

public interface AdminService {
    Admin login(String username, String password);

    int add(Admin record);

    int update(Admin record);

    int delete(Integer id);

    Admin getById(Integer id);

    List<Admin> list(Map<String, Object> params);
}
