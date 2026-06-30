<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/user_header.jsp">
    <jsp:param name="title" value="确认订单"/>
    <jsp:param name="menu" value="order"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-check-circle me-2"></i>确认订单</h5>
    <form action="${pageContext.request.contextPath}/user/order/doConfirm" method="post">
        <input type="hidden" name="orderId" value="${order.id}">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">订单编号</label>
                <input type="text" class="form-control" value="${order.orderNo}" disabled>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">跑腿员</label>
                <input type="text" class="form-control" value="${order.paotuiName}" disabled>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">跑腿员手机</label>
                <input type="text" class="form-control" value="${order.paotuiPhone}" disabled>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">跑腿费用</label>
                <input type="text" class="form-control" value="¥${order.fee}" disabled>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">评分</label>
                <select name="score" class="form-select">
                    <option value="5">5星</option>
                    <option value="4">4星</option>
                    <option value="3">3星</option>
                    <option value="2">2星</option>
                    <option value="1">1星</option>
                </select>
            </div>
            <div class="col-md-12 mb-3">
                <label class="form-label">备注</label>
                <textarea name="remark" rows="3" class="form-control"></textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-success">确认并完成</button>
        <a href="${pageContext.request.contextPath}/user/order/list" class="btn btn-secondary">返回</a>
    </form>
</div>

<jsp:include page="../common/user_footer.jsp"/>
