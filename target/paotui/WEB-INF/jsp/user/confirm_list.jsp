<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/user_header.jsp">
    <jsp:param name="title" value="确认订单管理"/>
    <jsp:param name="menu" value="confirm"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-check-circle me-2"></i>我的确认订单</h5>
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>订单编号</th>
                    <th>项目</th>
                    <th>跑腿员</th>
                    <th>费用</th>
                    <th>确认时间</th>
                    <th>评分</th>
                    <th>支付状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="c">
                    <tr>
                        <td>${c.orderNo}</td>
                        <td>${c.projectTitle}</td>
                        <td>${c.paotuiName}</td>
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
                        <td>
                            <c:if test="${c.isPay == 0}">
                                <a href="${pageContext.request.contextPath}/user/confirm/pay/${c.id}" class="btn btn-sm btn-success">支付</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/user_footer.jsp"/>
