<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm phòng trọ - Trọ SV</title>
    
    <!-- === CẢI TIẾN: SỬ DỤNG BOOTSTRAP VÀ ICON MỚI NHẤT === -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <!-- === CẢI TIẾN: LINK ĐẾN FILE CSS TÙY CHỈNH === -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="container mt-5 mb-5">
        <div class="row g-4">
           
            <div class="col-lg-3">
                <div class="card sticky-top shadow-sm" style="top: 80px;">
                    <div class="card-header bg-primary-subtle border-0">
                        <h5 class="mb-0 text-primary-emphasis"><i class="bi bi-funnel-fill me-2"></i>Bộ lọc tìm kiếm</h5>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/danh-sach-phong" method="get">
                            <div class="mb-3">
                                <label for="phuongSelect" class="form-label fw-semibold">Phường/Xã</label>
                                <select class="form-select" name="idPhuong" id="phuongSelect">
                                    <option value="">Tất cả các phường</option>
                                    <c:forEach items="${dsPhuong}" var="phuong">
                                        <option value="${phuong.id}" ${phuong.id eq param.idPhuong ? 'selected' : ''}>
                                            ${phuong.tenPhuong}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="giaSelect" class="form-label fw-semibold">Khoảng giá</label>
                                <select class="form-select" name="khoangGia" id="giaSelect">
                                    <option value="">Tất cả các mức giá</option>
                                    <option value="1" ${param.khoangGia eq '1' ? 'selected' : ''}>Dưới 2 triệu</option>
                                    <option value="2" ${param.khoangGia eq '2' ? 'selected' : ''}>Từ 2 - 3 triệu</option>
                                    <option value="3" ${param.khoangGia eq '3' ? 'selected' : ''}>Từ 3 - 5 triệu</option>
                                    <option value="4" ${param.khoangGia eq '4' ? 'selected' : ''}>Trên 5 triệu</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary w-100"><i class="bi bi-search me-2"></i>Áp dụng</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- ============================================= -->
            <!-- == PHẦN HIỂN THỊ KẾT QUẢ (TÂN TRANG LẠI CARD) == -->
            <!-- ============================================= -->
            <div class="col-lg-9">
                <div class="d-flex align-items-center mb-3 p-3 bg-light rounded">
                    <h4 class="mb-0">
                        Tìm thấy <span class="text-primary fw-bold">${dsPhongTro.size()}</span> phòng trọ phù hợp
                    </h4>
                </div>

                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <c:forEach items="${dsPhongTro}" var="phong">
                        <div class="col">
                            <!-- === CẢI TIẾN: CARD HIỆN ĐẠI VÀ HẤP DẪN HƠN === -->
                            <div class="card h-100 border-0 shadow-sm room-card">
                                <!-- Giả sử bạn có 1 ảnh đại diện cho phòng -->
                                <img src="${pageContext.request.contextPath}/${phong.hinhAnhDaiDien}" class="card-img-top room-card-img" alt="${phong.tieuDe}">
                                
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title text-truncate-2">${phong.tieuDe}</h5>
                                    <p class="card-text text-body-secondary small mb-2">
                                        <i class="bi bi-geo-alt-fill me-1"></i>
                                        ${phong.diaChi}, ${phong.phuong.tenPhuong}
                                    </p>
                                    <div class="mt-auto">
                                         <p class="card-text text-danger fs-5 fw-bold mb-3">
                                            <fmt:formatNumber value="${phong.gia}" type="currency" currencySymbol=""/>đ / tháng
                                        </p>
                                        <a href="${pageContext.request.contextPath}/chi-tiet-phong?id=${phong.id}" class="btn btn-outline-primary w-100">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty dsPhongTro}">
                        <div class="col-12">
                            <div class="text-center p-5 border rounded bg-light">
                                <i class="bi bi-binoculars-fill text-muted" style="font-size: 4rem;"></i>
                                <h4 class="mt-3">Không tìm thấy kết quả</h4>
                                <p class="lead text-body-secondary">Rất tiếc, không có phòng trọ nào phù hợp với bộ lọc của bạn.</p>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>