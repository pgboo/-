<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录 - 校园跑腿业务管理系统</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 40px;
            width: 100%;
            max-width: 420px;
        }
        .login-title {
            color: #4a5568;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .login-subtitle {
            color: #718096;
            margin-bottom: 30px;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            width: 100%;
        }
        .type-selector .btn {
            border-radius: 20px;
            font-size: 14px;
        }
        .type-selector .btn-check:checked + .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="text-center mb-4">
            <i class="fas fa-running fa-3x text-primary mb-3"></i>
            <h3 class="login-title">校园跑腿</h3>
            <p class="login-subtitle">业务管理系统</p>
        </div>

        <c:if test="${not empty msg}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${msg}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/doLogin" method="post">
            <input type="hidden" name="type" id="type" value="${type}">

            <div class="type-selector d-flex justify-content-center gap-2 mb-4">
                <input type="radio" class="btn-check" name="typeRadio" id="typeUser" value="user" ${type == 'user' ? 'checked' : ''}>
                <label class="btn btn-outline-primary" for="typeUser">用户</label>

                <input type="radio" class="btn-check" name="typeRadio" id="typePaotui" value="paotui" ${type == 'paotui' ? 'checked' : ''}>
                <label class="btn btn-outline-primary" for="typePaotui">跑腿员</label>

                <input type="radio" class="btn-check" name="typeRadio" id="typeShangjia" value="shangjia" ${type == 'shangjia' ? 'checked' : ''}>
                <label class="btn btn-outline-primary" for="typeShangjia">商家</label>

                <input type="radio" class="btn-check" name="typeRadio" id="typeAdmin" value="admin" ${type == 'admin' ? 'checked' : ''}>
                <label class="btn btn-outline-primary" for="typeAdmin">管理员</label>
            </div>

            <div class="mb-3">
                <label class="form-label">账号</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" name="username" class="form-control" placeholder="请输入账号" required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">密码</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" name="password" class="form-control" placeholder="请输入密码" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-login">
                <i class="fas fa-sign-in-alt me-2"></i>登录
            </button>
        </form>

        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/register?type=user" class="text-decoration-none">还没有账号？立即注册</a>
        </div>
        <div class="text-center mt-2">
            <a href="${pageContext.request.contextPath}/index" class="text-decoration-none text-muted">返回首页</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.querySelectorAll('input[name="typeRadio"]').forEach(function(radio) {
            radio.addEventListener('change', function() {
                document.getElementById('type').value = this.value;
            });
        });
    </script>
</body>
</html>
