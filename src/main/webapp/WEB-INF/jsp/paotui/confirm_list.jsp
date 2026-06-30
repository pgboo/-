<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/paotui_header.jsp">
    <jsp:param name="title" value="确认订单"/>
    <jsp:param name="menu" value="confirm"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-check-circle me-2"></i>用户确认订单</h5>
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>订单编号</th>
                    <th>项目</th>
                    <th>用户</th>
                    <th>用户手机</th>
                    <th>费用</th>
                    <th>确认时间</th>
                    <th>评分</th>
                    <th>是否支付</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="c">
                    <tr>
                        <td>${c.orderNo}</td>
                        <td>${c.projectTitle}</td>
                        <td>${c.userName}</td>
                        <td>${c.userPhone}</td>
                        <td class="text-danger">¥${c.fee}</td>
                        <td><fmt:formatDate value="${c.confirmTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <c:forEach begin="1" end="${c.score}">
                                <i class="fas fa-star text-warning"></i>
                            </c:forEach>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${c.isPay == 0}"><span class="badge bg-warning">未支付</span></c:when>
                                <c:when test="${c.isPay == 1}"><span class="badge bg-success">已支付</span></c:when>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/paotui_footer.jsp"/>
