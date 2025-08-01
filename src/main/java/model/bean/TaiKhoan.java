package model.bean;

import java.util.Date;

public class TaiKhoan {
    private int id;
    private String hoTen;
    private String email;
    private String matKhau;
    private String vaiTro; 
    private String soDienThoai;
    private String gioiTinh;
    private boolean trangThai;
    private boolean daXacThuc;
    private Date ngayTao;
    private String cccd;
    private Date ngayCapCccd;

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getMatKhau() { return matKhau; }
    public void setMatKhau(String matKhau) { this.matKhau = matKhau; }
    
    public String getVaiTro() { return vaiTro; }
    public void setVaiTro(String vaiTro) { this.vaiTro = vaiTro; }
    
    public String getSoDienThoai() { return soDienThoai; }
    public void setSoDienThoai(String soDienThoai) { this.soDienThoai = soDienThoai; }
    
    public String getGioiTinh() { return gioiTinh; }
    public void setGioiTinh(String gioiTinh) { this.gioiTinh = gioiTinh; }
    
    public boolean isTrangThai() { return trangThai; }
    public void setTrangThai(boolean trangThai) { this.trangThai = trangThai; }
    
    public boolean isDaXacThuc() { return daXacThuc; }
    public void setDaXacThuc(boolean daXacThuc) { this.daXacThuc = daXacThuc; }
    
    public Date getNgayTao() { return ngayTao; }
    public void setNgayTao(Date ngayTao) { this.ngayTao = ngayTao; }
    
    public String getCccd() { return cccd; }
    public void setCccd(String cccd) { this.cccd = cccd; }
    
    public Date getNgayCapCccd() { return ngayCapCccd; }
    public void setNgayCapCccd(Date ngayCapCccd) { this.ngayCapCccd = ngayCapCccd; }
}