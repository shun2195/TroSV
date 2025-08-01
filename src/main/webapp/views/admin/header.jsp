<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin - ${param.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="admin">Admin Panel</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link ${param.active eq 'dashboard' ? 'active' : ''}" href="admin">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active eq 'duyetChuTro' ? 'active' : ''}" href="admin?action=duyetChuTro">Duyệt chủ trọ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active eq 'thongKeHoatDong' ? 'active' : ''}" href="admin?action=thongKeHoatDong">Thống kê hoạt động</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active eq 'thongKeLichHen' ? 'active' : ''}" href="admin?action=thongKeLichHen">Thống kê lịch hẹn</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active eq 'taiKhoanMoiTuan' ? 'active' : ''}" href="admin?action=taiKhoanMoiTuan">Tài khoản mới</a>
                </li>
            </ul>
            <a href="logout" class="btn btn-outline-light">Đăng xuất</a>
        </div>
    </div>
</nav>