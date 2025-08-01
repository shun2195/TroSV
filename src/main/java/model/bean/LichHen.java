package model.bean;

import java.sql.Date;
import java.sql.Time;

public class LichHen {
    private int id;
    private int idPhong;
    private int idNguoiThue;
    private Date ngayHen;
    private Time gioHen;
    private String trangThai;
    private PhongTro phongTro;
    private TaiKhoan nguoiThue;

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPhong() {
        return idPhong;
    }

    public void setIdPhong(int idPhong) {
        this.idPhong = idPhong;
    }

    public int getIdNguoiThue() {
        return idNguoiThue;
    }

    public void setIdNguoiThue(int idNguoiThue) {
        this.idNguoiThue = idNguoiThue;
    }

    public Date getNgayHen() {
        return ngayHen;
    }

    public void setNgayHen(Date ngayHen) {
        this.ngayHen = ngayHen;
    }

    public Time getGioHen() {
        return gioHen;
    }

    public void setGioHen(Time gioHen) {
        this.gioHen = gioHen;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public PhongTro getPhongTro() {
        return phongTro;
    }

    public void setPhongTro(PhongTro phongTro) {
        this.phongTro = phongTro;
    }

    public TaiKhoan getNguoiThue() {
        return nguoiThue;
    }

    public void setNguoiThue(TaiKhoan nguoiThue) {
        this.nguoiThue = nguoiThue;
    }
}