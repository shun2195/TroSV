package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.Phuong;
import model.database.DatabaseConnection;
public class PhuongDAO {
	public List<Phuong> getAllPhuong() {
        List<Phuong> danhSachPhuong = new ArrayList<>();
        String sql = "SELECT * FROM Phuong ORDER BY tenPhuong ASC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Phuong phuong = new Phuong();
                phuong.setId(rs.getInt("id"));
                phuong.setTenPhuong(rs.getString("tenPhuong"));
                danhSachPhuong.add(phuong);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return danhSachPhuong;
    }

}
