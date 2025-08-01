package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.bean.PhongTro;
import model.bean.TienIch;
import model.database.DatabaseConnection;
import java.util.ArrayList;
import java.util.List;

public class PhongTroDAO {
	public boolean insertPhongTro(PhongTro phongTro, String[] dsTienIchIds) {
		Connection conn = null;
		PreparedStatement psPhongTro = null;
		PreparedStatement psPhongTienIch = null;
		ResultSet generatedKeys = null;

		// Câu lệnh SQL INSERT đã được cập nhật chính xác với các cột của bạn
		// Không cần thêm trangThai, ngayDang vì chúng có giá trị DEFAULT
		String sqlPhongTro = "INSERT INTO PhongTro (idChuTro, tieuDe, moTa, gia, giaDien, giaNuoc, phiDichVu, diaChi, idPhuong) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String sqlPhongTienIch = "INSERT INTO Phong_TienIch (idPhong, idTienIch) VALUES (?, ?)";

		try {
			conn = DatabaseConnection.getConnection();
			conn.setAutoCommit(false); // Bắt đầu Transaction

			psPhongTro = conn.prepareStatement(sqlPhongTro, Statement.RETURN_GENERATED_KEYS);
			psPhongTro.setInt(1, phongTro.getIdChuTro());
			psPhongTro.setString(2, phongTro.getTieuDe());
			psPhongTro.setString(3, phongTro.getMoTa());
			psPhongTro.setBigDecimal(4, phongTro.getGia());
			psPhongTro.setBigDecimal(5, phongTro.getGiaDien());
			psPhongTro.setBigDecimal(6, phongTro.getGiaNuoc());
			psPhongTro.setBigDecimal(7, phongTro.getPhiDichVu());
			psPhongTro.setString(8, phongTro.getDiaChi());
			psPhongTro.setInt(9, phongTro.getIdPhuong());

			int affectedRows = psPhongTro.executeUpdate();

			if (affectedRows == 0) {
				conn.rollback();
				return false;
			}

			// Lấy ID của phòng trọ vừa được tạo
			generatedKeys = psPhongTro.getGeneratedKeys();
			if (generatedKeys.next()) {
				int idPhongMoi = generatedKeys.getInt(1);

				// Thêm vào bảng Phong_TienIch
				if (dsTienIchIds != null && dsTienIchIds.length > 0) {
					psPhongTienIch = conn.prepareStatement(sqlPhongTienIch);
					for (String idTienIchStr : dsTienIchIds) {
						psPhongTienIch.setInt(1, idPhongMoi);
						psPhongTienIch.setInt(2, Integer.parseInt(idTienIchStr));
						psPhongTienIch.addBatch();
					}
					psPhongTienIch.executeBatch();
				}
			} else {
				conn.rollback();
				return false;
			}

			conn.commit(); // Hoàn thành transaction
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			return false;
		} finally {
			try {
				if (generatedKeys != null)
					generatedKeys.close();
				if (psPhongTro != null)
					psPhongTro.close();
				if (psPhongTienIch != null)
					psPhongTienIch.close();
				if (conn != null) {
					conn.setAutoCommit(true);
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<PhongTro> getPhongTroByChuTroId(int idChuTro) {
		List<PhongTro> dsPhongTro = new ArrayList<>();
		String sql = "SELECT * FROM PhongTro WHERE idChuTro = ? ORDER BY ngayDang DESC";

		try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, idChuTro);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				PhongTro phong = new PhongTro();
				phong.setId(rs.getInt("id"));
				phong.setTieuDe(rs.getString("tieuDe"));
				phong.setGia(rs.getBigDecimal("gia"));
				phong.setTrangThai(rs.getString("trangThai"));
				phong.setNgayDang(rs.getTimestamp("ngayDang"));
				dsPhongTro.add(phong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dsPhongTro;
	}
	
	public boolean deletePhongTro(int idPhong, int idChuTro) {
	    Connection conn = null;
	    String sqlDeleteTienIch = "DELETE FROM Phong_TienIch WHERE idPhong = ?";
	    String sqlDeleteHinhAnh = "DELETE FROM HinhAnh WHERE idPhong = ?";
	    String sqlDeleteLichHen = "DELETE FROM LichHen WHERE idPhong = ?";
	    String sqlDeletePhong = "DELETE FROM PhongTro WHERE id = ? AND idChuTro = ?";

	    try {
	        conn = DatabaseConnection.getConnection();
	        conn.setAutoCommit(false); // Bắt đầu Transaction

	        // Xóa các bảng phụ thuộc trước
	        try (PreparedStatement ps = conn.prepareStatement(sqlDeleteTienIch)) {
	            ps.setInt(1, idPhong);
	            ps.executeUpdate();
	        }
	        try (PreparedStatement ps = conn.prepareStatement(sqlDeleteHinhAnh)) {
	            ps.setInt(1, idPhong);
	            ps.executeUpdate();
	        }
	        try (PreparedStatement ps = conn.prepareStatement(sqlDeleteLichHen)) {
	            ps.setInt(1, idPhong);
	            ps.executeUpdate();
	        }

	        // Cuối cùng, xóa bảng chính
	        try (PreparedStatement ps = conn.prepareStatement(sqlDeletePhong)) {
	            ps.setInt(1, idPhong);
	            ps.setInt(2, idChuTro);
	            int rowsAffected = ps.executeUpdate();
	            
	            if (rowsAffected > 0) {
	                conn.commit(); // Lưu tất cả thay đổi
	                return true;
	            } else {
	                conn.rollback(); // Hủy bỏ vì không xóa được (sai id hoặc sai chủ)
	                return false;
	            }
	        }

	    } catch (SQLException e) {
	        if (conn != null) try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
	        e.printStackTrace();
	        return false;
	    } finally {
	        if (conn != null) try { conn.setAutoCommit(true); conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
	    }
	}
	
	public PhongTro getPhongTroById(int id) {
	    PhongTro phong = null;
	    String sql = "SELECT * FROM PhongTro WHERE id = ?";
	    String sqlTienIch = "SELECT idTienIch FROM Phong_TienIch WHERE idPhong = ?";

	    try (Connection conn = DatabaseConnection.getConnection()) {
	        // Lấy thông tin cơ bản của phòng trọ
	        try (PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                phong = new PhongTro();
	                phong.setId(rs.getInt("id"));
	                phong.setTieuDe(rs.getString("tieuDe"));
	                phong.setMoTa(rs.getString("moTa"));
	                phong.setDiaChi(rs.getString("diaChi"));
	                phong.setIdPhuong(rs.getInt("idPhuong"));
	                phong.setGia(rs.getBigDecimal("gia"));
	                phong.setGiaDien(rs.getBigDecimal("giaDien"));
	                phong.setGiaNuoc(rs.getBigDecimal("giaNuoc"));
	                phong.setPhiDichVu(rs.getBigDecimal("phiDichVu"));
	            }
	        }

	        // Nếu tìm thấy phòng, lấy danh sách tiện ích của nó
	        if (phong != null) {
	            List<TienIch> dsTienIchCuaPhong = new ArrayList<>();
	            try (PreparedStatement psTienIch = conn.prepareStatement(sqlTienIch)) {
	                psTienIch.setInt(1, id);
	                ResultSet rsTienIch = psTienIch.executeQuery();
	                while (rsTienIch.next()) {
	                    TienIch tienIch = new TienIch();
	                    tienIch.setId(rsTienIch.getInt("idTienIch"));
	                    dsTienIchCuaPhong.add(tienIch);
	                }
	            }
	            phong.setDsTienIch(dsTienIchCuaPhong); // Giả sử bạn có setter này trong model
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return phong;
	}
	
	public boolean updatePhongTro(PhongTro phong, String[] dsTienIchIds) {
	    String sqlUpdatePhong = "UPDATE PhongTro SET tieuDe=?, moTa=?, gia=?, giaDien=?, giaNuoc=?, phiDichVu=?, diaChi=?, idPhuong=? WHERE id=?";
	    String sqlDeleteTienIch = "DELETE FROM Phong_TienIch WHERE idPhong = ?";
	    String sqlInsertTienIch = "INSERT INTO Phong_TienIch (idPhong, idTienIch) VALUES (?, ?)";
	    Connection conn = null;

	    try {
	        conn = DatabaseConnection.getConnection();
	        conn.setAutoCommit(false);

	        // 1. Cập nhật bảng PhongTro
	        try (PreparedStatement ps = conn.prepareStatement(sqlUpdatePhong)) {
	            ps.setString(1, phong.getTieuDe());
	            ps.setString(2, phong.getMoTa());
	            ps.setBigDecimal(3, phong.getGia());
	            ps.setBigDecimal(4, phong.getGiaDien());
	            ps.setBigDecimal(5, phong.getGiaNuoc());
	            ps.setBigDecimal(6, phong.getPhiDichVu());
	            ps.setString(7, phong.getDiaChi());
	            ps.setInt(8, phong.getIdPhuong());
	            ps.setInt(9, phong.getId());
	            ps.executeUpdate();
	        }

	        // 2. Xóa hết tiện ích cũ
	        try (PreparedStatement ps = conn.prepareStatement(sqlDeleteTienIch)) {
	            ps.setInt(1, phong.getId());
	            ps.executeUpdate();
	        }

	        // 3. Thêm lại tiện ích mới
	        if (dsTienIchIds != null && dsTienIchIds.length > 0) {
	            try (PreparedStatement ps = conn.prepareStatement(sqlInsertTienIch)) {
	                for (String idTienIch : dsTienIchIds) {
	                    ps.setInt(1, phong.getId());
	                    ps.setInt(2, Integer.parseInt(idTienIch));
	                    ps.addBatch();
	                }
	                ps.executeBatch();
	            }
	        }
	        
	        conn.commit();
	        return true;

	    } catch (SQLException e) {
	        if (conn != null) try { conn.rollback(); } catch (SQLException ex) {}
	        e.printStackTrace();
	        return false;
	    } finally {
	        if (conn != null) try { conn.setAutoCommit(true); conn.close(); } catch (SQLException ex) {}
	    }
	}

}
