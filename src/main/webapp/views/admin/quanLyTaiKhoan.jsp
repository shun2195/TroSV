<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    <div class="container-fluid">
        <div class="row">
            <%@ include file="adminSidebar.jsp" %>
            
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Quản lý tài khoản</h1>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#themTaiKhoanModal">
                        <i class="bi bi-plus"></i> Thêm tài khoản
                    </button>
                </div>
                
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Họ tên</th>
                                <th>Email</th>
                                <th>Vai trò</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${dsTaiKhoan}" var="tk">
                                <tr>
                                    <td>${tk.id}</td>
                                    <td>${tk.hoTen}</td>
                                    <td>${tk.email}</td>
                                    <td>
                                        <span class="badge ${tk.vaiTro == 'admin' ? 'bg-danger' : 'bg-primary'}">
                                            ${tk.vaiTro}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-success">Hoạt động</span>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary" 
                                            data-bs-toggle="modal" 
                                            data-bs-target="#suaTaiKhoanModal"
                                            onclick="loadTaiKhoanData(${tk.id}, '${tk.hoTen}', '${tk.email}', '${tk.vaiTro}')">
                                            <i class="bi bi-pencil"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger" onclick="xoaTaiKhoan(${tk.id})">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <!-- Phân trang -->
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </main>
        </div>
    </div>
    
    <!-- Modal thêm tài khoản -->
    <div class="modal fade" id="themTaiKhoanModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm tài khoản mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="ThemTaiKhoanServlet" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="hoTenMoi" class="form-label">Họ tên</label>
                            <input type="text" class="form-control" id="hoTenMoi" name="hoTen" required>
                        </div>
                        <div class="mb-3">
                            <label for="emailMoi" class="form-label">Email</label>
                            <input type="email" class="form-control" id="emailMoi" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="matKhauMoi" class="form-label">Mật khẩu</label>
                            <input type="password" class="form-control" id="matKhauMoi" name="matKhau" required>
                        </div>
                        <div class="mb-3">
                            <label for="vaiTroMoi" class="form-label">Vai trò</label>
                            <select class="form-select" id="vaiTroMoi" name="vaiTro">
                                <option value="user">Người dùng</option>
                                <option value="admin">Quản trị viên</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Modal sửa tài khoản -->
    <div class="modal fade" id="suaTaiKhoanModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sửa thông tin tài khoản</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="SuaTaiKhoanServlet" method="post">
                    <input type="hidden" id="idSua" name="id">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="hoTenSua" class="form-label">Họ tên</label>
                            <input type="text" class="form-control" id="hoTenSua" name="hoTen" required>
                        </div>
                        <div class="mb-3">
                            <label for="emailSua" class="form-label">Email</label>
                            <input type="email" class="form-control" id="emailSua" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="vaiTroSua" class="form-label">Vai trò</label>
                            <select class="form-select" id="vaiTroSua" name="vaiTro">
                                <option value="user">Người dùng</option>
                                <option value="admin">Quản trị viên</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function loadTaiKhoanData(id, hoTen, email, vaiTro) {
            document.getElementById('idSua').value = id;
            document.getElementById('hoTenSua').value = hoTen;
            document.getElementById('emailSua').value = email;
            document.getElementById('vaiTroSua').value = vaiTro;
        }
        
        function xoaTaiKhoan(id) {
            if (confirm('Bạn có chắc chắn muốn xóa tài khoản này?')) {
                window.location.href = 'XoaTaiKhoanServlet?id=' + id;
            }
        }
    </script>
</body>
</html>