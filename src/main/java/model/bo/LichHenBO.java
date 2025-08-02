package model.bo;

import model.bean.LichHen;
import model.dao.LichHenDAO;

import java.util.List;

public class LichHenBO {
	private LichHenDAO lichHenDAO = new LichHenDAO();

	// Giữ lại phương thức này và dùng nó cho cả Chủ Trọ và Người Thuê
	public boolean insertLichHen(LichHen lichHen) {
		if (lichHen == null || lichHen.getNgayHen() == null || lichHen.getGioHen() == null) {
			return false;
		}
		// Gọi xuống DAO
		return lichHenDAO.insertLichHen(lichHen);
	}

	public boolean capNhatTrangThai(int idLichHen, String trangThaiMoi, int idChuTro) {
		if (!"ChapNhan".equals(trangThaiMoi) && !"TuChoi".equals(trangThaiMoi)) {
			return false;
		}
		return lichHenDAO.updateTrangThai(idLichHen, trangThaiMoi, idChuTro);
	}

	public List<LichHen> layLichHenChoChuTro(int idChuTro) {
		return lichHenDAO.getLichHenByChuTro(idChuTro);
	}
}