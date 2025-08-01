<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Duyệt chủ trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin">Admin Dashboard</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="admin?action=duyetChuTro">Duyệt chủ trọ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=thongKeHoatDong">Thống kê hoạt động</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=thongKeLichHen">Thống kê lịch hẹn</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?action=taiKhoanMoiTuan">Tài khoản mới</a>
                    </li>
                </ul>
                <a href="logout" class="btn btn-outline-light">Đăng xuất</a>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <h2>Duyệt chủ trọ</h2>
        <% if (session.getAttribute("success") != null) { %>
            <div class="alert alert-success"><%= session.getAttribute("success") %></div>
            <% session.removeAttribute("success"); %>
        <% } %>
        <% if (session.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= session.getAttribute("error") %></div>
            <% session.removeAttribute("error"); %>
        <% } %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>CCCD</th>
                    <th>Ngày cấp CCCD</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="chuTro" items="${chuTroChoDuyet}">
                    <tr>
                        <td>${chuTro.id}</td>
                        <td>${chuTro.hoTen}</td>
                        <td>${chuTro.email}</td>
                        <td>${chuTro.soDienThoai}</td>
                        <td>${chuTro.cccd}</td>
                        <td>${chuTro.ngayCapCccd}</td>
                        <td>
                            <form action="admin" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="xacNhanChuTro">
                                <input type="hidden" name="id" value="${chuTro.id}">
                                <button type="submit" class="btn btn-success btn-sm">Xác minh</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>