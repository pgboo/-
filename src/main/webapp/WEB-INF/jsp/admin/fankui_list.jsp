<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="交易反馈管理"/>
    <jsp:param name="menu" value="fankui"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-comment-dots me-2"></i>交易反馈列表</h5>
        <form action="${pageContext.request.contextPath}/admin/fankui/list" method="get" class="d-flex">
            <input type="text" name="keyword" value="${keyword}" class="form-control form-control-sm" placeholder="搜索">
            <button type="submit" class="btn btn-sm btn-outline-primary ms-2"><i class="fas fa-search"></i></button>
        </form>
    </div>

    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>订单编号</th>
                    <th>项目</th>
                    <th>反馈人</th>
                    <th>内容</th>
                    <th>反馈时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="f">
                    <tr>
                        <td>${f.id}</td>
                        <td>${f.orderNo}</td>
                        <td>${f.projectTitle}</td>
                        <td>${f.paotuiName}</td>
                        <td>${f.content}</td>
                        <td><fmt:formatDate value="${f.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/fankui/delete/${f.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
