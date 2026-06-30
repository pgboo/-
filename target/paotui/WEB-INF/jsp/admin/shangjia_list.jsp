<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="商家管理"/>
    <jsp:param name="menu" value="shangjia"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-store me-2"></i>商家列表</h5>
        <div class="d-flex gap-2">
            <form action="${pageContext.request.contextPath}/admin/shangjia/list" method="get" class="d-flex">
                <input type="text" name="keyword" value="${keyword}" class="form-control form-control-sm" placeholder="搜索">
                <button type="submit" class="btn btn-sm btn-outline-primary ms-2"><i class="fas fa-search"></i></button>
            </form>
            <a href="${pageContext.request.contextPath}/admin/shangjia/add" class="btn btn-sm btn-primary"><i class="fas fa-plus"></i> 新增</a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>账号</th>
                    <th>名称</th>
                    <th>联系人</th>
                    <th>手机</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="s">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.username}</td>
                        <td>${s.name}</td>
                        <td>${s.contact}</td>
                        <td>${s.phone}</td>
                        <td>
                            <span class="badge ${s.status == 1 ? 'bg-success' : 'bg-secondary'}">${s.status == 1 ? '启用' : '禁用'}</span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/shangjia/edit/${s.id}" class="btn btn-sm btn-outline-primary">编辑</a>
                            <a href="${pageContext.request.contextPath}/admin/shangjia/delete/${s.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
