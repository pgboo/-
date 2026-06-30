<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="接单信息管理"/>
    <jsp:param name="menu" value="order"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-clipboard-list me-2"></i>接单信息列表</h5>
        <form action="${pageContext.request.contextPath}/admin/order/list" method="get" class="d-flex">
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
                    <th>跑腿员</th>
                    <th>费用</th>
                    <th>状态</th>
                    <th>接单时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="o">
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.orderNo}</td>
                        <td>${o.projectTitle}</td>
                        <td>${o.paotuiName}</td>
                        <td class="text-danger">¥${o.fee}</td>
                        <td>
                            <c:choose>
                                <c:when test="${o.status == 0}"><span class="badge bg-warning">待处理</span></c:when>
                                <c:when test="${o.status == 1}"><span class="badge bg-primary">已接受</span></c:when>
                                <c:when test="${o.status == 2}"><span class="badge bg-danger">已拒绝</span></c:when>
                                <c:when test="${o.status == 4}"><span class="badge bg-info">已送达</span></c:when>
                                <c:when test="${o.status == 3}"><span class="badge bg-success">已完成</span></c:when>
                            </c:choose>
                        </td>
                        <td><fmt:formatDate value="${o.jiedanTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/order/delete/${o.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
