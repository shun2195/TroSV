<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Giả sử bạn có header và footer chung --%>
<jsp:include page="/views/common/header.jsp"/>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">

            <c:choose>
                <%-- TRƯỜNG HỢP 1: Đã có thông tin phòng trọ và người dùng hợp lệ --%>
                <c:when test="${not empty phongTro and not empty sessionScope.user and sessionScope.user.vaiTro eq 'NguoiThue'}">
                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0"><i class="bi bi-calendar-plus-fill"></i> Đặt Lịch Hẹn Xem Phòng</h4>
                        </div>
                        <div class="card-body p-4">
                            <div class="alert alert-secondary">
                                <p class="mb-1"><strong>Phòng trọ:</strong> ${phongTro.tieuDe}</p>
                                <p class="mb-0 text-muted"><i class="bi bi-geo-alt-fill"></i> ${phongTro.diaChi}</p>
                            </div>

                            <form action="${pageContext.request.contextPath}/lich-hen" method="post">
                                <!-- Các trường ẩn cần thiết để Controller xử lý -->
                                <input type="hidden" name="action" value="datLich">
                                <input type="hidden" name="idPhong" value="${phongTro.id}">

                                <h5 class="mt-4">Thông tin của bạn</h5>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Họ và tên:</label>
                                        <input type="text" class="form-control" value="${sessionScope.user.hoTen}" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Email:</label>
                                        <input type="email" class="form-control" value="${sessionScope.user.email}" readonly>
                                    </div>
                                </div>
                                
                                <hr class="my-4">

                                <h5 class="mt-4">Thời gian hẹn</h5>
                                <p class="text-muted">Vui lòng chọn ngày và giờ bạn muốn đến xem phòng.</p>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="ngayHen" class="form-label">Ngày xem phòng <span class="text-danger">*</span></label>
                                        <input type="date" class="form-control" id="ngayHen" name="ngayHen" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="gioHen" class="form-label">Giờ xem phòng <span class="text-danger">*</span></label>
                                        <input type="time" class="form-control" id="gioHen" name="gioHen" required>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-end mt-4">
                                    <a href="${pageContext.request.contextPath}/phong-tro?action=chi-tiet&id=${phongTro.id}" class="btn btn-secondary me-2">
                                        <i class="bi bi-arrow-left"></i> Quay lại
                                    </a>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-send-fill"></i> Gửi Yêu Cầu
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:when>

                <%-- TRƯỜNG HỢP 2: Chưa đăng nhập hoặc sai vai trò --%>
                <c:when test="${empty sessionScope.user or sessionScope.user.vaiTro ne 'NguoiThue'}">
                     <div class="text-center p-5 border rounded bg-light">
                        <i class="bi bi-exclamation-circle-fill text-warning" style="font-size: 4rem;"></i>
                        <h4 class="mt-3">Yêu cầu đăng nhập</h4>
                        <p class="lead">Vui lòng <a href="${pageContext.request.contextPath}/login">đăng nhập</a> với tài khoản **Người thuê** để thực hiện chức năng này.</p>
                    </div>
                </c:when>

                <%-- TRƯỜNG HỢP 3: Lỗi không tìm thấy phòng trọ --%>
                <c:otherwise>
                    <div class="alert alert-danger text-center p-5">
                        <h4 class="alert-heading">Lỗi!</h4>
                        <p>Không tìm thấy thông tin phòng trọ. Vui lòng quay lại và thử lại.</p>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

<jsp:include page="/views/common/footer.jsp"/>