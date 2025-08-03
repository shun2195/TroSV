package controller;

import model.bean.TaiKhoan;
import model.bo.AdminBO; // Thay đổi import

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    private final AdminBO adminBO = new AdminBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "dashboard";
        }

        try {
            switch (action) {
                case "duyetChuTro":
                    showDuyetChuTroPage(request, response);
                    break;
                case "thongKeHoatDong":
                    showThongKePage(request, response);
                    break;
                case "xemTatCaTaiKhoan":
                    showAllAccountsPage(request, response);
                    break;
                case "xemTatCaPhongTro":
                    showAllRoomsPage(request, response);
                    break;
                case "xemTatCaLichHen":
                    showAllAppointmentsPage(request, response);
                    break;
                case "xemTaiKhoanMoi":
                    showNewAccountsPage(request, response);
                    break;
                case "dashboard":
                default:
                    showDashboardPage(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã có lỗi không mong muốn xảy ra: " + e.getMessage());
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            if ("xacNhanChuTro".equals(action)) {
                handleXacNhanChuTro(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã có lỗi xảy ra khi xử lý yêu cầu: " + e.getMessage());
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    private void showDashboardPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/admin/adminDashboard.jsp").forward(request, response);
    }

    private void showDuyetChuTroPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gọi đến phương thức của AdminBO
        List<TaiKhoan> danhSachCanDuyet = adminBO.layDanhSachChuTroChoDuyet();
        request.setAttribute("chuTroChoDuyet", danhSachCanDuyet);
        request.getRequestDispatcher("/views/admin/duyetChuTro.jsp").forward(request, response);
    }

    private void showThongKePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gọi các phương thức thống kê từ AdminBO
        int tongTaiKhoan = adminBO.tongTaiKhoan();
        int tongPhongTro = adminBO.tongPhongTro();
        int tongLichHen = adminBO.tongLichHen();
        int taiKhoanMoiTuan = adminBO.soTaiKhoanMoiTrongTuan();

        // Gửi dữ liệu sang view
        request.setAttribute("tongTaiKhoan", tongTaiKhoan);
        request.setAttribute("tongPhongTro", tongPhongTro);
        request.setAttribute("tongLichHen", tongLichHen);
        request.setAttribute("taiKhoanMoiTuan", taiKhoanMoiTuan);

        request.getRequestDispatcher("/views/admin/thongKeHoatDong.jsp").forward(request, response);
    }

    private void handleXacNhanChuTro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            // Gọi đến phương thức xác nhận của AdminBO
            boolean success = adminBO.xacNhanChuTro(id);
            
            if (success) {
                session.setAttribute("success", "Xác minh chủ trọ có ID = " + id + " thành công!");
            } else {
                session.setAttribute("error", "Xác minh chủ trọ thất bại. Có thể chủ trọ không tồn tại hoặc đã được duyệt.");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("error", "ID chủ trọ không hợp lệ.");
        }
        
        response.sendRedirect(request.getContextPath() + "/admin?action=duyetChuTro");
    }
    private void showAllAccountsPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TaiKhoan> list = adminBO.layTatCaTaiKhoan(); 
        request.setAttribute("danhSach", list);
        request.setAttribute("tieuDe", "Tất cả Tài khoản");
        request.getRequestDispatcher("/views/admin/thongke/danhSachTaiKhoan.jsp").forward(request, response);
    }

    private void showAllRoomsPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // List<PhongTro> list = adminBO.layTatCaPhongTro(); 
        // request.setAttribute("danhSach", list);
        request.setAttribute("tieuDe", "Tất cả Phòng trọ");
        request.getRequestDispatcher("/views/admin/thongke/danhSachPhongTro.jsp").forward(request, response);
    }

    private void showAllAppointmentsPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // List<LichHen> list = adminBO.layTatCaLichHen();
        // request.setAttribute("danhSach", list);
        request.setAttribute("tieuDe", "Tất cả Lịch hẹn");
        request.getRequestDispatcher("/views/admin/thongke/danhSachLichHen.jsp").forward(request, response);
    }

    private void showNewAccountsPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TaiKhoan> list = adminBO.layTaiKhoanMoiTrongTuan(); // Giả sử bạn có hàm này
        request.setAttribute("danhSach", list);
        request.setAttribute("tieuDe", "Tài khoản mới trong 7 ngày");
        request.getRequestDispatcher("/views/admin/thongke/danhSachTaiKhoan.jsp").forward(request, response); // Tái sử dụng view danh sách tài khoản
    }
}