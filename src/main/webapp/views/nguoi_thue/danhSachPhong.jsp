<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách phòng trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    <div class="container mt-4">
        <div class="row">
            <!-- Sidebar lọc -->
            <div class="col-md-3">
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5>Bộ lọc tìm kiếm</h5>
                    </div>
                    <div class="card-body">
                        <form action="TimKiemPhong" method="get">
                            <div class="mb-3">
                                <label class="form-label">Khu vực</label>
                                <select class="form-select" name="khuVuc">
                                    <option value="">Tất cả</option>
                                    <c:forEach items="${dsKhuVuc}" var="khuVuc">
                                        <option value="${khuVuc.id}">${khuVuc.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Giá thuê (triệu/tháng)</label>
                                <input type="range" class="form-range" min="1" max="10" step="0.5" name="giaThue">
                                <div class="d-flex justify-content-between">
                                    <span>1</span>
                                    <span>10</span>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Áp dụng</button>
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- Danh sách phòng -->
            <div class="col-md-9">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>${dsPhong.size()} phòng trọ phù hợp</h4>
                    <div class="sort-options">
                        <select class="form-select" onchange="sortPhong(this.value)">
                            <option value="">Sắp xếp</option>
                            <option value="gia_tang">Giá tăng dần</option>
                            <option value="gia_giam">Giá giảm dần</option>
                            <option value="moi_nhat">Mới nhất</option>
                        </select>
                    </div>
                </div>
                
                <div class="row">
                    <c:forEach items="${dsPhong}" var="phong">
                        <div class="col-md-6 mb-4">
                            <div class="card h-100">
                                <img src="${phong.anhDaiDien}" class="card-img-top" style="height: 200px; object-fit: cover;">
                                <div class="card-body">
                                    <h5 class="card-title">${phong.tieuDe}</h5>
                                    <p class="text-success fw-bold">${phong.giaThue} triệu/tháng</p>
                                    <p class="card-text"><i class="bi bi-geo-alt"></i> ${phong.diaChi}</p>
                                    <div class="d-flex justify-content-between">
                                        <a href="chiTietPhong.jsp?id=${phong.id}" class="btn btn-outline-primary">Xem chi tiết</a>
                                        <a href="datLich.jsp?phongId=${phong.id}" class="btn btn-primary">Đặt lịch xem</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function sortPhong(value) {
            // Logic sắp xếp phòng
            window.location.href = "DanhSachPhongServlet?sort=" + value;
        }
    </script>
</body>
</html>