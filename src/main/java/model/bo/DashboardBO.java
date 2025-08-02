package model.bo;
import java.util.HashMap;
import java.util.Map;
import model.dao.PhongTroDAO;
import model.dao.LichHenDAO;

public class DashboardBO {
	private PhongTroDAO phongTroDAO = new PhongTroDAO();
    private LichHenDAO lichHenDAO = new LichHenDAO();
    
    public Map<String, Integer> getChuTroStats(int idChuTro) {
        Map<String, Integer> stats = new HashMap<>();
        
        // Gọi các phương thức đếm từ các DAO khác nhau
        int tongSoPhong = phongTroDAO.countPhongTroByChuTroId(idChuTro);
        int soPhongTrong = phongTroDAO.countPhongTroByStatus(idChuTro, "ConPhong");
        int lichHenChoDuyet = lichHenDAO.countLichHenByStatusForChuTro(idChuTro, "ChoDuyet");
        
     // Đặt kết quả vào Map
        stats.put("tongSoPhong", tongSoPhong);
        stats.put("soPhongTrong", soPhongTrong);
        stats.put("lichHenChoDuyet", lichHenChoDuyet);
        
        return stats;
    }
}
