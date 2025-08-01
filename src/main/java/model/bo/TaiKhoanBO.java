package model.bo;

import model.bean.TaiKhoan;
import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {
    private TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();

    public String dangKyTaiKhoan(TaiKhoan taiKhoan, String xacNhanMatKhau) {
        if (taiKhoan.getHoTen() == null || taiKhoan.getHoTen().trim().isEmpty()) {
            return "Vui lòng nhập họ và tên.";
        }
        if (!taiKhoan.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            return "Định dạng email không hợp lệ.";
        }
        if (taiKhoan.getMatKhau().length() < 6) {
            return "Mật khẩu phải có ít nhất 6 ký tự.";
        }
        if (!taiKhoan.getMatKhau().equals(xacNhanMatKhau)) {
            return "Mật khẩu xác nhận không khớp.";
        }
        if (!taiKhoan.getSoDienThoai().matches("^0[0-9]{9}$")) {
            return "Số điện thoại không hợp lệ (phải có 10 số, bắt đầu bằng 0).";
        }

        if (taiKhoanDAO.timTaiKhoanBangEmail(taiKhoan.getEmail()) != null) {
            return "Email này đã được sử dụng.";
        }
        
        if ("ChuTro".equalsIgnoreCase(taiKhoan.getVaiTro())) {
            if (taiKhoan.getCccd() == null || !taiKhoan.getCccd().matches("^\\d{12}$")) {
                return "Số CCCD không hợp lệ (phải có 12 số).";
            }
             if (taiKhoan.getNgayCapCccd() == null) {
                return "Vui lòng chọn ngày cấp CCCD.";
            }
        }

        taiKhoan.setTrangThai(true);
        taiKhoan.setDaXacThuc(false);
        if (taiKhoanDAO.dangKyTaiKhoan(taiKhoan)) {
            return null;
        } else {
            return "Đã có lỗi xảy ra phía server, vui lòng thử lại.";
        }
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
}