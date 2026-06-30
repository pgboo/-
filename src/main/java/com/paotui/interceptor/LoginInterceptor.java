package com.paotui.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();

        // 管理员接口
        if (uri.startsWith(contextPath + "/admin")) {
            Object admin = request.getSession().getAttribute("admin");
            if (admin == null) {
                response.sendRedirect(contextPath + "/login?type=admin");
                return false;
            }
        }
        // 用户接口
        else if (uri.startsWith(contextPath + "/user")) {
            Object user = request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect(contextPath + "/login?type=user");
                return false;
            }
        }
        // 跑腿员接口
        else if (uri.startsWith(contextPath + "/paotui")) {
            Object paotui = request.getSession().getAttribute("paotui");
            if (paotui == null) {
                response.sendRedirect(contextPath + "/login?type=paotui");
                return false;
            }
        }
        // 商家接口
        else if (uri.startsWith(contextPath + "/shangjia")) {
            Object shangjia = request.getSession().getAttribute("shangjia");
            if (shangjia == null) {
                response.sendRedirect(contextPath + "/login?type=shangjia");
                return false;
            }
        }

        return true;
    }
}
