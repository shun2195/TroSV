<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập - Trọ SV</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Custom CSS -->
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background: #f0f2f5; /* Màu nền xám nhẹ */
            /* Hoặc dùng Gradient nếu bạn thích */
            /* background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%); */
        }
        .login-card {
            width: 100%;
            max-width: 420px;
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            border: none;
        }
        .login-card .form-control {
            height: 50px;
            padding-left: 2.5rem; /* Tạo không gian cho icon */
        }
        .login-card .form-label {
            font-weight: 500;
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
                <a href="<c:url value='/'/>" class="h2 text-decoration-none fw-bold text-primary">TRỌ SV</a>
                <p class="text-muted mt-2">Chào mừng bạn quay trở lại!</p>
            </div>

            <%-- Hiển thị thông báo lỗi nếu có từ Servlet --%>
            <c:if test="${not empty requestScope.error}">
                <div class="alert alert-danger" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i> ${requestScope.error}
                </div>
            </c:if>

            <%-- Form đăng nhập --%>
            <form action="<c:url value='/login'/>" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Tài khoản Email</label>
                    <div class="position-relative">
                        <i class="bi bi-envelope-fill input-icon"></i>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email của bạn" required value="${param.email}">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="matKhau" class="form-label">Mật khẩu</label>
                     <div class="position-relative">
                        <i class="bi bi-lock-fill input-icon"></i>
                        <input type="password" class="form-control" id="matKhau" name="matKhau" placeholder="Nhập mật khẩu" required>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">
                            Ghi nhớ tôi
                        </label>
                    </div>
                    <a href="#" class="text-decoration-none small">Quên mật khẩu?</a>
                </div>
                <button type="submit" class="btn btn-primary w-100 btn-lg">Đăng Nhập</button>
                <div class="text-center mt-4">
                    <p class="text-muted mb-0">Chưa có tài khoản?</p>
                    <a href="<c:url value='/register'/>" class="fw-bold text-decoration-none">Đăng ký miễn phí ngay</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>