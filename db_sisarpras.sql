-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Bulan Mei 2025 pada 05.59
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sisarpras`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bangunan`
--

CREATE TABLE `tb_bangunan` (
  `id_bangunan` int(11) NOT NULL,
  `kode_bangunan` varchar(255) NOT NULL,
  `nama_bangunan` varchar(255) NOT NULL,
  `jml_lantai_bangunan` varchar(255) NOT NULL,
  `luas_bangunan` varchar(255) NOT NULL,
  `status_bangunan` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `id_merek` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `id_kondisi` int(11) NOT NULL,
  `jumlah_awal` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `keterangan_barang` varchar(255) NOT NULL DEFAULT 'Tidak ada keterangan',
  `tanggal_barang` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `id_merek`, `id_kategori`, `id_ruangan`, `id_kondisi`, `jumlah_awal`, `nama_barang`, `keterangan_barang`, `tanggal_barang`) VALUES
(96, 0, 14, 20, 0, '26', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(97, 0, 14, 20, 0, '25', 'Meja kayu Rangka Besi ', 'ada banyak coretan pulpen di meja', '2025-05-29'),
(98, 0, 14, 20, 0, '1', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(99, 0, 14, 20, 0, '4', 'Papan Mading', 'Tidak ada keterangan', '2025-05-29'),
(100, 0, 14, 20, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(101, 0, 15, 20, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(102, 0, 15, 20, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(103, 0, 15, 20, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(104, 0, 15, 20, 0, '1', 'Salib', 'Tidak ada keterangan', '2025-05-29'),
(105, 0, 14, 21, 0, '23', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(106, 0, 14, 21, 0, '22', 'Meja Kayu', 'Tidak ada keterangan', '2025-05-29'),
(107, 0, 14, 21, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(108, 0, 2, 21, 0, '2', 'AC', 'Panasonic', '2025-05-29'),
(109, 0, 0, 21, 0, '1', 'Akses Poin', 'Tidak ada keterangan', '2025-05-29'),
(110, 0, 2, 21, 0, '2', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(111, 0, 2, 20, 0, '2', 'AC', 'Panasonic + Daikin ', '2025-05-29'),
(112, 0, 2, 21, 0, '1', 'Proyektor ', 'epson ', '2025-05-29'),
(113, 0, 2, 21, 0, '1', 'HDMI COnverter', 'Tidak ada keterangan', '2025-05-29'),
(114, 0, 0, 2, 0, '1', 'Jam Dinding ', 'Tidak ada keterangan', '2025-05-29'),
(115, 0, 2, 21, 0, '1', 'Screen Proyektor', 'Tidak ada keterangan', '2025-05-29'),
(116, 0, 2, 21, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(117, 0, 2, 2, 0, '2', 'Access Point', 'Tidak ada keterangan', '2025-05-29'),
(118, 0, 2, 21, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(119, 0, 2, 21, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(120, 0, 2, 21, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(121, 0, 2, 2, 0, '1', 'CCTV', 'Tidak ada keterangan', '2025-05-29'),
(122, 0, 15, 21, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(123, 0, 15, 21, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(124, 0, 15, 21, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(125, 0, 2, 2, 0, '2', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(126, 20, 2, 2, 0, '1', 'Proyektor ', 'Tidak ada keterangan', '2025-05-29'),
(127, 0, 2, 2, 0, '1', 'Dongle Wifi', 'Tp-link', '2025-05-29'),
(128, 0, 2, 2, 0, '1', 'Web cam ', 'Tidak ada keterangan', '2025-05-29'),
(129, 0, 2, 2, 0, '1', 'Tripod camera', 'Tidak ada keterangan', '2025-05-29'),
(130, 0, 2, 2, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(131, 0, 2, 2, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(132, 0, 2, 2, 0, '2', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(133, 0, 2, 2, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(134, 0, 14, 22, 0, '25', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(135, 0, 14, 23, 0, '29', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(136, 0, 14, 22, 0, '24', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(137, 0, 14, 23, 0, '29', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(138, 0, 14, 22, 0, '2', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(139, 0, 14, 23, 0, '1', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(140, 0, 14, 22, 0, '1', 'Rak Kayu ', 'Tidak ada keterangan', '2025-05-29'),
(141, 0, 14, 23, 0, '1', 'Lemari Kayu Kecil ', 'Tidak ada keterangan', '2025-05-29'),
(142, 0, 14, 22, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(143, 0, 2, 22, 0, '2', 'AC', 'Tidak ada keterangan', '2025-05-29'),
(144, 0, 14, 23, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(145, 0, 2, 22, 0, '1', 'Akses Point', 'Tidak ada keterangan', '2025-05-29'),
(146, 0, 2, 23, 0, '2', 'AC', 'Panasonic/DAIKIN', '2025-05-29'),
(147, 0, 2, 22, 0, '2', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(148, 0, 2, 22, 0, '1', 'Proyektor ', 'Tidak ada keterangan', '2025-05-29'),
(149, 0, 2, 22, 0, '1', 'Dongle Wifi', 'Tidak ada keterangan', '2025-05-29'),
(150, 0, 2, 22, 0, '1', 'HDMI COnverter', 'Tidak ada keterangan', '2025-05-29'),
(151, 0, 2, 22, 0, '1', 'Web cam ', 'Tidak ada keterangan', '2025-05-29'),
(152, 0, 2, 22, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(153, 0, 2, 23, 0, '1', 'Jam Dinding ', 'Tidak ada keterangan', '2025-05-29'),
(154, 0, 2, 22, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(155, 0, 2, 23, 0, '0', 'Akses Poin', 'Tidak ada keterangan', '2025-05-29'),
(156, 0, 2, 22, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(157, 0, 15, 22, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(158, 0, 2, 23, 0, '2', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(159, 0, 15, 22, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(160, 0, 2, 23, 0, '1', 'Proyektor ', 'Epson', '2025-05-29'),
(161, 0, 2, 23, 0, '1', 'Web cam ', 'Simbadda', '2025-05-29'),
(162, 0, 2, 23, 0, '1', 'Screen Proyektor', 'Tidak ada keterangan', '2025-05-29'),
(163, 0, 2, 23, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(164, 0, 2, 23, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(165, 0, 2, 23, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(166, 0, 2, 23, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(167, 0, 15, 23, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(168, 0, 15, 23, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(169, 0, 15, 23, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(170, 0, 15, 23, 0, '1', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(171, 0, 14, 24, 0, '25', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(172, 0, 14, 24, 0, '24', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(173, 0, 14, 24, 0, '1', 'Meja Kayu panjang', 'Tidak ada keterangan', '2025-05-29'),
(174, 0, 14, 25, 0, '25', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(175, 0, 14, 24, 0, '1', 'Rak Kayu ', 'Tidak ada keterangan', '2025-05-29'),
(176, 0, 14, 24, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(177, 0, 14, 25, 0, '23', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(178, 0, 2, 24, 0, '2', 'AC', 'Panasonic', '2025-05-29'),
(179, 0, 14, 25, 0, '2', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(180, 0, 2, 24, 0, '1', 'CCTV', 'Tidak ada keterangan', '2025-05-29'),
(181, 0, 14, 25, 0, '1', 'Papan Vilsuf/Pajangan ', 'Tidak ada keterangan', '2025-05-29'),
(182, 0, 2, 24, 0, '1', 'Proyektor ', 'epson ', '2025-05-29'),
(183, 0, 14, 25, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(184, 0, 2, 24, 0, '1', 'Web cam ', 'Logitec', '2025-05-29'),
(185, 0, 2, 24, 0, '1', 'Tripod camera', 'Nest', '2025-05-29'),
(186, 0, 2, 25, 0, '2', 'AC', 'Panasonic/DAIKIN', '2025-05-29'),
(187, 0, 2, 24, 0, '1', 'Screen Proyektor', 'Tidak ada keterangan', '2025-05-29'),
(188, 0, 2, 24, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(189, 0, 2, 25, 0, '1', 'Akses Poin', 'Tidak ada keterangan', '2025-05-29'),
(190, 0, 2, 24, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(191, 0, 2, 25, 0, '1', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(192, 0, 2, 24, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(193, 0, 2, 24, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(194, 0, 2, 25, 0, '1', 'Proyektor ', 'Layar menguning', '2025-05-29'),
(195, 0, 15, 24, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(196, 0, 15, 24, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(197, 0, 2, 25, 0, '1', 'HDMI Converter', 'Tidak ada keterangan', '2025-05-29'),
(198, 0, 15, 24, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(199, 0, 2, 25, 0, '1', 'Web cam ', 'Tidak ada keterangan', '2025-05-29'),
(200, 0, 2, 25, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(201, 0, 2, 25, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(202, 0, 2, 25, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(203, 0, 2, 25, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(204, 0, 15, 25, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(205, 0, 15, 25, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(206, 0, 14, 26, 0, '23', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(207, 0, 15, 25, 0, '1', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(208, 0, 14, 26, 0, '22', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(209, 0, 14, 26, 0, '2', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(210, 0, 14, 26, 0, '2', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(211, 0, 2, 26, 0, '2', 'AC', 'Daikin', '2025-05-29'),
(212, 0, 14, 27, 0, '24', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(213, 0, 2, 26, 0, '1', 'Jam Dinding ', 'Tidak ada keterangan', '2025-05-29'),
(214, 0, 2, 26, 0, '1', 'Akses Poin', 'Tidak ada keterangan', '2025-05-29'),
(215, 0, 0, 27, 0, '24', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(216, 0, 2, 26, 0, '1', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(217, 0, 2, 26, 0, '1', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(218, 0, 14, 27, 0, '1', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(219, 0, 2, 26, 0, '1', 'Proyektor ', 'epson ', '2025-05-29'),
(220, 0, 2, 26, 0, '1', 'Web cam ', 'Tidak ada keterangan', '2025-05-29'),
(221, 0, 14, 27, 0, '1', 'Lemari Kayu 3 Pintu ', 'Tidak ada keterangan', '2025-05-29'),
(222, 0, 2, 26, 0, '1', 'Screen Proyektor', 'Tidak ada keterangan', '2025-05-29'),
(223, 0, 14, 27, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(224, 0, 2, 26, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(225, 0, 2, 26, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(226, 0, 2, 27, 0, '2', 'AC', 'Panasonic / Daikin', '2025-05-29'),
(227, 0, 2, 26, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(228, 0, 2, 26, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(229, 0, 2, 27, 0, '1', 'Jam Dinding ', 'Tidak ada keterangan', '2025-05-29'),
(230, 0, 15, 26, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(231, 0, 2, 27, 0, '1', 'Akses Point', 'Tidak ada keterangan', '2025-05-29'),
(232, 0, 15, 26, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(233, 0, 2, 27, 0, '2', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(234, 0, 15, 26, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(235, 0, 2, 27, 0, '1', 'Proyektor ', 'Panasonic', '2025-05-29'),
(236, 0, 15, 26, 0, '2', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(237, 0, 2, 27, 0, '1', 'Pen Tablet', 'Tidak ada keterangan', '2025-05-29'),
(238, 0, 2, 27, 0, '1', 'Web cam ', 'Tidak ada keterangan', '2025-05-29'),
(239, 0, 2, 27, 0, '1', 'Screen Proyektor', 'Tidak ada keterangan', '2025-05-29'),
(240, 0, 2, 27, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(241, 0, 2, 27, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(242, 0, 2, 27, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(243, 0, 2, 27, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(244, 0, 15, 27, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(245, 0, 15, 27, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(246, 0, 15, 27, 0, '1', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(247, 0, 14, 28, 0, '1', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(248, 0, 14, 28, 0, '5', 'Meja Kayu', 'perlu perbaikan', '2025-05-29'),
(249, 0, 14, 28, 0, '1', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(250, 0, 14, 28, 0, '1', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(251, 0, 14, 28, 0, '1', 'Lemari Kayu 3 Pintu ', 'Tidak ada keterangan', '2025-05-29'),
(252, 0, 14, 28, 0, '1', 'Rak Kayu ', 'Rak display buku ', '2025-05-29'),
(253, 0, 14, 28, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(254, 0, 14, 28, 0, '1', 'Sofa/kursi tamu', '1 Set', '2025-05-29'),
(255, 0, 2, 28, 0, '2', 'AC ', 'SHARP / PANASONIC', '2025-05-29'),
(256, 0, 2, 28, 0, '1', 'Akses Point', 'Tidak ada keterangan', '2025-05-29'),
(257, 0, 2, 28, 0, '1', 'CCTV', 'Tidak ada keterangan', '2025-05-29'),
(258, 25, 2, 28, 0, '1', 'Printer ', 'print warna kurang baik', '2025-05-29'),
(259, 0, 2, 28, 0, '1', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(260, 26, 2, 28, 0, '1', 'Proyektor ', 'Tidak ada keterangan', '2025-05-29'),
(261, 0, 14, 29, 0, '30', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(262, 0, 2, 28, 0, '1', 'Web cam ', 'Tidak ada keterangan', '2025-05-29'),
(263, 0, 14, 29, 0, '30', 'Meja Kayu', 'Tidak ada keterangan', '2025-05-29'),
(264, 0, 2, 28, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(265, 0, 2, 28, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(266, 0, 14, 29, 0, '1', 'Rak Kayu ', 'Tidak ada keterangan', '2025-05-29'),
(267, 0, 2, 28, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(268, 0, 2, 28, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(269, 0, 14, 29, 0, '1', 'Rak Besi', 'Tidak ada keterangan', '2025-05-29'),
(270, 0, 14, 29, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(271, 0, 15, 28, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(272, 0, 2, 29, 0, '3', 'AC', 'Tidak ada keterangan', '2025-05-29'),
(273, 0, 15, 28, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(274, 0, 2, 29, 0, '1', 'Jam Dinding ', 'Tidak ada keterangan', '2025-05-29'),
(275, 0, 2, 29, 0, '1', 'DVD Player ', 'Merk LG', '2025-05-29'),
(276, 0, 15, 28, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(277, 0, 2, 29, 0, '10', 'Printer', 'SMP SMA', '2025-05-29'),
(278, 0, 15, 28, 0, '1', 'Karpet ', '56 m2', '2025-05-29'),
(279, 0, 2, 29, 0, '1', 'Speaker Box', 'Merk Simbada', '2025-05-29'),
(280, 0, 2, 29, 0, '3', 'Proyektor ', '1 Epson Ebx200 (bagus), 2 Panasonic (Rusak)', '2025-05-29'),
(281, 0, 2, 29, 0, '1', 'Web cam ', 'Merk Logitech', '2025-05-29'),
(282, 0, 2, 29, 0, '4', 'UPS', '2 APC (rusak), 1 ICA (rusak), 1 ICA (bagus)', '2025-05-29'),
(283, 0, 14, 30, 0, '1', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(284, 0, 14, 30, 0, '1', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(285, 0, 2, 29, 0, '30', 'Keyboard dan mouse wireless', 'Merk Logitech', '2025-05-29'),
(286, 0, 14, 30, 0, '1', 'Lemari Kayu 2 Pintu ', 'Tidak ada keterangan', '2025-05-29'),
(287, 0, 14, 30, 0, '1', 'Lemari Kayu Kecil ', 'Tidak ada keterangan', '2025-05-29'),
(288, 0, 2, 29, 0, '30', 'Keyboard dan mouse Kabel', 'Merk Power Logich', '2025-05-29'),
(289, 0, 14, 30, 0, '1', 'Papan Pengumuman ', 'Tidak ada keterangan', '2025-05-29'),
(290, 0, 2, 29, 0, '1', 'Speaker Hanging', 'Merk asatron (sumbangan dari Siswa)', '2025-05-29'),
(291, 0, 2, 30, 0, '1', 'Kipas Angin ', 'Tidak ada keterangan', '2025-05-29'),
(292, 0, 15, 30, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(293, 0, 15, 30, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(294, 0, 15, 30, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(295, 0, 2, 29, 0, '35', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(296, 0, 15, 30, 0, '1', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(297, 0, 2, 29, 0, '30', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(298, 0, 15, 30, 0, '2', 'Kasur', 'Tidak ada keterangan', '2025-05-29'),
(299, 0, 15, 29, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(300, 0, 15, 30, 0, '2', 'Alat ukur badan ', 'Tidak ada keterangan', '2025-05-29'),
(301, 0, 15, 30, 0, '1', 'Alat ukur badan ', 'Tidak ada keterangan', '2025-05-29'),
(302, 0, 15, 29, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(303, 0, 15, 29, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(304, 0, 15, 30, 0, '1', 'Timbangan ', 'Tidak ada keterangan', '2025-05-29'),
(305, 0, 15, 29, 0, '1', 'Karpet', 'Tidak ada keterangan', '2025-05-29'),
(306, 0, 15, 30, 0, '2', 'Tempat tidur / Ranjang', 'Tidak ada keterangan', '2025-05-29'),
(307, 0, 15, 29, 0, '1', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(308, 0, 10, 30, 0, '3', 'Matras', 'Tidak ada keterangan', '2025-05-29'),
(309, 0, 14, 31, 0, '12', 'Kursi bulat rangka besi ', 'Tidak ada keterangan', '2025-05-29'),
(310, 0, 14, 31, 0, '3', 'Meja Kayu', 'Tidak ada keterangan', '2025-05-29'),
(311, 0, 14, 31, 0, '2', 'Lemari Kayu 2 Pintu ', 'Tidak ada keterangan', '2025-05-29'),
(312, 0, 14, 32, 0, '22', 'Kursi bulat Rangka besi', 'Tidak ada keterangan', '2025-05-29'),
(313, 0, 14, 32, 0, '5', 'Meja Kayu panjang', 'Tidak ada keterangan', '2025-05-29'),
(314, 0, 2, 32, 0, '1', 'Amplifier', 'Tidak ada keterangan', '2025-05-29'),
(315, 0, 2, 32, 0, '1', 'Mixer', 'Tidak ada keterangan', '2025-05-29'),
(316, 0, 2, 32, 0, '2', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(317, 0, 2, 32, 0, '1', 'Werles Mic', 'Tidak ada keterangan', '2025-05-29'),
(318, 0, 2, 32, 0, '3', 'Amplifier Gitar + Speaker', 'Tidak ada keterangan', '2025-05-29'),
(319, 0, 2, 32, 0, '2', 'Stand Mix + Mix Kabel', 'Tidak ada keterangan', '2025-05-29'),
(320, 0, 11, 32, 0, '3', 'Gitar Akustik', 'Tidak ada keterangan', '2025-05-29'),
(321, 0, 11, 32, 0, '2', 'Gitar Elektrik ', 'Tidak ada keterangan', '2025-05-29'),
(322, 0, 11, 32, 0, '1', 'Bas Akustik ', 'Tidak ada keterangan', '2025-05-29'),
(323, 0, 11, 32, 0, '1', 'Drum Set', 'Tidak ada keterangan', '2025-05-29'),
(324, 0, 11, 32, 0, '1', 'Keyboard/organ ', 'Tidak ada keterangan', '2025-05-29'),
(325, 0, 11, 32, 0, '2', 'Kahon', 'Tidak ada keterangan', '2025-05-29'),
(326, 0, 15, 32, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(327, 0, 15, 32, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(328, 0, 15, 32, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(329, 0, 14, 33, 0, '21', 'Kursi bulat ', 'Tidak ada keterangan', '2025-05-29'),
(330, 0, 14, 33, 0, '5', 'Meja Kayu', 'Tidak ada keterangan', '2025-05-29'),
(331, 0, 14, 33, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(332, 0, 15, 33, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(333, 0, 15, 33, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(334, 0, 15, 33, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(335, 0, 14, 39, 0, '13', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(336, 0, 14, 39, 0, '26', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(337, 0, 14, 39, 0, '1', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(338, 0, 14, 39, 0, '1', 'Whitboard', 'Tidak ada keterangan', '2025-05-29'),
(339, 0, 2, 39, 0, '2', 'AC', 'SHARP', '2025-05-29'),
(340, 0, 2, 39, 0, '1', 'CCTV', 'Tidak ada keterangan', '2025-05-29'),
(341, 0, 2, 39, 0, '1', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(342, 0, 2, 39, 0, '1', 'Proyektor ', 'Tidak ada keterangan', '2025-05-29'),
(343, 0, 2, 39, 0, '1', 'Screen Proyektor', 'Tidak ada keterangan', '2025-05-29'),
(344, 0, 2, 39, 0, '1', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(345, 0, 2, 39, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(346, 0, 2, 39, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(347, 0, 2, 39, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(348, 0, 15, 39, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(349, 0, 15, 39, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(350, 0, 15, 39, 0, '1', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(351, 0, 14, 35, 0, '1', 'Kursi Jok Rangka stainles', 'Tidak ada keterangan', '2025-05-29'),
(352, 0, 14, 35, 0, '1', 'Kursi tamu ', 'Tidak ada keterangan', '2025-05-29'),
(353, 0, 14, 35, 0, '1', 'Meja Tulis Kantor  biro ', 'Tidak ada keterangan', '2025-05-29'),
(354, 0, 14, 35, 0, '1', 'Lemari Kayu 3 Pintu ', 'Tidak ada keterangan', '2025-05-29'),
(355, 0, 14, 35, 0, '1', 'Papan Data Kegiatan KS/Guru ', 'Tidak ada keterangan', '2025-05-29'),
(356, 0, 14, 35, 0, '1', 'Papan Progam kerja KS /Guru ', 'Tidak ada keterangan', '2025-05-29'),
(357, 0, 14, 35, 0, '1', 'Papan Pengumuman ', 'Tidak ada keterangan', '2025-05-29'),
(358, 0, 2, 35, 0, '1', 'AC', 'Tidak ada keterangan', '2025-05-29'),
(359, 0, 2, 35, 0, '1', 'Access Point', 'Tidak ada keterangan', '2025-05-29'),
(360, 0, 2, 35, 0, '2', 'TV', 'Tidak ada keterangan', '2025-05-29'),
(361, 0, 2, 35, 0, '1', 'Telepon ', 'Tidak ada keterangan', '2025-05-29'),
(362, 0, 2, 35, 0, '1', 'Printer ', 'Tidak ada keterangan', '2025-05-29'),
(363, 0, 2, 35, 0, '1', 'Web cam ', 'Tidak ada keterangan', '2025-05-29'),
(364, 0, 2, 35, 0, '2', 'Kabel VGA', 'Tidak ada keterangan', '2025-05-29'),
(365, 0, 2, 35, 0, '1', 'Keyboard dan mouse wireless', 'Tidak ada keterangan', '2025-05-29'),
(366, 0, 2, 35, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(367, 0, 2, 35, 0, '5', 'Laptop', 'Tidak ada keterangan', '2025-05-29'),
(368, 0, 2, 35, 0, '1', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(369, 0, 2, 35, 0, '1', 'Monitor ', 'Tidak ada keterangan', '2025-05-29'),
(370, 0, 15, 35, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(371, 0, 15, 35, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(372, 0, 15, 35, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(373, 0, 15, 35, 0, '1', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(374, 0, 14, 36, 0, '1', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(375, 0, 14, 36, 0, '1', 'Kursi Jok Rangka Stainles', 'Tidak ada keterangan', '2025-05-29'),
(376, 0, 14, 36, 0, '1', 'Meja Tulis Kantor  biro ', 'Tidak ada keterangan', '2025-05-29'),
(377, 0, 14, 36, 0, '3', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(378, 0, 14, 36, 0, '2', 'Lemari Kayu 2 Pintu besi', 'Tidak ada keterangan', '2025-05-29'),
(379, 0, 14, 36, 0, '1', 'Lemari Kaca Etase ', 'Tidak ada keterangan', '2025-05-29'),
(380, 0, 14, 36, 0, '2', 'File Kabinet Kayu ', 'Tidak ada keterangan', '2025-05-29'),
(381, 0, 14, 36, 0, '1', 'Papan Data Siswa ', 'Tidak ada keterangan', '2025-05-29'),
(382, 0, 14, 36, 0, '1', 'Papan Bank Data ', 'Tidak ada keterangan', '2025-05-29'),
(383, 0, 14, 36, 0, '1', 'Papan Data Guru/Karyawan ', 'Tidak ada keterangan', '2025-05-29'),
(384, 0, 14, 36, 0, '1', 'Papan Kalender Pendidikan ', 'Tidak ada keterangan', '2025-05-29'),
(385, 0, 14, 36, 0, '1', 'Papan Progam kerja TU', 'Tidak ada keterangan', '2025-05-29'),
(386, 0, 2, 36, 0, '2', 'Casete Recorder/Tape', 'Tidak ada keterangan', '2025-05-29'),
(387, 0, 2, 36, 0, '1', 'Jam Dinding ', 'Tidak ada keterangan', '2025-05-29'),
(388, 0, 2, 36, 0, '1', 'Kipas Angin ', 'Tidak ada keterangan', '2025-05-29'),
(389, 32, 2, 36, 0, '1', 'Telepon ', 'Tidak ada keterangan', '2025-05-29'),
(390, 38, 2, 36, 0, '1', 'Printer ', 'Tidak ada keterangan', '2025-05-29'),
(391, 0, 2, 36, 0, '1', 'Amplifier', 'Tidak ada keterangan', '2025-05-29'),
(392, 0, 2, 36, 0, '3', 'Speaker Box', 'Tidak ada keterangan', '2025-05-29'),
(393, 39, 2, 36, 0, '1', 'Scaner', 'Tidak ada keterangan', '2025-05-29'),
(394, 0, 2, 36, 0, '1', 'Keyboard dan mouse wireless', 'Tidak ada keterangan', '2025-05-29'),
(395, 0, 2, 36, 0, '1', 'Keyboard dan mouse Kabel', 'Tidak ada keterangan', '2025-05-29'),
(396, 0, 2, 36, 0, '1', 'Laptop', 'Tidak ada keterangan', '2025-05-29'),
(397, 0, 2, 36, 0, '2', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(398, 0, 2, 36, 0, '1', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(399, 0, 14, 17, 0, '10', 'Kursi Jok Rangka stainles', 'Tidak ada keterangan', '2025-05-29'),
(400, 0, 14, 17, 0, '2', 'Meja Kayu', 'Tidak ada keterangan', '2025-05-29'),
(401, 0, 14, 17, 0, '13', 'Meja Tulis Kantor  biro ', 'Tidak ada keterangan', '2025-05-29'),
(402, 0, 14, 17, 0, '1', 'Meja Kayu Panjang Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(403, 0, 14, 17, 0, '5', 'Lemari Kayu ', 'Tidak ada keterangan', '2025-05-29'),
(404, 0, 14, 17, 0, '1', 'Lemari Kaca Pintu Geser ', 'Tidak ada keterangan', '2025-05-29'),
(405, 0, 14, 17, 0, '1', 'Locker', 'Tidak ada keterangan', '2025-05-29'),
(406, 0, 14, 17, 0, '1', 'Papan Pengumuman ', 'Tidak ada keterangan', '2025-05-29'),
(407, 0, 14, 17, 0, '1', 'Tempat Penyimpanan Bola', 'Tidak ada keterangan', '2025-05-29'),
(408, 0, 2, 17, 0, '2', 'AC', 'Panasonic / daikin', '2025-05-29'),
(409, 42, 2, 17, 0, '1', 'Dispenser ', 'Sumbangan', '2025-05-29'),
(410, 0, 2, 17, 0, '1', 'Kulkas', 'Sumbangan ', '2025-05-29'),
(411, 43, 2, 17, 0, '1', 'Vacum cleaner', 'Tidak ada keterangan', '2025-05-29'),
(412, 44, 2, 17, 0, '3', 'Kamera /Handicam', 'CSR Maranatha', '2025-05-29'),
(413, 20, 2, 17, 0, '3', 'Printer ', 'Panasonic rusak', '2025-05-29'),
(414, 0, 2, 17, 0, '1', 'Amplifier', 'PMMS', '2025-05-29'),
(415, 45, 2, 17, 0, '1', 'Mixer', 'CSR Maranatha', '2025-05-29'),
(416, 0, 2, 17, 0, '1', 'TOA', 'Tidak ada keterangan', '2025-05-29'),
(417, 0, 2, 17, 0, '2', 'Mikrofon Standar ', 'CSR Maranatha', '2025-05-29'),
(418, 0, 2, 17, 0, '2', 'Werles Mic', 'CSR Maranatha', '2025-05-29'),
(419, 0, 2, 17, 0, '2', 'Tripod camera', 'CSR Maranatha', '2025-05-29'),
(420, 0, 2, 17, 0, '2', 'Speaker Hanging', 'Tidak ada keterangan', '2025-05-29'),
(421, 0, 2, 17, 0, '4', 'Thermometer / Thermogun', 'Tidak ada keterangan', '2025-05-29'),
(422, 0, 2, 17, 0, '1', 'Oxymeter', 'Tidak ada keterangan', '2025-05-29'),
(423, 0, 15, 17, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(424, 0, 15, 17, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(425, 0, 15, 17, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(426, 0, 15, 17, 0, '1', 'Salib ', 'Tidak ada keterangan', '2025-05-29'),
(427, 0, 10, 17, 0, '11', 'Voly ', 'Tidak ada keterangan', '2025-05-29'),
(428, 0, 10, 17, 0, '13', 'Basket ', 'Tidak ada keterangan', '2025-05-29'),
(429, 0, 10, 17, 0, '3', 'net', 'Tidak ada keterangan', '2025-05-29'),
(430, 0, 10, 17, 0, '1', 'Tenis Meja ', 'Tidak ada keterangan', '2025-05-29'),
(431, 0, 10, 17, 0, '15', 'Footsal', 'Tidak ada keterangan', '2025-05-29'),
(432, 0, 10, 17, 0, '2', 'Badminton ', 'Tidak ada keterangan', '2025-05-29'),
(433, 0, 10, 17, 0, '2', 'bola takraw', 'Tidak ada keterangan', '2025-05-29'),
(434, 0, 14, 37, 0, '3', 'Kursi Rangka Besi', 'Tidak ada keterangan', '2025-05-29'),
(435, 0, 14, 37, 0, '2', 'Meja kayu Rangka Besi ', 'Tidak ada keterangan', '2025-05-29'),
(436, 0, 14, 37, 0, '1', 'Meja Komputer Kayu/sirkulasi ', 'Tidak ada keterangan', '2025-05-29'),
(437, 0, 14, 37, 0, '5', 'Meja Baca', 'Tidak ada keterangan', '2025-05-29'),
(438, 0, 14, 37, 0, '6', 'Rak Kayu buku ', 'Tidak ada keterangan', '2025-05-29'),
(439, 0, 14, 37, 0, '1', 'Rak pajangan kayu', 'Tidak ada keterangan', '2025-05-29'),
(440, 0, 14, 37, 0, '2', 'Locker', 'Tidak ada keterangan', '2025-05-29'),
(441, 0, 14, 37, 0, '1', 'File Kabinet Besi ', 'Tidak ada keterangan', '2025-05-29'),
(442, 0, 2, 37, 0, '2', 'AC', 'Tidak ada keterangan', '2025-05-29'),
(443, 0, 2, 37, 0, '2', 'Jam Dinding ', 'Tidak ada keterangan', '2025-05-29'),
(444, 0, 2, 37, 0, '1', 'Akses Poin', 'Tidak ada keterangan', '2025-05-29'),
(445, 0, 14, 38, 0, '2', 'Lemari Kayu pintu geser', 'Tidak ada keterangan', '2025-05-29'),
(446, 0, 2, 37, 0, '1', 'CCTV', 'Tidak ada keterangan', '2025-05-29'),
(447, 0, 14, 38, 0, '1', 'Sofa set', 'Tidak ada keterangan', '2025-05-29'),
(448, 46, 2, 37, 0, '1', 'Printer ', 'Tidak ada keterangan', '2025-05-29'),
(449, 0, 14, 38, 0, '1', 'Kipas Angin ', 'Tidak ada keterangan', '2025-05-29'),
(450, 0, 2, 37, 0, '1', 'Speaker Box/kecil', 'Tidak ada keterangan', '2025-05-29'),
(451, 47, 2, 37, 0, '1', 'Web cam ', 'Tidak ada keterangan', '2025-05-29'),
(452, 0, 2, 37, 0, '1', 'Scaner Barcode', 'Tidak ada keterangan', '2025-05-29'),
(453, 0, 2, 37, 0, '2', 'CPU', 'Tidak ada keterangan', '2025-05-29'),
(454, 0, 2, 37, 0, '2', 'Monitor', 'Tidak ada keterangan', '2025-05-29'),
(455, 0, 15, 37, 0, '1', 'Gambar garuda ', 'Tidak ada keterangan', '2025-05-29'),
(456, 0, 15, 37, 0, '1', 'Gambar Presiden ', 'Tidak ada keterangan', '2025-05-29'),
(457, 0, 15, 37, 0, '1', 'Gambar Wakil presiden ', 'Tidak ada keterangan', '2025-05-29'),
(458, 0, 15, 37, 0, '1', 'Karpet ', 'Tidak ada keterangan', '2025-05-29'),
(459, 0, 15, 37, 0, '3', 'Salib ', 'Tidak ada keterangan', '2025-05-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang_elektronik`
--

CREATE TABLE `tb_barang_elektronik` (
  `id_barang_elektronik` int(11) NOT NULL,
  `id_merek` int(11) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `id_ruangan` int(11) DEFAULT NULL,
  `id_kondisi` int(11) DEFAULT NULL,
  `id_sumber_dana` int(11) DEFAULT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `tahun_pengadaan` year(4) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `keterangan_barang` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `tanggal_nonaktif` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_barang_elektronik`
--

INSERT INTO `tb_barang_elektronik` (`id_barang_elektronik`, `id_merek`, `id_kategori`, `id_ruangan`, `id_kondisi`, `id_sumber_dana`, `nama_barang`, `serial_number`, `tahun_pengadaan`, `tanggal_masuk`, `keterangan_barang`, `gambar`, `qr_code`, `status`, `tanggal_nonaktif`, `created_at`, `updated_at`) VALUES
(27, 19, 16, 26, 1, 6, 'AC SPLIT', 'E221810', '2023', NULL, '', '', '27.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(28, 19, 16, 26, 1, 6, 'AC SPLIT', 'E221066', '2023', NULL, '', '', '28.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(29, 20, 16, 26, 1, 6, 'PROYEKTOR', 'X88Y3902613', '2023', NULL, '', '', '29.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(30, 21, 16, 26, 1, 6, 'CPU ', '2104-009', NULL, NULL, '', '', '30.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(31, 22, 16, 26, 1, 6, 'MONITOR', '104NRC6Y006', '2021', NULL, '', '', '31.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(32, 23, 16, 26, 1, 6, 'MOUSE KABEL', '2052HS04ZTG8', NULL, NULL, '', '', '32.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(33, 23, 16, 26, 1, 6, 'KEYBOARD KABEL', '2046MR0A6978', NULL, NULL, '', '', '33.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(34, 24, 16, 26, 1, 6, 'SPEAKER AKTIF', '6750N081203-000353', NULL, NULL, '', '', '34.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(35, 19, 16, 23, 1, 6, 'AC SPLIT', 'E656851', '2023', NULL, '', '', '35.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(36, 25, 16, 23, 1, 6, 'AC SPLIT', '5423612697', '2012', NULL, '', '', '36.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(37, 20, 16, 23, 1, 6, 'PROYEKTOR', 'X8982200835', '2023', NULL, '', '', '37.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(38, 21, 16, 23, 1, 6, 'CPU ', '2104-003', NULL, NULL, '', '', '38.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(39, 22, 16, 23, 1, 6, 'MONITOR', '104INJL77260', '2021', NULL, '', '', '39.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(40, 23, 16, 23, 1, 6, 'MOUSE KABEL', '2052HS04ZTC8', NULL, NULL, '', '', '40.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(41, 23, 16, 23, 1, 6, 'KEYBOARD KABEL', '2051MR098568', NULL, NULL, '', '', '41.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(42, 24, 16, 23, 1, 6, 'SPEAKER AKTIF', '2000N+04104002045', NULL, NULL, '', '', '42.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(43, 25, 16, 25, 1, 6, 'AC SPLIT', '5423613335', '2012', NULL, '', '', '43.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(44, 21, 16, 25, 1, 6, 'CPU ', '2104-008', NULL, NULL, '', '', '44.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(45, 22, 16, 25, 1, 6, 'MONITOR', '104INSE6X750', '2021', NULL, '', '', '45.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(46, 27, 16, 25, 1, 6, 'MOUSE KABEL', 'X5J91743600015', NULL, NULL, '', '', '46.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(47, 28, 16, 25, 1, 6, 'KEYBOARD KABEL', 'PLLX1814040182', '2016', NULL, '', '', '47.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(48, 25, 16, 24, 1, 6, 'AC SPLIT', '3425114336', '2012', NULL, '', '', '48.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(49, 25, 16, 24, 1, 6, 'AC SPLIT', '3425115985', '2012', NULL, '', '', '49.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(50, 20, 16, 24, 1, 6, 'PROYEKTOR', 'X8982200675', '2023', NULL, '', '', '50.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(51, 21, 16, 24, 1, 6, 'CPU ', '2104-001', NULL, NULL, '', '', '51.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(52, 29, 16, 24, 1, 6, 'MONITOR', 'ETLHZ0C001014026F14003', NULL, NULL, '', '', '52.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(53, 23, 16, 24, 1, 6, 'MOUSE KABEL', '2052HS04ZTD8', NULL, NULL, '', '', '53.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(54, 23, 16, 24, 1, 6, 'KEYBOARD KABEL', '2051MR098558', NULL, NULL, '', '', '54.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(55, 25, 16, 28, 1, 6, 'AC SPLIT', '3425116678', '2012', NULL, '', '', '55.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(56, 30, 16, 28, 1, 3, 'AC SPLIT', '63229984283', '2022', NULL, '', '', '56.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(57, 20, 16, 28, 1, 3, 'PROYEKTOR', 'X8983702652', '2023', NULL, '', '', '57.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(58, 21, 16, 28, 1, 6, 'CPU ', '2104-007', NULL, NULL, '', '', '58.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(59, 31, 16, 28, 1, 6, 'MONITOR', 'GALMTF031721', NULL, NULL, '', '', '59.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(60, 27, 16, 28, 1, 6, 'MOUSE KABEL', 'X5J91743600064', NULL, NULL, '', '', '60.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(61, 28, 16, 28, 1, 6, 'KEYBOARD KABEL', 'C26240', NULL, NULL, '', '', '61.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(62, 19, 16, 27, 1, 6, 'AC SPLIT', 'E656855', '2023', NULL, '', '', '62.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(63, 25, 16, 27, 1, 6, 'PROYEKTOR', 'DB26265021112.2012', '2012', NULL, '', '', '63.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(64, 28, 16, 27, 1, 6, 'CPU ', '1408-019', NULL, NULL, '', '', '64.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(65, 34, 16, 27, 1, 6, 'MONITOR', '8ML1253F25N3494', NULL, NULL, '', '', '65.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(66, 23, 16, 27, 1, 6, 'MOUSE KABEL', '2052HS04ZU18', NULL, NULL, '', '', '66.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(67, 34, 16, 27, 1, 6, 'KEYBOARD KABEL', '9079335', NULL, NULL, '', '', '67.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(68, 24, 16, 27, 1, 6, 'SPEAKER AKTIF', '2000N+122003002608', NULL, NULL, '', '', '68.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(69, 30, 16, 39, 1, 3, 'AC SPLIT', '21019628', '2022', NULL, '', '', '69.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(70, 30, 16, 39, 1, 3, 'AC SPLIT', '21018292', '2022', NULL, '', '', '70.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(71, 20, 16, 39, 1, 6, 'PROYEKTOR', 'X88Y3902608', '2023', NULL, '', '', '71.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(72, 28, 16, 39, 1, 6, 'CPU ', '1408-012', NULL, NULL, '', '', '72.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(73, 29, 16, 39, 1, 6, 'MONITOR', '1400998640', NULL, NULL, '', '', '73.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(74, 23, 16, 39, 1, 6, 'MOUSE KABEL', '2052HS04ZT98', NULL, NULL, '', '', '74.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(75, 23, 16, 39, 1, 6, 'KEYBOARD KABEL', 'PLLX18130700374', NULL, NULL, '', '', '75.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(76, 24, 16, 39, 1, 6, 'SPEAKER AKTIF', '2000N+122003002607', NULL, NULL, '', '', '76.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(77, 25, 16, 29, 1, 6, 'AC SPLIT', '3425161732', '2012', NULL, '', '', '77.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(78, 19, 16, 20, 1, 6, 'AC SPLIT', 'E111942', '2020', NULL, '', '', '78.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(79, 19, 16, 20, 1, 6, 'AC SPLIT', 'E320480', '2024', NULL, '', '', '79.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(80, 20, 16, 20, 1, 6, 'PROYEKTOR', '2208-010', '2022', NULL, '', '', '80.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(81, 21, 16, 20, 1, 6, 'CPU ', '2104-002', NULL, NULL, '', '', '81.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(82, 22, 16, 20, 1, 6, 'MONITOR', '408INSEON878', '2014', NULL, '', '', '82.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(83, 25, 16, 37, 1, 6, 'AC SPLIT', '5423612668', '2012', NULL, '', '', '83.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(84, 25, 16, 37, 1, 6, 'AC SPLIT', '5423612664', '2012', NULL, '', '', '84.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(85, 21, 16, 37, 1, 6, 'CPU', 'MON 2312-009', '2024', NULL, '', '', '85.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(86, 28, 16, 37, 1, 6, 'CPU', '1408-022', NULL, NULL, '', '', '86.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(88, 29, 16, 37, 1, 6, 'MONITOR', '1401139240', '2012', NULL, '', '', '88.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(89, 27, 16, 37, 1, 6, 'MOUSE KABEL', 'X5J91743600019', '2019', NULL, '', '', '89.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(90, 23, 16, 37, 1, 6, 'MOUSE KABEL', '1907HS02HUF8', NULL, NULL, '', '', '90.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:22'),
(91, 23, 16, 37, 1, 6, 'KEYBOARD KABEL', '2046MR0A69A8', '2024', NULL, '', '', '91.png', 'aktif', NULL, '2025-05-30 03:47:22', '2025-05-30 03:47:23'),
(92, 28, 16, 37, 1, 6, 'KEYBOARD KABEL', 'PLLX18 140401809', '2015', NULL, '', '', '92.png', 'aktif', NULL, '2025-05-30 03:47:23', '2025-05-30 03:47:23'),
(93, 49, 16, 37, 1, 6, 'SCANNER BARCODE', 'VB05004377', '2018', NULL, '', '', '93.png', 'aktif', NULL, '2025-05-30 03:47:23', '2025-05-30 03:47:23'),
(94, 35, 16, 37, 1, 6, 'AKSES POIN', 'G1RP6SG219452', '2022', NULL, '', '', '94.png', 'aktif', NULL, '2025-05-30 03:47:23', '2025-05-30 03:47:23'),
(95, 36, 16, 20, 1, 6, 'AKSES POIN', 'F4285330D030', NULL, NULL, '', '', '95.png', 'aktif', NULL, '2025-05-30 03:47:23', '2025-05-30 03:47:23'),
(96, 32, 16, 22, 1, 6, 'Proyektor', 'X8983702651', '2024', NULL, '', '', '96.png', 'aktif', NULL, '2025-05-30 03:47:23', '2025-05-30 03:47:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`, `keterangan`) VALUES
(2, 'Alat Elektronik', 'barang barang eletronik'),
(10, 'Alat Olahraga', 'alat alat untuk keperluan olahraga'),
(11, 'Alat Musik', 'alat untuk pentas musik'),
(14, 'Mebeular', 'barang furniture atau perabot'),
(15, 'Perlengkapan Lain', 'barang perlengkapan lainnya'),
(16, 'Barang Elektronik', 'barang barang elektronik'),
(17, 'Belum dikategorikan', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kondisi`
--

CREATE TABLE `tb_kondisi` (
  `id_kondisi` int(11) NOT NULL,
  `nama_kondisi` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kondisi`
--

INSERT INTO `tb_kondisi` (`id_kondisi`, `nama_kondisi`, `keterangan`) VALUES
(1, 'Baik', 'Barang bagus'),
(2, 'Rusak Ringan', 'barang barang rusak namun masih bisa dipake'),
(3, 'Rusak Berat', 'barang tidak dapat dipakai'),
(4, 'Belum ditentukan', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_lahan`
--

CREATE TABLE `tb_lahan` (
  `id_lahan` int(11) NOT NULL,
  `nama_lahan` varchar(255) NOT NULL,
  `no_sert_lahan` varchar(255) NOT NULL,
  `luas_lahan` varchar(255) NOT NULL,
  `status_lahan` enum('Wakaf','Milik Sendiri') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_merek`
--

CREATE TABLE `tb_merek` (
  `id_merek` int(11) NOT NULL,
  `nama_merek` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_merek`
--

INSERT INTO `tb_merek` (`id_merek`, `nama_merek`, `keterangan`) VALUES
(10, 'Tidak Bermerek', 'tidak ada merek barang'),
(19, 'DAIKIN', 'merek AC'),
(20, 'EPSON', 'merek proyektor'),
(21, 'ALCATROZ', 'merek CPU'),
(22, 'LG', 'merek monitor'),
(23, 'LOGITECH', 'merek mouse dan keyboard (kabel)'),
(24, 'SIMBADDA', 'merek speaker'),
(25, 'PANASONIC', 'merek AC'),
(26, 'SONY', 'merek proyektor'),
(27, 'GENIUS', 'merek mouse (kabel)'),
(28, 'POWERLOGIC', 'merek keyboard (kabel)'),
(29, 'ACER', 'merek monitor'),
(30, 'SHARP', 'merek AC'),
(31, 'ASUS', 'merek monitor'),
(32, 'EPSON', 'merek proyektor dan printer'),
(33, 'POWERLOGIC', 'merek keyboard (kabel) dan CPU'),
(34, 'LENOVO', 'merek monitor'),
(35, 'Ruijie', 'merek akses poin'),
(36, 'Toto Link', 'merek akses point'),
(37, 'LOGITECH', 'merek mouse (kabel) , keyboard (kabel), dan webcam'),
(38, 'Epson L120', 'merek printer'),
(39, 'Epson EB X06', 'merek proyektor'),
(40, 'Epson L5190', 'merek printer'),
(41, 'Canon Lide 110', 'merek scanner'),
(42, 'Under', 'merek dispenser'),
(43, 'Karcher', 'merek vacum cleaner'),
(44, 'Sony', 'merek kamera'),
(45, '8 Channel', 'merek mixer'),
(46, 'Epson L310', 'merek printer'),
(47, 'Logitect', 'merek webcam'),
(48, 'Tidak diketahui', ''),
(49, 'Scanlogic', 'merek scanner barcode');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ruangan`
--

CREATE TABLE `tb_ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `nama_ruangan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ruangan`
--

INSERT INTO `tb_ruangan` (`id_ruangan`, `nama_ruangan`, `keterangan`) VALUES
(17, 'Guru', 'untuk ruangan khusus guru'),
(18, 'UKS / Lab', 'ruangan untuk laboratorium dan uks'),
(19, 'Gudang', 'Alat alat sarana dan prasarana'),
(20, 'Inggris', 'ruangan untuk belajar bahasa inggris'),
(21, 'Biologi', 'ruangan untuk belajar Biologi'),
(22, 'Sejarah', 'ruangan untuk belajar Sejarah'),
(23, 'Ekonomi', 'ruangan untuk belajar Ekonomi'),
(24, 'Indonesia', 'ruangan untuk belajar bahasa indonesia'),
(25, 'matematika', 'ruangan untuk belajar matematika'),
(26, 'Fisika', 'ruangan untuk belajar Fisika'),
(27, 'Kimia', 'ruangan untuk belajar Kimia'),
(28, 'BK', 'ruangan untuk bimbingan konseling'),
(29, 'lab komputer', 'ruangan untuk belajar yang membutukan komputer'),
(30, 'UKS ', 'ruangan untuk uks'),
(31, 'Praktek Fisika', 'ruangan untuk praktek fisika'),
(32, 'Praktek Biologi', 'ruangan untuk praktek biologi'),
(33, 'Praktek Kimia', 'ruangan untuk praktek kimia'),
(34, 'Musik', 'ruangan untuk musik'),
(35, 'Kepala Sekolah', 'ruangan kepala sekolah'),
(36, 'TU', 'ruangan tata usaha'),
(37, 'Perpustakaan', 'ruangan perpustakaan'),
(38, 'Tamu', 'ruangan tamu'),
(39, 'Sosiologi', 'ruangan untuk belajar sosiologi'),
(40, 'Tidak diketahui', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sumber_dana`
--

CREATE TABLE `tb_sumber_dana` (
  `id_sumber_dana` int(11) NOT NULL,
  `nama_sumber_dana` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_sumber_dana`
--

INSERT INTO `tb_sumber_dana` (`id_sumber_dana`, `nama_sumber_dana`, `keterangan`) VALUES
(1, 'APBN', 'Anggaran dari APBN'),
(2, 'APBD', 'Anggaran dari APBD'),
(3, 'Dana BOS', 'Dana Bantuan Operasional Sekolah'),
(4, 'Hibah', 'Dana Hibah dari pihak ketiga'),
(5, 'Sumbangan Orang Tua', 'Sumbangan dari orang tua siswa'),
(6, 'Yayasan', 'Dana dari yayasan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jenis_transaksi` enum('masuk','keluar','pinjam') NOT NULL,
  `status` enum('belum','selesai') NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan_transaksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `no_hp_user` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_user` enum('admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `no_hp_user`, `username`, `password`, `role_user`) VALUES
(2, 'admin', '123456789', 'admin', 'admin123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bangunan`
--
ALTER TABLE `tb_bangunan`
  ADD PRIMARY KEY (`id_bangunan`);

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `tb_barang_elektronik`
--
ALTER TABLE `tb_barang_elektronik`
  ADD PRIMARY KEY (`id_barang_elektronik`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD KEY `id_merek` (`id_merek`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_ruangan` (`id_ruangan`),
  ADD KEY `id_kondisi` (`id_kondisi`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_kondisi`
--
ALTER TABLE `tb_kondisi`
  ADD PRIMARY KEY (`id_kondisi`);

--
-- Indeks untuk tabel `tb_lahan`
--
ALTER TABLE `tb_lahan`
  ADD PRIMARY KEY (`id_lahan`);

--
-- Indeks untuk tabel `tb_merek`
--
ALTER TABLE `tb_merek`
  ADD PRIMARY KEY (`id_merek`);

--
-- Indeks untuk tabel `tb_ruangan`
--
ALTER TABLE `tb_ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indeks untuk tabel `tb_sumber_dana`
--
ALTER TABLE `tb_sumber_dana`
  ADD PRIMARY KEY (`id_sumber_dana`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_bangunan`
--
ALTER TABLE `tb_bangunan`
  MODIFY `id_bangunan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;

--
-- AUTO_INCREMENT untuk tabel `tb_barang_elektronik`
--
ALTER TABLE `tb_barang_elektronik`
  MODIFY `id_barang_elektronik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_kondisi`
--
ALTER TABLE `tb_kondisi`
  MODIFY `id_kondisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_lahan`
--
ALTER TABLE `tb_lahan`
  MODIFY `id_lahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_merek`
--
ALTER TABLE `tb_merek`
  MODIFY `id_merek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `tb_ruangan`
--
ALTER TABLE `tb_ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tb_sumber_dana`
--
ALTER TABLE `tb_sumber_dana`
  MODIFY `id_sumber_dana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_barang_elektronik`
--
ALTER TABLE `tb_barang_elektronik`
  ADD CONSTRAINT `tb_barang_elektronik_ibfk_1` FOREIGN KEY (`id_merek`) REFERENCES `tb_merek` (`id_merek`),
  ADD CONSTRAINT `tb_barang_elektronik_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`),
  ADD CONSTRAINT `tb_barang_elektronik_ibfk_3` FOREIGN KEY (`id_ruangan`) REFERENCES `tb_ruangan` (`id_ruangan`),
  ADD CONSTRAINT `tb_barang_elektronik_ibfk_4` FOREIGN KEY (`id_kondisi`) REFERENCES `tb_kondisi` (`id_kondisi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
