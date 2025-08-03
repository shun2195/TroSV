<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Thanh điều hướng (Navbar) sử dụng Bootstrap --%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">TRỌ SV</a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/danh-sach-phong">Tìm Phòng</a>
                </li>
                <c:if test="${not empty sessionScope.account and sessionScope.account.vaiTro eq 'ChuTro'}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/chu-tro/dang-phong">Đăng Tin</a>
                    </li>
                </c:if>
            </ul>
            
            <div class="d-flex align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                        <%-- KHI ĐÃ ĐĂNG NHẬP --%>
                        <div class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle text-white" role="button" data-bs-toggle="dropdown">
                                Xin chào, <strong>${sessionScope.account.hoTen}</strong>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <c:if test="${sessionScope.account.vaiTro eq 'Admin'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard Admin</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account.vaiTro eq 'ChuTro'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/chu-tro/dashboard">Dashboard Chủ Trọ</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account.vaiTro eq 'NguoiThue'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/dashboard">Lịch hẹn của tôi</a></li>
                                </c:if>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <%-- KHI CHƯA ĐĂNG NHẬP --%>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light me-2">Đăng Nhập</a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Đăng Ký</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>