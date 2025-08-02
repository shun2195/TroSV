package model.dao;

import model.bean.TaiKhoan;
import model.database.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaiKhoanDAO {

    public TaiKhoan kiemTraDangNhap(String email, String matKhau) {
    	// --- BẮT ĐẦU DEBUG ---
        System.out.println("--- Bắt đầu kiểm tra đăng nhập trong DAO ---");
        System.out.println("Email nhận được: [" + email + "]");
        System.out.println("Mật khẩu nhận được: [" + matKhau + "]");
        // --- KẾT THÚC DEBUG ---
        TaiKhoan taiKhoan = timTaiKhoanBangEmail(email);
        if (taiKhoan != null) {
            System.out.println("Tìm thấy tài khoản: " + taiKhoan.getHoTen());
            System.out.println("Mật khẩu trong CSDL: [" + taiKhoan.getMatKhau() + "]");
            
            if (matKhau.equals(taiKhoan.getMatKhau())) {
                System.out.println("==> So sánh mật khẩu THÀNH CÔNG!");
                return taiKhoan;
            } else {
                System.out.println("==> So sánh mật khẩu THẤT BẠI!");
            }
        } else {
            System.out.println("==> Không tìm thấy tài khoản nào với email này.");
        }
        
        System.out.println("--- Kết thúc kiểm tra, trả về null ---");
        return null;
    }
    public boolean dangKyTaiKhoan(TaiKhoan tk) {
        String sql = "INSERT INTO taikhoan (hoTen, email, matKhau, vaiTro, soDienThoai, gioiTinh, trangThai, daXacThuc, cccd, ngayCapCccd) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, tk.getHoTen());
            ps.setString(2, tk.getEmail());
            ps.setString(3, tk.getMatKhau());
            ps.setString(4, tk.getVaiTro());
            ps.setString(5, tk.getSoDienThoai());
            ps.setString(6, tk.getGioiTinh());
            ps.setBoolean(7, tk.isTrangThai());
            ps.setBoolean(8, tk.isDaXacThuc());
            ps.setString(9, tk.getCccd());
            ps.setDate(10, tk.getNgayCapCccd() != null ? new java.sql.Date(tk.getNgayCapCccd().getTime()) : null);

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) return false;

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) tk.setId(rs.getInt(1));
            }

            return true;
        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Email đã tồn tại: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public TaiKhoan timTaiKhoanBangEmail(String email) {
        String sql = "SELECT * FROM TaiKhoan WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToTaiKhoan(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public TaiKhoan timTaiKhoanBangId(int id) {
        TaiKhoan taikhoan = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM taikhoan WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                taikhoan = mapResultSetToTaiKhoan(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return taikhoan;
    }

    public boolean capNhatMatKhau(int id, String matKhauMoi) {
        String sql = "UPDATE TaiKhoan SET matKhau = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, matKhauMoi); // Lưu mật khẩu plain text
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private TaiKhoan mapResultSetToTaiKhoan(ResultSet rs) throws SQLException {
        TaiKhoan tk = new TaiKhoan();
        tk.setId(rs.getInt("id"));
        tk.setHoTen(rs.getString("hoTen"));
        tk.setEmail(rs.getString("email"));
        tk.setMatKhau(rs.getString("matKhau"));
        tk.setVaiTro(rs.getString("vaiTro"));
        tk.setSoDienThoai(rs.getString("soDienThoai"));
        tk.setGioiTinh(rs.getString("gioiTinh"));
        tk.setTrangThai(rs.getBoolean("trangThai"));
        tk.setDaXacThuc(rs.getBoolean("daXacThuc"));
        tk.setNgayTao(rs.getTimestamp("ngayTao"));
        tk.setCccd(rs.getString("cccd"));
        tk.setNgayCapCccd(rs.getDate("ngayCapCccd"));
        return tk;
    }
}