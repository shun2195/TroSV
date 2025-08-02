package controller;

import model.bean.TaiKhoan;
import model.bo.TaiKhoanBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private final TaiKhoanBO taiKhoanBO = new TaiKhoanBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("email".equals(cookie.getName())) {
                    request.setAttribute("rememberEmail", cookie.getValue());
                    break;
                }
            }
        }
        request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("dangNhap".equals(action)) {
            String email = request.getParameter("email");
            String matKhau = request.getParameter("matKhau");
            String remember = request.getParameter("remember");
            TaiKhoan user = taiKhoanBO.dangNhap(email, matKhau);
            
          //test
            System.out.println("Controller nhận được Email: " + email);
            System.out.println("Controller nhận được Mật khẩu: " + matKhau);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account",user);

                String role = user.getVaiTro();
                String contextPath = request.getContextPath();

                switch (role) {
                    case "Admin":
                        response.sendRedirect(contextPath + "/views/admin/adminDashboard.jsp");
                        break;
                    case "ChuTro":
                    	response.sendRedirect(contextPath + "/chu-tro/dashboard");
                        break;
                    case "NguoiThue":
                    	response.sendRedirect(contextPath + "/danh-sach-phong");
                        break;
                    default:
                        response.sendRedirect(contextPath + "/index.jsp");
                }
            } else {
                request.setAttribute("error", "Email hoặc mật khẩu không chính xác.");
                request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}