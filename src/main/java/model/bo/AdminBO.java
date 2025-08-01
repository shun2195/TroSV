package model.bo;

import model.bean.TaiKhoan;
import model.dao.AdminDAO;

import java.util.List;

public class AdminBO {
    private AdminDAO adminDAO = new AdminDAO();

    // Lấy danh sách chủ trọ đã có CCCD nhưng chưa được xác minh
    public List<TaiKhoan> layDanhSachChuTroChoDuyet() {
        return adminDAO.getChuTroChuaXacMinh();
    }

    // Xác minh chủ trọ (gán huy hiệu)
    public boolean xacNhanChuTro(int idTaiKhoan) {
        return adminDAO.xacNhanChuTro(idTaiKhoan);
    }

    // Thống kê tổng số tài khoản
    public int tongTaiKhoan() {
        return adminDAO.demTongTaiKhoan();
    }

    // Thống kê tổng số phòng trọ
    public int tongPhongTro() {
        return adminDAO.demTongPhongTro();
    }

    // Thống kê tổng số lượt đặt lịch
    public int tongLichHen() {
        return adminDAO.demTongLichHen();
    }

    // Thống kê số tài khoản mới trong 7 ngày qua
    public int soTaiKhoanMoiTrongTuan() {
        return adminDAO.demTaiKhoanMoiTrong7Ngay();
    }
}
