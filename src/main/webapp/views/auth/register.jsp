<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Đăng ký tài khoản</h4>
                    </div>
                    <div class="card-body">
                        <form action="DangKyServlet" method="post">
                            <div class="mb-3">
                                <label for="hoTen" class="form-label">Họ và tên</label>
                                <input type="text" class="form-control" id="hoTen" name="hoTen" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="matKhau" class="form-label">Mật khẩu</label>
                                <input type="password" class="form-control" id="matKhau" name="matKhau" required>
                            </div>
                            <div class="mb-3">
                                <label for="nhapLaiMatKhau" class="form-label">Nhập lại mật khẩu</label>
                                <input type="password" class="form-control" id="nhapLaiMatKhau" name="nhapLaiMatKhau" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
                        </form>
                        <div class="text-center mt-3">
                            <a href="auth/login.jsp">Đã có tài khoản? Đăng nhập ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>