<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Thống Kê Hoạt Động"/>
    <jsp:param name="activePage" value="thongKe"/>
</jsp:include>

<div class="row mb-4">
    <div class="col-md-12">
        <h3 class="fw-bold"><i class="bi bi-bar-chart-line me-2"></i> Thống Kê Hoạt Động</h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thống Kê</li>
            </ol>
        </nav>
    </div>
</div>

<div class="row g-4 mb-4">
    <div class="col-md-6 col-lg-3">
        <div class="card stat-card primary h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted mb-2">Tổng Tài Khoản</h6>
                        <h3 class="mb-0">${tongTaiKhoan}</h3>
                        <small class="text-success">+${taiKhoanMoiTuan} mới (7 ngày)</small>
                    </div>
                    <div class="bg-primary bg-opacity-10 p-3 rounded">
                        <i class="bi bi-people fs-4 text-primary"></i>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/admin?action=xemTatCaTaiKhoan" class="stretched-link"></a>
        </div>
    </div>
    
    <div class="col-md-6 col-lg-3">
        <div class="card stat-card success h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted mb-2">Tổng Phòng Trọ</h6>
                        <h3 class="mb-0">${tongPhongTro}</h3>
                        <small class="text-success">+${phongMoiTuan} mới (7 ngày)</small>
                    </div>
                    <div class="bg-success bg-opacity-10 p-3 rounded">
                        <i class="bi bi-house-door fs-4 text-success"></i>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/admin?action=xemTatCaPhongTro" class="stretched-link"></a>
        </div>
    </div>
    
    <div class="col-md-6 col-lg-3">
        <div class="card stat-card warning h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted mb-2">Tổng Lịch Hẹn</h6>
                        <h3 class="mb-0">${tongLichHen}</h3>
                        <small class="text-warning">+${lichHenMoiTuan} mới (7 ngày)</small>
                    </div>
                    <div class="bg-warning bg-opacity-10 p-3 rounded">
                        <i class="bi bi-calendar-check fs-4 text-warning"></i>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/admin?action=xemTatCaLichHen" class="stretched-link"></a>
        </div>
    </div>
    
    <div class="col-md-6 col-lg-3">
        <div class="card stat-card danger h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted mb-2">Chủ trọ chờ duyệt</h6>
                        <h3 class="mb-0">${chuTroChoDuyet.size()}</h3>
                        <small class="text-danger">Cần xử lý</small>
                    </div>
                    <div class="bg-danger bg-opacity-10 p-3 rounded">
                        <i class="bi bi-person-x fs-4 text-danger"></i>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/admin?action=duyetChuTro" class="stretched-link"></a>
        </div>
    </div>
</div>

<div class="row g-4">
    <div class="col-lg-8">
        <div class="card h-100">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0"><i class="bi bi-graph-up me-2"></i> Biểu đồ đăng ký tài khoản</h5>
                <div class="dropdown">
                    <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" 
                            data-bs-toggle="dropdown" aria-expanded="false">
                        Theo tháng
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">Theo ngày</a></li>
                        <li><a class="dropdown-item" href="#">Theo tuần</a></li>
                        <li><a class="dropdown-item" href="#">Theo tháng</a></li>
                        <li><a class="dropdown-item" href="#">Theo năm</a></li>
                    </ul>
                </div>
            </div>
            <div class="card-body">
                <div class="chart-container" style="height: 300px;">
                    <!-- Placeholder for chart -->
                    <div class="d-flex align-items-center justify-content-center h-100">
                        <div class="text-center">
                            <i class="bi bi-bar-chart fs-1 text-muted"></i>
                            <p class="mt-2 text-muted">Biểu đồ sẽ hiển thị ở đây</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4">
        <div class="card h-100">
            <div class="card-header bg-white">
                <h5 class="mb-0"><i class="bi bi-pie-chart me-2"></i> Phân bổ người dùng</h5>
            </div>
            <div class="card-body">
                <div class="chart-container" style="height: 300px;">
                    <!-- Placeholder for pie chart -->
                    <div class="d-flex align-items-center justify-content-center h-100">
                        <div class="text-center">
                            <i class="bi bi-pie-chart fs-1 text-muted"></i>
                            <p class="mt-2 text-muted">Biểu đồ sẽ hiển thị ở đây</p>
                        </div>
                    </div>
                </div>
                <div class="mt-3">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <div class="d-flex align-items-center">
                            <span class="badge bg-primary me-2">&nbsp;</span>
                            <span>Người thuê trọ</span>
                        </div>
                        <span class="fw-bold">${phanBoNguoiDung.nguoiThue}%</span>
                    </div>
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <div class="d-flex align-items-center">
                            <span class="badge bg-success me-2">&nbsp;</span>
                            <span>Chủ trọ</span>
                        </div>
                        <span class="fw-bold">${phanBoNguoiDung.chuTro}%</span>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <span class="badge bg-warning me-2">&nbsp;</span>
                            <span>Quản trị viên</span>
                        </div>
                        <span class="fw-bold">${phanBoNguoiDung.quanTriVien}%</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>