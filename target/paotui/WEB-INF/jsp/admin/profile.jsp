<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/admin_header.jsp">
    <jsp:param name="title" value="个人中心"/>
    <jsp:param name="menu" value="profile"/>
</jsp:include>

<div class="row g-4">
    <div class="col-lg-4">
        <div class="card card-stats h-100">
            <div class="card-body text-center">
                <div class="mb-3">
                    <i class="fas fa-user-circle text-primary" style="font-size: 80px;"></i>
                </div>
                <h4 class="mb-1">${admin.name}</h4>
                <p class="text-muted mb-3">${admin.role == 'admin' ? '超级管理员' : '管理员'}</p>
                <hr>
                <div class="text-start">
                    <p class="mb-2">
                        <span class="text-muted">账号：</span>
                        <span class="fw-bold">${admin.username}</span>
                    </p>
                    <p class="mb-2">
                        <span class="text-muted">姓名：</span>
                        <span class="fw-bold">${admin.name}</span>
                    </p>
                    <p class="mb-2">
                        <span class="text-muted">角色：</span>
                        <span class="fw-bold">${admin.role}</span>
                    </p>
                    <p class="mb-0">
                        <span class="text-muted">创建时间：</span>
                        <span class="fw-bold"><fmt:formatDate value="${admin.createTime}" pattern="yyyy-MM-dd HH:mm"/></span>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-8">
        <div class="card card-stats mb-4">
            <div class="card-body">
                <h5 class="card-title mb-4"><i class="fas fa-edit me-2"></i>修改资料</h5>
                <form action="${pageContext.request.contextPath}/admin/updateProfile" method="post">
                    <div class="mb-3">
                        <label class="form-label">账号</label>
                        <input type="text" class="form-control" value="${admin.username}" disabled>
                        <div class="form-text">账号不可修改</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">姓名</label>
                        <input type="text" name="name" class="form-control" value="${admin.name}" required>
                    </div>
                    <button type="submit" class="btn btn-primary">保存资料</button>
                </form>
            </div>
        </div>

        <div class="card card-stats">
            <div class="card-body">
                <h5 class="card-title mb-4"><i class="fas fa-lock me-2"></i>修改密码</h5>
                <form action="${pageContext.request.contextPath}/admin/updatePassword" method="post" onsubmit="return checkPassword()">
                    <div class="mb-3">
                        <label class="form-label">新密码</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">确认新密码</label>
                        <input type="password" id="confirmPassword" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-warning text-white">修改密码</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function checkPassword() {
        var pwd = document.getElementById('password').value;
        var confirm = document.getElementById('confirmPassword').value;
        if (pwd !== confirm) {
            alert('两次输入的密码不一致');
            return false;
        }
        return true;
    }
</script>

<jsp:include page="../common/admin_footer.jsp"/>
