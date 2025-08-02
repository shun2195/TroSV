package controller;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bean.TaiKhoan;
import model.bo.DashboardBO;

@WebServlet("/chu-tro/dashboard")
public class DashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DashboardBO dashboardBO = new DashboardBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        // LƯU Ý: Đảm bảo bạn đang dùng đúng tên biến session ("account" hoặc "user")
        TaiKhoan chuTro = (TaiKhoan) session.getAttribute("account"); 

        if (chuTro == null || !"ChuTro".equals(chuTro.getVaiTro())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int idChuTro = chuTro.getId();
        Map<String, Integer> stats = dashboardBO.getChuTroStats(idChuTro);
        
        request.setAttribute("stats", stats);
        request.getRequestDispatcher("/views/chu_tro/dashboard.jsp").forward(request, response);
    }
}