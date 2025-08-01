package model.bo;
import java.util.List;
import model.dao.TienIchDAO;
import model.bean.TienIch;
public class TienIchBO {
	private TienIchDAO tienIchDAO = new TienIchDAO();

    public List<TienIch> getAllTienIch() {
        return tienIchDAO.getAllTienIch();
    }
}
