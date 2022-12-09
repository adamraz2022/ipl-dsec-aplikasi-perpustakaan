-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Des 2022 pada 05.28
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sp_administrasi_masyarakat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `Id_admin` varchar(10) NOT NULL,
  `Nama_admin` varchar(25) NOT NULL,
  `No_telp` int(12) DEFAULT NULL,
  `Status` varchar(25) DEFAULT NULL,
  `Email_admin` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_informasi`
--

CREATE TABLE `tb_informasi` (
  `Id_informasi` varchar(10) NOT NULL,
  `Nama_informasi` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_instansi_pemerintah`
--

CREATE TABLE `tb_instansi_pemerintah` (
  `Id_Pemerintah` varchar(10) NOT NULL,
  `Nama_Pemerintah` varchar(25) NOT NULL,
  `No_telp` int(12) DEFAULT NULL,
  `Status` varchar(25) DEFAULT NULL,
  `Email_Pemerintah` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_login`
--

CREATE TABLE `tb_login` (
  `Username` varchar(10) NOT NULL,
  `Password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_masyarakat`
--

CREATE TABLE `tb_masyarakat` (
  `NIK` varchar(20) NOT NULL,
  `Nama_Masyarakat` varchar(25) NOT NULL,
  `No_telp` int(12) DEFAULT NULL,
  `Alamat_Masrakat` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelayanan`
--

CREATE TABLE `tb_pelayanan` (
  `Id_pelayanan` varchar(10) NOT NULL,
  `Nama_pelayanan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengajuan`
--

CREATE TABLE `tb_pengajuan` (
  `Id_pengajuan` varchar(10) NOT NULL,
  `Nama_pengajuan` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`Id_admin`);

--
-- Indeks untuk tabel `tb_informasi`
--
ALTER TABLE `tb_informasi`
  ADD PRIMARY KEY (`Id_informasi`);

--
-- Indeks untuk tabel `tb_instansi_pemerintah`
--
ALTER TABLE `tb_instansi_pemerintah`
  ADD PRIMARY KEY (`Id_Pemerintah`);

--
-- Indeks untuk tabel `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`Username`);

--
-- Indeks untuk tabel `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  ADD PRIMARY KEY (`NIK`);

--
-- Indeks untuk tabel `tb_pelayanan`
--
ALTER TABLE `tb_pelayanan`
  ADD PRIMARY KEY (`Id_pelayanan`);

--
-- Indeks untuk tabel `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD PRIMARY KEY (`Id_pengajuan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`Id_admin`) REFERENCES `tb_pelayanan` (`Id_pelayanan`),
  ADD CONSTRAINT `tb_admin_ibfk_2` FOREIGN KEY (`Id_admin`) REFERENCES `tb_pengajuan` (`Id_pengajuan`);

--
-- Ketidakleluasaan untuk tabel `tb_informasi`
--
ALTER TABLE `tb_informasi`
  ADD CONSTRAINT `tb_informasi_ibfk_1` FOREIGN KEY (`Id_informasi`) REFERENCES `tb_admin` (`Id_admin`),
  ADD CONSTRAINT `tb_informasi_ibfk_2` FOREIGN KEY (`Id_informasi`) REFERENCES `tb_pelayanan` (`Id_pelayanan`),
  ADD CONSTRAINT `tb_informasi_ibfk_3` FOREIGN KEY (`Id_informasi`) REFERENCES `tb_masyarakat` (`NIK`);

--
-- Ketidakleluasaan untuk tabel `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `tb_login_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `tb_admin` (`Id_admin`),
  ADD CONSTRAINT `tb_login_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `tb_masyarakat` (`NIK`),
  ADD CONSTRAINT `tb_login_ibfk_3` FOREIGN KEY (`Username`) REFERENCES `tb_instansi_pemerintah` (`Id_Pemerintah`);

--
-- Ketidakleluasaan untuk tabel `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  ADD CONSTRAINT `tb_masyarakat_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `tb_pengajuan` (`Id_pengajuan`);

--
-- Ketidakleluasaan untuk tabel `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD CONSTRAINT `tb_pengajuan_ibfk_1` FOREIGN KEY (`Id_pengajuan`) REFERENCES `tb_instansi_pemerintah` (`Id_Pemerintah`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
