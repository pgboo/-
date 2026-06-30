<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/user_header.jsp">
    <jsp:param name="title" value="编辑动态"/>
    <jsp:param name="menu" value="dongtai"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-edit me-2"></i>编辑动态</h5>
    <form action="${pageContext.request.contextPath}/user/dongtai/update" method="post">
        <input type="hidden" name="id" value="${dongtai.id}">
        <div class="mb-3">
            <label class="form-label">标题</label>
            <input type="text" name="title" class="form-control" value="${dongtai.title}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">内容</label>
            <textarea name="content" rows="6" class="form-control" required>${dongtai.content}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">保存</button>
        <a href="${pageContext.request.contextPath}/user/dongtai/list" class="btn btn-secondary">返回</a>
    </form>
</div>

<jsp:include page="../common/user_footer.jsp"/>
