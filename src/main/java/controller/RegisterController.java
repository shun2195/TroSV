package controller;

import model.bean.TaiKhoan;
import model.bo.TaiKhoanBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private TaiKhoanBO taiKhoanBO = new TaiKhoanBO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");

        String hoTen = request.getParameter("hoTen");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String xacNhanMatKhau = request.getParameter("xacNhanMatKhau");
        String soDienThoai = request.getParameter("soDienThoai");
        String gioiTinh = request.getParameter("gioiTinh");
        String vaiTro = request.getParameter("vaiTro");

        String cccd = null;
        Date ngayCapCccd = null;

        if ("ChuTro".equals(vaiTro)) {
            cccd = request.getParameter("cccd");
            String ngayCapStr = request.getParameter("ngayCapCccd");
            if (ngayCapStr != null && !ngayCapStr.trim().isEmpty()) {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    ngayCapCccd = sdf.parse(ngayCapStr);
                } catch (Exception e) {
                    setErrorAndForward(request, response, "Ngày cấp CCCD không hợp lệ", hoTen, email, soDienThoai, gioiTinh, vaiTro, cccd, ngayCapStr);
                    return;
                }
            }
        }

        if (!matKhau.equals(xacNhanMatKhau)) {
            setErrorAndForward(request, response, "Mật khẩu xác nhận không khớp", hoTen, email, soDienThoai, gioiTinh, vaiTro, cccd, null);
            return;
        }

        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setHoTen(hoTen);
        taiKhoan.setEmail(email);
        taiKhoan.setMatKhau(matKhau);
        taiKhoan.setSoDienThoai(soDienThoai);
        taiKhoan.setGioiTinh(gioiTinh);
        taiKhoan.setVaiTro(vaiTro);
        taiKhoan.setCccd(cccd);
        taiKhoan.setNgayCapCccd(ngayCapCccd);

        if (taiKhoanBO.dangKyTaiKhoan(taiKhoan)) {
            response.sendRedirect("login");
        } else {
            setErrorAndForward(request, response, "Đăng ký thất bại. Email đã tồn tại hoặc dữ liệu không hợp lệ", hoTen, email, soDienThoai, gioiTinh, vaiTro, cccd, ngayCapCccd != null ? new SimpleDateFormat("yyyy-MM-dd").format(ngayCapCccd) : null);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
    }

    private void setErrorAndForward(HttpServletRequest request, HttpServletResponse response,
                                    String errorMessage, String hoTen, String email, String soDienThoai,
                                    String gioiTinh, String vaiTro, String cccd, String ngayCapCccd)
            throws ServletException, IOException {
        request.setAttribute("error", errorMessage);
        request.setAttribute("hoTen", hoTen);
        request.setAttribute("email", email);
        request.setAttribute("soDienThoai", soDienThoai);
        request.setAttribute("gioiTinh", gioiTinh);
        request.setAttribute("vaiTro", vaiTro);
        request.setAttribute("cccd", cccd);
        request.setAttribute("ngayCapCccd", ngayCapCccd);
        request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
    }
}