-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jul 2025 pada 06.44
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
(6, 'Yayasan', 'Dana dari yayasan'),
(7, 'Pemda', 'dana dari pemda');

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
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_barang_elektronik`
--
ALTER TABLE `tb_barang_elektronik`
  MODIFY `id_barang_elektronik` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_sumber_dana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

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
