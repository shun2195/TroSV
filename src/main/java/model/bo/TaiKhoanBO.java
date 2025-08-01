package model.bo;

import model.dao.TaiKhoanDAO;
import model.bean.TaiKhoan;

public class TaiKhoanBO {
    private TaiKhoanDAO taiKhoanDAO;

    public TaiKhoanBO() {
        taiKhoanDAO = new TaiKhoanDAO();
    }

    public TaiKhoan dangNhap(String email, String matKhau) {
        return taiKhoanDAO.kiemTraDangNhap(email, matKhau);
    }

    public boolean dangKy(TaiKhoan taiKhoan) {
        return taiKhoanDAO.dangKyTaiKhoan(taiKhoan);
    }

    public TaiKhoan timBangEmail(String email) {
        return taiKhoanDAO.timTaiKhoanBangEmail(email);
    }

    public void capNhatMatKhau(int id, String matKhauMoi) {
        taiKhoanDAO.capNhatMatKhau(id, matKhauMoi);
    }
}
