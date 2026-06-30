<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/paotui_header.jsp">
    <jsp:param name="title" value="交易反馈"/>
    <jsp:param name="menu" value="fankui"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-comment-dots me-2"></i>我的交易反馈</h5>
        <a href="${pageContext.request.contextPath}/paotui/fankui/add" class="btn btn-primary">
            <i class="fas fa-plus me-1"></i>新增反馈
        </a>
    </div>

    <c:forEach items="${list}" var="f">
        <div class="dongtai-item">
            <div class="d-flex justify-content-between">
                <div>
                    <span class="badge bg-secondary">${f.orderNo}</span>
                    <span class="text-muted ms-2">${f.projectTitle}</span>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/paotui/fankui/edit/${f.id}" class="btn btn-sm btn-outline-primary">编辑</a>
                    <a href="${pageContext.request.contextPath}/paotui/fankui/delete/${f.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                </div>
            </div>
            <p class="mt-2 mb-1">${f.content}</p>
            <small class="text-muted"><fmt:formatDate value="${f.createTime}" pattern="yyyy-MM-dd HH:mm"/></small>
        </div>
    </c:forEach>
</div>

<jsp:include page="../common/paotui_footer.jsp"/>
