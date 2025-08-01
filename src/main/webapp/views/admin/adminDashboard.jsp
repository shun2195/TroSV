<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=duyetChuTro">Duyệt chủ trọ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=thongKeHoatDong">Thống kê hoạt động</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=thongKeLichHen">Thống kê lịch hẹn</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=taiKhoanMoiTuan">Tài khoản mới</a>
                    </li>
                </ul>
                <a href="logout" class="btn btn-outline-light">Đăng xuất</a>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <h2>Chào mừng đến với Dashboard Admin</h2>
        <p>Vui lòng chọn chức năng từ menu trên để quản lý hệ thống.</p>
        <div class="row mt-4">
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Duyệt chủ trọ</h5>
                        <p class="card-text">Xem và xác minh danh sách chủ trọ.</p>
                        <a href="admin?action=duyetChuTro" class="btn btn-primary">Truy cập</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Thống kê hoạt động</h5>
                        <p class="card-text">Xem tổng số tài khoản, phòng trọ, lịch hẹn.</p>
                        <a href="admin?action=thongKeHoatDong" class="btn btn-primary">Truy cập</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Thống kê lịch hẹn</h5>
                        <p class="card-text">Xem tổng số lịch hẹn trong hệ thống.</p>
                        <a href="admin?action=thongKeLichHen" class="btn btn-primary">Truy cập</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Tài khoản mới</h5>
                        <p class="card-text">Xem số tài khoản mới trong 7 ngày qua.</p>
                        <a href="admin?action=taiKhoanMoiTuan" class="btn btn-primary">Truy cập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>