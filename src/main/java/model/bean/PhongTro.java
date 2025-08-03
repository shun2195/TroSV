package model.bean;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import model.bean.HinhAnh;

// Các import này đã đúng, không cần import lại các class trong cùng package
// import model.bean.Phuong;
// import model.bean.TienIch;
// import model.bean.TaiKhoan;

public class PhongTro {

	// --- Các thuộc tính tương ứng với cột trong CSDL ---
	private int id;
	private int idChuTro;
	private String tieuDe;
	private String moTa;
	private BigDecimal gia;
	private BigDecimal giaDien;
	private BigDecimal giaNuoc;
	private BigDecimal phiDichVu;
	private String diaChi;
	private int idPhuong;
	private String trangThai;
	private Timestamp ngayDang;

	// --- Các thuộc tính để chứa dữ liệu từ các bảng khác (sau khi JOIN) ---
	private Phuong phuong; // Đối tượng Phường (chứa tenPhuong)
	private TaiKhoan chuTro; // Đối tượng Tài Khoản (chứa hoTen, soDienThoai của chủ trọ)
	private List<TienIch> dsTienIch; // Danh sách các tiện ích của phòng
	private List<HinhAnh> dsHinhAnh; // Danh sách hình ảnh của phòng (cần có model HinhAnh.java)
	private HinhAnh hinhanh; // Danh sách hình ảnh của phòng (cần có model HinhAnh.java)

	// --- Constructor ---
	public PhongTro() {
	}

	// --- Getters and Setters ---
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdChuTro() {
		return idChuTro;
	}

	public void setIdChuTro(int idChuTro) {
		this.idChuTro = idChuTro;
	}

	public String getTieuDe() {
		return tieuDe;
	}

	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public BigDecimal getGia() {
		return gia;
	}

	public void setGia(BigDecimal gia) {
		this.gia = gia;
	}

	public BigDecimal getGiaDien() {
		return giaDien;
	}

	public void setGiaDien(BigDecimal giaDien) {
		this.giaDien = giaDien;
	}

	public BigDecimal getGiaNuoc() {
		return giaNuoc;
	}

	public void setGiaNuoc(BigDecimal giaNuoc) {
		this.giaNuoc = giaNuoc;
	}

	public BigDecimal getPhiDichVu() {
		return phiDichVu;
	}

	public void setPhiDichVu(BigDecimal phiDichVu) {
		this.phiDichVu = phiDichVu;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public int getIdPhuong() {
		return idPhuong;
	}

	public void setIdPhuong(int idPhuong) {
		this.idPhuong = idPhuong;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public Timestamp getNgayDang() {
		return ngayDang;
	}

	public void setNgayDang(Timestamp ngayDang) {
		this.ngayDang = ngayDang;
	}

	public Phuong getPhuong() {
		return phuong;
	}

	public void setPhuong(Phuong phuong) {
		this.phuong = phuong;
	}

	public TaiKhoan getChuTro() {
		return chuTro;
	}

	public void setChuTro(TaiKhoan chuTro) {
		this.chuTro = chuTro;
	}

	public HinhAnh getHinhanh() {
		return hinhanh;
	}

	public void setHinhanh(HinhAnh hinhanh) {
		this.hinhanh = hinhanh;
	}

	public List<TienIch> getDsTienIch() {
		return dsTienIch;
	}

	public void setDsTienIch(List<TienIch> dsTienIch) {
		this.dsTienIch = dsTienIch;
	}

	public List<HinhAnh> getDsHinhAnh() {
		return dsHinhAnh;
	}

	public void setDsHinhAnh(List<HinhAnh> dsHinhAnh) {
		this.dsHinhAnh = dsHinhAnh;
	}

	public String getHinhAnhDaiDien() {
		// Kiểm tra xem danh sách hình ảnh có tồn tại và không rỗng không
		if (this.dsHinhAnh != null && !this.dsHinhAnh.isEmpty()) {
			// Trả về đường dẫn của ảnh đầu tiên
			System.out.println("dsHinhAnh" + dsHinhAnh);
			return this.dsHinhAnh.get(0).getDuongDan();
		}

		// Nếu không có ảnh nào, trả về một ảnh mẫu
		return "https://via.placeholder.com/400x250.png?text=Chưa+có+ảnh";
	}
}