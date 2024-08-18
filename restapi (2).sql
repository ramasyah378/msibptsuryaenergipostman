-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2024 at 05:31 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id` bigint(20) NOT NULL,
  `nama_lokasi` varchar(255) DEFAULT NULL,
  `negara` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id`, `nama_lokasi`, `negara`, `provinsi`, `kota`, `created_at`) VALUES
(1, 'rungkut', 'indonesia', 'jawa timur', 'surabaya', '2024-08-17 09:50:33'),
(4, 'tambaksari', 'indonesia', 'jawa timur', 'surabaya', '2024-07-17 09:50:33');

-- --------------------------------------------------------

--
-- Table structure for table `proyek`
--

CREATE TABLE `proyek` (
  `id` bigint(20) NOT NULL,
  `nama_proyek` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `pimpinan_proyek` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proyek`
--

INSERT INTO `proyek` (`id`, `nama_proyek`, `client`, `tgl_mulai`, `tgl_selesai`, `pimpinan_proyek`, `keterangan`, `created_at`) VALUES
(1, 'Proyek B', 'Client B', '2024-08-17', '2024-08-17', 'John Doe', 'Proyek besarr', '2024-08-17 09:12:05'),
(3, 'Proyek A', 'Client A', '2024-08-17', '2024-08-17', 'Kevin', 'Proyek kecil', '2024-08-17 09:12:05'),
(5, 'Proyek C', 'Client C', '2024-08-17', '2024-08-17', 'Adit', 'Proyek kecil', '2024-08-18 08:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `proyek_lokasi`
--

CREATE TABLE `proyek_lokasi` (
  `proyek_id` bigint(20) NOT NULL,
  `lokasi_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proyek`
--
ALTER TABLE `proyek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proyek_lokasi`
--
ALTER TABLE `proyek_lokasi`
  ADD KEY `FKpu315origeegw6u8b5bqvs4l6` (`lokasi_id`),
  ADD KEY `FK762iwxjks0mnloew7s2fc6r7q` (`proyek_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `proyek`
--
ALTER TABLE `proyek`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `proyek_lokasi`
--
ALTER TABLE `proyek_lokasi`
  ADD CONSTRAINT `FK762iwxjks0mnloew7s2fc6r7q` FOREIGN KEY (`proyek_id`) REFERENCES `proyek` (`id`),
  ADD CONSTRAINT `FKpu315origeegw6u8b5bqvs4l6` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
