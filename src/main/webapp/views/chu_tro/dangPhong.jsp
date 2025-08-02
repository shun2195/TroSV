<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="isEdit" value="${not empty phong}"/>

<!DOCTYPE html>
<html>
<head>
    <title>${isEdit ? 'Sửa thông tin phòng trọ' : 'Đăng phòng mới'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .form-section {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .form-section h5 {
            color: #0d6efd;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .tien-ich-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp">
        <jsp:param name="active" value="quan-ly-phong"/>
    </jsp:include>
    
    <div class="container my-4">
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/chu-tro/quan-ly-phong">Quản lý phòng</a></li>
                <li class="breadcrumb-item active" aria-current="page">${isEdit ? 'Sửa phòng' : 'Đăng phòng mới'}</li>
            </ol>
        </nav>

        <div class="card border-0 shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">${isEdit ? 'Sửa thông tin phòng trọ' : 'Đăng tin cho thuê phòng trọ mới'}</h4>
            </div>
            
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/chu-tro/${isEdit ? 'update-phong' : 'dang-phong'}" method="post">
                    <c:if test="${isEdit}">
                        <input type="hidden" name="id" value="${phong.id}">
                    </c:if>

                    <div class="form-section">
                        <h5>Thông tin cơ bản</h5>
                        <div class="mb-3">
                            <label for="tieuDe" class="form-label">Tiêu đề <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="tieuDe" name="tieuDe" value="${phong.tieuDe}" required>
                            <div class="form-text">Tiêu đề hấp dẫn sẽ thu hút nhiều người xem hơn</div>
                        </div>

                        <div class="mb-3">
                            <label for="moTa" class="form-label">Mô tả chi tiết</label>
                            <textarea class="form-control" id="moTa" name="moTa" rows="5">${phong.moTa}</textarea>
                            <div class="form-text">Mô tả đầy đủ về phòng trọ, tiện ích xung quanh...</div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h5>Địa chỉ</h5>
                        <div class="mb-3">
                            <label for="diaChi" class="form-label">Số nhà, tên đường <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="diaChi" name="diaChi" value="${phong.diaChi}" required>
                        </div>

                        <div class="mb-3">
                            <label for="idPhuong" class="form-label">Phường/Xã <span class="text-danger">*</span></label>
                            <select class="form-select" id="idPhuong" name="idPhuong" required>
                                <option value="">-- Chọn phường/xã --</option>
                                <c:forEach items="${dsPhuong}" var="phuong">
                                    <option value="${phuong.id}" ${phuong.id eq phong.idPhuong ? 'selected' : ''}>
                                        ${phuong.tenPhuong}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-section">
                        <h5>Giá cả và chi phí</h5>
                        <div class="row g-3">
                            <div class="col-md-3">
                                <label for="gia" class="form-label">Giá thuê (VND)</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="gia" name="gia" value="${phong.gia}">
                                    <span class="input-group-text">/tháng</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="giaDien" class="form-label">Giá điện (VND)</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="giaDien" name="giaDien" value="${phong.giaDien}">
                                    <span class="input-group-text">/số</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="giaNuoc" class="form-label">Giá nước (VND)</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="giaNuoc" name="giaNuoc" value="${phong.giaNuoc}">
                                    <span class="input-group-text">/khối</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="phiDichVu" class="form-label">Phí dịch vụ (VND)</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="phiDichVu" name="phiDichVu" value="${phong.phiDichVu}">
                                    <span class="input-group-text">/tháng</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h5>Tiện ích</h5>
                        <div class="tien-ich-container">
                            <c:forEach items="${dsTienIch}" var="tienIch">
                                <c:set var="checked" value=""/>
                                <c:if test="${isEdit}">
                                    <c:forEach items="${phong.dsTienIch}" var="tienIchCuaPhong">
                                        <c:if test="${tienIch.id eq tienIchCuaPhong.id}">
                                            <c:set var="checked" value="checked"/>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="tienIch-${tienIch.id}" 
                                           name="tienIch" value="${tienIch.id}" ${checked}>
                                    <label class="form-check-label" for="tienIch-${tienIch.id}">
                                        ${tienIch.tenTienIch}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="d-flex justify-content-end gap-2 mt-4">
                        <a href="${pageContext.request.contextPath}/chu-tro/quan-ly-phong" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-1"></i> Quay lại
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="bi ${isEdit ? 'bi-check-circle' : 'bi-save'} me-1"></i> 
                            ${isEdit ? 'Cập nhật' : 'Đăng tin'}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>