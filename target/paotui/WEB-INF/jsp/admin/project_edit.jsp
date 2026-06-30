<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="编辑项目"/>
    <jsp:param name="menu" value="project"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-edit me-2"></i>编辑跑腿项目</h5>
    <form action="${pageContext.request.contextPath}/admin/project/update" method="post">
        <input type="hidden" name="id" value="${project.id}">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">标题</label>
                <input type="text" name="title" class="form-control" value="${project.title}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">分类</label>
                <select name="fenleiId" class="form-select" required>
                    <c:forEach items="${fenleiList}" var="f">
                        <option value="${f.id}" ${f.id == project.fenleiId ? 'selected' : ''}>${f.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">费用</label>
                <input type="number" step="0.01" name="fee" class="form-control" value="${project.fee}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">状态</label>
                <select name="status" class="form-select">
                    <option value="0" ${project.status == 0 ? 'selected' : ''}>待接单</option>
                    <option value="1" ${project.status == 1 ? 'selected' : ''}>已接单</option>
                    <option value="2" ${project.status == 2 ? 'selected' : ''}>已完成</option>
                </select>
            </div>
            <div class="col-md-12 mb-3">
                <label class="form-label">内容</label>
                <textarea name="content" rows="5" class="form-control" required>${project.content}</textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">保存</button>
        <a href="${pageContext.request.contextPath}/admin/project/list" class="btn btn-secondary">返回</a>
    </form>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
