<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/shangjia_header.jsp">
    <jsp:param name="title" value="商家首页"/>
    <jsp:param name="menu" value="index"/>
</jsp:include>

<div class="row mb-4">
    <div class="col-md-6">
        <div class="card card-stats p-4">
            <div class="d-flex align-items-center">
                <div class="bg-warning bg-opacity-10 p-3 rounded">
                    <i class="fas fa-tasks fa-2x text-warning"></i>
                </div>
                <div class="ms-3">
                    <div class="text-muted">我的项目</div>
                    <h3 class="m-0">${projectCount}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card card-stats p-4">
            <div class="d-flex align-items-center">
                <div class="bg-danger bg-opacity-10 p-3 rounded">
                    <i class="fas fa-bell fa-2x text-danger"></i>
                </div>
                <div class="ms-3">
                    <div class="text-muted">提醒信息</div>
                    <h3 class="m-0">${tixingCount}</h3>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <h5>欢迎使用校园跑腿商家中心</h5>
        <p class="text-muted">您可以发布跑腿项目、管理接单信息、查看提醒通知。</p>
        <a href="${pageContext.request.contextPath}/shangjia/project/list" class="btn btn-warning text-white">管理项目</a>
    </div>
</div>

<jsp:include page="../common/shangjia_footer.jsp"/>
