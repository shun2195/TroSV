package model.bo;
import model.bean.PhongTro;
import model.dao.PhongTroDAO;
public class PhongTroBO {
private PhongTroDAO phongTroDAO = new PhongTroDAO();
    
    public boolean insertPhongTro(PhongTro phongTro, String[] dsTienIchIds) {
        // Trong tương lai, bạn có thể thêm các logic kiểm tra dữ liệu ở đây
        return phongTroDAO.insertPhongTro(phongTro, dsTienIchIds);
    }
}
