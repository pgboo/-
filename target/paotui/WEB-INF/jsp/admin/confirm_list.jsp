<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="确认订单管理"/>
    <jsp:param name="menu" value="confirm"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-check-circle me-2"></i>确认订单列表</h5>
        <form action="${pageContext.request.contextPath}/admin/confirm/list" method="get" class="d-flex">
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
                    <th>用户</th>
                    <th>跑腿员</th>
                    <th>费用</th>
                    <th>评分</th>
                    <th>支付</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.orderNo}</td>
                        <td>${c.projectTitle}</td>
                        <td>${c.userName}</td>
                        <td>${c.paotuiName}</td>
                        <td class="text-danger">¥${c.fee}</td>
                        <td>
                            <c:forEach begin="1" end="${c.score}">
                                <i class="fas fa-star text-warning"></i>
                            </c:forEach>
                        </td>
                        <td>
                            <span class="badge ${c.isPay == 1 ? 'bg-success' : 'bg-warning'}">${c.isPay == 1 ? '已支付' : '未支付'}</span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/confirm/delete/${c.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/admin_footer.jsp"/>
