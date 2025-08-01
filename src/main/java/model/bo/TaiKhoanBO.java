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
        
        // Lưu mật khẩu dạng plain text (không mã hóa)
        return taiKhoanDAO.dangKyTaiKhoan(taiKhoan);
    }

    public TaiKhoan dangNhap(String email, String matKhau) {
        // So sánh mật khẩu trực tiếp (không mã hóa)
        TaiKhoan taiKhoan = taiKhoanDAO.timTaiKhoanBangEmail(email);
        if (taiKhoan != null && matKhau.equals(taiKhoan.getMatKhau())) {
            return taiKhoan;
        }
        return null;
    }

    public TaiKhoan timTaiKhoanBangEmail(String email) {
        return taiKhoanDAO.timTaiKhoanBangEmail(email);
    }

    public boolean capNhatMatKhau(int id, String matKhauCu, String matKhauMoi) {
        TaiKhoan taiKhoan = taiKhoanDAO.timTaiKhoanBangId(id);
        if (taiKhoan == null || !matKhauCu.equals(taiKhoan.getMatKhau())) {
            return false;
        }
        
        // Cập nhật mật khẩu mới dạng plain text
        return taiKhoanDAO.capNhatMatKhau(id, matKhauMoi);
    }

    public boolean resetMatKhau(String email, String soDienThoai, String matKhauMoi) {
        TaiKhoan taiKhoan = taiKhoanDAO.timTaiKhoanBangEmail(email);
        if (taiKhoan != null && taiKhoan.getSoDienThoai().equals(soDienThoai)) {
            // Cập nhật mật khẩu mới dạng plain text
            return taiKhoanDAO.capNhatMatKhau(taiKhoan.getId(), matKhauMoi);
        }
        return false;
    }

    private boolean emailDaTonTai(String email) {
        return taiKhoanDAO.timTaiKhoanBangEmail(email) != null;
    }

    private boolean validateTaiKhoan(TaiKhoan taiKhoan) {
        // Validate email format
        if (!taiKhoan.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            return false;
        }
        
        // Validate phone number
        if (!taiKhoan.getSoDienThoai().matches("^(0|\\+84)[0-9]{9,10}$")) {
            return false;
        }
        
        // Validate password strength
        if (taiKhoan.getMatKhau().length() < 8) {
            return false;
        }
        
        return true;
    }
}