<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng phòng mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="container mt-4">
        <h2>Đăng tin cho thuê phòng trọ mới</h2>
        <hr>
        
        <form action="${pageContext.request.contextPath}/chu-tro/dang-phong" method="post">
            <div class="mb-3">
                <label for="tieuDe" class="form-label">Tiêu đề</label>
                <input type="text" class="form-control" id="tieuDe" name="tieuDe" required>
            </div>

            <div class="mb-3">
                <label for="moTa" class="form-label">Mô tả chi tiết</label>
                <textarea class="form-control" id="moTa" name="moTa" rows="5"></textarea>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="gia" class="form-label">Giá thuê (VND/tháng)</label>
                    <input type="number" class="form-control" id="gia" name="gia" required>
                </div>
                 <div class="col-md-6 mb-3">
                    <label for="diaChi" class="form-label">Số nhà, tên đường</label>
                    <input type="text" class="form-control" id="diaChi" name="diaChi" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 mb-3">
                    <label for="giaDien" class="form-label">Giá điện (VND/kWh)</label>
                    <input type="number" class="form-control" id="giaDien" name="giaDien">
                </div>
                 <div class="col-md-4 mb-3">
                    <label for="giaNuoc" class="form-label">Giá nước (VND/m³)</label>
                    <input type="number" class="form-control" id="giaNuoc" name="giaNuoc">
                </div>
                 <div class="col-md-4 mb-3">
                    <label for="phiDichVu" class="form-label">Phí dịch vụ khác (VND)</label>
                    <input type="number" class="form-control" id="phiDichVu" name="phiDichVu">
                </div>
            </div>
            
            <div class="mb-3">
                <label for="phuong" class="form-label">Phường/Xã</label>
                <select class="form-select" id="phuong" name="idPhuong" required>
                    <option selected disabled value="">-- Chọn Phường/Xã --</option>
                    <c:forEach items="${dsPhuong}" var="phuong">
                        <option value="${phuong.id}">${phuong.tenPhuong}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Các tiện ích</label>
                <div>
                    <c:forEach items="${dsTienIch}" var="tienIch">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="tienIch" id="tienIch_${tienIch.id}" value="${tienIch.id}">
                            <label class="form-check-label" for="tienIch_${tienIch.id}">${tienIch.tenTienIch}</label>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <hr>
            <button type="submit" class="btn btn-primary">Đăng tin</button>
        </form>
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>