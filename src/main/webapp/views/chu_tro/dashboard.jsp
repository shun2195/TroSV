<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Chủ trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    
    <div class="container mt-4">
        <%-- Chào mừng người dùng đang đăng nhập --%>
        <h2>Chào mừng, ${sessionScope.account.hoTen}!</h2>
        <p>Đây là trang tổng quan hoạt động của bạn.</p>
        <hr>

        <div class="row">
            <!-- Card Tổng số phòng -->
            <div class="col-md-4 mb-3">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <%-- Hiển thị dữ liệu từ Map 'stats' mà Controller đã gửi --%>
                        <h3 class="card-title">${stats.tongSoPhong}</h3>
                        <p class="card-text">Tổng số phòng</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/chu-tro/quan-ly-phong" class="card-footer text-white text-decoration-none">
                        Xem chi tiết →
                    </a>
                </div>
            </div>

            <!-- Card Số phòng trống -->
            <div class="col-md-4 mb-3">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h3 class="card-title">${stats.soPhongTrong}</h3>
                        <p class="card-text">Phòng đang trống</p>
                    </div>
                     <a href="${pageContext.request.contextPath}/chu-tro/quan-ly-phong" class="card-footer text-white text-decoration-none">
                        Xem chi tiết →
                    </a>
                </div>
            </div>

            <!-- Card Lịch hẹn chờ duyệt -->
            <div class="col-md-4 mb-3">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h3 class="card-title">${stats.lichHenChoDuyet}</h3>
                        <p class="card-text">Lịch hẹn chờ duyệt</p>
                    </div>
                     <a href="${pageContext.request.contextPath}/lich-hen?action=xem" class="card-footer text-white text-decoration-none">
                        Xem chi tiết →
                    </a>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>