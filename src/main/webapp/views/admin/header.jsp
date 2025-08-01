<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trọ SV Admin - ${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .main-content { min-height: calc(100vh - 120px); }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin">TRỌ SV ADMIN</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link ${activePage eq 'dashboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin">
                        <i class="bi bi-speedometer2"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${activePage eq 'duyetChuTro' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin?action=duyetChuTro">
                        <i class="bi bi-person-check-fill"></i> Duyệt Chủ Trọ
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link ${activePage eq 'thongKeHoatDong' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin?action=thongKeHoatDong">
                        <i class="bi bi-bar-chart-line-fill"></i> Thống Kê
                    </a>
                </li>
            </ul>
            <c:if test="${not empty sessionScope.user}">
                <span class="navbar-text me-3 text-white">Chào, ${sessionScope.user.hoTen}!</span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">
                    <i class="bi bi-box-arrow-right"></i> Đăng xuất
                </a>
            </c:if>
        </div>
    </div>
</nav>
<main class="main-content">