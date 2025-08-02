package model.bo;

import java.util.List; 
import model.bean.PhongTro;
import model.dao.PhongTroDAO;

public class PhongTroBO {

	private PhongTroDAO phongTroDAO = new PhongTroDAO();

	public boolean insertPhongTro(PhongTro phongTro, String[] dsTienIchIds) {
		return phongTroDAO.insertPhongTro(phongTro, dsTienIchIds);
	}

	// THÊM PHƯƠNG THỨC MỚI VÀO ĐÂY
	public List<PhongTro> getPhongTroByChuTroId(int idChuTro) {
		return phongTroDAO.getPhongTroByChuTroId(idChuTro);
	}
	
	public boolean deletePhongTro(int idPhong, int idChuTro) {
        return phongTroDAO.deletePhongTro(idPhong, idChuTro);
    }
	
	public PhongTro getPhongTroById(int id) {
	    return phongTroDAO.getPhongTroById(id);
	}
	
	public boolean updatePhongTro(PhongTro phong, String[] dsTienIchIds) {
	    return phongTroDAO.updatePhongTro(phong, dsTienIchIds);
	}
	
	public List<PhongTro> getDanhSachPhongForNguoiThue() {
	    return phongTroDAO.getDanhSachPhongForNguoiThue();
	}

	public PhongTro getChiTietPhongById(int id) {
	    return phongTroDAO.getChiTietPhongById(id);
	}
	public List<PhongTro> searchPhongTro(String idPhuongStr, String khoangGiaStr) {
	    // BO chỉ đơn giản là gọi xuống DAO
	    return phongTroDAO.searchPhongTro(idPhuongStr, khoangGiaStr);
	}
}
