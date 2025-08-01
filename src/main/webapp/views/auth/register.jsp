<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký - Trọ SV</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f0f2f5;
        }
        .register-card {
            width: 100%;
            max-width: 650px; /* Tăng chiều rộng để chứa form dài hơn */
            margin: 50px auto;
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            border: none;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card register-card">
        <div class="card-body">
            <div class="text-center mb-4">
                <a href="<c:url value='/'/>" class="h2 text-decoration-none fw-bold text-primary">TRỌ SV</a>
                <p class="text-muted mt-2">Tạo tài khoản để khám phá ngàn phòng trọ</p>
            </div>

            <%-- Hiển thị thông báo lỗi nếu có từ Servlet --%>
            <c:if test="${not empty requestScope.error}">
                <div class="alert alert-danger" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i> ${requestScope.error}
                </div>
            </c:if>

            <%-- Form đăng ký --%>
            <form action="<c:url value='/register'/>" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="hoTen" class="form-label">Họ và tên</label>
                        <input type="text" class="form-control" id="hoTen" name="hoTen" value="${param.hoTen}" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${param.email}" required>
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
                        <input type="text" class="form-control" id="soDienThoai" name="soDienThoai" value="${param.soDienThoai}" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="gioiTinh" class="form-label">Giới tính</label>
                        <select class="form-select" id="gioiTinh" name="gioiTinh" required>
                            <option value="Nam" ${param.gioiTinh == 'Nam' ? 'selected' : ''}>Nam</option>
                            <option value="Nu" ${param.gioiTinh == 'Nu' ? 'selected' : ''}>Nữ</option>
                        </select>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="vaiTro" class="form-label">Bạn là</label>
                    <select class="form-select" id="vaiTro" name="vaiTro" required>
                        <option value="NguoiThue" ${param.vaiTro == 'NguoiThue' ? 'selected' : ''}>Người tìm trọ</option>
                        <option value="ChuTro" ${param.vaiTro == 'ChuTro' ? 'selected' : ''}>Chủ trọ</option>
                    </select>
                </div>

                <%-- Các trường chỉ dành cho Chủ trọ --%>
                <div id="chuTroFields" class="d-none">
                     <div class="alert alert-warning small">Vui lòng cung cấp thông tin CCCD để xác minh tài khoản chủ trọ.</div>
                     <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="cccd" class="form-label">Số CCCD/CMND</label>
                            <input type="text" class="form-control" id="cccd" name="cccd" value="${param.cccd}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="ngayCapCccd" class="form-label">Ngày cấp</label>
                            <input type="date" class="form-control" id="ngayCapCccd" name="ngayCapCccd" value="${param.ngayCapCccd}">
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100 btn-lg mt-3">Đăng Ký</button>
                
                <div class="text-center mt-4">
                    <p class="text-muted mb-0">Đã có tài khoản?</p>
                    <a href="<c:url value='/login'/>" class="fw-bold text-decoration-none">Đăng nhập ngay</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- JavaScript để ẩn/hiện các trường của Chủ Trọ -->
<script>
    const vaiTroSelect = document.getElementById('vaiTro');
    const chuTroFields = document.getElementById('chuTroFields');

    function toggleChuTroFields() {
        if (vaiTroSelect.value === 'ChuTro') {
            chuTroFields.classList.remove('d-none');
        } else {
            chuTroFields.classList.add('d-none');
        }
    }

    // Gán sự kiện onchange
    vaiTroSelect.addEventListener('change', toggleChuTroFields);

    // Chạy hàm một lần khi tải trang để kiểm tra giá trị mặc định/giá trị cũ
    document.addEventListener('DOMContentLoaded', toggleChuTroFields);
</script>

</body>
</html>