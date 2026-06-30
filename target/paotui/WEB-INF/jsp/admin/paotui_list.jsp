<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="跑腿员管理"/>
    <jsp:param name="menu" value="paotui"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-running me-2"></i>跑腿员列表</h5>
        <div class="d-flex gap-2">
            <form action="${pageContext.request.contextPath}/admin/paotui/list" method="get" class="d-flex">
                <input type="text" name="keyword" value="${keyword}" class="form-control form-control-sm" placeholder="搜索">
                <button type="submit" class="btn btn-sm btn-outline-primary ms-2"><i class="fas fa-search"></i></button>
            </form>
            <a href="${pageContext.request.contextPath}/admin/paotui/add" class="btn btn-sm btn-primary"><i class="fas fa-plus"></i> 新增</a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>账号</th>
                    <th>姓名</th>
                    <th>手机</th>
                    <th>状态</th>
                    <th>注册时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.username}</td>
                        <td>${u.name}</td>
                        <td>${u.phone}</td>
                        <td>
                            <span class="badge ${u.status == 1 ? 'bg-success' : 'bg-secondary'}">${u.status == 1 ? '启用' : '禁用'}</span>
                        </td>
                        <td><fmt:formatDate value="${u.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/paotui/edit/${u.id}" class="btn btn-sm btn-outline-primary">编辑</a>
                            <a href="${pageContext.request.contextPath}/admin/paotui/delete/${u.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
