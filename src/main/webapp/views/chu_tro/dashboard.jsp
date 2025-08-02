<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Chủ trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .card {
            transition: transform 0.3s;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }
        .card-footer {
            background-color: rgba(0,0,0,0.05);
            border-top: 1px solid rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp">
        <jsp:param name="active" value="dashboard"/>
    </jsp:include>
    
    <div class="container mt-4">
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
        </nav>

        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="mb-0">Chào mừng, ${sessionScope.account.hoTen}!</h2>
                <p class="text-muted mb-0">Tổng quan hoạt động của bạn</p>
            </div>
            <a href="${pageContext.request.contextPath}/chu-tro/dang-phong" class="btn btn-primary">
                <i class="bi bi-plus-lg me-1"></i> Đăng phòng mới
            </a>
        </div>

        <div class="row g-4">
            <!-- Card Tổng số phòng -->
            <div class="col-md-4">
                <div class="card text-white bg-primary h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="card-title mb-0">${stats.tongSoPhong}</h3>
                                <p class="card-text">Tổng số phòng</p>
                            </div>
                            <i class="bi bi-house-door" style="font-size: 2rem;"></i>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/chu-tro/quan-ly-phong" class="card-footer text-white text-decoration-none d-flex justify-content-between align-items-center">
                        Xem chi tiết <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>

            <!-- Card Số phòng trống -->
            <div class="col-md-4">
                <div class="card text-white bg-success h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="card-title mb-0">${stats.soPhongTrong}</h3>
                                <p class="card-text">Phòng đang trống</p>
                            </div>
                            <i class="bi bi-door-open" style="font-size: 2rem;"></i>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/chu-tro/quan-ly-phong" class="card-footer text-white text-decoration-none d-flex justify-content-between align-items-center">
                        Xem chi tiết <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>

            <!-- Card Lịch hẹn chờ duyệt -->
            <div class="col-md-4">
                <div class="card text-white bg-warning h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="card-title mb-0">${stats.lichHenChoDuyet}</h3>
                                <p class="card-text">Lịch hẹn chờ duyệt</p>
                            </div>
                            <i class="bi bi-calendar-check" style="font-size: 2rem;"></i>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/lich-hen?action=xem" class="card-footer text-white text-decoration-none d-flex justify-content-between align-items-center">
                        Xem chi tiết <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Phòng mới đăng gần đây</h5>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${not empty recentRooms}">
                                <div class="list-group list-group-flush">
                                    <c:forEach items="${recentRooms}" var="room" end="4">
                                        <a href="${pageContext.request.contextPath}/chu-tro/sua-phong?id=${room.id}" 
                                           class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                            ${room.tieuDe}
                                            <span class="badge ${room.trangThai eq 'ConPhong' ? 'bg-success' : 'bg-secondary'}">
                                                ${room.trangThai eq 'ConPhong' ? 'Còn phòng' : 'Hết phòng'}
                                            </span>
                                        </a>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-4 text-muted">
                                    <i class="bi bi-house-x" style="font-size: 2rem;"></i>
                                    <p class="mt-2">Chưa có phòng nào được đăng</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Lịch hẹn gần đây</h5>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${not empty recentAppointments}">
                                <div class="list-group list-group-flush">
                                    <c:forEach items="${recentAppointments}" var="app" end="4">
                                        <div class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <strong>${app.phongTro.tieuDe}</strong>
                                                <span class="badge ${app.trangThai eq 'ChapNhan' ? 'bg-success' : 
                                                                      app.trangThai eq 'TuChoi' ? 'bg-danger' : 'bg-warning text-dark'}">
                                                    ${app.trangThai eq 'ChapNhan' ? 'Đã chấp nhận' : 
                                                     app.trangThai eq 'TuChoi' ? 'Đã từ chối' : 'Chờ duyệt'}
                                                </span>
                                            </div>
                                            <small class="text-muted">${app.nguoiThue.hoTen} - 
                                                <fmt:formatDate value="${app.ngayHen}" pattern="dd/MM/yyyy"/> lúc 
                                                <fmt:formatDate value="${app.gioHen}" pattern="HH:mm"/>
                                            </small>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-4 text-muted">
                                    <i class="bi bi-calendar-x" style="font-size: 2rem;"></i>
                                    <p class="mt-2">Chưa có lịch hẹn nào</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>