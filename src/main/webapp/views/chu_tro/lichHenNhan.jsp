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
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container my-5">
        <h2 class="mb-4">Lịch Hẹn Đã Nhận</h2>

        <%-- Hiển thị thông báo (nếu có) --%>
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success">${sessionScope.successMessage}</div>
            <c:remove var="successMessage" scope="session"/>
        </c:if>

        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <%-- BẮT ĐẦU BẢNG --%>
                    <table class="table table-hover align-middle">
                        <%-- TIÊU ĐỀ BẢNG --%>
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
                        <%-- THÂN BẢNG (CHỨA DỮ LIỆU) --%>
                        <tbody>
                            <c:forEach var="lh" items="${danhSachLichHen}">
                                <%-- MỖI LỊCH HẸN LÀ MỘT HÀNG (tr) --%>
                                <tr>
                                    <%-- MỖI THÔNG TIN LÀ MỘT Ô (td) --%>
                                    <td>${lh.phongTro.tieuDe}</td>
                                    <td>${lh.nguoiThue.hoTen}</td>
                                    <td>${lh.nguoiThue.soDienThoai}</td>
                                    <td>
                                        <fmt:formatDate value="${lh.ngayHen}" pattern="dd/MM/yyyy"/>
                                        lúc <fmt:formatDate value="${lh.gioHen}" pattern="HH:mm"/>
                                    </td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${lh.trangThai eq 'ChapNhan'}"><span class="badge bg-success">Đã Chấp Nhận</span></c:when>
                                            <c:when test="${lh.trangThai eq 'TuChoi'}"><span class="badge bg-danger">Đã Từ Chối</span></c:when>
                                            <c:otherwise><span class="badge bg-warning text-dark">Chờ Duyệt</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <c:if test="${lh.trangThai eq 'ChoDuyet'}">
                                            <form action="${pageContext.request.contextPath}/lich-hen" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="capNhatTrangThai">
                                                <input type="hidden" name="idLichHen" value="${lh.id}">
                                                <input type="hidden" name="trangThaiMoi" value="ChapNhan">
                                                <button type="submit" class="btn btn-success btn-sm" title="Chấp nhận"><i class="bi bi-check-lg"></i></button>
                                            </form>
                                            <form action="${pageContext.request.contextPath}/lich-hen" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="capNhatTrangThai">
                                                <input type="hidden" name="idLichHen" value="${lh.id}">
                                                <input type="hidden" name="trangThaiMoi" value="TuChoi">
                                                <button type="submit" class="btn btn-danger btn-sm" title="Từ chối"><i class="bi bi-x-lg"></i></button>
                                            </form>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty danhSachLichHen}">
                                <tr><td colspan="6" class="text-center p-4">Bạn chưa có lịch hẹn nào.</td></tr>
                            </c:if>
                        </tbody>
                    </table>
                    <%-- KẾT THÚC BẢNG --%>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>