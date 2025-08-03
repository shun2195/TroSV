package model.dao;

import model.bean.LichHen;
import model.bean.PhongTro;
import model.bean.TaiKhoan;
import model.database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LichHenDAO {

	public boolean insertLichHen(LichHen lichHen) {
        String sql = "INSERT INTO lichhen (idPhong, idNguoiThue, ngayHen, gioHen, trangThai) VALUES (?, ?, ?, ?, 'ChoDuyet')";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, lichHen.getIdPhong());
            ps.setInt(2, lichHen.getIdNguoiThue());
            ps.setDate(3, lichHen.getNgayHen());
            ps.setTime(4, lichHen.getGioHen());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateTrangThai(int idLichHen, String trangThaiMoi, int idChuTro) {
        String sql = "UPDATE lichhen lh " +
                   "JOIN phongtro pt ON lh.idPhong = pt.id " +
                   "SET lh.trangThai = ? " +
                   "WHERE lh.id = ? AND pt.idChuTro = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, trangThaiMoi);
            ps.setInt(2, idLichHen);
            ps.setInt(3, idChuTro);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<LichHen> getLichHenByChuTro(int idChuTro) {
        List<LichHen> list = new ArrayList<>();
        String sql = "SELECT lh.*, pt.tieuDe, tk_nguoithue.hoTen AS tenNguoiThue, tk_nguoithue.soDienThoai AS sdtNguoiThue " +
                   "FROM lichhen lh " +
                   "JOIN phongtro pt ON lh.idPhong = pt.id " +
                   "JOIN taikhoan tk_nguoithue ON lh.idNguoiThue = tk_nguoithue.id " +
                   "WHERE pt.idChuTro = ? ORDER BY lh.ngayHen DESC, lh.gioHen DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idChuTro);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToLichHenChiTiet(rs));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    private LichHen mapResultSetToLichHenChiTiet(ResultSet rs) throws SQLException {
        LichHen lh = new LichHen();
        lh.setId(rs.getInt("id"));
        lh.setIdPhong(rs.getInt("idPhong"));
        lh.setIdNguoiThue(rs.getInt("idNguoiThue"));
        lh.setNgayHen(rs.getDate("ngayHen"));
        lh.setGioHen(rs.getTime("gioHen"));
        lh.setTrangThai(rs.getString("trangThai"));

        PhongTro pt = new PhongTro();
        pt.setId(rs.getInt("idPhong"));
        pt.setTieuDe(rs.getString("tieuDe"));
        lh.setPhongTro(pt);

        TaiKhoan nguoiThue = new TaiKhoan();
        nguoiThue.setId(rs.getInt("idNguoiThue"));
        nguoiThue.setHoTen(rs.getString("tenNguoiThue"));
        nguoiThue.setSoDienThoai(rs.getString("sdtNguoiThue"));
        lh.setNguoiThue(nguoiThue);
        
        return lh;
    }
    
    public int countLichHenByStatusForChuTro(int idChuTro, String trangThai) {
        String sql = "SELECT COUNT(lh.id) FROM LichHen lh " +
                     "JOIN PhongTro pt ON lh.idPhong = pt.id " +
                     "WHERE pt.idChuTro = ? AND lh.trangThai = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idChuTro);
            ps.setString(2, trangThai);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public List<LichHen> getLichHenByNguoiThueId(int idNguoiThue) {
        List<LichHen> dsLichHen = new ArrayList<>();
        String sql = "SELECT lh.*, pt.tieuDe, pt.diaChi FROM lichhen lh " +
                     "JOIN phongtro pt ON lh.idPhong = pt.id " +
                     "WHERE lh.idNguoiThue = ? ORDER BY lh.ngayHen DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idNguoiThue);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LichHen lh = new LichHen();
                lh.setId(rs.getInt("id"));
                lh.setNgayHen(rs.getDate("ngayHen"));
                lh.setGioHen(rs.getTime("gioHen"));
                lh.setTrangThai(rs.getString("trangThai"));
                
                PhongTro pt = new PhongTro();
                pt.setId(rs.getInt("idPhong"));
                pt.setTieuDe(rs.getString("tieuDe"));
                pt.setDiaChi(rs.getString("diaChi"));
                lh.setPhongTro(pt);
                
                dsLichHen.add(lh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsLichHen;
    }
    
}