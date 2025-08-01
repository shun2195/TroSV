package controller;

import model.bean.TaiKhoan;
import model.dao.TaiKhoanDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hoTen = request.getParameter("hoTen");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String soDienThoai = request.getParameter("soDienThoai");
        String gioiTinh = request.getParameter("gioiTinh");
        String vaiTro = request.getParameter("vaiTro"); // "NguoiThue" hoặc "ChuTro"

        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setHoTen(hoTen);
        taiKhoan.setEmail(email);
        taiKhoan.setMatKhau(matKhau);
        taiKhoan.setSoDienThoai(soDienThoai);
        taiKhoan.setGioiTinh(gioiTinh);
        taiKhoan.setVaiTro(vaiTro);

        TaiKhoanDAO dao = new TaiKhoanDAO();
        boolean daDangKy = dao.dangKyTaiKhoan(taiKhoan);

        if (daDangKy) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Email đã được sử dụng. Vui lòng chọn email khác.");
            request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
    }
}
