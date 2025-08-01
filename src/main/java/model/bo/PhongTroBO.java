package model.bo;
import model.bean.PhongTro;
import model.dao.PhongTroDAO;
public class PhongTroBO {

    // Khai báo một đối tượng DAO
    private PhongTroDAO phongTroDAO;

    // Hàm khởi tạo (Constructor) không có tham số
    // Đây là nơi mà lỗi của bạn đang xảy ra
    public PhongTroBO() {
        // Bên trong constructor, chúng ta khởi tạo đối tượng DAO
        this.phongTroDAO = new PhongTroDAO();
    }
    
    // Phương thức nghiệp vụ
    public boolean insertPhongTro(PhongTro phongTro, String[] dsTienIchIds) {
        return phongTroDAO.insertPhongTro(phongTro, dsTienIchIds);
    }
    
    // Các phương thức khác của BO sẽ được thêm vào đây...
}
