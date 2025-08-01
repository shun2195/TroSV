<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trọ SV - Tìm phòng trọ sinh viên dễ dàng</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Custom CSS để trang thêm phần độc đáo -->
    <style>
        body {
            padding-top: 56px; /* Bằng chiều cao của navbar */
        }
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=2070&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 10rem 0;
            text-align: center;
        }
        .feature-icon {
            font-size: 3rem;
            color: #0d6efd; /* Màu xanh primary của Bootstrap */
        }
    </style>
</head>
<body>

<!-- 1. Thanh điều hướng (Navbar) -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">TRỌ SV</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Tìm Phòng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Đăng Tin</a>
                </li>
            </ul>
            <div class="d-flex">
                <a href="<c:url value='/login'/>" class="btn btn-outline-light me-2">Đăng Nhập</a>
                <a href="<c:url value='/register'/>" class="btn btn-primary">Đăng Ký</a>
            </div>
        </div>
    </div>
</nav>

<!-- 2. Khu vực Hero -->
<main>
    <section class="hero-section">
        <div class="container">
            <h1 class="display-4 fw-bold">Tìm Kiếm Phòng Trọ Dễ Dàng & Nhanh Chóng</h1>
            <p class="lead my-4">Nền tảng kết nối chủ trọ và sinh viên uy tín nhất.</p>
            <form class="d-flex justify-content-center" role="search" action="<c:url value='/search'/>" method="get">
                <div class="input-group" style="max-width: 600px;">
                    <input class="form-control form-control-lg" type="search" name="keyword" placeholder="Nhập tên đường, quận..." aria-label="Search">
                    <button class="btn btn-primary btn-lg" type="submit"><i class="bi bi-search"></i> Tìm kiếm</button>
                </div>
            </form>
        </div>
    </section>

    <!-- 3. Khu vực giới thiệu tính năng -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Tại sao nên chọn Trọ SV?</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 text-center border-0 shadow-sm">
                        <div class="card-body p-4">
                            <i class="bi bi-patch-check-fill feature-icon mb-3"></i>
                            <h5 class="card-title fw-bold">Thông Tin Xác Thực</h5>
                            <p class="card-text">Tất cả các tin đăng đều được kiểm duyệt kỹ càng, đảm bảo thông tin chính xác và an toàn cho sinh viên.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 text-center border-0 shadow-sm">
                        <div class="card-body p-4">
                            <i class="bi bi-search-heart feature-icon mb-3"></i>
                            <h5 class="card-title fw-bold">Tìm Kiếm Thông Minh</h5>
                            <p class="card-text">Bộ lọc đa dạng giúp bạn dễ dàng tìm được phòng trọ ưng ý theo giá, diện tích, và vị trí gần trường học.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 text-center border-0 shadow-sm">
                        <div class="card-body p-4">
                            <i class="bi bi-shield-lock-fill feature-icon mb-3"></i>
                            <h5 class="card-title fw-bold">Giao Dịch An Toàn</h5>
                            <p class="card-text">Hỗ trợ tư vấn và cung cấp mẫu hợp đồng thuê nhà chuẩn, bảo vệ quyền lợi cho cả người thuê và chủ trọ.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 4. Khu vực Kêu gọi hành động (CTA) -->
    <section class="py-5 bg-light">
        <div class="container text-center">
            <h2 class="fw-bold">Sẵn sàng tìm kiếm ngôi nhà thứ hai của bạn?</h2>
            <p class="lead text-muted mb-4">Hãy tạo tài khoản ngay hôm nay để bắt đầu đăng tin hoặc tìm phòng trọ mơ ước.</p>
            <a href="<c:url value='/register'/>" class="btn btn-primary btn-lg">Đăng Ký Miễn Phí</a>
        </div>
    </section>
</main>

<!-- 5. Chân trang (Footer) -->
<footer class="bg-dark text-white text-center py-4">
    <div class="container">
        <p class="mb-2">© 2025 Trọ SV. Đã đăng ký bản quyền.</p>
        <div>
            <a href="#" class="text-white me-3"><i class="bi bi-facebook"></i></a>
            <a href="#" class="text-white me-3"><i class="bi bi-instagram"></i></a>
            <a href="#" class="text-white"><i class="bi bi-twitter"></i></a>
        </div>
    </div>
</footer>

<!-- Bootstrap 5 JS Bundle (cần thiết cho các thành phần như Navbar dropdown) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>