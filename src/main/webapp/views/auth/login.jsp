<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container bg-white">
            <h2 class="text-center mb-4">Đăng nhập</h2>
            <form action="DangNhapServlet" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="matKhau" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="matKhau" name="matKhau" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                <div class="text-center mt-3">
                    <a href="auth/register.jsp">Chưa có tài khoản? Đăng ký ngay</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>