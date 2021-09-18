USE extra_assignment2;

-- Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
SELECT 
    gv.MaGv, gv.HoTenGV, k.TenKhoa
FROM
    giangvien gv
        JOIN
    khoa k USING (MaKhoa);

-- Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’
SELECT 
    gv.MaGv, gv.HoTenGV, k.TenKhoa
FROM
    giangvien gv
        JOIN
    khoa k USING (MaKhoa)
WHERE TenKhoa IN ('Dia Ly','QLTN');

-- Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
SELECT 
    COUNT(sv.MaSV) SoSinhVien, k.TenKhoa
FROM
    sinhvien sv
        JOIN
    khoa k USING (MaKhoa)
GROUP BY MaKhoa
HAVING TenKhoa = 'Cong nghe sinh hoc';

-- Đưa ra danh sách gồm mã số, họ tên và tuổi của các sinh viên khoa ‘TOAN’
SELECT 
    sv.MaSV,
    sv.HoTenSV,
    k.TenKhoa,
    (YEAR(NOW()) - NamSinh) AS Tuoi
FROM
    sinhvien sv
        JOIN
    khoa k USING (MaKhoa)
WHERE
    k.TenKhoa = 'Toan';

-- Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’
SELECT 
    COUNT(gv.MaGV) SoGiangVien, k.TenKhoa
FROM
    giangvien gv
        JOIN
    khoa k USING (MaKhoa)
GROUP BY MaKhoa
HAVING TenKhoa = 'Cong nghe sinh hoc';

-- Cho biết thông tin về sinh viên không tham gia thực tập
SELECT 
    sv.*
FROM
    sinhvien sv
        LEFT JOIN
    huongdan hd USING (MaSV)
WHERE
    hd.MaDT IS NULL;

-- Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
SELECT 
    k.*, COUNT(gv.MaGV) SoGiangVien
FROM
    khoa k
        JOIN
    giangvien gv USING (MaKhoa)
GROUP BY gv.MaKhoa;

-- Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học
SELECT 
    sv.HoTenSV, k.TenKhoa, k.DienThoai
FROM
    sinhvien sv
        JOIN
    khoa k USING (MaKhoa)
WHERE
    sv.HoTenSv = 'LE Van Son';

-- Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn
SELECT 
    hd.MaGV, gv.HoTenGV, hd.MaDT, dt.TenDT
FROM
    huongdan hd
        JOIN
    giangvien gv USING (MaGV)
        JOIN
    detai dt USING (MaDT)
WHERE
    gv.HoTenGV = 'Tran Son';

-- Cho biết tên đề tài không có sinh viên nào thực tập
SELECT 
    dt.MaDT, dt.TenDT
FROM
    detai dt
        LEFT JOIN
    huongdan hd USING (MaDT)
WHERE
    hd.MaDT IS NULL;

-- Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.
SELECT 
    gv.MaGV,
    gv.HoTenGV,
    k.TenKhoa,
    COUNT(hd.MaSv) AS SoLuongSVHD
FROM
    giangvien gv
        JOIN
    khoa k USING (MaKhoa)
        JOIN
    huongdan hd USING (MaGV)
GROUP BY hd.MaGV
HAVING COUNT(hd.MaSv) >= 3;

-- Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
SELECT 
    *
FROM
    detai
WHERE
    KinhPhi = (SELECT 
            MAX(KinhPhi)
        FROM
            detai);
            
-- Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
SELECT 
    dt.MaDT, dt.TenDT, COUNT(hd.MaSV) SoLuongSVThucTap
FROM
    detai dt
        LEFT JOIN
    huongdan hd USING (MaDT)
GROUP BY dt.MaDT
HAVING COUNT(hd.MaSV) >= 2;

-- Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN’
SELECT 
    sv.MaSv, sv.HoTenSv, sv.MaKhoa, k.TenKhoa, hd.KetQua
FROM
    sinhvien sv
        LEFT JOIN
    huongdan hd USING (MaSV)
        LEFT JOIN
    khoa k USING (MaKhoa)
WHERE
    k.TenKhoa IN ('Dia Ly' , 'QLTN');

-- Đưa ra tên khoa, số lượng sinh viên của mỗi khoa
SELECT 
    k.TenKhoa, COUNT(sv.MaSV)
FROM
    khoa k
        JOIN
    sinhvien sv USING (MaKhoa)
GROUP BY k.MaKhoa;

-- Cho biết thông tin về các sinh viên thực tập tại quê nhà
SELECT 
    sv.*, dt.NoiThucTap
FROM
    sinhvien sv
        LEFT JOIN
    huongdan hd USING (MaSV)
        LEFT JOIN
    detai dt USING (MaDT)
WHERE
    dt.NoiThucTap LIKE ('Truong hoc');

-- Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập
SELECT 
    sv.MaSv, sv.HoTenSv, sv.MaKhoa, k.TenKhoa, hd.KetQua
FROM
    sinhvien sv
        LEFT JOIN
    huongdan hd USING (MaSV)
        LEFT JOIN
    khoa k USING (MaKhoa)
WHERE
    hd.KetQua IS NULL;

-- Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0
SELECT 
    sv.MaSv, sv.HoTenSv, sv.MaKhoa, k.TenKhoa, hd.KetQua
FROM
    sinhvien sv
        LEFT JOIN
    huongdan hd USING (MaSV)
        LEFT JOIN
    khoa k USING (MaKhoa)
WHERE
    hd.KetQua = 0;