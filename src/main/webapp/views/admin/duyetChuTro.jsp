<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Duyệt Chủ Trọ"/>
    <jsp:param name="activePage" value="duyetChuTro"/>
</jsp:include>

<div class="row mb-4">
    <div class="col-md-12">
        <h3 class="fw-bold"><i class="bi bi-person-check me-2"></i> Duyệt Chủ Trọ</h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Duyệt Chủ Trọ</li>
            </ol>
        </nav>
    </div>
</div>

<c:if test="${not empty sessionScope.success}">
    <div class="alert alert-success alert-dismissible fade show">
        ${sessionScope.success}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <c:remove var="success" scope="session" />
</c:if>

<div class="card">
    <div class="card-header bg-white d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Danh sách Chủ Trọ chờ duyệt</h5>
        <span class="badge bg-primary">${chuTroChoDuyet.size()} yêu cầu</span>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Họ Tên</th>
                        <th>Email</th>
                        <th>SĐT</th>
                        <th>CCCD</th>
                        <th class="text-center">Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="chuTro" items="${chuTroChoDuyet}">
                        <tr>
                            <td>${chuTro.id}</td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="avatar-sm me-2">
                                        <div class="avatar-title bg-light rounded">
                                            ${chuTro.hoTen.charAt(0)}
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="mb-0">${chuTro.hoTen}</h6>
                                        <small class="text-muted">Ngày đăng ký: ${chuTro.ngayDangKy}</small>
                                    </div>
                                </div>
                            </td>
                            <td>${chuTro.email}</td>
                            <td>${chuTro.soDienThoai}</td>
                            <td>
                                <span class="d-block">${chuTro.cccd}</span>
                                <small class="text-muted">Ngày cấp: ${chuTro.ngayCapCccd}</small>
                            </td>
                            <td class="text-center">
                                <div class="d-flex justify-content-center gap-2">
                                    <form action="admin" method="post" class="d-inline">
                                        <input type="hidden" name="action" value="xacNhanChuTro"/>
                                        <input type="hidden" name="id" value="${chuTro.id}"/>
                                        <button type="submit" class="btn btn-success btn-sm">
                                            <i class="bi bi-check-circle me-1"></i> Duyệt
                                        </button>
                                    </form>
                                    <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" 
                                            data-bs-target="#detailModal${chuTro.id}">
                                        <i class="bi bi-eye me-1"></i> Xem
                                    </button>
                                </div>
                            </td>
                        </tr>
                        
                        <!-- Modal for details -->
                        <div class="modal fade" id="detailModal${chuTro.id}" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Chi tiết Chủ Trọ</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <h6>Thông tin cá nhân</h6>
                                            <p class="mb-1"><strong>Họ tên:</strong> ${chuTro.hoTen}</p>
                                            <p class="mb-1"><strong>Email:</strong> ${chuTro.email}</p>
                                            <p class="mb-1"><strong>SĐT:</strong> ${chuTro.soDienThoai}</p>
                                        </div>
                                        <div class="mb-3">
                                            <h6>Thông tin CCCD</h6>
                                            <p class="mb-1"><strong>Số CCCD:</strong> ${chuTro.cccd}</p>
                                            <p class="mb-1"><strong>Ngày cấp:</strong> ${chuTro.ngayCapCccd}</p>
                                            <p class="mb-1"><strong>Nơi cấp:</strong> ${chuTro.noiCapCccd}</p>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty chuTroChoDuyet}">
                        <tr>
                            <td colspan="6" class="text-center py-5">
                                <div class="py-4">
                                    <i class="bi bi-emoji-smile fs-1 text-muted"></i>
                                    <h5 class="mt-3">Không có yêu cầu nào chờ duyệt</h5>
                                    <p class="text-muted">Tất cả các yêu cầu đã được xử lý</p>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>