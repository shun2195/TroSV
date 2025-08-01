<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thống kê lịch hẹn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin">Admin Dashboard</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=duyetChuTro">Duyệt chủ trọ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=thongKeHoatDong">Thống kê hoạt động</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="admin?action=thongKeLichHen">Thống kê lịch hẹn</a>
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
        <h2>Thống kê lịch hẹn</h2>
        <div class="card text-center">
            <div class="card-body">
                <h5 class="card-title">Tổng số lịch hẹn</h5>
                <p class="card-text">${tongLichHen}</p>
            </div>
        </div>
    </div>
</body>
</html>