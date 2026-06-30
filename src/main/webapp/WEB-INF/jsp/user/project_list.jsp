<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/user_header.jsp">
    <jsp:param name="title" value="跑腿项目管理"/>
    <jsp:param name="menu" value="project"/>
</jsp:include>

<div class="table-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="m-0"><i class="fas fa-tasks me-2"></i>我的跑腿项目</h5>
        <a href="${pageContext.request.contextPath}/user/project/add" class="btn btn-primary">
            <i class="fas fa-plus me-1"></i>发布项目
        </a>
    </div>

    <form action="${pageContext.request.contextPath}/user/project/list" method="get" class="row g-2 mb-4">
        <div class="col-md-3">
            <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="搜索标题/内容">
        </div>
        <div class="col-md-3">
            <select name="fenleiId" class="form-select" aria-label="按分类筛选">
                <option value="">全部分类</option>
                <c:forEach items="${fenleiList}" var="f">
                    <option value="${f.id}" ${f.id == fenleiId ? 'selected' : ''}>${f.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-outline-primary" aria-label="搜索"><i class="fas fa-search"></i></button>
        </div>
    </form>

    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>封面</th>
                    <th>标题</th>
                    <th>分类</th>
                    <th>费用</th>
                    <th>要求时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="p">
                    <tr>
                        <td>
                            <img src="${p.cover != null ? p.cover : pageContext.request.contextPath.concat('/static/images/default.svg')}"
                                 alt="项目封面"
                                 style="width:60px;height:45px;object-fit:cover;border-radius:6px;">
                        </td>
                        <td>${p.title}</td>
                        <td>${p.fenleiName}</td>
                        <td class="text-danger">¥${p.fee}</td>
                        <td><fmt:formatDate value="${p.requireTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${p.status == 0}"><span class="badge bg-warning">待接单</span></c:when>
                                <c:when test="${p.status == 1}"><span class="badge bg-primary">已接单</span></c:when>
                                <c:when test="${p.status == 2}"><span class="badge bg-success">已完成</span></c:when>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/project/edit/${p.id}" class="btn btn-sm btn-outline-primary">编辑</a>
                            <a href="${pageContext.request.contextPath}/user/project/delete/${p.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('确认删除？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/user_footer.jsp"/>
