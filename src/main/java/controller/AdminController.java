package controller;

import model.bean.TaiKhoan;
import model.bo.AdminBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private AdminBO adminBO = new AdminBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Kiểm tra quyền admin
        HttpSession session = request.getSession();
        TaiKhoan user = (TaiKhoan) session.getAttribute("user");
        if (user == null || !"Admin".equals(user.getVaiTro())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "";

        try {
            switch (action) {
                case "duyetChuTro":
                    handleDuyetChuTro(request, response);
                    break;
                case "thongKeHoatDong":
                    handleThongKeHoatDong(request, response);
                    break;
                case "thongKeLichHen":
                    handleThongKeLichHen(request, response);
                    break;
                case "taiKhoanMoiTuan":
                    handleTaiKhoanMoiTuan(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/views/admin/adminDashboard.jsp");
            }
        } catch (Exception e) {
            handleError(request, response, "Đã xảy ra lỗi: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Kiểm tra quyền admin
        HttpSession session = request.getSession();
        TaiKhoan user = (TaiKhoan) session.getAttribute("user");
        if (user == null || !"Admin".equals(user.getVaiTro())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "";

        try {
            if ("xacNhanChuTro".equals(action)) {
                handleXacNhanChuTro(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin");
            }
        } catch (Exception e) {
            handleError(request, response, "Đã xảy ra lỗi: " + e.getMessage());
        }
    }

    private void handleDuyetChuTro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<TaiKhoan> chuTroChoDuyet = adminBO.layDanhSachChuTroChoDuyet();
        request.setAttribute("chuTroChoDuyet", chuTroChoDuyet);
        request.getRequestDispatcher("/views/admin/duyetChuTro.jsp").forward(request, response);
    }

    private void handleThongKeHoatDong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("tongTaiKhoan", adminBO.tongTaiKhoan());
        request.setAttribute("tongPhongTro", adminBO.tongPhongTro());
        request.setAttribute("tongLichHen", adminBO.tongLichHen());
        request.getRequestDispatcher("/views/admin/thongKe.jsp").forward(request, response);
    }

    private void handleThongKeLichHen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("tongLichHen", adminBO.tongLichHen());
        request.getRequestDispatcher("/views/admin/thongKeLichHen.jsp").forward(request, response);
    }

    private void handleTaiKhoanMoiTuan(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("taiKhoanMoiTuan", adminBO.soTaiKhoanMoiTrongTuan());
        request.getRequestDispatcher("/views/admin/taiKhoanMoi.jsp").forward(request, response);
    }

    private void handleXacNhanChuTro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean thanhCong = adminBO.xacNhanChuTro(id);
        
        if (thanhCong) {
            request.getSession().setAttribute("success", "Đã xác minh chủ trọ thành công.");
        } else {
            request.getSession().setAttribute("error", "Không thể xác minh.");
        }
        
        response.sendRedirect(request.getContextPath() + "/admin?action=duyetChuTro");
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.getSession().setAttribute("error", errorMessage);
        response.sendRedirect(request.getContextPath() + "/admin");
    }
}