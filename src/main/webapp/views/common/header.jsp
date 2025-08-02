<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
	<div class="container">

		<%-- SỬA 1: Link Logo trỏ về trang chủ qua Controller --%>
		<a class="navbar-brand fw-bold"
			href="${pageContext.request.contextPath}/">TRỌ SV</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<%-- Link "Trang chủ" -> Giữ nguyên, đã đúng --%> <a
					class="nav-link" href="${pageContext.request.contextPath}/">Trang
						chủ</a>
				</li>
				<li class="nav-item">
					<%-- Link "Tìm phòng" -> Giữ nguyên, đã đúng --%> <a
					class="nav-link"
					href="${pageContext.request.contextPath}/danh-sach-phong">Tìm
						phòng</a>
				</li>

				<%-- SỬA 2: Sửa tên biến session và so sánh vai trò --%>
				<c:if
					test="${not empty sessionScope.account and sessionScope.account.vaiTro eq 'Admin'}">
					<li class="nav-item">
						<%-- SỬA 3: Link Quản trị trỏ đến Controller thay vì file JSP --%>
						<a class="nav-link"
						href="${pageContext.request.contextPath}/admin/dashboard">Quản
							trị</a>
					</li>
				</c:if>

				<c:if
					test="${not empty sessionScope.account and sessionScope.account.vaiTro eq 'ChuTro'}">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/chu-tro/dashboard">Kênh
							Chủ Trọ</a></li>
				</c:if>
			</ul>

			<div class="d-flex">
				<c:choose>
					<%-- SỬA 4: Sửa tên biến session để kiểm tra đăng nhập --%>
					<c:when test="${not empty sessionScope.account}">
						<div class="dropdown">
							<button class="btn btn-outline-light dropdown-toggle"
								type="button" data-bs-toggle="dropdown">Xin chào,
								${sessionScope.account.hoTen}</button>
							<ul class="dropdown-menu dropdown-menu-end">
								<li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
								<li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<%-- Phần này giữ nguyên, đã đúng --%>
						<a href="${pageContext.request.contextPath}/login"
							class="btn btn-light me-2">Đăng nhập</a>
						<a href="${pageContext.request.contextPath}/register"
							class="btn btn-warning">Đăng ký</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</nav>

<%-- Cần thêm Bootstrap JS để dropdown hoạt động --%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>