package com.paotui.controller;

import com.paotui.entity.*;
import com.paotui.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private PaotuiService paotuiService;
    @Autowired
    private ShangjiaService shangjiaService;
    @Autowired
    private AdminService adminService;

    @GetMapping("/login")
    public String loginPage(@RequestParam(value = "type", defaultValue = "user") String type, Model model) {
        model.addAttribute("type", type);
        return "common/login";
    }

    @PostMapping("/doLogin")
    public String doLogin(@RequestParam("type") String type,
                          @RequestParam("username") String username,
                          @RequestParam("password") String password,
                          HttpSession session,
                          Model model) {
        if ("admin".equals(type)) {
            Admin admin = adminService.login(username, password);
            if (admin != null) {
                session.setAttribute("admin", admin);
                return "redirect:/admin/index";
            }
        } else if ("user".equals(type)) {
            User user = userService.login(username, password);
            if (user != null) {
                session.setAttribute("user", user);
                return "redirect:/user/index";
            }
        } else if ("paotui".equals(type)) {
            Paotui paotui = paotuiService.login(username, password);
            if (paotui != null) {
                session.setAttribute("paotui", paotui);
                return "redirect:/paotui/index";
            }
        } else if ("shangjia".equals(type)) {
            Shangjia shangjia = shangjiaService.login(username, password);
            if (shangjia != null) {
                session.setAttribute("shangjia", shangjia);
                return "redirect:/shangjia/index";
            }
        }
        model.addAttribute("msg", "用户名或密码错误");
        model.addAttribute("type", type);
        return "common/login";
    }

    @GetMapping("/register")
    public String registerPage(@RequestParam(value = "type", defaultValue = "user") String type, Model model) {
        model.addAttribute("type", type);
        return "common/register";
    }

    @PostMapping("/doRegister")
    public String doRegister(@RequestParam("type") String type,
                             @RequestParam("username") String username,
                             @RequestParam("password") String password,
                             @RequestParam("name") String name,
                             @RequestParam(value = "phone", required = false) String phone,
                             Model model) {
        try {
            if ("user".equals(type)) {
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setName(name);
                user.setPhone(phone);
                userService.register(user);
            } else if ("paotui".equals(type)) {
                Paotui paotui = new Paotui();
                paotui.setUsername(username);
                paotui.setPassword(password);
                paotui.setName(name);
                paotui.setPhone(phone);
                paotuiService.register(paotui);
            } else if ("shangjia".equals(type)) {
                Shangjia shangjia = new Shangjia();
                shangjia.setUsername(username);
                shangjia.setPassword(password);
                shangjia.setName(name);
                shangjia.setPhone(phone);
                shangjiaService.register(shangjia);
            }
            model.addAttribute("msg", "注册成功，请登录");
            model.addAttribute("type", type);
            return "common/login";
        } catch (Exception e) {
            model.addAttribute("msg", e.getMessage());
            model.addAttribute("type", type);
            return "common/register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/index";
    }
}
