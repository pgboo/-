<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="新增跑腿员"/>
    <jsp:param name="menu" value="paotui"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-plus me-2"></i>新增跑腿员</h5>
    <form action="${pageContext.request.contextPath}/admin/paotui/save" method="post">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">账号</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">密码</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">姓名</label>
                <input type="text" name="name" class="form-control">
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">手机</label>
                <input type="text" name="phone" class="form-control">
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">状态</label>
                <select name="status" class="form-select">
                    <option value="1">启用</option>
                    <option value="0">禁用</option>
                </select>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">保存</button>
        <a href="${pageContext.request.contextPath}/admin/paotui/list" class="btn btn-secondary">返回</a>
    </form>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
