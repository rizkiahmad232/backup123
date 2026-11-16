-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2025 at 10:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rizkiahmad_db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_barang`
--

CREATE TABLE `tabel_barang` (
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(70) NOT NULL,
  `harga_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_barang`
--

INSERT INTO `tabel_barang` (`kode_barang`, `nama_barang`, `harga_satuan`) VALUES
('CR005', 'CDRW Asus', 350000),
('MN015', 'Monitor 15\'\'', 700000),
('PR001', 'Printer HP', 450000),
('SC002', 'Scanner UX', 400000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_detail_transaksi`
--

CREATE TABLE `tabel_detail_transaksi` (
  `nota` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `jumlah_barang` varchar(100) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_detail_transaksi`
--

INSERT INTO `tabel_detail_transaksi` (`nota`, `kode_barang`, `jumlah_barang`, `total_harga`) VALUES
('NC001', 'PR001', '1', 450000),
('NC001', 'SC002', '1', 400000),
('NC002', 'MN015', '1', 700000),
('NC002', 'CR005', '1', 350000),
('NC001', 'PR001', '1', 450000),
('NC001', 'SC002', '1', 400000),
('NC002', 'MN015', '1', 700000),
('NC002', 'CR005', '1', 350000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pelanggan`
--

CREATE TABLE `tabel_pelanggan` (
  `kode_pelanggan` varchar(100) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_pelanggan`
--

INSERT INTO `tabel_pelanggan` (`kode_pelanggan`, `nama_pelanggan`) VALUES
('P001', 'Heru'),
('P002', 'Arif');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi`
--

CREATE TABLE `tabel_transaksi` (
  `nota` varchar(100) NOT NULL,
  `kode_pelanggan` varchar(100) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_transaksi`
--

INSERT INTO `tabel_transaksi` (`nota`, `kode_pelanggan`, `total_bayar`, `tanggal_pembelian`) VALUES
('NC001', 'P001', 850000, '2004-03-03'),
('NC002', 'P002', 1050000, '2004-03-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_barang`
--
ALTER TABLE `tabel_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD KEY `nota` (`nota`),
  ADD KEY `FOREIGN` (`kode_barang`);

--
-- Indexes for table `tabel_pelanggan`
--
ALTER TABLE `tabel_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD PRIMARY KEY (`nota`),
  ADD KEY `kode_pelanggan` (`kode_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_barang`
--
ALTER TABLE `tabel_barang`
  ADD CONSTRAINT `tabel_barang_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tabel_detail_transaksi` (`kode_barang`);

--
-- Constraints for table `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD CONSTRAINT `FOREIGN` FOREIGN KEY (`kode_barang`) REFERENCES `tabel_barang` (`kode_barang`);

--
-- Constraints for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_1` FOREIGN KEY (`kode_pelanggan`) REFERENCES `tabel_pelanggan` (`kode_pelanggan`),
  ADD CONSTRAINT `tabel_transaksi_ibfk_1` FOREIGN KEY (`nota`) REFERENCES `tabel_detail_transaksi` (`nota`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
