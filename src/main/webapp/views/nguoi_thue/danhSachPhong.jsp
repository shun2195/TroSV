<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Tìm kiếm phòng trọ</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container mt-4">
		<div class="row">

			<!-- ============================================= -->
			<!-- == PHẦN MỚI: BỘ LỌC TÌM KIẾM BÊN TRÁI == -->
			<!-- ============================================= -->
			<div class="col-lg-3">
				<div class="card sticky-top" style="top: 20px;">
					<div class="card-header bg-light">
						<h5 class="mb-0">Bộ lọc tìm kiếm</h5>
					</div>
					<div class="card-body">
						<%-- Form này sẽ gửi yêu cầu đến NguoiThueController --%>
						<form action="${pageContext.request.contextPath}/danh-sach-phong"
							method="get">
							<div class="mb-3">
								<label class="form-label fw-bold">Phường/Xã</label> <select
									class="form-select" name="idPhuong">
									<option value="">Tất cả các phường</option>
									<%-- Lặp qua dsPhuong mà Controller gửi sang --%>
									<c:forEach items="${dsPhuong}" var="phuong">
										<%-- Giữ lại lựa chọn cũ của người dùng sau khi tìm kiếm --%>
										<option value="${phuong.id}"
											${phuong.id eq param.idPhuong ? 'selected' : ''}>
											${phuong.tenPhuong}</option>
									</c:forEach>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label fw-bold">Khoảng giá</label> <select
									class="form-select" name="khoangGia">
									<option value="">Tất cả các mức giá</option>
									<option value="1" ${param.khoangGia eq '1' ? 'selected' : ''}>Dưới
										2 triệu</option>
									<option value="2" ${param.khoangGia eq '2' ? 'selected' : ''}>Từ
										2 - 3 triệu</option>
									<option value="3" ${param.khoangGia eq '3' ? 'selected' : ''}>Từ
										3 - 5 triệu</option>
									<option value="4" ${param.khoangGia eq '4' ? 'selected' : ''}>Trên
										5 triệu</option>
								</select>
							</div>
							<button type="submit" class="btn btn-primary w-100">Áp
								dụng</button>
						</form>
					</div>
				</div>
			</div>

			<!-- ============================================= -->
			<!-- == PHẦN CŨ: HIỂN THỊ KẾT QUẢ BÊN PHẢI == -->
			<!-- ============================================= -->
			<div class="col-lg-9">
				<h4>
					Tìm thấy <span class="text-danger">${dsPhongTro.size()}</span>
					phòng trọ phù hợp
				</h4>
				<hr>
				<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
					<%-- Phần lặp qua danh sách phòng của bạn giữ nguyên --%>
					<c:forEach items="${dsPhongTro}" var="phong">
						<div class="col">
							<div class="card h-100">
								<img src="https://via.placeholder.com/400x250"
									class="card-img-top" alt="Ảnh phòng">
								<div class="card-body">
									<h5 class="card-title text-truncate">${phong.tieuDe}</h5>
									<p class="card-text text-danger fw-bold">
										<fmt:formatNumber value="${phong.gia}" type="number" />
										VND/tháng
									</p>
									<p class="card-text text-muted">${phong.diaChi},
										${phong.phuong.tenPhuong}</p>
								</div>
								<div class="card-footer bg-white border-0">
									<a
										href="${pageContext.request.contextPath}/chi-tiet-phong?id=${phong.id}"
										class="btn btn-primary w-100">Xem chi tiết</a>
								</div>
							</div>
						</div>
					</c:forEach>

					<%-- Thông báo nếu không có kết quả --%>
					<c:if test="${empty dsPhongTro}">
						<div class="col-12">
							<div class="alert alert-warning text-center">Không tìm thấy
								phòng trọ nào phù hợp với tiêu chí của bạn.</div>
						</div>
					</c:if>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>