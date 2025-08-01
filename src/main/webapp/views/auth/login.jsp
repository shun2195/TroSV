<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập - Trọ SV</title>

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        body {
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .login-card {
            max-width: 420px;
            width: 100%;
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        }
        .input-icon {
            position: absolute;
            top: 50%;
            left: 0.75rem;
            transform: translateY(-50%);
            color: #6c757d;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card login-card mx-auto">
        <div class="card-body">
            <div class="text-center mb-4">
                <a href="${pageContext.request.contextPath}/" class="h2 fw-bold text-primary text-decoration-none">TRỌ SV</a>
                <p class="text-muted mt-2">Chào mừng bạn quay trở lại!</p>
            </div>

            <%-- Hiển thị thông báo lỗi nếu có --%>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i> <%= error %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <input type="hidden" name="action" value="dangNhap">

                <div class="mb-3">
                    <label for="email" class="form-label">Tài khoản Email</label>
                    <div class="position-relative">
                        <i class="bi bi-envelope-fill input-icon"></i>
                        <input type="email" class="form-control" id="email" name="email"
                               placeholder="Nhập email của bạn" required
                               value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="matKhau" class="form-label">Mật khẩu</label>
                    <div class="position-relative">
                        <i class="bi bi-lock-fill input-icon"></i>
                        <input type="password" class="form-control" id="matKhau" name="matKhau" placeholder="Nhập mật khẩu" required>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" id="remember">
                        <label class="form-check-label" for="remember">Ghi nhớ tôi</label>
                    </div>
                    <a href="#" class="small text-decoration-none">Quên mật khẩu?</a>
                </div>

                <button type="submit" class="btn btn-primary w-100 btn-lg">Đăng Nhập</button>

                <div class="text-center mt-4">
                    <p class="text-muted mb-1">Chưa có tài khoản?</p>
                    <a href="${pageContext.request.contextPath}/register" class="fw-bold text-decoration-none">Đăng ký miễn phí ngay</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
