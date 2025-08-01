package model.bean;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

public class PhongTro {
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
    
    public PhongTro() {}

    // Getters and Setters cho tất cả các thuộc tính
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdChuTro() { return idChuTro; }
    public void setIdChuTro(int idChuTro) { this.idChuTro = idChuTro; }
    public String getTieuDe() { return tieuDe; }
    public void setTieuDe(String tieuDe) { this.tieuDe = tieuDe; }
    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }
    public BigDecimal getGia() { return gia; }
    public void setGia(BigDecimal gia) { this.gia = gia; }
    public BigDecimal getGiaDien() { return giaDien; }
    public void setGiaDien(BigDecimal giaDien) { this.giaDien = giaDien; }
    public BigDecimal getGiaNuoc() { return giaNuoc; }
    public void setGiaNuoc(BigDecimal giaNuoc) { this.giaNuoc = giaNuoc; }
    public BigDecimal getPhiDichVu() { return phiDichVu; }
    public void setPhiDichVu(BigDecimal phiDichVu) { this.phiDichVu = phiDichVu; }
    public String getDiaChi() { return diaChi; }
    public void setDiaChi(String diaChi) { this.diaChi = diaChi; }
    public int getIdPhuong() { return idPhuong; }
    public void setIdPhuong(int idPhuong) { this.idPhuong = idPhuong; }
    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }
    public Timestamp getNgayDang() { return ngayDang; }
    public void setNgayDang(Timestamp ngayDang) { this.ngayDang = ngayDang; }
 // Thêm thuộc tính mới này cùng với các thuộc tính khác
    private List<TienIch> dsTienIch;

    // Thêm cặp Getter và Setter này vào cuối file
    public List<TienIch> getDsTienIch() {
        return dsTienIch;
    }

    public void setDsTienIch(List<TienIch> dsTienIch) {
        this.dsTienIch = dsTienIch;
    }
}
