<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="动态分享管理"/>
    <jsp:param name="menu" value="dongtai"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-comments me-2"></i>动态分享列表</h5>
        <form action="${pageContext.request.contextPath}/admin/dongtai/list" method="get" class="d-flex">
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
                    <th>发布人</th>
                    <th>浏览量</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="d">
                    <tr>
                        <td>${d.id}</td>
                        <td>${d.title}</td>
                        <td>${d.userName}</td>
                        <td>${d.viewCount}</td>
                        <td><fmt:formatDate value="${d.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/dongtai/delete/${d.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
