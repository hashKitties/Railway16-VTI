DROP DATABASE IF EXISTS extra_assignment2;

CREATE DATABASE IF NOT EXISTS extra_assignment2;

USE extra_assignment2;

-- Create table Khoa
DROP TABLE IF EXISTS khoa;

CREATE TABLE IF NOT EXISTS khoa (
	MaKhoa		CHAR(10) PRIMARY KEY NOT NULL,
    TenKhoa		CHAR(30),
    DienThoai	CHAR(10)
);

-- Create table GiangVien
DROP TABLE IF EXISTS giangvien;

CREATE TABLE IF NOT EXISTS giangvien(
	MaGV		INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    HoTenGV		CHAR(30),
    Luong		DECIMAL(5,2),
    MaKhoa		CHAR(10),
    FOREIGN KEY (MaKhoa) REFERENCES khoa(MaKhoa)
);

-- Create table SinhVien
DROP TABLE IF EXISTS sinhvien;

CREATE TABLE IF NOT EXISTS sinhvien(
	MaSV		INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    HoTenSV		CHAR(30),
    MaKhoa		CHAR(10),
    NamSinh		INT UNSIGNED,
    QueQuan		CHAR(30),
    FOREIGN KEY (MaKhoa) REFERENCES khoa(MaKhoa)
);

-- Create table DeTai
DROP TABLE IF EXISTS detai;

CREATE TABLE IF NOT EXISTS detai(
	MaDT		CHAR(10) PRIMARY KEY NOT NULL,
    TenDT		CHAR(30),
    KinhPhi		INT UNSIGNED,
    NoiThucTap	CHAR(30)
);

-- Create table SinhVien
DROP TABLE IF EXISTS huongdan;

CREATE TABLE IF NOT EXISTS huongdan(
	MaSV		INT PRIMARY KEY NOT NULL,
    MaDT		CHAR(10),
    MaGV		INT,
    KetQua		DECIMAL(5,2),
    FOREIGN KEY (MaDT) REFERENCES detai(MaDT),
    FOREIGN KEY (MaSV) REFERENCES sinhvien(MaSV),
    FOREIGN KEY (MaGV) REFERENCES giangvien(MaGV)
);

-- Add Data
INSERT INTO khoa 
VALUES 	('1',		'Dia Ly',					'3847582948'),
		('2',		'QLTN',						'3950859382'),
		('3',		'Cong nghe sinh hoc',		'2039940030'),
		('4',		'Toan',						'1095930039'),
		('5',		'Van',						'1047875930');

INSERT INTO giangvien VALUES 
('1',	'Nguyen Van Hung',		100.2,	'3'),
('2',	'Do Viet Dung',			100.3,	'2'),
('3',	'Chu Thi An',			303.1,	'4'),
('4',	'Nguyen Thi Xuan',		395.2,	'1'),
('5',	'Tran Son',				100.3,	'5');

INSERT INTO sinhvien VALUES 
('1',	'Dao Tien Ha',			'1',	'1990',		'Ha Noi'),
('2',	'Le Van Son',			'3',	'1991',		'Phu Tho'),
('3',	'Ngo Thi Thu',			'2',	'1992',		'Thai Binh'),
('4',	'Nguyen Van Cong',		'4',	'1989',		'Thanh Hoa'),
('5',	'Tran Tuan Anh',		'1',	'1991',		'Ho Chi Minh'),
('6',	'Hoang Kim Phuong',		'5',	'1990',		'Ha Noi'),
('7',	'Nguyen Thi Dien',		'2',	'1987',		'Hue'),
('8',	'Nguyen Van Bien',		'3',	'1993',		'Ha Noi'),
('9',	'Luong Minh Cong',		'2',	'1991',		'Hue'),
('10',	'Ta Duc Tam',			'4',	'1990',		'Da Nang');

INSERT INTO detai VALUES 
('1',	'Nghien cuu',	'10000',	'Cong ty'),
('2',	'Tim hieu',		'23000',	'Vien nghien cuu'),
('3',	'Giai phap',	'49000',	'Nha may'),
('4',	'Ung dung',		'10000',	'Truong hoc'),
('5',	'Thuc trang',	'23000',	'Benh vien'),
('6',	'Chinh sach',	'30299',	'Truong hoc'),
('7',	'Giang day',	'10000',	'Vien nghien cuu'),
('8',	'Doi moi',		'30299',	'Vien nghien cuu');

INSERT INTO huongdan VALUES 
('1',	'3',	'3',	'9.3889'),
('2',	'1',	'2',	'8.3918'),
('3',	'5',	'3',	'5.2994'),
('4',	'6',	'3',	'10'),
('5',	'7',	'1',	'7'),
('6',	'2',	'5',	'8');