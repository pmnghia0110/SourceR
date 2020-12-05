-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2020 at 01:51 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nhom1`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_hd`
--

CREATE TABLE `detail_hd` (
  `SoHD` char(255) NOT NULL,
  `MASP` char(255) NOT NULL,
  `SL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_hd`
--

INSERT INTO `detail_hd` (`SoHD`, `MASP`, `SL`) VALUES
('HD01', 'A01', 20),
('HD02', 'A03', 30),
('HD03', 'B01', 20),
('HD04', 'N01', 10),
('HD05', 'G01', 15);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `SoHD` char(255) NOT NULL,
  `MAKH` int(11) NOT NULL,
  `Ngaymua` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`SoHD`, `MAKH`, `Ngaymua`) VALUES
('HD01', 1, '0000-00-00'),
('HD02', 2, '0000-00-00'),
('HD03', 3, '0000-00-00'),
('HD04', 4, '0000-00-00'),
('HD05', 5, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MAKH` int(11) NOT NULL,
  `TENKH` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MAKH`, `TENKH`, `Address`, `Phone`, `Email`) VALUES
(1, 'Nguyen Duy Tung', '17A Cong Hoa', 123456789, 'phanductri@at13.vn'),
(2, 'Nguyen Trong Hieu', '17A Cong Hoa', 123456789, 'nguyentrunghieu@at13.vn'),
(3, 'Phan Minh Nghia', '17A Cong Hoa', 123456789, 'hovandiem@at13.vn'),
(4, 'Nguyen Tan Phuc', '17A Cong Hoa', 123456789, 'duongthihuyentrang@at13.vn'),
(5, 'Nguyen Phuoc Bao Toan', '17A Cong Hoa', 123456789, 'nguyenkiencuong@at13.vn');

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MALOAI` char(255) NOT NULL,
  `TENLOAI` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MALOAI`, `TENLOAI`) VALUES
('L01', 'Ao'),
('L02', 'Quan'),
('L03', 'Giay'),
('L04', 'Non'),
('L05', 'Balo'),
('L06', 'JEans'),
('L07', 'DNASNDS'),
('L10', 'hdahha'),
('L12', '?'),
('L13', '111');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MASP` char(255) NOT NULL,
  `TENSP` varchar(255) NOT NULL,
  `GIA` int(11) NOT NULL,
  `MALOAI` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MASP`, `TENSP`, `GIA`, `MALOAI`) VALUES
('A01', 'Ao somi tay dai', 250, 'L01'),
('A02', 'Ao somi tay ngan', 240, 'L01'),
('A03', 'Ao somi body', 200, 'L01'),
('B01', 'balo yami', 200, 'L05'),
('B02', 'Balo chelsea', 200, 'L05'),
('G01', 'giay bata', 200, 'L03'),
('N01', 'Non luoi trai', 200, 'L04'),
('N02', 'Non tai beo', 200, 'L04'),
('Q01', 'Quan dai', 200, 'L02'),
('Q02', 'Quan ngan', 250, 'L02'),
('Q03', 'Quan tay', 300, 'L02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_hd`
--
ALTER TABLE `detail_hd`
  ADD PRIMARY KEY (`SoHD`),
  ADD KEY `Detail_HD_Sanpham` (`MASP`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`SoHD`),
  ADD KEY `Hoadon_Khachhang` (`MAKH`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MAKH`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MALOAI`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MASP`),
  ADD KEY `Sanpham_Loaisanpham` (`MALOAI`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_hd`
--
ALTER TABLE `detail_hd`
  ADD CONSTRAINT `Detail_HD_Hoadon` FOREIGN KEY (`SoHD`) REFERENCES `hoadon` (`SoHD`),
  ADD CONSTRAINT `Detail_HD_Sanpham` FOREIGN KEY (`MASP`) REFERENCES `sanpham` (`MASP`);

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `Hoadon_Khachhang` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`MAKH`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `Sanpham_Loaisanpham` FOREIGN KEY (`MALOAI`) REFERENCES `loaisanpham` (`MALOAI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
