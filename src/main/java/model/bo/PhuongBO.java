package model.bo;
import java.util.List;
import model.dao.PhuongDAO;
import model.bean.Phuong;
public class PhuongBO {
	private PhuongDAO phuongDAO = new PhuongDAO();

    public List<Phuong> getAllPhuong() {
        return phuongDAO.getAllPhuong();
    }
}
