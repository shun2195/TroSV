package model.bean;

public class TienIch {
	// 1. Khai báo các thuộc tính trùng với tên cột trong CSDL
    private int id;
    private String tenTienIch;

    // 2. Constructor (không bắt buộc nhưng nên có)
    public TienIch() {
    }

    public TienIch(int id, String tenTienIch) {
        this.id = id;
        this.tenTienIch = tenTienIch;
    }
 // 3. Các phương thức Getter và Setter (ĐÂY LÀ PHẦN QUAN TRỌNG NHẤT)
    // Eclipse sẽ tìm các phương thức này.
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenTienIch() {
        return tenTienIch;
    }

    public void setTenTienIch(String tenTienIch) {
        this.tenTienIch = tenTienIch;
    }
}
