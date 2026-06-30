<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="公告管理"/>
    <jsp:param name="menu" value="gonggao"/>
</jsp:include>

<div class="row">
    <div class="col-lg-5">
        <div class="table-card">
            <h5 class="mb-4"><i class="fas fa-plus me-2"></i>新增公告</h5>
            <form action="${pageContext.request.contextPath}/admin/gonggao/save" method="post">
                <div class="mb-3">
                    <label class="form-label">标题</label>
                    <input type="text" name="title" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">内容</label>
                    <textarea name="content" rows="5" class="form-control" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">新增</button>
            </form>
        </div>
    </div>
    <div class="col-lg-7">
        <div class="table-card">
            <h5 class="mb-4"><i class="fas fa-bullhorn me-2"></i>公告列表</h5>
            <c:forEach items="${list}" var="g">
                <div class="border-bottom pb-3 mb-3">
                    <div class="d-flex justify-content-between">
                        <h6 class="fw-bold">${g.title}</h6>
                        <div>
                            <button class="btn btn-sm btn-outline-primary" onclick="editGonggao(${g.id}, '${g.title}', '${g.content}')">编辑</button>
                            <a href="${pageContext.request.contextPath}/admin/gonggao/delete/${g.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </div>
                    </div>
                    <p class="mb-1">${g.content}</p>
                    <small class="text-muted"><fmt:formatDate value="${g.createTime}" pattern="yyyy-MM-dd HH:mm"/></small>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/gonggao/update" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">编辑公告</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="editId">
                    <div class="mb-3">
                        <label class="form-label">标题</label>
                        <input type="text" name="title" id="editTitle" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">内容</label>
                        <textarea name="content" id="editContent" rows="5" class="form-control" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function editGonggao(id, title, content) {
        document.getElementById('editId').value = id;
        document.getElementById('editTitle').value = title;
        document.getElementById('editContent').value = content;
        new bootstrap.Modal(document.getElementById('editModal')).show();
    }
</script>

<jsp:include page="../common/admin_footer.jsp"/>
