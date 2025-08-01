package controller;

import model.bean.TaiKhoan;
import model.bo.TaiKhoanBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private TaiKhoanBO taiKhoanBO = new TaiKhoanBO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("dangNhap".equals(action)) {
            handleLogin(request, response);
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String remember = request.getParameter("remember");

        TaiKhoan user = taiKhoanBO.dangNhap(email, matKhau);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Remember me functionality
            if ("on".equals(remember)) {
                Cookie emailCookie = new Cookie("email", email);
                emailCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days
                response.addCookie(emailCookie);
            } else {
                // Remove cookie if exists
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("email".equals(cookie.getName())) {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                            break;
                        }
                    }
                }
            }

            // Redirect based on role
            redirectBasedOnRole(user, response);
        } else {
            request.setAttribute("error", "Sai email hoặc mật khẩu.");
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        }
    }

    private void redirectBasedOnRole(TaiKhoan user, HttpServletResponse response) throws IOException {
        switch (user.getVaiTro()) {
            case "Admin":
                response.sendRedirect("views/admin/adminDashboard.jsp");
                break;
            case "ChuTro":
                response.sendRedirect("views/chu_tro/dashboard.jsp");
                break;
            case "NguoiThue":
                response.sendRedirect("views/nguoi_thue/dashboard.jsp");
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check for remember me cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("email".equals(cookie.getName())) {
                    request.setAttribute("rememberEmail", cookie.getValue());
                    break;
                }
            }
        }
        request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
    }
}