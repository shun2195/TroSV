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
import model.bean.TaiKhoan;
import model.bo.LichHenBO;

@WebServlet("/user/dashboard")
public class UserDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LichHenBO lichHenBO = new LichHenBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        TaiKhoan user = (TaiKhoan) session.getAttribute("account");

        // Bắt buộc đăng nhập mới được vào dashboard
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Lấy danh sách lịch hẹn của người dùng này
        int idNguoiThue = user.getId();
        List<LichHen> dsLichHen = lichHenBO.getLichHenByNguoiThueId(idNguoiThue);
        
        // Gửi danh sách ra view
        request.setAttribute("dsLichHen", dsLichHen);
        
        request.getRequestDispatcher("/views/nguoi_thue/userDashboard.jsp").forward(request, response);
    }
}