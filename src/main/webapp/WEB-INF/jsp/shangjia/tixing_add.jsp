<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/shangjia_header.jsp">
    <jsp:param name="title" value="新建提醒"/>
    <jsp:param name="menu" value="tixing"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-plus me-2"></i>新建提醒</h5>
    <form action="${pageContext.request.contextPath}/shangjia/tixing/save" method="post">
        <div class="mb-3">
            <label class="form-label">提醒标题</label>
            <input type="text" name="title" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">关联订单号</label>
            <input type="text" name="orderNo" class="form-control" placeholder="选填">
        </div>
        <div class="mb-3">
            <label class="form-label">提醒内容</label>
            <textarea name="content" rows="5" class="form-control" required></textarea>
        </div>
        <button type="submit" class="btn btn-warning text-white">保存</button>
        <a href="${pageContext.request.contextPath}/shangjia/tixing/list" class="btn btn-secondary">返回</a>
    </form>
</div>

<jsp:include page="../common/shangjia_footer.jsp"/>
