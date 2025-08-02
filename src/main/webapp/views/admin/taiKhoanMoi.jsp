<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Tài khoản mới"/>
    <jsp:param name="activePage" value="thongKe"/>
</jsp:include>

<div class="row mb-4">
    <div class="col-md-12">
        <h3 class="fw-bold"><i class="bi bi-person-plus me-2"></i> Tài khoản mới</h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin?action=thongKeHoatDong">Thống kê</a></li>
                <li class="breadcrumb-item active" aria-current="page">Tài khoản mới</li>
            </ol>
        </nav>
    </div>
</div>

<div class="row g-4">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header bg-white">
                <h5 class="mb-0">Tài khoản mới đăng ký</h5>
            </div>
            <div class="card-body">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <div>
                        <h2 class="mb-0">${taiKhoanMoiTuan}</h2>
                        <small class="text-muted">Tài khoản mới trong 7 ngày qua</small>
                    </div>
                    <div class="bg-primary bg-opacity-10 p-3 rounded">
                        <i class="bi bi-people-fill fs-2 text-primary"></i>
                    </div>
                </div>
                
                <div class="progress mb-3" style="height: 10px;">
                    <div class="progress-bar bg-primary" role="progressbar" 
                         style="width: ${(taiKhoanMoiTuan / (tongTaiKhoan/20)) * 100}%" 
                         aria-valuenow="${taiKhoanMoiTuan}" aria-valuemin="0" 
                         aria-valuemax="${tongTaiKhoan/20}"></div>
                </div>
                
                <div class="d-flex justify-content-between">
                    <small class="text-muted">Tăng trưởng</small>
                    <small class="text-primary fw-bold">+${(taiKhoanMoiTuan / (tongTaiKhoan - taiKhoanMoiTuan)) * 100}%</small>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-6">
        <div class="card">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Phân loại tài khoản</h5>
                <span class="badge bg-primary">${taiKhoanMoiTuan} tài khoản</span>
            </div>
            <div class="card-body">
                <div class="chart-container" style="height: 200px;">
                    <!-- Placeholder for chart -->
                    <div class="d-flex align-items-center justify-content-center h-100">
                        <div class="text-center">
                            <i class="bi bi-pie-chart fs-1 text-muted"></i>
                            <p class="mt-2 text-muted">Biểu đồ sẽ hiển thị ở đây</p>
                        </div>
                    </div>
                </div>
                <div class="mt-4">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <div class="d-flex align-items-center">
                            <span class="badge bg-primary me-2">&nbsp;</span>
                            <span>Người thuê trọ</span>
                        </div>
                        <span class="fw-bold">${phanBoTaiKhoanMoi.nguoiThue}%</span>
                    </div>
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <div class="d-flex align-items-center">
                            <span class="badge bg-success me-2">&nbsp;</span>
                            <span>Chủ trọ</span>
                        </div>
                        <span class="fw-bold">${phanBoTaiKhoanMoi.chuTro}%</span>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <span class="badge bg-warning me-2">&nbsp;</span>
                            <span>Khác</span>
                        </div>
                        <span class="fw-bold">${phanBoTaiKhoanMoi.khac}%</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row mt-4">
    <div class="col-12">
        <div class="card">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Danh sách tài khoản mới</h5>
                <a href="${pageContext.request.contextPath}/admin?action=thongKeHoatDong" 
                   class="btn btn-sm btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i> Quay lại
                </a>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Họ Tên</th>
                                <th>Email</th>
                                <th>Ngày ĐK</th>
                                <th>Vai Trò</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="tk" items="${danhSachTaiKhoanMoi}">
                                <tr>
                                    <td>${tk.id}</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm me-2">
                                                <div class="avatar-title bg-light rounded">
                                                    ${tk.hoTen.charAt(0)}
                                                </div>
                                            </div>
                                            <div>
                                                <h6 class="mb-0">${tk.hoTen}</h6>
                                                <small class="text-muted">${tk.soDienThoai}</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>${tk.email}</td>
                                    <td>${tk.ngayDangKy}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${tk.vaiTro eq 'CHU_TRO'}">
                                                <span class="badge bg-success">Chủ trọ</span>
                                            </c:when>
                                            <c:when test="${tk.vaiTro eq 'NGUOI_THUE'}">
                                                <span class="badge bg-primary">Người thuê</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">${tk.vaiTro}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty danhSachTaiKhoanMoi}">
                                <tr>
                                    <td colspan="5" class="text-center py-5">
                                        <div class="py-4">
                                            <i class="bi bi-emoji-smile fs-1 text-muted"></i>
                                            <h5 class="mt-3">Không có tài khoản mới</h5>
                                            <p class="text-muted">Không có tài khoản nào đăng ký trong 7 ngày qua</p>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>