<%-- File này là một "mảnh" (fragment), chỉ chứa code của thanh điều hướng --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- CSS cho header tối giản -->
<style>
    .simple-header {
        background-color: white;
        padding: 0.75rem 0; /* Tăng khoảng đệm dọc một chút */
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        border-bottom: 1px solid #e9ecef;
    }
    .simple-header-nav {
        display: flex;
        justify-content: space-between; /* Đẩy các mục ra 2 bên */
        align-items: center;
    }
    .simple-header .nav-link {
        color: #495057;
        font-weight: 500;
        padding: 0.5rem 1rem;
        border-radius: 6px;
        text-decoration: none;
        transition: background-color 0.2s;
    }
    .simple-header .nav-link:hover {
        background-color: #f1f3f5;
    }
    .simple-header .nav-link.active {
        background-color: rgba(46, 139, 87, 0.1);
        color: #2E8B57;
        font-weight: 600;
    }
    .simple-header .user-info {
        display: flex;
        align-items: center;
        gap: 1rem; /* Khoảng cách giữa lời chào và nút đăng xuất */
    }
    .simple-header .navbar-text {
        color: #333;
    }
</style>

<!-- Phần HTML của Header -->
<header class="simple-header mb-4">
    <div class="container">
        <nav class="simple-header-nav">
            
            <!-- MỤC 1: LINK TRANG CHỦ -->
            <div>
                <a class="nav-link ${param.active == 'dashboard' ? 'active' : ''}" 
                   href="${pageContext.request.contextPath}/chu-tro/dashboard">Trang chủ</a>
            </div>

            <!-- MỤC 2 & 3: LỜI CHÀO VÀ NÚT ĐĂNG XUẤT -->
            <div class="user-info">
                <span class="navbar-text">
                    Xin chào, <strong>${sessionScope.account.hoTen}</strong>
                </span>
                <a class="btn btn-outline-danger btn-sm" 
                   href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
            </div>

        </nav>
    </div>
</header>