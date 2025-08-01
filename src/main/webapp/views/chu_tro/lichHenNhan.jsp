<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <%-- Dùng để định dạng ngày tháng --%>
<%-- Giả sử bạn có header và footer chung cho toàn bộ trang --%>
<jsp:include page="/views/common/header.jsp"/>

<div class="container my-5">
    <div class="row">
        <%-- Sidebar của Chủ trọ (nếu có) --%>
        <div class="col-md-3">
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">Dashboard</a>
                <a href="#" class="list-group-item list-group-item-action">Quản lý phòng trọ</a>
                <a href="${pageContext.request.contextPath}/lich-hen" class="list-group-item list-group-item-action active" aria-current="true">
                    Quản lý lịch hẹn
                </a>
                <a href="#" class="list-group-item list-group-item-action">Thông tin cá nhân</a>
            </div>
        </div>

        <%-- Nội dung chính --%>
        <div class="col-md-9">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0"><i class="bi bi-calendar-event-fill"></i> Lịch Hẹn Đã Nhận</h2>
            </div>

            <%-- Hiển thị thông báo thành công/lỗi từ session --%>
            <c:if test="${not empty sessionScope.success}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${sessionScope.success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="success" scope="session"/>
            </c:if>
            <c:if test="${not empty sessionScope.error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${sessionScope.error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="error" scope="session"/>
            </c:if>

            <div class="card shadow-sm">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Phòng Trọ</th>
                                    <th>Người Đặt Hẹn</th>
                                    <th>SĐT Người Đặt</th>
                                    <th>Ngày Hẹn</th>
                                    <th class="text-center">Trạng Thái</th>
                                    <th class="text-center" style="width: 120px;">Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="lh" items="${danhSachLichHen}">
                                    <tr>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/phong-tro?action=chi-tiet&id=${lh.phongTro.id}" target="_blank">
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
                                            <c:choose>
                                                <c:when test="${lh.trangThai eq 'ChapNhan'}">
                                                    <span class="badge rounded-pill bg-success">Đã Chấp Nhận</span>
                                                </c:when>
                                                <c:when test="${lh.trangThai eq 'TuChoi'}">
                                                    <span class="badge rounded-pill bg-danger">Đã Từ Chối</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge rounded-pill bg-warning text-dark">Chờ Duyệt</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${lh.trangThai eq 'ChoDuyet'}">
                                                <form action="${pageContext.request.contextPath}/lich-hen" method="post" class="d-inline">
                                                    <input type="hidden" name="action" value="capNhatTrangThai">
                                                    <input type="hidden" name="idLichHen" value="${lh.id}">
                                                    <input type="hidden" name="trangThaiMoi" value="ChapNhan">
                                                    <button type="submit" class="btn btn-success btn-sm" title="Chấp nhận">
                                                        <i class="bi bi-check-lg"></i>
                                                    </button>
                                                </form>
                                                <form action="${pageContext.request.contextPath}/lich-hen" method="post" class="d-inline">
                                                    <input type="hidden" name="action" value="capNhatTrangThai">
                                                    <input type="hidden" name="idLichHen" value="${lh.id}">
                                                    <input type="hidden" name="trangThaiMoi" value="TuChoi">
                                                    <button type="submit" class="btn btn-danger btn-sm" title="Từ chối">
                                                        <i class="bi bi-x-lg"></i>
                                                    </button>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty danhSachLichHen}">
                                    <tr>
                                        <td colspan="6" class="text-center text-muted p-5">
                                            <i class="bi bi-calendar-x fs-1"></i>
                                            <p class="mt-2">Bạn chưa có lịch hẹn nào được đặt.</p>
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
</div>

<jsp:include page="/views/common/footer.jsp"/>