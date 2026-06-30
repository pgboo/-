<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/paotui_header.jsp">
    <jsp:param name="title" value="我的接单"/>
    <jsp:param name="menu" value="order"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-clipboard-list me-2"></i>我的接单信息</h5>
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>订单编号</th>
                    <th>项目</th>
                    <th>费用</th>
                    <th>接单时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="o">
                    <tr>
                        <td>${o.orderNo}</td>
                        <td>${o.projectTitle}</td>
                        <td class="text-danger">¥${o.fee}</td>
                        <td><fmt:formatDate value="${o.jiedanTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${o.status == 0}"><span class="badge bg-warning">待处理</span></c:when>
                                <c:when test="${o.status == 1}"><span class="badge bg-primary">已接受</span></c:when>
                                <c:when test="${o.status == 2}"><span class="badge bg-danger">已拒绝</span></c:when>
                                <c:when test="${o.status == 4}"><span class="badge bg-info">已送达</span></c:when>
                                <c:when test="${o.status == 3}"><span class="badge bg-success">已完成</span></c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${o.status == 1}">
                                <a href="${pageContext.request.contextPath}/paotui/order/deliver/${o.id}" class="btn btn-sm btn-info text-white">确认送达</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/paotui_footer.jsp"/>
