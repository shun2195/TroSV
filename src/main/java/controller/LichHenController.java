package controller;

import model.bean.LichHen;
import model.bean.PhongTro;
import model.bean.TaiKhoan;
import model.bo.LichHenBO;
import model.bo.PhongTroBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@WebServlet("/lich-hen")
public class LichHenController extends HttpServlet {

    private final LichHenBO lichHenBO = new LichHenBO();
    private final PhongTroBO phongTroBO = new PhongTroBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        TaiKhoan user = (TaiKhoan) session.getAttribute("account");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            // Nếu không có action, chuyển hướng về trang dashboard tương ứng
            if ("ChuTro".equals(user.getVaiTro())) {
                action = "xem"; // Mặc định cho chủ trọ là xem lịch hẹn
            } else {
                response.sendRedirect(request.getContextPath() + "/userDashboard.jsp");
                return;
            }
        }
        
        try {
            switch (action) {
                case "xem":
                    showQuanLyLichHenPage(request, response, user);
                    break;
                case "showDatLichForm":
                    showDatLichFormPage(request, response, user);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã có lỗi xảy ra trong quá trình xử lý yêu cầu.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        TaiKhoan account = (TaiKhoan) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        try {
            switch (action) {
                case "datLich":
                    handleDatLich(request, response, account);
                    break;
                case "capNhatTrangThai":
                    handleCapNhatTrangThai(request, response, account);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại.");
            response.sendRedirect(request.getHeader("Referer"));
        }
    }

    //============= CÁC PHƯƠNG THỨC XỬ LÝ GET =============

    private void showQuanLyLichHenPage(HttpServletRequest request, HttpServletResponse response, TaiKhoan user) throws ServletException, IOException {
        if (!"ChuTro".equals(user.getVaiTro())) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        List<LichHen> danhSachLichHen = lichHenBO.layLichHenChoChuTro(user.getId());
        request.setAttribute("danhSachLichHen", danhSachLichHen);
        request.getRequestDispatcher("/views/chu_tro/lichHenNhan.jsp").forward(request, response);
    }

    private void showDatLichFormPage(HttpServletRequest request, HttpServletResponse response, TaiKhoan user) throws ServletException, IOException {
        if (!"NguoiThue".equals(user.getVaiTro())) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        try {
            int idPhong = Integer.parseInt(request.getParameter("idPhong"));
            PhongTro phongTro = phongTroBO.getPhongTroById(idPhong); // Giả sử hàm này tồn tại
            if (phongTro != null) {
                request.setAttribute("phongTro", phongTro);
                request.getRequestDispatcher("/views/nguoi_thue/datLich.jsp").forward(request, response);
            } else {
                throw new Exception("Không tìm thấy phòng trọ.");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Không tìm thấy phòng trọ hoặc ID không hợp lệ.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    //============= CÁC PHƯƠNG THỨC XỬ LÝ POST =============

    private void handleDatLich(HttpServletRequest request, HttpServletResponse response, TaiKhoan user) throws IOException {
        HttpSession session = request.getSession();
        String idPhongStr = request.getParameter("idPhong");
        try {
            int idPhong = Integer.parseInt(idPhongStr);
            Date ngayHen = Date.valueOf(request.getParameter("ngayHen"));
            Time gioHen = Time.valueOf(request.getParameter("gioHen") + ":00");

            LichHen lichHen = new LichHen();
            lichHen.setIdPhong(idPhong);
            lichHen.setIdNguoiThue(user.getId());
            lichHen.setNgayHen(ngayHen);
            lichHen.setGioHen(gioHen);

            if (lichHenBO.insertLichHen(lichHen)) {
                session.setAttribute("success", "Đặt lịch hẹn thành công! Vui lòng chờ chủ trọ xác nhận.");
            } else {
                session.setAttribute("error", "Đặt lịch hẹn thất bại. Ngày hoặc giờ không hợp lệ.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.");
        }
        response.sendRedirect(request.getContextPath() + "/phong-tro?action=chi-tiet&id=" + idPhongStr);
    }

    private void handleCapNhatTrangThai(HttpServletRequest request, HttpServletResponse response, TaiKhoan user) throws IOException {
        HttpSession session = request.getSession();
        if (!"ChuTro".equals(user.getVaiTro())) {
            session.setAttribute("error", "Bạn không có quyền thực hiện hành động này.");
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        try {
            int idLichHen = Integer.parseInt(request.getParameter("idLichHen"));
            String trangThaiMoi = request.getParameter("trangThaiMoi");

            if (lichHenBO.capNhatTrangThai(idLichHen, trangThaiMoi, user.getId())) {
                session.setAttribute("success", "Cập nhật trạng thái lịch hẹn thành công.");
            } else {
                session.setAttribute("error", "Cập nhật thất bại. Lịch hẹn không tồn tại hoặc bạn không có quyền.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Dữ liệu không hợp lệ.");
        }
        response.sendRedirect(request.getContextPath() + "/lich-hen?action=xem");
    }
}