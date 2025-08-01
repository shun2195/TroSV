<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/views/admin/header.jsp" %>
<div class="container mt-5">
    <h2 class="mb-4">Dashboard Admin</h2>
    <%-- Các thẻ c:if để hiển thị thông báo thành công/lỗi --%>
    <c:if test="${not empty sessionScope.success}">
        <div class="alert alert-success" role="alert">${sessionScope.success}</div>
        <c:remove var="success" scope="session"/>
    </c:if>
    <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-danger" role="alert">${sessionScope.error}</div>
        <c:remove var="error" scope="session"/>
    </c:if>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        <div class="col">
            <div class="card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                    <h5 class="card-title">Duyệt chủ trọ</h5>
                    <p class="card-text">Xác minh danh sách chủ trọ.</p>
                    <%-- SỬA LẠI ĐƯỜNG DẪN Ở ĐÂY --%>
                    <a href="${pageContext.request.contextPath}/admin?action=duyetChuTro" class="btn btn-outline-primary btn-sm">Truy cập</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                    <h5 class="card-title">Thống kê hoạt động</h5>
                    <p class="card-text">Xem tổng quan tài khoản, phòng trọ.</p>
                    <%-- SỬA LẠI ĐƯỜNG DẪN Ở ĐÂY --%>
                    <a href="${pageContext.request.contextPath}/admin?action=thongKeHoatDong" class="btn btn-outline-primary btn-sm">Truy cập</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                    <h5 class="card-title">Thống kê lịch hẹn</h5>
                    <p class="card-text">Xem tổng số lịch hẹn.</p>
                    <%-- SỬA LẠI ĐƯỜNG DẪN Ở ĐÂY --%>
                    <a href="${pageContext.request.contextPath}/admin?action=thongKeLichHen" class="btn btn-outline-primary btn-sm">Truy cập</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                    <h5 class="card-title">Tài khoản mới</h5>
                    <p class="card-text">Xem tài khoản trong 7 ngày.</p>
                    <%-- SỬA LẠI ĐƯỜNG DẪN Ở ĐÂY --%>
                    <a href="${pageContext.request.contextPath}/admin?action=taiKhoanMoiTuan" class="btn btn-outline-primary btn-sm">Truy cập</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>