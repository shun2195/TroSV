package model.bo;

import model.bean.LichHen;
import model.bean.PhongTro;
import model.bean.TaiKhoan;
import model.dao.AdminDAO;

import java.util.List;

public class AdminBO {
    private AdminDAO adminDAO = new AdminDAO();

    public List<TaiKhoan> layDanhSachChuTroChoDuyet() {
        return adminDAO.getChuTroChuaXacMinh();
    }

    public boolean xacNhanChuTro(int idTaiKhoan) {
        return adminDAO.xacNhanChuTro(idTaiKhoan);
    }

    public int tongTaiKhoan() {
        return adminDAO.demTongTaiKhoan();
    }

    public int tongPhongTro() {
        return adminDAO.demTongPhongTro();
    }

    public int tongLichHen() {
        return adminDAO.demTongLichHen();
    }

    public int soTaiKhoanMoiTrongTuan() {
        return adminDAO.demTaiKhoanMoiTrong7Ngay();
    }
    
    public List<TaiKhoan> layTatCaTaiKhoan() {
        return adminDAO.getAllTaiKhoan();
    }

    public List<TaiKhoan> layTaiKhoanMoiTrongTuan() {
        return adminDAO.getTaiKhoanMoiTrong7Ngay();
    }
    
    public List<PhongTro> layTatCaPhongTro() {
        return adminDAO.getAllPhongTro();
    }
    
    public List<LichHen> layTatCaLichHen() {
        return adminDAO.getAllLichHen();
    }
}