package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.PhongTroBO;
import model.bo.PhuongBO;
import model.bo.TienIchBO;
import model.bean.Phuong;
import model.bean.TienIch;
import java.math.BigDecimal;
import model.bean.PhongTro;
import model.bean.TaiKhoan;
import javax.servlet.http.HttpSession;
import model.bo.PhongTroBO;

@WebServlet(name = "PhongTroController", urlPatterns = { "/chu-tro/dang-phong" })
public class PhongTroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TienIchBO tienIchBO = new TienIchBO();
	private PhuongBO phuongBO = new PhuongBO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		if ("/chu-tro/dang-phong".equals(action)) {
			showDangPhongForm(request, response);
		}
	}

	private void showDangPhongForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<TienIch> dsTienIch = tienIchBO.getAllTienIch();
		List<Phuong> dsPhuong = phuongBO.getAllPhuong();

		request.setAttribute("dsTienIch", dsTienIch);
		request.setAttribute("dsPhuong", dsPhuong);

		request.getRequestDispatcher("/views/chu_tro/dangPhong.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getServletPath();

	    if ("/chu-tro/dang-phong".equals(action)) {
	        insertPhongTro(request, response);
	    }
	}
	
	private void insertPhongTro(HttpServletRequest request, HttpServletResponse response) 
	        throws IOException, ServletException {
	    
	    HttpSession session = request.getSession();
	    TaiKhoan chuTro = (TaiKhoan) session.getAttribute("account");
	    
	    if (chuTro == null || !"ChuTro".equals(chuTro.getVaiTro())) {
	        response.sendRedirect(request.getContextPath() + "/login");
	        return;
	    }
	    
	    // Lấy dữ liệu từ form
	    String tieuDe = request.getParameter("tieuDe");
	    String moTa = request.getParameter("moTa");
	    String diaChi = request.getParameter("diaChi");
	    int idPhuong = Integer.parseInt(request.getParameter("idPhuong"));
	    
	    // Chuyển đổi giá sang BigDecimal, xử lý giá trị rỗng hoặc không hợp lệ
	    BigDecimal gia = getBigDecimalParameter(request, "gia");
	    BigDecimal giaDien = getBigDecimalParameter(request, "giaDien");
	    BigDecimal giaNuoc = getBigDecimalParameter(request, "giaNuoc");
	    BigDecimal phiDichVu = getBigDecimalParameter(request, "phiDichVu");
	    
	    String[] dsTienIchIds = request.getParameterValues("tienIch");
	    
	    // Tạo đối tượng PhongTro
	    PhongTro newPhongTro = new PhongTro();
	    newPhongTro.setIdChuTro(chuTro.getId());
	    newPhongTro.setTieuDe(tieuDe);
	    newPhongTro.setMoTa(moTa);
	    newPhongTro.setDiaChi(diaChi);
	    newPhongTro.setIdPhuong(idPhuong);
	    newPhongTro.setGia(gia);
	    newPhongTro.setGiaDien(giaDien);
	    newPhongTro.setGiaNuoc(giaNuoc);
	    newPhongTro.setPhiDichVu(phiDichVu);
	    // Các giá trị mặc định (trangThai, ngayDang) sẽ do CSDL tự xử lý
	    
	    // Gọi BO để lưu
	    PhongTroBO phongTroBO = new PhongTroBO(); 
	    boolean result = phongTroBO.insertPhongTro(newPhongTro, dsTienIchIds);
	    
	    if (result) {
	        // Chuyển hướng đến trang quản lý phòng (sẽ làm sau)
	        // Thêm một thông báo thành công vào session để hiển thị
	        session.setAttribute("successMessage", "Đăng tin phòng trọ thành công!");
	        response.sendRedirect(request.getContextPath() + "/chu-tro/quan-ly-phong"); // URL của trang quản lý
	    } else {
	        // Quay lại trang đăng tin với thông báo lỗi
	        request.setAttribute("errorMessage", "Đã có lỗi xảy ra, vui lòng thử lại.");
	        showDangPhongForm(request, response); // Gọi lại hàm doGet để tải lại dữ liệu cho form
	    }
	}
	
	private BigDecimal getBigDecimalParameter(HttpServletRequest request, String paramName) {
	    String paramValue = request.getParameter(paramName);
	    if (paramValue != null && !paramValue.trim().isEmpty()) {
	        try {
	            return new BigDecimal(paramValue);
	        } catch (NumberFormatException e) {
	            // Có thể log lỗi ở đây
	            return null;
	        }
	    }
	    return null;
	}
}

