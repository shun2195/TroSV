<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Lịch hẹn của tôi</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container my-5">


		<div class="d-flex justify-content-between align-items-center mb-3">
			<div>
				<h2>Lịch hẹn của tôi</h2>
				<p class="text-muted mb-0">Đây là danh sách các lịch hẹn xem
					phòng bạn đã đặt.</p>
			</div>
			<div>
				<%-- Nút Đăng xuất trỏ đến LogoutController --%>
				<a href="${pageContext.request.contextPath}/logout"
					class="btn btn-outline-danger"> <i
					class="bi bi-box-arrow-right me-1"></i> Đăng xuất
				</a>
			</div>
		</div>
		<hr class="mb-4">

		<div class="card">
			<div class="card-body">
				<table class="table table-hover align-middle">
					<thead class="table-light">
						<tr>
							<th>Phòng trọ</th>
							<th>Ngày hẹn</th>
							<th class="text-center">Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dsLichHen}" var="lh">
							<tr>
								<td><a
									href="${pageContext.request.contextPath}/chi-tiet-phong?id=${lh.phongTro.id}">
										${lh.phongTro.tieuDe} </a> <br> <small class="text-muted"><i
										class="bi bi-geo-alt"></i> ${lh.phongTro.diaChi}</small></td>
								<td><fmt:formatDate value="${lh.ngayHen}"
										pattern="dd/MM/yyyy" /> lúc <fmt:formatDate
										value="${lh.gioHen}" pattern="HH:mm" /></td>
								<td class="text-center"><c:choose>
										<c:when test="${lh.trangThai eq 'ChapNhan'}">
											<span class="badge bg-success">Đã được chấp nhận</span>
										</c:when>
										<c:when test="${lh.trangThai eq 'TuChoi'}">
											<span class="badge bg-danger">Đã bị từ chối</span>
										</c:when>
										<c:otherwise>
											<span class="badge bg-warning text-dark">Đang chờ
												duyệt</span>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
						<c:if test="${empty dsLichHen}">
							<tr>
								<td colspan="3" class="text-center p-4">Bạn chưa đặt lịch
									hẹn nào.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>