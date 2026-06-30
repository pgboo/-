<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册 - 校园跑腿业务管理系统</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .register-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 40px;
            width: 100%;
            max-width: 450px;
        }
        .btn-register {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="register-card">
        <div class="text-center mb-4">
            <i class="fas fa-user-plus fa-3x text-success mb-3"></i>
            <h3 class="fw-bold text-dark">用户注册</h3>
            <p class="text-muted">加入校园跑腿，让生活更便捷</p>
        </div>

        <c:if test="${not empty msg}">
            <div class="alert alert-danger" role="alert">${msg}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/doRegister" method="post">
            <input type="hidden" name="type" value="${type}">

            <div class="mb-3">
                <label class="form-label">账号</label>
                <input type="text" name="username" class="form-control" placeholder="请输入账号" required>
            </div>
            <div class="mb-3">
                <label class="form-label">密码</label>
                <input type="password" name="password" class="form-control" placeholder="请输入密码" required>
            </div>
            <div class="mb-3">
                <label class="form-label">姓名/名称</label>
                <input type="text" name="name" class="form-control" placeholder="请输入姓名" required>
            </div>
            <div class="mb-4">
                <label class="form-label">手机号</label>
                <input type="text" name="phone" class="form-control" placeholder="请输入手机号">
            </div>

            <button type="submit" class="btn btn-success btn-register">
                <i class="fas fa-user-check me-2"></i>立即注册
            </button>
        </form>

        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login?type=${type}" class="text-decoration-none">已有账号？立即登录</a>
        </div>
        <div class="text-center mt-2">
            <a href="${pageContext.request.contextPath}/index" class="text-decoration-none text-muted">返回首页</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
