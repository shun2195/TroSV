package controller;

import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.LichHen;
import model.bean.PhongTro;
import model.bean.TaiKhoan;
import model.bo.LichHenBO;
import model.bo.PhongTroBO;
import model.bean.Phuong;
import model.bo.PhuongBO;

@WebServlet(urlPatterns = {"/danh-sach-phong", "/chi-tiet-phong", "/dat-lich"})
public class NguoiThueController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PhongTroBO phongTroBO = new PhongTroBO();
    private PhuongBO phuongBO = new PhuongBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getServletPath();

        switch (action) {
            case "/danh-sach-phong":
                showDanhSachPhong(request, response);
                break;
            case "/chi-tiet-phong":
                showChiTietPhong(request, response);
                break;
            case "/dat-lich":
                showDatLichForm(request, response);
                break;
            default:
            	showDanhSachPhong(request, response);
                break;
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();

        
        if ("/dat-lich".equals(action)) {
            submitDatLich(request, response);
        }
    }
    
    private void showDanhSachPhong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String idPhuongStr = request.getParameter("idPhuong");
        String khoangGiaStr = request.getParameter("khoangGia");
        
        List<PhongTro> dsPhongTro = phongTroBO.searchPhongTro(idPhuongStr, khoangGiaStr);
        List<Phuong> dsPhuong = phuongBO.getAllPhuong();
        
        request.setAttribute("dsPhongTro", dsPhongTro);
        request.setAttribute("dsPhuong", dsPhuong);
        
        request.getRequestDispatcher("/views/nguoi_thue/danhSachPhong.jsp").forward(request, response);
        
    }
    
    private void showChiTietPhong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PhongTro phong = phongTroBO.getChiTietPhongById(id);
        request.setAttribute("phong", phong);
        request.getRequestDispatcher("/views/nguoi_thue/chiTietPhong.jsp").forward(request, response);
    }
    
 // Hàm hiển thị form
    private void showDatLichForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Bắt buộc đăng nhập mới cho đặt lịch
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        int idPhong = Integer.parseInt(request.getParameter("idPhong"));
        // Lấy lại thông tin phòng để hiển thị trên trang đặt lịch
        PhongTro phong = phongTroBO.getChiTietPhongById(idPhong);

        request.setAttribute("phong", phong);
        request.getRequestDispatcher("/views/nguoi_thue/datLich.jsp").forward(request, response);
    }

    // Hàm xử lý khi người dùng nhấn nút "Gửi yêu cầu"
    private void submitDatLich(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        HttpSession session = request.getSession();
        TaiKhoan nguoiThue = (TaiKhoan) session.getAttribute("account");

        int idPhong = Integer.parseInt(request.getParameter("idPhong"));
        String ngayHenStr = request.getParameter("ngayHen");
        String gioHenStr = request.getParameter("gioHen");
        
        // Chuyển đổi String sang Date và Time của SQL
        java.sql.Date ngayHen = java.sql.Date.valueOf(ngayHenStr);
        java.sql.Time gioHen = java.sql.Time.valueOf(gioHenStr + ":00"); // Thêm giây cho đúng định dạng

        // Tạo đối tượng LichHen
        LichHen lichHen = new LichHen();
        lichHen.setIdPhong(idPhong);
        lichHen.setIdNguoiThue(nguoiThue.getId());
        lichHen.setNgayHen(ngayHen);
        lichHen.setGioHen(gioHen);
        // Trạng thái mặc định là 'ChoDuyet' đã được CSDL xử lý

        // Gọi BO để lưu
        LichHenBO lichHenBO = new LichHenBO();
        boolean result = lichHenBO.insertLichHen(lichHen);

        if (result) {
            session.setAttribute("successMessage", "Gửi yêu cầu đặt lịch thành công! Vui lòng chờ chủ trọ xác nhận.");
        } else {
            session.setAttribute("errorMessage", "Đặt lịch thất bại, đã có lỗi xảy ra.");
        }
        
        // Chuyển hướng lại trang chi tiết phòng
        response.sendRedirect(request.getContextPath() + "/chi-tiet-phong?id=" + idPhong);
    }
}