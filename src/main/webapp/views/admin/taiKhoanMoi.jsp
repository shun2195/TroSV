<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp">
    <jsp:param name="title" value="Tài khoản mới"/>
    <jsp:param name="activePage" value="taiKhoanMoiTuan"/>
</jsp:include>

<div class="container mt-4">
    <h2><i class="bi bi-person-plus-fill"></i> Tài khoản mới</h2>
    
    <div class="card shadow-sm mt-4">
        <div class="card-body text-center">
            <h5 class="card-title">Số tài khoản mới trong 7 ngày qua</h5>
            <p class="display-4 text-primary">${taiKhoanMoiTuan}</p>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>