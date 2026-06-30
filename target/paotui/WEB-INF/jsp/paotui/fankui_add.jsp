<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/paotui_header.jsp">
    <jsp:param name="title" value="新增反馈"/>
    <jsp:param name="menu" value="fankui"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-plus me-2"></i>新增交易反馈</h5>
    <form action="${pageContext.request.contextPath}/paotui/fankui/save" method="post">
        <div class="mb-3">
            <label class="form-label">选择订单</label>
            <select name="orderNo" class="form-select" required>
                <option value="">请选择</option>
                <c:forEach items="${confirmList}" var="c">
                    <option value="${c.orderNo}">${c.orderNo} - ${c.projectTitle}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">反馈内容</label>
            <textarea name="content" rows="6" class="form-control" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">提交</button>
        <a href="${pageContext.request.contextPath}/paotui/fankui/list" class="btn btn-secondary">返回</a>
    </form>
</div>

<jsp:include page="../common/paotui_footer.jsp"/>
