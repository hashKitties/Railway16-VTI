DROP DATABASE IF EXISTS QuanLyGiaoHang;

CREATE DATABASE IF NOT EXISTS QuanLyGiaoHang;

USE QuanLyGiaoHang;

-- CREATE TABLE 

DROP TABLE IF EXISTS loaimathang;

CREATE TABLE IF NOT EXISTS loaimathang(
	MaLoaiMatHang 	CHAR(10) PRIMARY KEY,
    TenLoaiMatHang 	CHAR(50)
);

DROP TABLE IF EXISTS khuvuc;

CREATE TABLE IF NOT EXISTS khuvuc(
	MaKhuVuc		CHAR(10) PRIMARY KEY,
    TenKhuVuc		CHAR(50)
);

DROP TABLE IF EXISTS khachhang;

CREATE TABLE IF NOT EXISTS khachhang(
	MaKhachHang		CHAR(10) PRIMARY KEY,
    MaKhuVuc		CHAR(10),
    TenKhachHang	CHAR(50),
    TenCuaHang		CHAR(50),
    SoDTKhachHang	CHAR(10),
    DiaChiEmail		CHAR(50),
    DiaChiNhanHang	CHAR(100),
    FOREIGN KEY (MaKhuVuc) REFERENCES khuvuc (MaKhuVuc) 
);

DROP TABLE IF EXISTS dichvu;

CREATE TABLE IF NOT EXISTS dichvu(
	MaDichVu	CHAR(10) PRIMARY KEY,
    TenDichVu	CHAR(50)
);

DROP TABLE IF EXISTS khoangthoigian;

CREATE TABLE IF NOT EXISTS khoangthoigian(
	MaKhoangThoiGian	CHAR(10) PRIMARY KEY,
    MoTa				TEXT
);

DROP TABLE IF EXISTS thanhviengiaohang;

CREATE TABLE IF NOT EXISTS thanhviengiaohang (
	MaThanhVienGiaoHang		CHAR(10) PRIMARY KEY,
    TenThanhVienGiaoHang	CHAR(50),
    NgaySinh				DATE,
    GioiTinh				ENUM('M','F','U'),
    SoDTThanhVien			CHAR(10),
    DiaChiThanhVien			CHAR(100)
);

DROP TABLE IF EXISTS donhang_giaohang;

CREATE TABLE IF NOT EXISTS donhang_giaohang(
	MaDonHangGiaoHang			CHAR(10) PRIMARY KEY,
    MaKhachHang					CHAR(10),
    MaThanhVienGiaoHang			CHAR(10),
    MaDichVu					CHAR(10),
    MaKhuVucGiaoHang			CHAR(10),
    TenNguoiNhan				CHAR(50),
    DiaChiGiaoHang				CHAR(100),
    SoDTNguoiNhan				CHAR(10),
    MaKhoangThoiGianGiaoHang	CHAR(10),
    NgayGiaoHang				DATE,
    PhuongThucThanhToan			ENUM('Tien mat','Chuyen khoan'),
    TrangThaiPheDuyet			ENUM('Da phe duyet','Chua phe duyet'),
    TrangThaiGiaoHang			ENUM('Da giao hang','Chua giao hang'),
    FOREIGN KEY (MaKhachHang) REFERENCES khachhang (MaKhachHang),
    FOREIGN KEY (MaThanhVienGiaoHang) REFERENCES thanhviengiaohang (MaThanhVienGiaoHang),
    FOREIGN KEY (MaDichVu) REFERENCES dichvu (MaDichVu),
    FOREIGN KEY (MaKhuVucGiaoHang) REFERENCES khuvuc (MaKhuVuc),
    FOREIGN KEY (MaKhoangThoiGianGiaoHang) REFERENCES khoangthoigian (MaKhoangThoiGian)
);

DROP TABLE IF EXISTS dangkygiaohang;

CREATE TABLE IF NOT EXISTS dangkygiaohang(
	MaThanhVienGiaoHang			CHAR(10),
    MaKhoangThoiGianDKGiaoHang	CHAR(10),
    PRIMARY KEY (MaThanhVienGiaoHang, MaKhoangThoiGianDKGiaoHang),
    FOREIGN KEY (MaThanhVienGiaoHang) REFERENCES thanhviengiaohang (MaThanhVienGiaoHang),
    FOREIGN KEY (MaKhoangThoiGianDKGiaoHang) REFERENCES khoangthoigian (MaKhoangThoiGian)
);

DROP TABLE IF EXISTS chitietdonhang;

CREATE TABLE IF NOT EXISTS chitietdonhang (
	MaDonHangGiaoHang		CHAR(10),
    TenSanPhamDuocGiao		CHAR(100),
    SoLuong					SMALLINT UNSIGNED,
    TrongLuong				DECIMAL(4,2),
    MaLoaiMatHang			CHAR(20),
    TienThuHo				INT UNSIGNED,
    PRIMARY KEY (MaDonHangGiaoHang, TenSanPhamDuocGiao),
    FOREIGN KEY (MaDonHangGiaoHang) REFERENCES donhang_giaohang (MaDonHangGiaoHang),
    FOREIGN KEY (MaLoaiMatHang) REFERENCES loaimathang (MaLoaiMatHang)
);

-- INSERT DATA

INSERT INTO loaimathang VALUES 
('MH001',	'Quan Ao'),
('MH002',	'My Pham'),
('MH003',	'Do Gia Dung'),
('MH004',	'Do Dien Tu'),
('MH005',	'thong thuong');

INSERT INTO dichvu VALUES 
('DV001',	'Giao hang nguoi nhan tra tien phi'),
('DV002',	'Giao hang nguoi gui tra tien phi'),
('DV003',	'Giao hang cong ich (khong tinh phi)');

INSERT INTO khuvuc VALUES 
('KV001',	'Son Tra'),
('KV002',	'Lien Chieu'),
('KV003',	'Ngu Hanh Son'),
('KV004',	'Hai Chau'),
('KV005',	'Thanh Khe');

INSERT INTO khoangthoigian VALUES 
('TG001',	'7h - 9h AM'),
('TG002',	'9h - 11h AM'),
('TG003',	'1h - 3h PM'),
('TG004',	'3h - 5h PM'),
('TG005',	'7h - 9h30 PM');

INSERT INTO khachhang VALUES 
('KH001',	'KV001',		'Le Thi A',			'Cua hang 1',		'0905111111',		'alethi@gmail.com',			'80 Pham Thu Thai'),
('KH002',	'KV001',		'Nguyen Van B',		'Cua hang 2',		'0905111112',		'bnguyenvan@gmail.com',		'100 Phan Tu'),
('KH003',	'KV002',		'Le Thi B',			'Cua hang 3',		'0905111113',		'blethi@gmail.com',			'23 An Thuong 18'),
('KH004',	'KV002',		'Nguyen Van C',		'Cua hang 4',		'0905111114',		'cnguyenvan@gmail.com',		'67 Ngo The Thai'),
('KH005',	'KV001',		'Le Thi D',			'Cua hang 5',		'0905111115',		'dlethi@gmail.com',			'100 Chau Thi Vinh Te');

INSERT INTO thanhviengiaohang VALUES 
('TV0001',	'Nguyen Van A',		'1995-11-20',		'M',		'0905111111',		'23 Ong Ich Khiem'),
('TV0002',	'Nguyen Van ',		'1992-12-26',		'F',		'0905111112',		'234 Ton Duc Thang'),
('TV0003',	'Nguyen Van C',		'1990-11-30',		'F',		'0905111113',		'45 Hoang Dieu'),
('TV0004',	'Nguyen Van D',		'1995-07-08',		'M',		'0905111114',		'23/33 Ngu Hanh Son'),
('TV0005',	'Nguyen Van E',		'1991-04-02',		'M',		'0905111115',		'56 Dinh Thi Dieu');

INSERT INTO donhang_giaohang VALUES 
('DH0001',	'KH001',		'TV0001',		'DV001',		'KV001',		'Pham Van A',		'30 Hoang Van Thu',		'0905111111',		'TG004',		'2016-10-10',		'Tien Mat',			'Da phe duyet',			'Da giao hang'),
('DH0002',	'KH001',		'TV0002',		'DV001',		'KV005',		'Pham Van B',		'15 Le Dinh Ly',		'0905111112',		'TG005',		'2016-12-23',		'Tien Mat',			'Da phe duyet',			'Chua giao hang'),
('DH0003',	'KH002',		'TV0003',		'DV001',		'KV005',		'Pham Van C',		'23 Le Dinh Duong',		'0905111113',		'TG001',		'2017-04-08',		'Tien Mat',			'Da phe duyet',			'Da giao hang'),
('DH0004',	'KH003',		'TV0001',		'DV003',		'KV002',		'Pham Van D',		'45 Pham Thu Thai',		'0905111115',		'TG002',		'2015-10-11',		'Chuyen Khoan',		'Da phe duyet',			'Da giao hang'),
('DH0005',	'KH003',		'TV0005',		'DV003',		'KV003',		'Pham Van E',		'78 Hoang Dieu',		'0905111115',		'TG003',		'2017-04-04',		'Chuyen Khoan',		'Chua phe duyet',		NULL);

INSERT INTO dangkygiaohang VALUES 
('TV0001',	'TG004'),
('TV0002',	'TG005'),
('TV0003',	'TG001'),
('TV0003',	'TG002'),
('TV0003',	'TG003');

INSERT INTO chitietdonhang VALUES 
('DH0001',	'Ao len',					'2',		'0.5',		'MH005',		'200000'),
('DH0001',	'Quan au',					'1',		'0.25',		'MH005',		'350000'),
('DH0002',	'Ao thun',					'1',		'0.25',		'MH005',		'1000000'),
('DH0002',	'Ao khoac',					'3',		'0.25',		'MH005',		'2000000'),
('DH0003',	'Sua duong the',			'2',		'0.25',		'MH005',		'780000'),
('DH0003',	'Kem tay da chet',			'3',		'0.5',		'MH005',		'150000'),
('DH0003',	'Kem duong ban dem',		'4',		'0.25',		'MH005',		'900000');