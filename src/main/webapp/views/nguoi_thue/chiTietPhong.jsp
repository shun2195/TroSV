<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${phong.tieuDe}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container mt-4">
        <c:if test="${not empty phong}">
            <h1>${phong.tieuDe}</h1>
            <p class="lead">${phong.diaChi}, ${phong.phuong.tenPhuong}</p>
            <hr>
            <div class="row">
                <div class="col-md-8">
                    <h3>Mô tả chi tiết</h3>
                    <p>${phong.moTa}</p>
                    <h3>Tiện ích</h3>
                    <c:forEach items="${phong.dsTienIch}" var="tienIch">
                        <span class="badge bg-secondary me-1">${tienIch.tenTienIch}</span>
                    </c:forEach>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title text-danger"><fmt:formatNumber value="${phong.gia}" type="number"/> VND/tháng</h4>
                            <hr>
                            <p><strong>Điện:</strong> <fmt:formatNumber value="${phong.giaDien}" type="number"/>/kWh</p>
                            <p><strong>Nước:</strong> <fmt:formatNumber value="${phong.giaNuoc}" type="number"/>/m³</p>
                            <p><strong>Phí khác:</strong> <fmt:formatNumber value="${phong.phiDichVu}" type="number"/>/tháng</p>
                            <hr>
                            <p><strong>Liên hệ:</strong> ${phong.chuTro.hoTen}</p>
                            <p><strong>Điện thoại:</strong> ${phong.chuTro.soDienThoai}</p>
                            <a href="${pageContext.request.contextPath}/dat-lich?idPhong=${phong.id}" class="btn btn-success w-100 mt-2">Đặt lịch xem phòng</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty phong}">
            <h2 class="text-center">Không tìm thấy thông tin phòng trọ.</h2>
        </c:if>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>