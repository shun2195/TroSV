package controller;

import model.bean.TaiKhoan;
import model.bo.TaiKhoanBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private TaiKhoanBO taiKhoanBO = new TaiKhoanBO();

    @Override
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
        String cccd = request.getParameter("cccd");
        String ngayCapStr = request.getParameter("ngayCapCccd");

        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setHoTen(hoTen);
        taiKhoan.setEmail(email);
        taiKhoan.setMatKhau(matKhau);
        taiKhoan.setSoDienThoai(soDienThoai);
        taiKhoan.setGioiTinh(gioiTinh);
        taiKhoan.setVaiTro(vaiTro);
        taiKhoan.setCccd(cccd);
        
        try {
            if (ngayCapStr != null && !ngayCapStr.trim().isEmpty()) {
                java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(ngayCapStr);
                taiKhoan.setNgayCapCccd(new java.sql.Date(utilDate.getTime()));
            }
        } catch (Exception e) {
            setErrorAndForward(request, response, "Định dạng ngày cấp không hợp lệ.", taiKhoan, ngayCapStr);
            return;
        }

        String errorMessage = taiKhoanBO.dangKyTaiKhoan(taiKhoan, xacNhanMatKhau);

        if (errorMessage == null) {
            response.sendRedirect(request.getContextPath() + "/login?success=true");
        } else {
            setErrorAndForward(request, response, errorMessage, taiKhoan, ngayCapStr);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
    }

    private void setErrorAndForward(HttpServletRequest request, HttpServletResponse response,
                                    String errorMessage, TaiKhoan userInput, String ngayCapCccdStr)
            throws ServletException, IOException {
        request.setAttribute("error", errorMessage);
        request.setAttribute("userInput", userInput);
        request.setAttribute("ngayCapCccdStr", ngayCapCccdStr);
        request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
    }
}