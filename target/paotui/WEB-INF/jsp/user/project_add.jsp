<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/user_header.jsp">
    <jsp:param name="title" value="发布跑腿项目"/>
    <jsp:param name="menu" value="project"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-plus me-2"></i>发布跑腿项目</h5>
    <form action="${pageContext.request.contextPath}/user/project/save" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">标题</label>
                <input type="text" name="title" class="form-control" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">分类</label>
                <select name="fenleiId" class="form-select" required>
                    <option value="">请选择</option>
                    <c:forEach items="${fenleiList}" var="f">
                        <option value="${f.id}">${f.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">跑腿费用（元）</label>
                <input type="number" step="0.01" name="fee" class="form-control" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">要求时间</label>
                <input type="datetime-local" name="requireTime" class="form-control" required>
            </div>
            <div class="col-md-12 mb-3">
                <label class="form-label">封面图片</label>
                <input type="file" name="file" class="form-control">
            </div>
            <div class="col-md-12 mb-3">
                <label class="form-label">项目内容/要求</label>
                <textarea name="content" rows="5" class="form-control" required></textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">发布</button>
        <a href="${pageContext.request.contextPath}/user/project/list" class="btn btn-secondary">返回</a>
    </form>
</div>

<jsp:include page="../common/user_footer.jsp"/>
