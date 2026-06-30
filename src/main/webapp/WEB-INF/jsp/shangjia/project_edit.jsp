<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/shangjia_header.jsp">
    <jsp:param name="title" value="编辑跑腿项目"/>
    <jsp:param name="menu" value="project"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-edit me-2"></i>编辑跑腿项目</h5>
    <form action="${pageContext.request.contextPath}/shangjia/project/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${project.id}">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">标题</label>
                <input type="text" name="title" class="form-control" value="${project.title}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">分类</label>
                <select name="fenleiId" class="form-select" required>
                    <c:forEach items="${fenleiList}" var="f">
                        <option value="${f.id}" ${f.id == project.fenleiId ? 'selected' : ''}>${f.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">跑腿费用（元）</label>
                <input type="number" step="0.01" name="fee" class="form-control" value="${project.fee}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">要求时间</label>
                <input type="datetime-local" name="requireTime" class="form-control"
                       value='<fmt:formatDate value="${project.requireTime}" pattern="yyyy-MM-dd'T'HH:mm"/>' required>
            </div>
            <div class="col-md-12 mb-3">
                <label class="form-label">封面图片</label>
                <input type="file" name="file" class="form-control">
                <img src="${project.cover != null ? project.cover : pageContext.request.contextPath.concat('/static/images/default.svg')}"
                     style="width:120px;height:90px;object-fit:cover;border-radius:6px;margin-top:10px;">
            </div>
            <div class="col-md-12 mb-3">
                <label class="form-label">项目内容/要求</label>
                <textarea name="content" rows="5" class="form-control" required>${project.content}</textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-warning text-white">保存</button>
        <a href="${pageContext.request.contextPath}/shangjia/project/list" class="btn btn-secondary">返回</a>
    </form>
</div>

<jsp:include page="../common/shangjia_footer.jsp"/>
