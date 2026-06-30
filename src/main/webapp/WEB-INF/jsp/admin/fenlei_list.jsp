<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="分类管理"/>
    <jsp:param name="menu" value="fenlei"/>
</jsp:include>

<div class="row">
    <div class="col-lg-5">
        <div class="table-card">
            <h5 class="mb-4"><i class="fas fa-plus me-2"></i>新增分类</h5>
            <form action="${pageContext.request.contextPath}/admin/fenlei/save" method="post">
                <div class="mb-3">
                    <label class="form-label">分类名称</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">新增</button>
            </form>
        </div>
    </div>
    <div class="col-lg-7">
        <div class="table-card">
            <h5 class="mb-4"><i class="fas fa-tags me-2"></i>分类列表</h5>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>名称</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="f">
                            <tr>
                                <td>${f.id}</td>
                                <td>${f.name}</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary" onclick="editFenlei(${f.id}, '${f.name}')">编辑</button>
                                    <a href="${pageContext.request.contextPath}/admin/fenlei/delete/${f.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- 编辑弹窗 -->
<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/fenlei/update" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">编辑分类</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="editId">
                    <div class="mb-3">
                        <label class="form-label">分类名称</label>
                        <input type="text" name="name" id="editName" class="form-control" required>
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
    function editFenlei(id, name) {
        document.getElementById('editId').value = id;
        document.getElementById('editName').value = name;
        new bootstrap.Modal(document.getElementById('editModal')).show();
    }
</script>

<jsp:include page="../common/admin_footer.jsp"/>
