<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/user_header.jsp">
    <jsp:param name="title" value="用户首页"/>
    <jsp:param name="menu" value="index"/>
</jsp:include>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card card-stats p-4">
            <div class="d-flex align-items-center">
                <div class="bg-primary bg-opacity-10 p-3 rounded">
                    <i class="fas fa-tasks fa-2x text-primary"></i>
                </div>
                <div class="ms-3">
                    <div class="text-muted">我的项目</div>
                    <h3 class="m-0">${myProjectCount}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card card-stats p-4">
            <div class="d-flex align-items-center">
                <div class="bg-success bg-opacity-10 p-3 rounded">
                    <i class="fas fa-clipboard-list fa-2x text-success"></i>
                </div>
                <div class="ms-3">
                    <div class="text-muted">我的订单</div>
                    <h3 class="m-0">${myOrderCount}</h3>
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
                    <div class="text-muted">用户名</div>
                    <h5 class="m-0">${user.name}</h5>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header bg-white">
        <h5 class="m-0"><i class="fas fa-bullhorn me-2"></i>最新公告</h5>
    </div>
    <div class="card-body">
        <c:forEach items="${gonggaoList}" var="g" begin="0" end="4">
            <div class="border-bottom pb-2 mb-2">
                <div class="fw-bold">${g.title}</div>
                <small class="text-muted"><fmt:formatDate value="${g.createTime}" pattern="yyyy-MM-dd HH:mm"/></small>
                <p class="text-muted mb-0">${g.content}</p>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="../common/user_footer.jsp"/>
