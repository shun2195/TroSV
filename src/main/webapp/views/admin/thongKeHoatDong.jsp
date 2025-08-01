<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Thống Kê Hoạt Động"/>
    <jsp:param name="activePage" value="thongKeHoatDong"/>
</jsp:include>
<div class="container mt-4">
    <h2 class="mb-4"><i class="bi bi-bar-chart-line-fill"></i> Thống Kê Tổng Quan</h2>
    <div class="row g-4">
        <div class="col-md-6 col-lg-3"><div class="card text-white bg-primary shadow h-100"><div class="card-body"><h3>${tongTaiKhoan}</h3><p>Tổng Tài Khoản</p></div><a href="${pageContext.request.contextPath}/admin?action=xemTatCaTaiKhoan" class="card-footer text-white">Xem chi tiết »</a></div></div>
        <div class="col-md-6 col-lg-3"><div class="card text-white bg-success shadow h-100"><div class="card-body"><h3>${tongPhongTro}</h3><p>Tổng Phòng Trọ</p></div><a href="${pageContext.request.contextPath}/admin?action=xemTatCaPhongTro" class="card-footer text-white">Xem chi tiết »</a></div></div>
        <div class="col-md-6 col-lg-3"><div class="card text-white bg-warning shadow h-100"><div class="card-body"><h3>${tongLichHen}</h3><p>Tổng Lịch Hẹn</p></div><a href="${pageContext.request.contextPath}/admin?action=xemTatCaLichHen" class="card-footer text-white">Xem chi tiết »</a></div></div>
        <div class="col-md-6 col-lg-3"><div class="card text-white bg-info shadow h-100"><div class="card-body"><h3>${taiKhoanMoiTuan}</h3><p>TK Mới (7 ngày)</p></div><a href="${pageContext.request.contextPath}/admin?action=xemTaiKhoanMoi" class="card-footer text-white">Xem chi tiết »</a></div></div>
    </div>
</div>
<jsp:include page="footer.jsp"/>