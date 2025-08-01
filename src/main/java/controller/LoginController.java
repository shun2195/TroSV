package controller;

import model.bean.TaiKhoan;
import model.dao.TaiKhoanDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        TaiKhoanDAO dao = new TaiKhoanDAO();

        if ("dangNhap".equals(action)) {
            String email = request.getParameter("email");
            String matKhau = request.getParameter("matKhau");

            TaiKhoan user = dao.kiemTraDangNhap(email, matKhau);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Chuyển hướng theo vai trò
                switch (user.getVaiTro()) {
                    case "Admin":
                        response.sendRedirect("views/admin/adminDashboard.jsp");
                        break;
                    case "ChuTro":
                        response.sendRedirect("views/chu_tro/dashboard.jsp");
                        break;
                    default:
                        response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("error", "Sai email hoặc mật khẩu.");
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
            }

        } else if ("quenMatKhau".equals(action)) {
            String email = request.getParameter("email");
            String sdt = request.getParameter("soDienThoai");
            String matKhauMoi = request.getParameter("matKhauMoi");

            TaiKhoan tk = dao.timTaiKhoanBangEmail(email);

            if (tk != null && sdt.equals(tk.getSoDienThoai())) {
                dao.capNhatMatKhau(tk.getId(), matKhauMoi);
                request.setAttribute("success", "Mật khẩu đã được thay đổi. Vui lòng đăng nhập.");
            } else {
                request.setAttribute("error", "Email hoặc số điện thoại không đúng.");
            }

            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
    }
}
