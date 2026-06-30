<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/paotui_header.jsp">
    <jsp:param name="title" value="可接单项目"/>
    <jsp:param name="menu" value="project"/>
</jsp:include>

<div class="table-card">
    <h5 class="mb-4"><i class="fas fa-list me-2"></i>可接单项目</h5>

    <form action="${pageContext.request.contextPath}/paotui/project/list" method="get" class="row g-2 mb-4">
        <div class="col-md-3">
            <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="搜索标题/内容">
        </div>
        <div class="col-md-3">
            <select name="fenleiId" class="form-select">
                <option value="">全部分类</option>
                <c:forEach items="${fenleiList}" var="f">
                    <option value="${f.id}" ${f.id == fenleiId ? 'selected' : ''}>${f.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-outline-primary"><i class="fas fa-search"></i></button>
        </div>
    </form>

    <div class="row g-4">
        <c:forEach items="${list}" var="p">
            <div class="col-md-6 col-lg-4">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="${p.cover != null ? p.cover : pageContext.request.contextPath.concat('/static/images/default.svg')}"
                         class="card-img-top" style="height:180px;object-fit:cover;">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="badge bg-info">${p.fenleiName}</span>
                            <span class="badge bg-warning">待接单</span>
                        </div>
                        <h5 class="card-title">${p.title}</h5>
                        <p class="card-text text-muted text-truncate">${p.content}</p>
                        <div class="d-flex justify-content-between">
                            <span class="text-danger fw-bold">¥${p.fee}</span>
                            <small class="text-muted"><fmt:formatDate value="${p.requireTime}" pattern="MM-dd HH:mm"/></small>
                        </div>
                        <button onclick="jiedan(${p.id})" class="btn btn-success w-100 mt-3">立即接单</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script>
    function jiedan(projectId) {
        if (!confirm('确认接单？')) return;
        $.post('${pageContext.request.contextPath}/paotui/project/jiedan', {projectId: projectId}, function(res) {
            alert(res.msg);
            if (res.code === 0) location.reload();
        }, 'json');
    }
</script>

<jsp:include page="../common/paotui_footer.jsp"/>
