<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="${tieuDe}"/>
    <jsp:param name="activePage" value="thongKeHoatDong"/>
</jsp:include>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="bi bi-list-ul"></i> ${tieuDe}</h2>
        <a href="${pageContext.request.contextPath}/admin?action=thongKeHoatDong" class="btn btn-secondary btn-sm"><i class="bi bi-arrow-left"></i> Quay lại</a>
    </div>
    <div class="card shadow-sm"><div class="card-body"><div class="table-responsive">
        <table class="table table-hover">
            <thead><tr><th>ID</th><th>Họ Tên</th><th>Email</th><th>Vai Trò</th></tr></thead>
            <tbody>
                <c:forEach var="tk" items="${danhSach}">
                    <tr><td>${tk.id}</td><td>${tk.hoTen}</td><td>${tk.email}</td><td><span class="badge bg-secondary">${tk.vaiTro}</span></td></tr>
                </c:forEach>
                <c:if test="${empty danhSach}"><td colspan="4" class="text-center p-4">Không có dữ liệu.</td></c:if>
            </tbody>
        </table>
    </div></div></div>
</div>
<jsp:include page="../footer.jsp"/>