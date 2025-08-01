<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="isEdit" value="${not empty phong}"/>

<!DOCTYPE html>
<html>
<head>
    <title>${isEdit ? 'Sửa thông tin phòng trọ' : 'Đăng phòng mới'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div class="container mt-4">
        <h2>${isEdit ? 'Sửa thông tin phòng trọ' : 'Đăng tin cho thuê phòng trọ mới'}</h2>
        <hr>
        
        <form action="${pageContext.request.contextPath}/chu-tro/${isEdit ? 'update-phong' : 'dang-phong'}" method="post">
            <c:if test="${isEdit}">
                <input type="hidden" name="id" value="${phong.id}">
            </c:if>

            <div class="mb-3">
                <label for="tieuDe" class="form-label">Tiêu đề</label>
                <input type="text" class="form-control" name="tieuDe" value="${phong.tieuDe}" required>
            </div>

            <div class="mb-3">
                <label for="moTa" class="form-label">Mô tả</label>
                <textarea class="form-control" name="moTa" rows="5">${phong.moTa}</textarea>
            </div>
            
            <div class="mb-3">
                <label for="diaChi" class="form-label">Số nhà, tên đường</label>
                <input type="text" class="form-control" name="diaChi" value="${phong.diaChi}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phường/Xã</label>
                <select class="form-select" name="idPhuong" required>
                    <c:forEach items="${dsPhuong}" var="phuong">
                        <option value="${phuong.id}" ${phuong.id eq phong.idPhuong ? 'selected' : ''}>
                            ${phuong.tenPhuong}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="row">
                <div class="col-md-3 mb-3"><label>Giá thuê</label><input type="number" class="form-control" name="gia" value="${phong.gia}"></div>
                <div class="col-md-3 mb-3"><label>Giá điện</label><input type="number" class="form-control" name="giaDien" value="${phong.giaDien}"></div>
                <div class="col-md-3 mb-3"><label>Giá nước</label><input type="number" class="form-control" name="giaNuoc" value="${phong.giaNuoc}"></div>
                <div class="col-md-3 mb-3"><label>Phí dịch vụ</label><input type="number" class="form-control" name="phiDichVu" value="${phong.phiDichVu}"></div>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Các tiện ích</label>
                <div>
                    <c:forEach items="${dsTienIch}" var="tienIch">
                        <c:set var="checked" value=""/>
                        <c:if test="${isEdit}">
                            <c:forEach items="${phong.dsTienIch}" var="tienIchCuaPhong">
                                <c:if test="${tienIch.id eq tienIchCuaPhong.id}">
                                    <c:set var="checked" value="checked"/>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="tienIch" value="${tienIch.id}" ${checked}>
                            <label class="form-check-label">${tienIch.tenTienIch}</label>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">${isEdit ? 'Cập nhật' : 'Đăng tin'}</button>
        </form>
    </div>
</body>
</html>