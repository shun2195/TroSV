package model.bo;

import model.bean.TaiKhoan;
import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {
    private TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();

    public boolean dangKyTaiKhoan(TaiKhoan taiKhoan) {
        if (!validateTaiKhoan(taiKhoan)) {
            return false;
        }

        if (emailDaTonTai(taiKhoan.getEmail())) {
            return false;
        }

        taiKhoan.setTrangThai(true);
        taiKhoan.setDaXacThuc(false);
        
        if ("ChuTro".equalsIgnoreCase(taiKhoan.getVaiTro())) {
            if (taiKhoan.getCccd() != null && !taiKhoan.getCccd().isEmpty()) {
                if (!taiKhoan.getCccd().matches("^\\d{9}|\\d{12}$")) {
                    return false;
                }
            }
        }

        return taiKhoanDAO.dangKyTaiKhoan(taiKhoan);
    }

    public TaiKhoan dangNhap(String email, String matKhau) {
        TaiKhoan taiKhoan = taiKhoanDAO.timTaiKhoanBangEmail(email);
        if (taiKhoan != null && matKhau.equals(taiKhoan.getMatKhau())) {
            return taiKhoan;
        }
        return null;
    }

    public TaiKhoan timTaiKhoanBangEmail(String email) {
        return taiKhoanDAO.timTaiKhoanBangEmail(email);
    }

    public boolean capNhatMatKhau(String email, String matKhauCu, String matKhauMoi) {
        TaiKhoan taiKhoan = taiKhoanDAO.timTaiKhoanBangEmail(email);
        if (taiKhoan == null || !matKhauCu.equals(taiKhoan.getMatKhau())) {
            return false;
        }

        return taiKhoanDAO.capNhatMatKhau(taiKhoan.getId(), matKhauMoi);
    }

    public boolean resetMatKhau(String email, String soDienThoai, String matKhauMoi) {
        TaiKhoan taiKhoan = taiKhoanDAO.timTaiKhoanBangEmail(email);
        if (taiKhoan != null && taiKhoan.getSoDienThoai().equals(soDienThoai)) {
            return taiKhoanDAO.capNhatMatKhau(taiKhoan.getId(), matKhauMoi);
        }
        return false;
    }

    private boolean emailDaTonTai(String email) {
        return taiKhoanDAO.timTaiKhoanBangEmail(email) != null;
    }

    private boolean validateTaiKhoan(TaiKhoan taiKhoan) {
        if (!taiKhoan.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            return false;
        }

        if (!taiKhoan.getSoDienThoai().matches("^(0|\\+84)[0-9]{9,10}$")) {
            return false;
        }

        if (taiKhoan.getMatKhau().length() < 8) {
            return false;
        }

        return true;
    }
}