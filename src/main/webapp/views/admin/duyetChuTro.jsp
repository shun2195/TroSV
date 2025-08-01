<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Duyệt Chủ Trọ"/>
    <jsp:param name="activePage" value="duyetChuTro"/>
</jsp:include>
<div class="container mt-4">
    <h2 class="mb-4"><i class="bi bi-person-check-fill"></i> Danh sách Chủ Trọ chờ duyệt</h2>
    <c:if test="${not empty sessionScope.success}"><div class="alert alert-success">${sessionScope.success}</div><c:remove var="success" scope="session"/></c:if>
    <div class="card shadow-sm"><div class="card-body"><div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead><tr><th>ID</th><th>Họ Tên</th><th>Email</th><th>SĐT</th><th>CCCD</th><th>Ngày Cấp</th><th class="text-center">Hành Động</th></tr></thead>
            <tbody>
                <c:forEach var="chuTro" items="${chuTroChoDuyet}">
                    <tr>
                        <td>${chuTro.id}</td><td>${chuTro.hoTen}</td><td>${chuTro.email}</td><td>${chuTro.soDienThoai}</td><td>${chuTro.cccd}</td><td>${chuTro.ngayCapCccd}</td>
                        <td class="text-center">
                            <form action="admin" method="post" class="d-inline">
                                <input type="hidden" name="action" value="xacNhanChuTro"/><input type="hidden" name="id" value="${chuTro.id}"/>
                                <button type="submit" class="btn btn-success btn-sm"><i class="bi bi-check-circle"></i> Xác minh</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty chuTroChoDuyet}"><td colspan="7" class="text-center text-muted p-4">Không có chủ trọ nào đang chờ duyệt.</td></c:if>
            </tbody>
        </table>
    </div></div></div>
</div>
<jsp:include page="footer.jsp"/>