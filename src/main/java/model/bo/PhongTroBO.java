package model.bo;

import java.util.Collection;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import model.bean.PhongTro;
import model.dao.PhongTroDAO;

public class PhongTroBO {
    private PhongTroDAO phongTroDAO = new PhongTroDAO();

    public boolean insertPhongTro(PhongTro phongTro, String[] dsTienIchIds, Collection<Part> fileParts, ServletContext context) {
        return phongTroDAO.insertPhongTro(phongTro, dsTienIchIds, fileParts, context);
    }

    public boolean updatePhongTro(PhongTro phong, String[] dsTienIchIds, Collection<Part> fileParts, ServletContext context) {
        return phongTroDAO.updatePhongTro(phong, dsTienIchIds, fileParts, context);
    }
    
    public List<PhongTro> getPhongTroByChuTroId(int idChuTro) {
        return phongTroDAO.getPhongTroByChuTroId(idChuTro);
    }
    
    public boolean deletePhongTro(int idPhong, int idChuTro) {
        return phongTroDAO.deletePhongTro(idPhong, idChuTro);
    }
    
    public PhongTro getPhongTroById(int id) {
        return phongTroDAO.getPhongTroById(id);
    }
    
    public List<PhongTro> getDanhSachPhongForNguoiThue() {
        return phongTroDAO.getDanhSachPhongForNguoiThue();
    }

    public PhongTro getChiTietPhongById(int id) {
        return phongTroDAO.getChiTietPhongById(id);
    }

    public List<PhongTro> searchPhongTro(String idPhuongStr, String khoangGiaStr) {
        return phongTroDAO.searchPhongTro(idPhuongStr, khoangGiaStr);
    }
}