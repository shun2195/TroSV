package model.dao;

import model.bean.TaiKhoan;
import model.database.DatabaseConnection;

import java.sql.*;

public class TaiKhoanDAO {

    // Kiểm tra đăng nhập người dùng
    public TaiKhoan kiemTraDangNhap(String email, String matKhau) {
        TaiKhoan taiKhoan = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM TaiKhoan WHERE email = ? AND matKhau = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, matKhau);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                taiKhoan = mapResultSetToTaiKhoan(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return taiKhoan;
    }

    // Đăng ký tài khoản mới
    public boolean dangKyTaiKhoan(TaiKhoan tk) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO TaiKhoan (hoTen, email, matKhau, vaiTro) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tk.getHoTen());
            ps.setString(2, tk.getEmail());
            ps.setString(3, tk.getMatKhau());
            ps.setString(4, tk.getVaiTro());
            return ps.executeUpdate() > 0;
        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Email đã tồn tại.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Tìm tài khoản bằng email
    public TaiKhoan timTaiKhoanBangEmail(String email) {
        TaiKhoan tk = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM TaiKhoan WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tk = mapResultSetToTaiKhoan(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tk;
    }

    // Cập nhật mật khẩu
    public boolean capNhatMatKhau(int id, String matKhauMoi) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE TaiKhoan SET matKhau = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, matKhauMoi);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return false;
    }

    // Ánh xạ ResultSet -> Đối tượng TaiKhoan
    private TaiKhoan mapResultSetToTaiKhoan(ResultSet rs) throws SQLException {
        TaiKhoan tk = new TaiKhoan();
        tk.setId(rs.getInt("id"));
        tk.setHoTen(rs.getString("hoTen"));
        tk.setEmail(rs.getString("email"));
        tk.setMatKhau(rs.getString("matKhau"));
        tk.setVaiTro(rs.getString("vaiTro"));
        return tk;
    }
}
