package controller;

import model.bean.TaiKhoan;
import model.bo.TaiKhoanBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private TaiKhoanBO taiKhoanBO = new TaiKhoanBO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Lấy thông tin từ form
        String hoTen = request.getParameter("hoTen");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String xacNhanMatKhau = request.getParameter("xacNhanMatKhau");
        String soDienThoai = request.getParameter("soDienThoai");
        String gioiTinh = request.getParameter("gioiTinh");
        String vaiTro = request.getParameter("vaiTro");

        // Kiểm tra mật khẩu xác nhận
        if (!matKhau.equals(xacNhanMatKhau)) {
            setErrorAndForward(request, response, "Mật khẩu xác nhận không khớp", 
                             hoTen, email, soDienThoai, gioiTinh, vaiTro);
            return;
        }

        // Tạo đối tượng tài khoản
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setHoTen(hoTen);
        taiKhoan.setEmail(email);
        taiKhoan.setMatKhau(matKhau);
        taiKhoan.setSoDienThoai(soDienThoai);
        taiKhoan.setGioiTinh(gioiTinh);
        taiKhoan.setVaiTro(vaiTro);

        // Thực hiện đăng ký
        if (taiKhoanBO.dangKyTaiKhoan(taiKhoan)) {
            request.setAttribute("success", "Đăng ký thành công. Vui lòng đăng nhập.");
            response.sendRedirect("login");
        } else {
            setErrorAndForward(request, response, 
                             "Đăng ký không thành công. Email có thể đã được sử dụng",
                             hoTen, email, soDienThoai, gioiTinh, vaiTro);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Hiển thị trang đăng ký
        request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
    }

    private void setErrorAndForward(HttpServletRequest request, HttpServletResponse response,
                                  String errorMessage, String hoTen, String email, 
                                  String soDienThoai, String gioiTinh, String vaiTro)
            throws ServletException, IOException {
        request.setAttribute("error", errorMessage);
        forwardWithData(request, response, hoTen, email, soDienThoai, gioiTinh, vaiTro);
    }

    private void forwardWithData(HttpServletRequest request, HttpServletResponse response,
                               String hoTen, String email, String soDienThoai,
                               String gioiTinh, String vaiTro) 
            throws ServletException, IOException {
        request.setAttribute("hoTen", hoTen);
        request.setAttribute("email", email);
        request.setAttribute("soDienThoai", soDienThoai);
        request.setAttribute("gioiTinh", gioiTinh);
        request.setAttribute("vaiTro", vaiTro);
        request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
    }
}