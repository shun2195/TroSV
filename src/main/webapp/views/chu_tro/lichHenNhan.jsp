<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý lịch hẹn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <style>
        .badge {
            font-size: 0.85em;
            padding: 0.5em 0.75em;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(13, 110, 253, 0.05);
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp">
        <jsp:param name="active" value="lich-hen"/>
    </jsp:include>

    <div class="container my-5">
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Lịch hẹn đã nhận</li>
            </ol>
        </nav>

        <div class="card border-0 shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Lịch Hẹn Đã Nhận</h4>
            </div>
            
            <div class="card-body">
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="alert alert-success alert-dismissible fade show">
                        ${sessionScope.successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <c:remove var="successMessage" scope="session"/>
                </c:if>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Phòng Trọ</th>
                                <th>Người Đặt Hẹn</th>
                                <th>SĐT Người Đặt</th>
                                <th>Ngày Hẹn</th>
                                <th class="text-center">Trạng Thái</th>
                                <th class="text-center">Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="lh" items="${danhSachLichHen}">
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/phong/${lh.phongTro.id}" class="text-decoration-none">
                                            ${lh.phongTro.tieuDe}
                                        </a>
                                    </td>
                                    <td>${lh.nguoiThue.hoTen}</td>
                                    <td>${lh.nguoiThue.soDienThoai}</td>
                                    <td>
                                        <fmt:formatDate value="${lh.ngayHen}" pattern="dd/MM/yyyy"/>
                                        lúc <fmt:formatDate value="${lh.gioHen}" pattern="HH:mm"/>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge ${lh.trangThai eq 'ChapNhan' ? 'bg-success' : 
                                                          lh.trangThai eq 'TuChoi' ? 'bg-danger' : 'bg-warning text-dark'}">
                                            ${lh.trangThai eq 'ChapNhan' ? 'Đã Chấp Nhận' : 
                                             lh.trangThai eq 'TuChoi' ? 'Đã Từ Chối' : 'Chờ Duyệt'}
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <c:if test="${lh.trangThai eq 'ChoDuyet'}">
                                            <div class="d-flex gap-2 justify-content-center">
                                                <form action="${pageContext.request.contextPath}/lich-hen" method="post" class="d-inline">
                                                    <input type="hidden" name="action" value="capNhatTrangThai">
                                                    <input type="hidden" name="idLichHen" value="${lh.id}">
                                                    <input type="hidden" name="trangThaiMoi" value="ChapNhan">
                                                    <button type="submit" class="btn btn-sm btn-success" title="Chấp nhận">
                                                        <i class="bi bi-check-lg"></i> Chấp nhận
                                                    </button>
                                                </form>
                                                <form action="${pageContext.request.contextPath}/lich-hen" method="post" class="d-inline">
                                                    <input type="hidden" name="action" value="capNhatTrangThai">
                                                    <input type="hidden" name="idLichHen" value="${lh.id}">
                                                    <input type="hidden" name="trangThaiMoi" value="TuChoi">
                                                    <button type="submit" class="btn btn-sm btn-danger" title="Từ chối">
                                                        <i class="bi bi-x-lg"></i> Từ chối
                                                    </button>
                                                </form>
                                            </div>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty danhSachLichHen}">
                                <tr>
                                    <td colspan="6" class="text-center p-5 text-muted">
                                        <i class="bi bi-calendar-x" style="font-size: 2rem;"></i>
                                        <p class="mt-2">Bạn chưa có lịch hẹn nào.</p>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>