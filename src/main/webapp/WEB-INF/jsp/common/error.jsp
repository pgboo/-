<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>出错了</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container text-center mt-5">
        <h1 class="display-1 text-danger">500</h1>
        <p class="lead">系统出现错误，请稍后再试</p>
        <a href="${pageContext.request.contextPath}/index" class="btn btn-primary">返回首页</a>
    </div>
</body>
</html>
