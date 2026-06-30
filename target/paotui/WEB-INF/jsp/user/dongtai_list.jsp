<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/user_header.jsp">
    <jsp:param name="title" value="动态分享"/>
    <jsp:param name="menu" value="dongtai"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-comments me-2"></i>我的动态分享</h5>
        <a href="${pageContext.request.contextPath}/user/dongtai/add" class="btn btn-primary">
            <i class="fas fa-plus me-1"></i>发布动态
        </a>
    </div>

    <c:forEach items="${list}" var="d">
        <div class="dongtai-item">
            <div class="d-flex justify-content-between">
                <h5>${d.title}</h5>
                <div>
                    <a href="${pageContext.request.contextPath}/user/dongtai/edit/${d.id}" class="btn btn-sm btn-outline-primary">编辑</a>
                    <a href="${pageContext.request.contextPath}/user/dongtai/delete/${d.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                </div>
            </div>
            <p class="text-muted">${d.content}</p>
            <div class="text-muted small">
                <i class="far fa-eye me-1"></i>${d.viewCount} &nbsp;
                <i class="far fa-clock me-1"></i><fmt:formatDate value="${d.createTime}" pattern="yyyy-MM-dd HH:mm"/>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="../common/user_footer.jsp"/>
