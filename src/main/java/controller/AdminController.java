package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import model.dao.TaiKhoanDAO;
import model.bean.TaiKhoan;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "dashboard";
        }

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
                    handleTaiKhoanMoi(request, response);
                    break;
                default:
                    showDashboard(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/adminDashboard.jsp");
        dispatcher.forward(request, response);
    }

    private void handleDuyetChuTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();
        // List<TaiKhoan> danhSachCanDuyet = taiKhoanDAO.getChuTroChuaDuyet();
        // request.setAttribute("danhSachChuTro", danhSachCanDuyet);
        
        System.out.println("Đang xử lý action: duyetChuTro");
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/duyetChuTro.jsp");
        dispatcher.forward(request, response);
    }

    private void handleThongKeHoatDong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // int soLuongNguoiDung = taiKhoanDAO.countUsers();
        // int soLuongPhongTro = phongTroDAO.countRooms();
        // request.setAttribute("soLuongNguoiDung", soLuongNguoiDung);
        // request.setAttribute("soLuongPhongTro", soLuongPhongTro);
        
        System.out.println("Đang xử lý action: thongKeHoatDong");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/thongKe.jsp");
        dispatcher.forward(request, response);
    }

    private void handleThongKeLichHen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // int soLichHen = lichHenDAO.countAppointments();
        // request.setAttribute("soLichHen", soLichHen);
        
        System.out.println("Đang xử lý action: thongKeLichHen");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/thongKeLichHen.jsp");
        dispatcher.forward(request, response);
    }
    
    private void handleTaiKhoanMoi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();
        // List<TaiKhoan> taiKhoanMoi = taiKhoanDAO.getTaiKhoanMoiTrongTuan();
        // request.setAttribute("danhSachTaiKhoanMoi", taiKhoanMoi);
        
        System.out.println("Đang xử lý action: taiKhoanMoiTuan");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/taiKhoanMoi.jsp");
        dispatcher.forward(request, response);
    }
}