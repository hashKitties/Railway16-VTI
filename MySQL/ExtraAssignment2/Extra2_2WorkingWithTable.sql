SET foreign_key_checks = 0;
-- Câu 1: Xóa những khách hàng có tên là “Le Thi A”.
DELETE FROM khachhang 
WHERE
    TenKhachHang = 'Le Thi A';

-- Câu 2: Cập nhật những khách hàng đang thường trú ở khu vực “Son Tra” thành khu vực “Ngu
-- Hanh Son”.
UPDATE khachhang 
SET 
    MaKhuVuc = 'KV003'
WHERE
    MaKhuVuc = 'KV001';

-- Câu 3: Liệt kê những thành viên (shipper) có họ tên bắt đầu là ký tự ‘Tr’ và có độ dài ít nhất là
-- 25 ký tự (kể cả ký tự trắng).
SELECT 
    *
FROM
    thanhviengiaohang
WHERE
    TenThanhVienGiaoHang LIKE ('Tr%')
        AND LENGTH(TenThanhVienGiaoHang) >= 25;

-- Câu 4: Liệt kê những đơn hàng có NgayGiaoHang nằm trong năm 2017 và có khu vực giao
-- hàng là “Hai Chau”.
SELECT 
    *
FROM
    donhang_giaohang
WHERE
    YEAR(NgayGiaoHang) = 2017
        AND MaKhuVucGiaoHang = 'KV004';

-- Câu 5: Liệt kê MaDonHangGiaoHang, MaThanhVienGiaoHang, TenThanhVienGiaoHang,
-- NgayGiaoHang, PhuongThucThanhToan của tất cả những đơn hàng có trạng thái là “Da giao
-- hang”. Kết quả hiển thị được sắp xếp tăng dần theo NgayGiaoHang và giảm dần theo
-- PhuongThucThanhToan
SELECT 
    dh.MaDonHangGiaoHang,
    dh.MaThanhVienGiaoHang,
    tv.TenThanhVienGiaoHang,
    dh.NgayGiaoHang,
    dh.PhuongThucThanhToan
FROM
    donhang_giaohang dh
        JOIN
    thanhviengiaohang tv USING (MaThanhVienGiaoHang)
WHERE
    dh.TrangThaiGiaoHang = 'Da giao hang';

-- Câu 6: Liệt kê những thành viên có giới tính là “Nam” và chưa từng được giao hàng lần nào.
SELECT 
    tv.*
FROM
    thanhviengiaohang tv
        LEFT JOIN
    donhang_giaohang dh USING (MaThanhVienGiaoHang)
WHERE
    dh.MaThanhVienGiaoHang IS NULL
        AND tv.GioiTinh = 'M';

-- Câu 7: Liệt kê họ tên của những khách hàng đang có trong hệ thống. Nếu họ tên trùng nhau
-- thì chỉ hiển thị 1 lần. Học viên cần thực hiện yêu cầu này bằng 2 cách khác nhau (mỗi cách
-- được tính 0.5 điểm)
SELECT DISTINCT
    TenKhachHang
FROM
    khachhang;

SELECT
    TenKhachHang
FROM
    khachhang
UNION
SELECT
    TenKhachHang
FROM
    khachhang;

-- Câu 8: Liệt kê MaKhachHang, TenKhachHang, DiaChiNhanHang, MaDonHangGiaoHang,
-- PhuongThucThanhToan, TrangThaiGiaoHang của tất cả các khách hàng đang có trong hệ
-- thống
SELECT 
    kh.MaKhachHang,
    kh.TenKhachHang,
    kh.DiaChiNhanHang,
    dh.MaDonHangGiaoHang,
    dh.PhuongThucThanhToan,
    dh.TrangThaiGiaoHang
FROM
    khachhang kh
       LEFT JOIN
    donhang_giaohang dh USING (MaKhachHang);

-- Câu 9: Liệt kê những thành viên giao hàng có giới tính là “Nu” và từng giao hàng cho 10
-- khách hàng khác nhau ở khu vực giao hàng là “Hai Chau”
SELECT 
    tv.*
FROM
    thanhviengiaohang tv
        JOIN
    donhang_giaohang dh
WHERE
    dh.MaKhuVucGiaoHang = 'KV004'
        AND tv.GioiTinh = 'F';



-- Câu 10: Liệt kê những khách hàng đã từng yêu cầu giao hàng tại khu vực “Lien Chieu” và
-- chưa từng được một thành viên giao hàng nào có giới tính là “Nam” nhận giao hàng
SELECT 
    kh.*
FROM
    khachhang kh
        LEFT JOIN
    donhang_giaohang dh USING (MaKhachHang)
        LEFT JOIN
    thanhviengiaohang tv USING (MaThanhVienGiaoHang)
WHERE
    tv.GioiTinh <> ('M') AND kh.MaKhuVuc = 'KV002';

