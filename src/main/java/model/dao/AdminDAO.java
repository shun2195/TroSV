package model.dao;

import model.bean.LichHen;
import model.bean.PhongTro;
import model.bean.TaiKhoan;
import model.database.DatabaseConnection;

import java.math.BigDecimal;
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
                list.add(mapResultSetToTaiKhoan(rs));
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

    public int demTongTaiKhoan() {
        return dem("SELECT COUNT(*) FROM TaiKhoan");
    }

    public int demTongPhongTro() {
        return dem("SELECT COUNT(*) FROM PhongTro");
    }

    public int demTongLichHen() {
        return dem("SELECT COUNT(*) FROM LichHen");
    }

    public int demTaiKhoanMoiTrong7Ngay() {
        return dem("SELECT COUNT(*) FROM TaiKhoan WHERE ngayTao >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)");
    }

    public List<TaiKhoan> getAllTaiKhoan() {
        List<TaiKhoan> list = new ArrayList<>();
        String sql = "SELECT * FROM TaiKhoan ORDER BY id DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSetToTaiKhoan(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<TaiKhoan> getTaiKhoanMoiTrong7Ngay() {
        List<TaiKhoan> list = new ArrayList<>();
        String sql = "SELECT * FROM TaiKhoan WHERE ngayTao >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) ORDER BY ngayTao DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSetToTaiKhoan(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<PhongTro> getAllPhongTro() {
        List<PhongTro> list = new ArrayList<>();
        String sql = "SELECT * FROM PhongTro ORDER BY id DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSetToPhongTro(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<LichHen> getAllLichHen() {
        List<LichHen> list = new ArrayList<>();
        String sql = "SELECT * FROM LichHen ORDER BY id DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSetToLichHen(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

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
    
    private PhongTro mapResultSetToPhongTro(ResultSet rs) throws SQLException {
        PhongTro pt = new PhongTro();
        pt.setId(rs.getInt("id"));
        pt.setTieuDe(rs.getString("tieuDe"));
        pt.setGia(BigDecimal.valueOf(rs.getInt("gia")));  // Chuyển đổi từ int sang BigDecimal
        return pt;
    }
    
    private LichHen mapResultSetToLichHen(ResultSet rs) throws SQLException {
        LichHen lh = new LichHen();
        lh.setId(rs.getInt("id"));
        lh.setNgayHen(Date.valueOf("ngayHen"));
        return lh;
    }
}