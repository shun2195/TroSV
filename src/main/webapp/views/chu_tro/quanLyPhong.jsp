<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý phòng trọ</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container mt-4">
		<div class="d-flex justify-content-between align-items-center mb-3">
			<h2>Danh sách phòng trọ của bạn</h2>
			<a href="${pageContext.request.contextPath}/chu-tro/dang-phong"
				class="btn btn-primary">Đăng phòng mới</a>
		</div>

		<c:if test="${not empty sessionScope.successMessage}">
			<div class="alert alert-success">${sessionScope.successMessage}</div>
			<c:remove var="successMessage" scope="session" />
		</c:if>

		<table class="table table-hover">
			<thead class="table-dark">
				<tr>
					<th>Tiêu đề</th>
					<th>Giá/tháng</th>
					<th>Trạng thái</th>
					<th>Ngày đăng</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dsPhongTro}" var="phong">
					<tr>
						<td>${phong.tieuDe}</td>
						<td><fmt:formatNumber value="${phong.gia}" type="number" />
							VND</td>
						<td><c:if test="${phong.trangThai eq 'ConPhong'}">
								<span class="badge bg-success">Còn phòng</span>
							</c:if> <c:if test="${phong.trangThai eq 'HetPhong'}">
								<span class="badge bg-secondary">Hết phòng</span>
							</c:if></td>
						<td><fmt:formatDate value="${phong.ngayDang}"
								pattern="dd/MM/yyyy" /></td>
						<td><a
							href="${pageContext.request.contextPath}/chu-tro/xoa-phong?id=${phong.id}"
							class="btn btn-sm btn-danger"
							onclick="return confirm('Bạn có chắc chắn muốn xóa phòng này không?');">Xóa</a>
							<a
							href="${pageContext.request.contextPath}/chu-tro/sua-phong?id=${phong.id}"
							class="btn btn-sm btn-warning">Sửa</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty dsPhongTro}">
					<tr>
						<td colspan="5" class="text-center p-4">Bạn chưa đăng phòng
							trọ nào.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>