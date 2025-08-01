package model.dao;

import model.bean.TaiKhoan;
import model.database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

	public List<TaiKhoan> getChuTroChuaXacMinh() {
        List<TaiKhoan> list = new ArrayList<>();
        String sql = "SELECT * FROM taikhoan WHERE vaiTro = 'ChuTro' AND cccd IS NOT NULL AND ngayCapCccd IS NOT NULL AND daXacThuc = false";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                TaiKhoan tk = mapResultSetToTaiKhoan(rs);
                list.add(tk);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

	 public boolean xacNhanChuTro(int id) {
	        String sql = "UPDATE taikhoan SET daXacThuc = true WHERE id = ? AND vaiTro = 'ChuTro'";
	        try (Connection conn = DatabaseConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setInt(1, id);
	            return ps.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

    // Tổng tài khoản
    public int demTongTaiKhoan() {
        return dem("SELECT COUNT(*) FROM TaiKhoan");
    }

    // Tổng phòng trọ
    public int demTongPhongTro() {
        return dem("SELECT COUNT(*) FROM PhongTro");
    }

    // Tổng lịch hẹn
    public int demTongLichHen() {
        return dem("SELECT COUNT(*) FROM LichHen");
    }

    // Tài khoản mới trong 7 ngày qua
    public int demTaiKhoanMoiTrong7Ngay() {
        return dem("SELECT COUNT(*) FROM TaiKhoan WHERE ngayTao >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)");
    }

    // Hàm dùng chung để đếm
    private int dem(String query) {
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    private TaiKhoan mapResultSetToTaiKhoan(ResultSet rs) throws SQLException {
        TaiKhoan tk = new TaiKhoan();
        tk.setId(rs.getInt("id"));
        tk.setHoTen(rs.getString("hoTen"));
        tk.setEmail(rs.getString("email"));
        tk.setVaiTro(rs.getString("vaiTro"));
        tk.setSoDienThoai(rs.getString("soDienThoai"));
        tk.setGioiTinh(rs.getString("gioiTinh"));
        tk.setDaXacThuc(rs.getBoolean("daXacThuc"));
        tk.setCccd(rs.getString("cccd"));
        tk.setNgayCapCccd(rs.getDate("ngayCapCccd"));
        return tk;
    }
}
