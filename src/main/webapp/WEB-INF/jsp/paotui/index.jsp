<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/paotui_header.jsp">
    <jsp:param name="title" value="跑腿员首页"/>
    <jsp:param name="menu" value="index"/>
</jsp:include>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card card-stats p-4">
            <div class="d-flex align-items-center">
                <div class="bg-primary bg-opacity-10 p-3 rounded">
                    <i class="fas fa-clipboard-list fa-2x text-primary"></i>
                </div>
                <div class="ms-3">
                    <div class="text-muted">我的接单</div>
                    <h3 class="m-0">${myJiedanCount}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card card-stats p-4">
            <div class="d-flex align-items-center">
                <div class="bg-success bg-opacity-10 p-3 rounded">
                    <i class="fas fa-check-circle fa-2x text-success"></i>
                </div>
                <div class="ms-3">
                    <div class="text-muted">确认订单</div>
                    <h3 class="m-0">${myConfirmCount}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card card-stats p-4">
            <div class="d-flex align-items-center">
                <div class="bg-info bg-opacity-10 p-3 rounded">
                    <i class="fas fa-user fa-2x text-info"></i>
                </div>
                <div class="ms-3">
                    <div class="text-muted">姓名</div>
                    <h5 class="m-0">${paotui.name}</h5>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <h5>欢迎使用校园跑腿跑腿员中心</h5>
        <p class="text-muted">请及时查看可接单项目，为用户提供优质的跑腿服务。</p>
        <a href="${pageContext.request.contextPath}/paotui/project/list" class="btn btn-primary">去接单</a>
    </div>
</div>

<jsp:include page="../common/paotui_footer.jsp"/>
