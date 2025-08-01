package model.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.bean.PhongTro;
import model.database.DatabaseConnection;
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
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            return false;
        } finally {
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (psPhongTro != null) psPhongTro.close();
                if (psPhongTienIch != null) psPhongTienIch.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
