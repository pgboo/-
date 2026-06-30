<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} - 用户中心</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --sidebar-width: 260px; --primary: #667eea; }
        body { background: #f4f6f9; }
        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: linear-gradient(180deg, #1a1f37 0%, #2d3748 100%);
            color: white;
            overflow-y: auto;
            z-index: 1000;
        }
        .sidebar .brand {
            padding: 20px;
            font-size: 20px;
            font-weight: 700;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        .sidebar .nav-link {
            color: rgba(255,255,255,0.8);
            padding: 14px 20px;
            border-left: 4px solid transparent;
            transition: all 0.3s;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background: rgba(255,255,255,0.1);
            color: white;
            border-left-color: var(--primary);
        }
        .main-content {
            margin-left: var(--sidebar-width);
            min-height: 100vh;
        }
        .topbar {
            background: white;
            padding: 15px 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .content-wrapper { padding: 25px; }
        .card-stats {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .table-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            padding: 25px;
        }
        .dongtai-item {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="brand">
            <i class="fas fa-running me-2"></i>校园跑腿
        </div>
        <nav class="nav flex-column mt-3">
            <a class="nav-link ${param.menu == 'index' ? 'active' : ''}" href="${pageContext.request.contextPath}/user/index">
                <i class="fas fa-home me-2"></i>用户首页
            </a>
            <a class="nav-link ${param.menu == 'project' ? 'active' : ''}" href="${pageContext.request.contextPath}/user/project/list">
                <i class="fas fa-tasks me-2"></i>跑腿项目管理
            </a>
            <a class="nav-link ${param.menu == 'order' ? 'active' : ''}" href="${pageContext.request.contextPath}/user/order/list">
                <i class="fas fa-clipboard-list me-2"></i>我的订单
            </a>
            <a class="nav-link ${param.menu == 'confirm' ? 'active' : ''}" href="${pageContext.request.contextPath}/user/confirm/list">
                <i class="fas fa-check-circle me-2"></i>确认订单
            </a>
            <a class="nav-link ${param.menu == 'dongtai' ? 'active' : ''}" href="${pageContext.request.contextPath}/user/dongtai/list">
                <i class="fas fa-comments me-2"></i>动态分享
            </a>
            <a class="nav-link ${param.menu == 'gonggao' ? 'active' : ''}" href="${pageContext.request.contextPath}/user/gonggao/list">
                <i class="fas fa-bullhorn me-2"></i>系统公告
            </a>
            <a class="nav-link ${param.menu == 'profile' ? 'active' : ''}" href="${pageContext.request.contextPath}/user/profile">
                <i class="fas fa-user me-2"></i>个人中心
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                <i class="fas fa-sign-out-alt me-2"></i>退出登录
            </a>
        </nav>
    </div>
    <div class="main-content">
        <div class="topbar">
            <h5 class="m-0">${param.title}</h5>
            <div>
                <i class="fas fa-user-circle me-1"></i>${sessionScope.user.name}
            </div>
        </div>
        <div class="content-wrapper">
