<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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
                    <h1 class="h2">Dashboard</h1>
                </div>
                
                <!-- Thống kê -->
                <div class="row">
                    <div class="col-md-3">
                        <div class="card text-white bg-primary mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Tổng phòng trọ</h5>
                                <p class="card-text h2">${tongPhong}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-success mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Phòng đã thuê</h5>
                                <p class="card-text h2">${phongDaThue}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-warning mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Lịch hẹn mới</h5>
                                <p class="card-text h2">${lichHenMoi}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-danger mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Tài khoản</h5>
                                <p class="card-text h2">${tongTaiKhoan}</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Biểu đồ và bảng thống kê -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Thống kê phòng trọ</h5>
                            </div>
                            <div class="card-body">
                                <!-- Placeholder cho biểu đồ -->
                                <div id="thongKePhongChart" style="height: 300px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Lịch hẹn mới nhất</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Phòng</th>
                                                <th>Ngày xem</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${dsLichHenMoi}" var="lichHen">
                                                <tr>
                                                    <td>${lichHen.phong.tieuDe}</td>
                                                    <td>${lichHen.ngayXem}</td>
                                                    <td><span class="badge bg-warning">Chờ xác nhận</span></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Khởi tạo biểu đồ
        const ctx = document.getElementById('thongKePhongChart');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Đã thuê', 'Còn trống', 'Đang sửa chữa'],
                datasets: [{
                    label: 'Thống kê phòng trọ',
                    data: [${phongDaThue}, ${phongConTrong}, ${phongDangSua}],
                    backgroundColor: [
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)'
                    ],
                    borderColor: [
                        'rgba(75, 192, 192, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>