<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/shangjia_header.jsp">
    <jsp:param name="title" value="提醒信息管理"/>
    <jsp:param name="menu" value="tixing"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-bell me-2"></i>提醒信息</h5>
        <a href="${pageContext.request.contextPath}/shangjia/tixing/add" class="btn btn-warning text-white">
            <i class="fas fa-plus me-1"></i>新建提醒
        </a>
    </div>

    <c:forEach items="${list}" var="t">
        <div class="alert ${t.status == 0 ? 'alert-warning' : 'alert-light'} d-flex justify-content-between align-items-center">
            <div>
                <h6 class="alert-heading mb-1">${t.title}
                    <c:if test="${t.status == 0}"><span class="badge bg-danger ms-2">未读</span></c:if>
                </h6>
                <p class="mb-1">${t.content}</p>
                <small class="text-muted"><fmt:formatDate value="${t.createTime}" pattern="yyyy-MM-dd HH:mm"/></small>
            </div>
            <div>
                <c:if test="${t.status == 0}">
                    <a href="${pageContext.request.contextPath}/shangjia/tixing/read/${t.id}" class="btn btn-sm btn-outline-success">标记已读</a>
                </c:if>
                <a href="${pageContext.request.contextPath}/shangjia/tixing/delete/${t.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="../common/shangjia_footer.jsp"/>
