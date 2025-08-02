<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- BƯỚC 1: THÊM LẠI DÒNG NÀY ĐỂ SỬ DỤNG JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trọ SV - Tìm phòng trọ sinh viên dễ dàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { padding-top: 56px; }
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=2070&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 8rem 0; /* Giảm padding một chút */
            text-align: center;
        }
        .feature-icon { font-size: 3rem; color: #0d6efd; }
    </style>
</head>
<body>

    <!-- 1. Thanh điều hướng (Navbar) -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">TRỌ SV</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/">Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/danh-sach-phong">Tìm Phòng</a></li>
                    
                    <c:if test="${not empty sessionScope.account and sessionScope.account.vaiTro eq 'ChuTro'}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/chu-tro/dang-phong">Đăng Tin</a></li>
                    </c:if>
                    
                    <c:if test="${not empty sessionScope.account}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Kênh Quản Lý</a>
                            <ul class="dropdown-menu">
                                <c:if test="${sessionScope.account.vaiTro eq 'Admin'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard">Quản trị Admin</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account.vaiTro eq 'ChuTro'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/chu-tro/dashboard">Quản lý Chủ Trọ</a></li>
                                </c:if>
                                <%-- Thêm dashboard cho Người Thuê sau --%>
                            </ul>
                        </li>
                    </c:if>
                </ul>
                
                <%-- BƯỚC 2: THÊM LOGIC HIỂN THỊ ĐĂNG NHẬP/ĐĂNG XUẤT --%>
                <div class="d-flex align-items-center">
                    <c:choose>
                        <c:when test="${not empty sessionScope.account}">
                            <%-- ĐÃ ĐĂNG NHẬP --%>
                            <div class="dropdown">
                                <a href="#" class="nav-link dropdown-toggle text-white" role="button" data-bs-toggle="dropdown">
                                    Xin chào, <strong>${sessionScope.account.hoTen}</strong>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                                </ul>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%-- CHƯA ĐĂNG NHẬP --%>
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light me-2">Đăng Nhập</a>
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Đăng Ký</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- Các phần còn lại của trang -->
    <main>
        <section class="hero-section">
            <div class="container">
                <h1 class="display-4 fw-bold">Tìm Kiếm Phòng Trọ Dễ Dàng & Nhanh Chóng</h1>
                <p class="lead my-4">Nền tảng kết nối chủ trọ và sinh viên uy tín nhất.</p>
                
                <%-- Sửa action của form tìm kiếm trỏ đến trang danh sách phòng --%>
                <form class="d-flex justify-content-center" role="search" action="${pageContext.request.contextPath}/danh-sach-phong" method="get">
                    <div class="input-group" style="max-width: 600px;">
                        <input class="form-control form-control-lg" type="search" name="keyword" placeholder="Nhập tên đường, quận...">
                        <button class="btn btn-primary btn-lg" type="submit">
                            <i class="bi bi-search"></i> Tìm kiếm
                        </button>
                    </div>
                </form>
            </div>
        </section>

        <!-- Phần tính năng (giữ nguyên) -->
        <section class="py-5"> ... </section>

        <section class="py-5 bg-light">
            <div class="container text-center">
                <h2 class="fw-bold">Sẵn sàng tìm kiếm ngôi nhà thứ hai của bạn?</h2>
                <p class="lead text-muted mb-4">Hãy tạo tài khoản ngay hôm nay để bắt đầu đăng tin hoặc tìm phòng trọ mơ ước.</p>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-primary btn-lg">Đăng Ký Miễn Phí</a>
            </div>
        </section>
    </main>

    <footer class="bg-dark text-white text-center py-4"> ... </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>