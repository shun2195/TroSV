<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp">
	<jsp:param name="title" value="Dashboard" />
	<jsp:param name="activePage" value="dashboard" />
</jsp:include>
<div class="container mt-4">
	<h2 class="mb-4">
		<i class="bi bi-speedometer2"></i> Bảng điều khiển
	</h2>
	<c:if test="${not empty sessionScope.success}">
		<div class="alert alert-success">${sessionScope.success}</div>
		<c:remove var="success" scope="session" />
	</c:if>
	<div class="row row-cols-1 row-cols-md-2 g-4">
		<div class="col">
			<div class="card h-100">
				<div class="card-body text-center">
					<h5 class="card-title">Duyệt Chủ Trọ</h5>
					<p class="card-text text-muted">Xác minh các tài khoản chủ trọ
						mới.</p>
					<a
						href="${pageContext.request.contextPath}/admin?action=duyetChuTro"
						class="btn btn-primary">Quản lý</a>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<div class="card-body text-center">
					<h5 class="card-title">Thống Kê</h5>
					<p class="card-text text-muted">Xem các số liệu tổng quan của
						hệ thống.</p>
					<a
						href="${pageContext.request.contextPath}/admin?action=thongKeHoatDong"
						class="btn btn-success">Xem báo cáo</a>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />