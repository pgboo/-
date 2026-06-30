<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>校园跑腿业务管理系统</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #667eea;
            --secondary: #764ba2;
        }
        body { font-family: 'Microsoft YaHei', sans-serif; }
        .hero {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 80px 0;
        }
        .navbar { box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .project-card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s;
            overflow: hidden;
        }
        .project-card:hover { transform: translateY(-5px); }
        .status-badge { font-size: 12px; padding: 5px 10px; border-radius: 20px; }
        .section-title {
            position: relative;
            padding-left: 15px;
            margin-bottom: 25px;
            font-weight: 700;
        }
        .section-title::before {
            content: '';
            position: absolute;
            left: 0;
            top: 5px;
            bottom: 5px;
            width: 5px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: 3px;
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
    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">
                <i class="fas fa-running text-primary me-2"></i>校园跑腿
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/index">首页</a></li>
                    <li class="nav-item"><a class="nav-link" href="#projects">跑腿项目</a></li>
                    <li class="nav-item"><a class="nav-link" href="#dongtai">动态分享</a></li>
                    <li class="nav-item"><a class="nav-link" href="#gonggao">公告</a></li>
                </ul>
                <div class="d-flex gap-2">
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary rounded-pill">登录</a>
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-primary rounded-pill">注册</a>
                </div>
            </div>
        </div>
    </nav>

    <section class="hero">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-4">校园跑腿，随叫随到</h1>
            <p class="lead mb-5">代取快递、代买外卖、文件代办，让校园生活更轻松</p>
            <form action="${pageContext.request.contextPath}/index" method="get" class="row g-2 justify-content-center">
                <div class="col-md-6">
                    <input type="text" name="keyword" value="${keyword}" class="form-control form-control-lg" placeholder="搜索跑腿项目...">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-light btn-lg px-4">
                        <i class="fas fa-search me-2"></i>搜索
                    </button>
                </div>
            </form>
        </div>
    </section>

    <div class="container my-5" id="projects">
        <h3 class="section-title">热门跑腿项目</h3>
        <div class="row g-4">
            <c:forEach items="${projectList}" var="p">
                <div class="col-md-6 col-lg-4">
                    <div class="card project-card h-100">
                        <img src="${p.cover != null ? p.cover : pageContext.request.contextPath.concat('/static/images/default.svg')}"
                             class="card-img-top" style="height: 180px; object-fit: cover;" alt="封面">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <span class="badge bg-info">${p.fenleiName}</span>
                                <span class="status-badge bg-warning text-dark">待接单</span>
                            </div>
                            <h5 class="card-title">${p.title}</h5>
                            <p class="card-text text-muted text-truncate">${p.content}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-danger fw-bold">¥${p.fee}</span>
                                <small class="text-muted"><i class="far fa-clock me-1"></i>
                                    <fmt:formatDate value="${p.requireTime}" pattern="MM-dd HH:mm"/>
                                </small>
                            </div>
                        </div>
                        <div class="card-footer bg-white border-0">
                            <a href="${pageContext.request.contextPath}/login?type=paotui" class="btn btn-primary w-100">立即接单</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty projectList}">
                <div class="col-12 text-center text-muted py-5">暂无跑腿项目</div>
            </c:if>
        </div>
    </div>

    <div class="container my-5" id="dongtai">
        <div class="row">
            <div class="col-lg-8">
                <h3 class="section-title">动态分享</h3>
                <c:forEach items="${dongtaiList}" var="d" begin="0" end="4">
                    <div class="dongtai-item">
                        <div class="d-flex align-items-center mb-2">
                            <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center"
                                 style="width:40px;height:40px;">${d.userName.charAt(0)}</div>
                            <div class="ms-2">
                                <div class="fw-bold">${d.userName}</div>
                                <small class="text-muted"><fmt:formatDate value="${d.createTime}" pattern="yyyy-MM-dd HH:mm"/></small>
                            </div>
                        </div>
                        <h5>${d.title}</h5>
                        <p class="text-muted">${d.content}</p>
                    </div>
                </c:forEach>
            </div>
            <div class="col-lg-4" id="gonggao">
                <h3 class="section-title">系统公告</h3>
                <ul class="list-group list-group-flush">
                    <c:forEach items="${gonggaoList}" var="g">
                        <li class="list-group-item">
                            <i class="fas fa-bullhorn text-primary me-2"></i>${g.title}
                            <br>
                            <small class="text-muted"><fmt:formatDate value="${g.createTime}" pattern="yyyy-MM-dd"/></small>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">&copy; 2026 校园跑腿业务管理系统. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
