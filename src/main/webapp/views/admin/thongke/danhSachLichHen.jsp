<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="${tieuDe}"/>
    <jsp:param name="activePage" value="thongKeHoatDong"/>
</jsp:include>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="bi bi-calendar-check-fill"></i> ${tieuDe}</h2>
        <a href="${pageContext.request.contextPath}/admin?action=thongKeHoatDong" class="btn btn-secondary btn-sm">
            <i class="bi bi-arrow-left"></i> Quay lại
        </a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>ID Lịch Hẹn</th>
                            <th>Phòng Trọ</th>
                            <th>Người Đặt</th>
                            <th>Ngày Hẹn</th>
                            <th>Giờ Hẹn</th>
                            <th>Trạng Thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="lh" items="${danhSach}">
                            <tr>
                                <td>${lh.id}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/phong-tro?action=chi-tiet&id=${lh.phongTro.id}" target="_blank">
                                        ${lh.phongTro.tieuDe} (ID: ${lh.phongTro.id})
                                    </a>
                                </td>
                                <td>${lh.nguoiThue.hoTen} (ID: ${lh.nguoiThue.id})</td>
                                <td>${lh.ngayHen}</td>
                                <td>${lh.gioHen}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${lh.trangThai eq 'ChapNhan'}">
                                            <span class="badge bg-success">Chấp Nhận</span>
                                        </c:when>
                                        <c:when test="${lh.trangThai eq 'TuChoi'}">
                                            <span class="badge bg-danger">Từ Chối</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">Chờ Duyệt</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty danhSach}">
                            <tr><td colspan="6" class="text-center text-muted p-4">Không có dữ liệu lịch hẹn.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>