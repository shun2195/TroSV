<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="${tieuDe}"/>
    <jsp:param name="activePage" value="thongKeHoatDong"/>
</jsp:include>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="bi bi-house-door-fill"></i> ${tieuDe}</h2>
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
                            <th>ID</th>
                            <th>Tiêu Đề</th>
                            <th>Địa Chỉ</th>
                            <th>Giá (VND)</th>
                            <th>Trạng Thái</th>
                            <th class="text-center">Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pt" items="${danhSach}">
                            <tr>
                                <td>${pt.id}</td>
                                <td>${pt.tieuDe}</td>
                                <td>${pt.diaChi}</td>
                                <td><fmt:formatNumber value="${pt.gia}" type="number"/></td> <%-- Dùng JSTL format number --%>
                                <td>
                                    <c:choose>
                                        <c:when test="${pt.trangThai eq 'DaDuyet'}">
                                            <span class="badge bg-success">Đã Duyệt</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-warning text-dark">Chờ Duyệt</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/phong-tro?action=chi-tiet&id=${pt.id}" class="btn btn-info btn-sm" target="_blank">
                                        <i class="bi bi-eye"></i> Xem
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty danhSach}">
                            <tr><td colspan="6" class="text-center text-muted p-4">Không có dữ liệu phòng trọ.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>