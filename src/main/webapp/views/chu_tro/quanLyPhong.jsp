<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý phòng trọ</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    .table-hover tbody tr:hover {
        background-color: rgba(13, 110, 253, 0.05);
    }
    .action-buttons .btn {
        width: 80px;
    }
    .badge {
        font-size: 0.85em;
        padding: 0.5em 0.75em;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp">
        <jsp:param name="active" value="quan-ly-phong"/>
    </jsp:include>
    
	<div class="container my-4">
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page"></li>
            </ol>
        </nav>

        <div class="card border-0 shadow">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Danh sách phòng trọ của bạn</h4>
                <a href="${pageContext.request.contextPath}/chu-tro/dang-phong" class="btn btn-light">
                    <i class="bi bi-plus-lg me-1"></i> Đăng phòng mới
                </a>
            </div>

            <div class="card-body">
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="alert alert-success alert-dismissible fade show">
                        ${sessionScope.successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <c:remove var="successMessage" scope="session" />
                </c:if>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Tiêu đề</th>
                                <th>Giá/tháng</th>
                                <th>Trạng thái</th>
                                <th>Ngày đăng</th>
                                <th class="text-end">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${dsPhongTro}" var="phong">
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/phong/${phong.id}" class="text-decoration-none">
                                            ${phong.tieuDe}
                                        </a>
                                    </td>
                                    <td><fmt:formatNumber value="${phong.gia}" type="number" /> VND</td>
                                    <td>
                                        <span class="badge ${phong.trangThai eq 'ConPhong' ? 'bg-success' : 'bg-secondary'}">
                                            ${phong.trangThai eq 'ConPhong' ? 'Còn phòng' : 'Hết phòng'}
                                        </span>
                                    </td>
                                    <td><fmt:formatDate value="${phong.ngayDang}" pattern="dd/MM/yyyy" /></td>
                                    <td class="text-end action-buttons">
                                        <div class="d-flex gap-2 justify-content-end">
                                            <a href="${pageContext.request.contextPath}/chu-tro/sua-phong?id=${phong.id}" 
                                               class="btn btn-sm btn-outline-primary">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/chu-tro/xoa-phong?id=${phong.id}"
                                                class="btn btn-sm btn-outline-danger"
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa phòng này không?');">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty dsPhongTro}">
                                <tr>
                                    <td colspan="5" class="text-center p-5 text-muted">
                                        <i class="bi bi-house-x" style="font-size: 2rem;"></i>
                                        <p class="mt-2">Bạn chưa đăng phòng trọ nào.</p>
                                        <a href="${pageContext.request.contextPath}/chu-tro/dang-phong" class="btn btn-primary mt-2">
                                            <i class="bi bi-plus-lg me-1"></i> Đăng phòng ngay
                                        </a>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
	</div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>