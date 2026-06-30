<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="跑腿项目管理"/>
    <jsp:param name="menu" value="project"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-tasks me-2"></i>跑腿项目列表</h5>
        <form action="${pageContext.request.contextPath}/admin/project/list" method="get" class="d-flex">
            <input type="text" name="keyword" value="${keyword}" class="form-control form-control-sm" placeholder="搜索">
            <button type="submit" class="btn btn-sm btn-outline-primary ms-2"><i class="fas fa-search"></i></button>
        </form>
    </div>

    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>标题</th>
                    <th>分类</th>
                    <th>发布人</th>
                    <th>费用</th>
                    <th>状态</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.title}</td>
                        <td>${p.fenleiName}</td>
                        <td>${p.userName != null ? p.userName : p.shangjiaName}</td>
                        <td class="text-danger">¥${p.fee}</td>
                        <td>
                            <c:choose>
                                <c:when test="${p.status == 0}"><span class="badge bg-warning">待接单</span></c:when>
                                <c:when test="${p.status == 1}"><span class="badge bg-primary">已接单</span></c:when>
                                <c:when test="${p.status == 2}"><span class="badge bg-success">已完成</span></c:when>
                            </c:choose>
                        </td>
                        <td><fmt:formatDate value="${p.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/project/edit/${p.id}" class="btn btn-sm btn-outline-primary">编辑</a>
                            <a href="${pageContext.request.contextPath}/admin/project/delete/${p.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
