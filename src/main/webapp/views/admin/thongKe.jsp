<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/views/admin/header.jsp" %>
<div class="container mt-5">
    <h2>Thống kê hoạt động</h2>
    <div class="row g-4 mt-3">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">Tổng tài khoản</h5>
                    <p class="card-text display-6">${tongTaiKhoan}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">Tổng phòng trọ</h5>
                    <p class="card-text display-6">${tongPhongTro}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">Tổng lịch hẹn</h5>
                    <p class="card-text display-6">${tongLichHen}</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>