<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function toggleChuTroFields() {
            var vaiTro = document.getElementById("vaiTro").value;
            var chuTroFields = document.getElementById("chuTroFields");
            chuTroFields.style.display = vaiTro === "ChuTro" ? "block" : "none";
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="text-center">Đăng ký tài khoản</h2>
                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                <% } %>
                <form action="register" method="post" class="mt-4">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="hoTen" class="form-label">Họ tên</label>
                            <input type="text" class="form-control" id="hoTen" name="hoTen" 
                                   value="<%= request.getAttribute("hoTen") != null ? request.getAttribute("hoTen") : "" %>" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" 
                                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="matKhau" class="form-label">Mật khẩu</label>
                            <input type="password" class="form-control" id="matKhau" name="matKhau" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="xacNhanMatKhau" class="form-label">Xác nhận mật khẩu</label>
                            <input type="password" class="form-control" id="xacNhanMatKhau" name="xacNhanMatKhau" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="soDienThoai" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" id="soDienThoai" name="soDienThoai" 
                                   value="<%= request.getAttribute("soDienThoai") != null ? request.getAttribute("soDienThoai") : "" %>" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="gioiTinh" class="form-label">Giới tính</label>
                            <select class="form-select" id="gioiTinh" name="gioiTinh" required>
                                <option value="Nam" <%= "Nam".equals(request.getAttribute("gioiTinh")) ? "selected" : "" %>>Nam</option>
                                <option value="Nu" <%= "Nu".equals(request.getAttribute("gioiTinh")) ? "selected" : "" %>>Nữ</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="vaiTro" class="form-label">Vai trò</label>
                        <select class="form-select" id="vaiTro" name="vaiTro" onchange="toggleChuTroFields()" required>
                            <option value="NguoiThue" <%= "NguoiThue".equals(request.getAttribute("vaiTro")) ? "selected" : "" %>>Người thuê</option>
                            <option value="ChuTro" <%= "ChuTro".equals(request.getAttribute("vaiTro")) ? "selected" : "" %>>Chủ trọ</option>
                        </select>
                    </div>
                    <div id="chuTroFields" style="display: <%= "ChuTro".equals(request.getAttribute("vaiTro")) ? "block" : "none" %>;">
                        <div class="mb-3">
                            <label for="cccd" class="form-label">Số CCCD</label>
                            <input type="text" class="form-control" id="cccd" name="cccd" 
                                   value="<%= request.getAttribute("cccd") != null ? request.getAttribute("cccd") : "" %>">
                        </div>
                        <div class="mb-3">
                            <label for="ngayCapCccd" class="form-label">Ngày cấp CCCD</label>
                            <input type="date" class="form-control" id="ngayCapCccd" name="ngayCapCccd" 
                                   value="<%= request.getAttribute("ngayCapCccd") != null ? request.getAttribute("ngayCapCccd") : "" %>">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
                </form>
                <p class="text-center mt-3">Đã có tài khoản? <a href="login">Đăng nhập</a></p>
            </div>
        </div>
    </div>
</body>
</html>