<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} | Trọ SV Admin</title>
    
    <!-- NẠP CÁC FILE CSS CẦN THIẾT -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- CSS TÙY CHỈNH CHO GIAO DIỆN MỚI -->
    <style>
        :root {
            --dark-color: #2b2d42;
            --danger-color: #f72585;
        }
        
        body {
            background-color: #f5f7fa;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        .header-top {
            background-color: var(--dark-color);
            color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .header-top .navbar-brand {
            font-weight: 600;
            color: white;
        }
        
        main {
            flex: 1;
        }
    </style>
</head>
<body>

    <!-- ============================================== -->
    <!-- == HEADER NGANG TỐI GIẢN THEO YÊU CẦU == -->
    <!-- ============================================== -->
    <header class="header-top sticky-top">
        <nav class="navbar navbar-expand">
            <div class="container-fluid">
                
                <!-- 1. Link Trang chủ -->
                <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="bi bi-house-gear-fill me-2"></i>TRỌ SV ADMIN
                </a>
                
                <!-- 2. Lời chào và Đăng xuất (đẩy về cuối) -->
                <div class="ms-auto d-flex align-items-center">
                    <c:if test="${not empty sessionScope.account}">
                        
                        <!-- Lời chào người dùng -->
                        <span class="navbar-text me-3">
                            Chào, <strong>${sessionScope.account.hoTen}</strong>
                        </span>
                        
                        <!-- Nút Đăng xuất duy nhất -->
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">
                            <i class="bi bi-box-arrow-right me-1"></i>Đăng xuất
                        </a>
                        
                    </c:if>
                </div>

            </div>
        </nav>
    </header>

    <!-- Nội dung chính của các trang sẽ được nạp vào đây -->
    <main class="container py-4">
        <%-- Ví dụ: Nội dung của dashboard.jsp sẽ ở đây --%>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>