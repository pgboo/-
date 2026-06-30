<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/paotui_header.jsp">
    <jsp:param name="title" value="个人中心"/>
    <jsp:param name="menu" value="profile"/>
</jsp:include>

<div class="row">
    <div class="col-lg-6">
        <div class="table-card">
            <h5 class="mb-4"><i class="fas fa-user-edit me-2"></i>修改资料</h5>
            <form action="${pageContext.request.contextPath}/paotui/updateProfile" method="post" enctype="multipart/form-data">
                <div class="text-center mb-4">
                    <img src="${paotui.avatar != null ? paotui.avatar : pageContext.request.contextPath.concat('/static/images/avatar.svg')}"
                         class="rounded-circle" style="width:100px;height:100px;object-fit:cover;">
                </div>
                <div class="mb-3">
                    <label class="form-label">头像</label>
                    <input type="file" name="file" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">账号</label>
                    <input type="text" class="form-control" value="${paotui.username}" disabled>
                </div>
                <div class="mb-3">
                    <label class="form-label">姓名</label>
                    <input type="text" name="name" class="form-control" value="${paotui.name}">
                </div>
                <div class="mb-3">
                    <label class="form-label">手机</label>
                    <input type="text" name="phone" class="form-control" value="${paotui.phone}">
                </div>
                <button type="submit" class="btn btn-primary">保存修改</button>
            </form>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="table-card">
            <h5 class="mb-4"><i class="fas fa-lock me-2"></i>修改密码</h5>
            <form id="pwdForm">
                <div class="mb-3">
                    <label class="form-label">原密码</label>
                    <input type="password" id="oldPassword" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">新密码</label>
                    <input type="password" id="newPassword" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">确认新密码</label>
                    <input type="password" id="confirmPassword" class="form-control" required>
                </div>
                <button type="button" onclick="changePwd()" class="btn btn-warning">修改密码</button>
            </form>
        </div>
    </div>
</div>

<script>
    function changePwd() {
        var oldPwd = document.getElementById('oldPassword').value;
        var newPwd = document.getElementById('newPassword').value;
        var confirmPwd = document.getElementById('confirmPassword').value;
        if (newPwd !== confirmPwd) {
            alert('两次输入的新密码不一致');
            return;
        }
        $.post('${pageContext.request.contextPath}/paotui/updatePassword', {
            oldPassword: oldPwd,
            newPassword: newPwd
        }, function(res) {
            alert(res.msg);
            if (res.code === 0) document.getElementById('pwdForm').reset();
        }, 'json');
    }
</script>

<jsp:include page="../common/paotui_footer.jsp"/>
