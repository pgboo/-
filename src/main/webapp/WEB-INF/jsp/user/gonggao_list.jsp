<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/user_header.jsp">
    <jsp:param name="title" value="系统公告"/>
    <jsp:param name="menu" value="gonggao"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-bullhorn me-2"></i>系统公告</h5>
    <c:forEach items="${list}" var="g">
        <div class="border-bottom pb-3 mb-3">
            <h5>${g.title}</h5>
            <small class="text-muted"><i class="far fa-clock me-1"></i><fmt:formatDate value="${g.createTime}" pattern="yyyy-MM-dd HH:mm"/></small>
            <p class="mt-2">${g.content}</p>
        </div>
    </c:forEach>
</div>

<jsp:include page="../common/user_footer.jsp"/>
