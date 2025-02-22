﻿CREATE DATABASE hieu

USE hieu
DROP TABLE IF EXISTS LOP ;
DROP TABLE IF EXISTS DONVI ;
DROP TABLE IF EXISTS DSDKTAOTHE ;
DROP TABLE IF EXISTS PHIEU;
DROP TABLE IF EXISTS CHUCNANG ;
DROP TABLE IF EXISTS TAILIEU ;
DROP TABLE IF EXISTS NHAXUATBAN ;
DROP TABLE IF EXISTS THELOAI ;
DROP TABLE IF EXISTS NGONNGU ;
DROP TABLE IF EXISTS VITRITL ;
DROP TABLE IF EXISTS TLCHITIET ;
DROP TABLE IF EXISTS NHACUNGCAP ;
DROP TABLE IF EXISTS PHIEUNHAP ;
DROP TABLE IF EXISTS NHANVIEN ;
DROP TABLE IF EXISTS DOCGIA ;

CREATE TABLE LOP(
	MALOP VARCHAR(10) NOT NULL PRIMARY KEY,
	TENLOP VARCHAR(50) NOT NULL,
	MADV VARCHAR(10) FOREIGN KEY (MADV) REFERENCES dbo.DONVI(MADV)
)
--NHAP DU LIEU LOP 
INSERT INTO LOP VALUES('10001','65CS2', 65001),('10002','65CS2', 65002),('10003','65CS2', 65003),('10004','65CS2', 65004),('10005','65CS2', 65005);
CREATE TABLE DONVI(
	MADV VARCHAR(10) NOT NULL PRIMARY KEY,
	TENDV VARCHAR(100) NOT NULL,
	GHICHU VARCHAR(1000) NOT NULL
)
--NHAP DU LIEU DON VI 
INSERT INTO DONVI(MADV, TENDV, GHICHU) VALUES('65001','CONG NGHE THONG TIN', 'Khoa cong nghe thong tin'),('65002','KHOA HOC MAY TINH', 'nganh khoa hoc may tinh'),('65003','KINH TE',' nganh kinh te'),('65004','KIEN TRUC', 'khoa kien truc'),('65005','CAU DUONG',' khoa cau duong');
CREATE TABLE CHUCNANG(
	MACN VARCHAR(10) NOT NULL PRIMARY KEY,
	TENCN VARCHAR(50) NOT NULL)
--NHAP DU LIEU CHUC NANG 
INSERT INTO CHUCNANG(MACN, TENCN) VALUES ('01', 'DANG NHAP'),('02', 'QUAN LI NGUOI DUNG'),('03', 'THEM NGUOI DUNG'),('04', 'SUA THONG TIN NGUOI DUNG'),('05', 'XOA NGUOI DUNG');
CREATE TABLE NHACUNGCAP(
	MANCC VARCHAR(20) NOT NULL PRIMARY KEY,
	TENNCC VARCHAR(50) NOT NULL,
	DIACHI VARCHAR(500) NOT NULL,
	DIENTHOAI INTEGER NOT NULL
)
-- NHAP DU LIEU NHA CUNG CAP 
INSERT INTO NHACUNGCAP VALUES ('NCC01','NCC A', 'HAI BA TRUNG HA NOI VIET NAM','0358843271'),('NCC02','NCC B','DONG ANH HA NOI VIET NAM', '0356465168'),('NCC03','NCC C','HA DONG HA NOI VIET NAM','0332456123');
CREATE TABLE NGONNGU(
	MANGONNGU VARCHAR(20) NOT NULL PRIMARY KEY,
	TENNGONNGU VARCHAR(50) NOT NULL,
	GHICHU CHAR(500) NOT NULL
)
--NHAP DU LIEU NGON NGU 
INSERT INTO NGONNGU VALUES('NNANH1','TIENG ANH',''),('NNVIET2','TIENG VIET',''),('NNHAN3','TIENG HAN','');
CREATE TABLE THELOAI(
	MATHELOAI VARCHAR(20) NOT NULL PRIMARY KEY,
	TENTHELOAI VARCHAR(50) NOT NULL,
	GHICHU CHAR(500) NOT NULL
)
-- NHAP DU LIEU THE LOAI 
INSERT INTO THELOAI(MATHELOAI, TENTHELOAI,GHICHU) VALUES('TL01','TRUYEN',''),('TL02','VAN HOC NGHE THUAT',''),('TL03','KHOA HOC CONG NGHE- KINH TE','');
CREATE TABLE NHAXUATBAN(
	MANXB VARCHAR(20) NOT NULL PRIMARY KEY,
	TENNXB VARCHAR(50) NOT NULL,
	GHICHU CHAR(500) NOT NULL
)
--NHAP DU LIEU NHA XUAT BAN
INSERT INTO NHAXUATBAN(MANXB, TENNXB,GHICHU) VALUES('NXB01','KIM DONG', ''),('NXB02','CHINH TRI QUOC GIA', ''),('NXB03','HONG DUC', '');
CREATE TABLE VITRITL(
	MAVT VARCHAR(20) NOT NULL PRIMARY KEY,
	TENVT VARCHAR(50) NOT NULL,
	MOTA VARCHAR(500) NOT NULL,
	CHATV CHAR(500) NOT NULL
 )
--NHAP DU LIEU VI TRI TAI LIEU 
INSERT INTO VITRITL VALUES ('VT01','TRUYEN','DAY 1 HANG 3', 'VAN HOC'),('VT02','TAI LIEU','DAY 3 HANG 4', 'VAN HOC'),('VT03','TRUYEN','DAY 36 HANG 3', 'NGON TINH'),('VT04','TRUYEN TRANH','DAY 2 HANG 1','');
CREATE TABLE PHIEUNHAP(
	ID_NHAP VARCHAR(20) NOT NULL PRIMARY KEY,
	MANCC VARCHAR(20) FOREIGN KEY (MANCC) REFERENCES dbo.NHACUNGCAP(MANCC),
	NGUOINHAP VARCHAR(50),
	NGAYNHAP DATETIME,
	SOLUONG INTEGER
 )
 --NHAP DU LIEU PHIEU NHAP
INSERT INTO PHIEUNHAP VALUES ('NHAP01','NCC01','CO HOAI','2023/08/19', '100'),('NHAP02','NCC02','CO HOAI','2019/08/20','50'),('NHAP03','NCC03','CO HUYEN','2021/09/19','20');
CREATE TABLE TAILIEU(
	MATL VARCHAR(20) NOT NULL PRIMARY KEY,
	TENTL VARCHAR(50) NOT NULL,
	MANXB VARCHAR(20) FOREIGN KEY (MANXB) REFERENCES dbo.NHAXUATBAN(MANXB),
	MANGONNGU VARCHAR(20) FOREIGN KEY (MANGONNGU) REFERENCES dbo.NGONNGU(MANGONNGU),
	MATHELOAI VARCHAR(20) FOREIGN KEY (MATHELOAI) REFERENCES dbo.THELOAI(MATHELOAI),
	MAVT VARCHAR(20)FOREIGN KEY (MAVT) REFERENCES dbo.VITRITL(MAVT),
	ID_NHAP VARCHAR(20) FOREIGN KEY (ID_NHAP) REFERENCES dbo.PHIEUNHAP(ID_NHAP),
	TACGIA VARCHAR(500) NOT NULL,
	NAMXB DATETIME NOT NULL,
	NOIDUNG VARCHAR (5000) NOT NULL,
	TINHTRANG VARCHAR (500) NOT NULL,
	SOTRANG INTEGER NOT NULL,
	KHOGIAY VARCHAR(50) NOT NULL,
	GIABIA INTEGER NOT NULL,
	SOPH INTEGER NOT NULL,
	NGAYPH DATETIME NOT NULL,
	TONGSO INTEGER NOT NULL
 )
 --NHAP DU LIEU TAI LIEU 
INSERT INTO TAILIEU VALUES('TL001', 'DOREMOMN','NXB01','NNVIET2','TL01','VT04','NHAP01','KIM DONG','2009','bala','','','A4','','','','20' ),('TL002','CONAN','NXB01','NNANH1','TL01','VT04','NHAP02','KIM DONG','2017','','','','','','','',''),('TL03','','NXB02','NNVIET2','TL02','VT03','NHAP03','','','','','','','','','','');
CREATE TABLE TLCHITIET(
 MACABIET VARCHAR(20) NOT NULL PRIMARY KEY,
 MATL VARCHAR(20) FOREIGN KEY (MATL) REFERENCES dbo.TAILIEU(MATL),
 ANHBARCODE IMAGE ,
 NGAYCN DATETIME,
 NGUOICN VARCHAR(50),
 TINHTRANG VARCHAR(50),
 XULY VARCHAR(500)
)
 --NHAP DU LIEU TLCHITIET
INSERT INTO TLCHITIET VALUES  ('MCB01','TL001','ANH','','','MOI',''),('MCB02','TL002','ANH','','','MOI',''),('MCB03','TL03','ANH','','','CU','');



CREATE TABLE DOCGIA(
	MADG VARCHAR(10) NOT NULL PRIMARY KEY,
	HOVATEN VARCHAR(50) NOT NULL,
	MALOP VARCHAR(10) FOREIGN KEY (MALOP) REFERENCES dbo.LOP(MALOP),
	MAPHIEU VARCHAR(20) FOREIGN KEY (MAPHIEU) REFERENCES dbo.PHIEU(MAPHIEU),
	EMAIL VARCHAR(50) NOT NULL,
	GIOTINH BIT NOT NULL,
	NAMSINH DATETIME NOT NULL,
	DIENTHOAI INTEGER NOT NULL, 
	DIACHI VARCHAR (50) NOT NULL
)

CREATE TABLE PHIEU(
	MAPHIEU VARCHAR(20) NOT NULL PRIMARY KEY,
	MACABIET VARCHAR (20) FOREIGN KEY(MACABIET) REFERENCES dbo.TLCHITIET(MACABIET),
	LOAIPHIEU VARCHAR(50) NOT NULL,
	SOLUONG INTEGER NOT NULL,
	NGAYTRA DATETIME NOT NULL,
	NGAYMUON DATETIME NOT NULL,
	TONG INTEGER NOT NULL
)
 
CREATE TABLE NHANVIEN(
	MANV VARCHAR(50) NOT NULL PRIMARY KEY,
	MACN VARCHAR(10) FOREIGN KEY (MACN) REFERENCES dbo.CHUCNANG(MACN),
	MAPHIEU VARCHAR(20) FOREIGN KEY (MAPHIEU) REFERENCES dbo.PHIEU(MAPHIEU),
	MATL VARCHAR(20) FOREIGN KEY (MATL) REFERENCES dbo.TAILIEU(MATL),
	HOTEN INTEGER NOT NULL,
	GIOITINH BIT NOT NULL, 
	NAMSINH DATETIME NOT NULL,
	CHUCDANH CHAR(50) NOT NULL,
	DIENTHOAI INTEGER NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	DIACHI VARCHAR(50) NOT NULL
)



















--1 Xuất ra thông tin danh sách độc giả mượn sách trong ngày 18/05/2023
SELECT *
FROM DOCGIA AS DG,PHIEU AS P
WHERE DG.MAPHIEU = P.MAPHIEU AND NGAYMUON = '2023-05-18'
--2 
SELECT TENTL
FROM TAILIEU ,THELOAI
WHERE TAILIEU.MATHELOAI=THELOAI.MATHELOAI and THELOAI.TENTHELOAI=N'CNTT '
--3 
SELECT MAPHIEU
FROM PHIEU AS P,DOCGIA AS DG
WHERE P.MAPHIEU=DG.MAPHIEU AND HOVATEN LIKE N'%Vũ'
--4
SELECT COUNT(*) AS TONGPHIEU
FROM PHIEU
WHERE MAPHIEU IN (
SELECT MADG
FROM DOCGIA
WHERE HOVATEN = N'Nguyen Van A')
--5
SELECT *
FROM PHIEU	
WHERE TONG = (
SELECT TOP 1 TONG
FROM PHIEU
ORDER BY TONG DESC
)
--6
SELECT HOVATEN, COUNT(P.MAPHIEU) AS TONG
FROM DOCGIA,PHIEU AS P
WHERE P.MAPHIEU = DOCGIA.MAPHIEU 
 AND    P.NGAYMUON LIKE  '2020-07%'
GROUP BY HOVATEN
ORDER BY TONG DESC
