package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bean.Phuong;
import model.bean.PhongTro;
import model.bean.TaiKhoan;
import model.bean.TienIch;
import model.bo.PhuongBO;
import model.bo.PhongTroBO;
import model.bo.TienIchBO;

@WebServlet(name = "PhongTroController", urlPatterns = { "/chu-tro/dang-phong", "/chu-tro/quan-ly-phong",
		"/chu-tro/xoa-phong", "/chu-tro/sua-phong", "/chu-tro/update-phong" })
public class PhongTroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PhongTroBO phongTroBO = new PhongTroBO();
	private PhuongBO phuongBO = new PhuongBO();
	private TienIchBO tienIchBO = new TienIchBO();

	// doGet xử lý các yêu cầu hiển thị trang
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		switch (action) {
		case "/chu-tro/dang-phong":
			showDangPhongForm(request, response);
			break;
		case "/chu-tro/quan-ly-phong":
			showQuanLyPhong(request, response);
			break;
		case "/chu-tro/xoa-phong":
			deletePhongTro(request, response);
			break;
		case "/chu-tro/sua-phong":
	        showEditForm(request, response);
	        break;
	    
		default:
			response.sendRedirect(request.getContextPath() + "/");
			break;
		}
	}

	// doPost chỉ xử lý yêu cầu gửi dữ liệu từ form
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getServletPath();

		if ("/chu-tro/dang-phong".equals(action)) {
			if (insertPhongTro(request)) {
				request.getSession().setAttribute("successMessage", "Đăng tin phòng trọ thành công!");
				response.sendRedirect(request.getContextPath() + "/chu-tro/quan-ly-phong");
			} else {
				request.setAttribute("errorMessage", "Đã có lỗi xảy ra, vui lòng thử lại.");
				showDangPhongForm(request, response);
			}
		}
		if ("/chu-tro/update-phong".equals(action)) {
		    if (updatePhongTro(request)) {
		        request.getSession().setAttribute("successMessage", "Cập nhật phòng trọ thành công!");
		    } else {
		        request.getSession().setAttribute("errorMessage", "Cập nhật thất bại!");
		    }
		    response.sendRedirect(request.getContextPath() + "/chu-tro/quan-ly-phong");
		}
	}

	// ---------- CÁC HÀM XỬ LÝ CHO doGet ----------

	private void showDangPhongForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Phuong> dsPhuong = phuongBO.getAllPhuong();
		List<TienIch> dsTienIch = tienIchBO.getAllTienIch();
		request.setAttribute("dsPhuong", dsPhuong);
		request.setAttribute("dsTienIch", dsTienIch);
		request.getRequestDispatcher("/views/chu_tro/dangPhong.jsp").forward(request, response);
	}

	private void showQuanLyPhong(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		TaiKhoan chuTro = (TaiKhoan) session.getAttribute("account");

		if (chuTro == null || !"ChuTro".equals(chuTro.getVaiTro())) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		List<PhongTro> dsPhongTro = phongTroBO.getPhongTroByChuTroId(chuTro.getId());
		request.setAttribute("dsPhongTro", dsPhongTro);
		request.getRequestDispatcher("/views/chu_tro/quanLyPhong.jsp").forward(request, response);
	}

	// ---------- CÁC HÀM XỬ LÝ CHO doPost ----------

	private boolean insertPhongTro(HttpServletRequest request) {
		HttpSession session = request.getSession();
		TaiKhoan chuTro = (TaiKhoan) session.getAttribute("account");

		if (chuTro == null)
			return false;

		PhongTro newPhongTro = new PhongTro();
		newPhongTro.setIdChuTro(chuTro.getId());
		newPhongTro.setTieuDe(request.getParameter("tieuDe"));
		newPhongTro.setMoTa(request.getParameter("moTa"));
		newPhongTro.setDiaChi(request.getParameter("diaChi"));
		newPhongTro.setIdPhuong(Integer.parseInt(request.getParameter("idPhuong")));
		newPhongTro.setGia(getBigDecimalParameter(request, "gia"));
		newPhongTro.setGiaDien(getBigDecimalParameter(request, "giaDien"));
		newPhongTro.setGiaNuoc(getBigDecimalParameter(request, "giaNuoc"));
		newPhongTro.setPhiDichVu(getBigDecimalParameter(request, "phiDichVu"));

		String[] dsTienIchIds = request.getParameterValues("tienIch");

		return phongTroBO.insertPhongTro(newPhongTro, dsTienIchIds);
	}

	private BigDecimal getBigDecimalParameter(HttpServletRequest request, String paramName) {
		String paramValue = request.getParameter(paramName);
		if (paramValue != null && !paramValue.trim().isEmpty()) {
			try {
				return new BigDecimal(paramValue);
			} catch (NumberFormatException e) {
				return null;
			}
		}
		return null;
	}
	
	private void deletePhongTro(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    HttpSession session = request.getSession();
	    TaiKhoan chuTro = (TaiKhoan) session.getAttribute("account");

	    if (chuTro == null || !"ChuTro".equals(chuTro.getVaiTro())) {
	        response.sendRedirect(request.getContextPath() + "/login");
	        return;
	    }

	    int idPhong = Integer.parseInt(request.getParameter("id"));
	    int idChuTro = chuTro.getId();

	    boolean result = phongTroBO.deletePhongTro(idPhong, idChuTro);

	    if (result) {
	        session.setAttribute("successMessage", "Xóa phòng trọ thành công!");
	    } else {
	        session.setAttribute("errorMessage", "Xóa thất bại! Đây có thể không phải phòng của bạn.");
	    }
	    
	    response.sendRedirect(request.getContextPath() + "/chu-tro/quan-ly-phong");
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    PhongTro phongCanSua = phongTroBO.getPhongTroById(id);
	    
	    List<Phuong> dsPhuong = phuongBO.getAllPhuong();
	    List<TienIch> dsTienIch = tienIchBO.getAllTienIch();

	    request.setAttribute("phong", phongCanSua);
	    request.setAttribute("dsPhuong", dsPhuong);
	    request.setAttribute("dsTienIch", dsTienIch);
	    
	    request.getRequestDispatcher("/views/chu_tro/dangPhong.jsp").forward(request, response);
	}
	
	private boolean updatePhongTro(HttpServletRequest request) {
	    PhongTro phong = new PhongTro();
	    phong.setId(Integer.parseInt(request.getParameter("id")));
	    phong.setTieuDe(request.getParameter("tieuDe"));
	    phong.setMoTa(request.getParameter("moTa"));
	    phong.setDiaChi(request.getParameter("diaChi"));
	    phong.setIdPhuong(Integer.parseInt(request.getParameter("idPhuong")));
	    phong.setGia(getBigDecimalParameter(request, "gia"));
	    phong.setGiaDien(getBigDecimalParameter(request, "giaDien"));
	    phong.setGiaNuoc(getBigDecimalParameter(request, "giaNuoc"));
	    phong.setPhiDichVu(getBigDecimalParameter(request, "phiDichVu"));
	    
	    String[] dsTienIchIds = request.getParameterValues("tienIch");
	    
	    return phongTroBO.updatePhongTro(phong, dsTienIchIds);
	}
}