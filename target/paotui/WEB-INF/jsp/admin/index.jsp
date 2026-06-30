<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="管理首页"/>
    <jsp:param name="menu" value="index"/>
</jsp:include>

<div class="row g-4 mb-4">
    <div class="col-md-4 col-lg-2">
        <div class="card card-stats h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">用户总数</p>
                        <h3 class="mb-0">${userCount}</h3>
                    </div>
                    <div class="bg-primary bg-opacity-10 p-3 rounded">
                        <i class="fas fa-users text-primary fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 col-lg-2">
        <div class="card card-stats h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">跑腿员总数</p>
                        <h3 class="mb-0">${paotuiCount}</h3>
                    </div>
                    <div class="bg-success bg-opacity-10 p-3 rounded">
                        <i class="fas fa-biking text-success fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 col-lg-2">
        <div class="card card-stats h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">商家总数</p>
                        <h3 class="mb-0">${shangjiaCount}</h3>
                    </div>
                    <div class="bg-info bg-opacity-10 p-3 rounded">
                        <i class="fas fa-store text-info fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 col-lg-2">
        <div class="card card-stats h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">跑腿项目</p>
                        <h3 class="mb-0">${projectCount}</h3>
                    </div>
                    <div class="bg-warning bg-opacity-10 p-3 rounded">
                        <i class="fas fa-tasks text-warning fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 col-lg-2">
        <div class="card card-stats h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">接单订单</p>
                        <h3 class="mb-0">${orderCount}</h3>
                    </div>
                    <div class="bg-danger bg-opacity-10 p-3 rounded">
                        <i class="fas fa-clipboard-list text-danger fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 col-lg-2">
        <div class="card card-stats h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">动态分享</p>
                        <h3 class="mb-0">${dongtaiCount}</h3>
                    </div>
                    <div class="bg-secondary bg-opacity-10 p-3 rounded">
                        <i class="fas fa-comments text-secondary fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row g-4 mb-4">
    <div class="col-lg-6">
        <div class="card card-stats h-100">
            <div class="card-body">
                <h5 class="card-title mb-4"><i class="fas fa-chart-pie me-2"></i>跑腿项目状态分布</h5>
                <canvas id="projectStatusChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="card card-stats h-100">
            <div class="card-body">
                <h5 class="card-title mb-4"><i class="fas fa-chart-bar me-2"></i>平台角色分布</h5>
                <canvas id="roleChart"></canvas>
            </div>
        </div>
    </div>
</div>

<div class="row g-4">
    <div class="col-lg-8">
        <div class="card card-stats h-100">
            <div class="card-body">
                <h5 class="card-title mb-4"><i class="fas fa-chart-line me-2"></i>接单订单状态分布</h5>
                <canvas id="orderStatusChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="card card-stats h-100">
            <div class="card-body">
                <h5 class="card-title mb-4"><i class="fas fa-bullhorn me-2"></i>最新公告</h5>
                <ul class="list-group list-group-flush">
                    <c:forEach items="${gonggaoList}" var="g">
                        <li class="list-group-item px-0">
                            <div class="d-flex w-100 justify-content-between">
                                <small class="text-muted"><fmt:formatDate value="${g.createTime}" pattern="yyyy-MM-dd HH:mm"/></small>
                            </div>
                            <p class="mb-1 fw-bold">${g.title}</p>
                        </li>
                    </c:forEach>
                    <c:if test="${empty gonggaoList}">
                        <li class="list-group-item px-0 text-muted">暂无公告</li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    new Chart(document.getElementById('projectStatusChart'), {
        type: 'doughnut',
        data: {
            labels: ['待接单', '已接单', '已完成'],
            datasets: [{
                data: [${projectPending}, ${projectAccepted}, ${projectCompleted}],
                backgroundColor: ['#ffc107', '#0d6efd', '#198754']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'bottom' }
            }
        }
    });

    new Chart(document.getElementById('roleChart'), {
        type: 'bar',
        data: {
            labels: ['用户', '跑腿员', '商家'],
            datasets: [{
                label: '数量',
                data: [${userCount}, ${paotuiCount}, ${shangjiaCount}],
                backgroundColor: ['#0d6efd', '#198754', '#0dcaf0']
            }]
        },
        options: {
            responsive: true,
            scales: { y: { beginAtZero: true } },
            plugins: { legend: { display: false } }
        }
    });

    new Chart(document.getElementById('orderStatusChart'), {
        type: 'line',
        data: {
            labels: ['待处理', '已接受', '已拒绝', '已完成'],
            datasets: [{
                label: '订单数',
                data: [${orderPending}, ${orderAccepted}, ${orderRejected}, ${orderDone}],
                borderColor: '#dc3545',
                backgroundColor: 'rgba(220, 53, 69, 0.1)',
                tension: 0.3,
                fill: true
            }]
        },
        options: {
            responsive: true,
            scales: { y: { beginAtZero: true } },
            plugins: { legend: { display: false } }
        }
    });
</script>

<jsp:include page="../common/admin_footer.jsp"/>
