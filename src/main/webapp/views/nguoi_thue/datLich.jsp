<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lịch xem phòng - Trọ SV</title>
    
    <!-- BƯỚC 1: THÊM CÁC LINK CSS VÀ JS CẦN THIẾT -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <%-- Thêm một chút CSS tùy chỉnh nếu cần --%>
    <style>
        body { background-color: #f8f9fa; }
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">

                <c:choose>
                    <%-- TRƯỜNG HỢP 1: Logic của bạn đã rất tốt, giữ nguyên --%>
                    <c:when test="${not empty phong and not empty sessionScope.account and sessionScope.account.vaiTro eq 'NguoiThue'}">
                        <div class="card shadow-lg">
                            <div class="card-header bg-primary text-white">
                                <h4 class="mb-0"><i class="bi bi-calendar-plus-fill me-2"></i> Đặt Lịch Hẹn Xem Phòng</h4>
                            </div>
                            <div class="card-body p-4">
                                <div class="alert alert-info">
                                    <p class="mb-1"><strong>Phòng trọ:</strong> ${phong.tieuDe}</p>
                                    <p class="mb-0 text-muted"><i class="bi bi-geo-alt-fill"></i> ${phong.diaChi}, ${phong.phuong.tenPhuong}</p>
                                </div>

                                <form action="${pageContext.request.contextPath}/dat-lich" method="post">
                                    <input type="hidden" name="idPhong" value="${phong.id}">

                                    <h5 class="mt-4">Thông tin của bạn (Không thể thay đổi)</h5>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Họ và tên:</label>
                                            <input type="text" class="form-control bg-light" value="${sessionScope.account.hoTen}" readonly>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Email:</label>
                                            <input type="email" class="form-control bg-light" value="${sessionScope.account.email}" readonly>
                                        </div>
                                    </div>
                                    
                                    <hr class="my-4">

                                    <h5 class="mt-4">Thời gian hẹn</h5>
                                    <p class="text-muted">Vui lòng chọn ngày và giờ bạn muốn đến xem phòng.</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <label for="ngayHen" class="form-label">Ngày xem phòng <span class="text-danger">*</span></label>
                                            <input type="date" class="form-control" id="ngayHen" name="ngayHen" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="gioHen" class="form-label">Giờ xem phòng <span class="text-danger">*</span></label>
                                            <input type="time" class="form-control" id="gioHen" name="gioHen" required>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-end mt-4">
                                        <a href="${pageContext.request.contextPath}/chi-tiet-phong?id=${phong.id}" class="btn btn-secondary me-2">
                                            <i class="bi bi-arrow-left"></i> Quay lại
                                        </a>
                                        <button type="submit" class="btn btn-primary">
                                            <i class="bi bi-send-fill"></i> Gửi Yêu Cầu
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:when>

                    <%-- TRƯỜNG HỢP 2: Logic của bạn đã rất tốt, chỉ cần thêm CSS cho đẹp --%>
                    <c:when test="${empty sessionScope.account or sessionScope.account.vaiTro ne 'NguoiThue'}">
                         <div class="text-center p-5 border rounded bg-light">
                            <i class="bi bi-exclamation-circle-fill text-warning" style="font-size: 4rem;"></i>
                            <h4 class="mt-3">Yêu cầu đăng nhập</h4>
                            <p class="lead">Vui lòng <a href="${pageContext.request.contextPath}/login">đăng nhập</a> với tài khoản <strong>Người thuê</strong> để thực hiện chức năng này.</p>
                        </div>
                    </c:when>

                    <%-- TRƯỜNG HỢP 3: Logic của bạn đã rất tốt --%>
                    <c:otherwise>
                        <div class="alert alert-danger text-center p-5">
                            <h4 class="alert-heading">Lỗi!</h4>
                            <p>Không tìm thấy thông tin phòng trọ. Vui lòng quay lại và thử lại.</p>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    
    <%-- Thêm Bootstrap JS ở cuối body để các thành phần hoạt động --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>