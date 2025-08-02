<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${phong.tieuDe} - Trọ SV</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="container my-5">
        <c:choose>
            <c:when test="${not empty phong}">
                <!-- === CẢI TIẾN: TIÊU ĐỀ VÀ ĐỊA CHỈ NỔI BẬT HƠN === -->
                <div class="mb-4">
                    <h1 class="fw-bold">${phong.tieuDe}</h1>
                    <p class="lead text-body-secondary"><i class="bi bi-geo-alt-fill me-2"></i>${phong.diaChi}, ${phong.phuong.tenPhuong}</p>
                </div>

                <!-- === CẢI TIẾN: BỘ SƯU TẬP ẢNH (IMAGE GALLERY) === -->
                <!-- Giả sử bạn có 1 ds ảnh: phong.dsHinhAnh -->
                <div class="row g-2 mb-4">
                    <div class="col-8">
                        <img src="${pageContext.request.contextPath}/${phong.dsHinhAnh[0]}" class="img-fluid rounded-start-3 h-100 object-fit-cover" alt="Ảnh chính">
                    </div>
                    <div class="col-4">
                        <div class="row g-2 h-100">
                            <div class="col-12"><img src="${pageContext.request.contextPath}/${phong.dsHinhAnh[1]}" class="img-fluid rounded-top-right-3 object-fit-cover h-100" alt="Ảnh phụ 1"></div>
                            <div class="col-12"><img src="${pageContext.request.contextPath}/${phong.dsHinhAnh[2]}" class="img-fluid rounded-bottom-right-3 object-fit-cover h-100" alt="Ảnh phụ 2"></div>
                        </div>
                    </div>
                </div>

                <div class="row g-5">
                    <!-- === CỘT BÊN TRÁI: MÔ TẢ VÀ TIỆN ÍCH === -->
                    <div class="col-lg-7">
                        <h3 class="fw-semibold">Mô tả chi tiết</h3>
                        <p>${phong.moTa}</p>
                        
                        <hr class="my-4">

                        <h3 class="fw-semibold">Tiện ích có sẵn</h3>
                        <div class="row row-cols-2 g-3 mt-3">
                            <c:forEach items="${phong.dsTienIch}" var="tienIch">
                                <div class="col">
                                    <i class="bi bi-check-circle-fill text-success me-2"></i>${tienIch.tenTienIch}
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- === CỘT BÊN PHẢI: THÔNG TIN GIÁ VÀ ĐẶT LỊCH === -->
                    <div class="col-lg-5">
                        <div class="card sticky-top shadow" style="top: 80px;">
                            <div class="card-body p-4">
                                <h3 class="card-title text-danger fw-bold">
                                    <fmt:formatNumber value="${phong.gia}" type="currency" currencySymbol=""/>đ
                                    <span class="fs-6 fw-normal text-body-secondary">/ tháng</span>
                                </h3>
                                <hr>
                                <ul class="list-unstyled">
                                    <li class="d-flex justify-content-between mb-2">
                                        <span><i class="bi bi-lightning-charge-fill text-warning me-2"></i>Tiền điện</span>
                                        <strong><fmt:formatNumber value="${phong.giaDien}" type="currency" currencySymbol=""/>đ/kWh</strong>
                                    </li>
                                    <li class="d-flex justify-content-between mb-2">
                                        <span><i class="bi bi-droplet-fill text-info me-2"></i>Tiền nước</span>
                                        <strong><fmt:formatNumber value="${phong.giaNuoc}" type="currency" currencySymbol=""/>đ/m³</strong>
                                    </li>
                                     <li class="d-flex justify-content-between">
                                        <span><i class="bi bi-plus-circle-fill text-secondary me-2"></i>Phí dịch vụ</span>
                                        <strong><fmt:formatNumber value="${phong.phiDichVu}" type="currency" currencySymbol=""/>đ/tháng</strong>
                                    </li>
                                </ul>
                                <hr>
                                <div class="text-center">
                                    <p class="mb-1">Liên hệ chủ trọ:</p>
                                    <p class="fs-5 fw-bold mb-3">${phong.chuTro.hoTen} - ${phong.chuTro.soDienThoai}</p>
                                    <a href="${pageContext.request.contextPath}/dat-lich?idPhong=${phong.id}" class="btn btn-primary btn-lg w-100">
                                        <i class="bi bi-calendar-check-fill me-2"></i>Đặt lịch xem phòng
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <div class="text-center p-5 border rounded bg-light">
                    <i class="bi bi-exclamation-triangle-fill text-danger" style="font-size: 4rem;"></i>
                    <h4 class="mt-3">Lỗi! Không tìm thấy phòng</h4>
                    <p class="lead text-body-secondary">Phòng trọ bạn đang tìm kiếm không tồn tại hoặc đã bị xóa.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="../common/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>