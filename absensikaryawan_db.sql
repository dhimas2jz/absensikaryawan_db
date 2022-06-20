-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jun 2022 pada 07.50
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensikaryawan_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id_absen` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `waktu` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id_absen`, `tgl`, `waktu`, `keterangan`, `id_user`) VALUES
(4, '2022-07-25', '07:21:53', 'Masuk', 6),
(5, '2022-07-25', '09:00:47', 'Masuk', 6),
(6, '2022-07-25', '16:01:03', 'Pulang', 6),
(7, '2022-07-25', '17:01:28', 'Pulang', 6),
(8, '2022-05-25', '15:57:19', 'Masuk', 7),
(9, '2022-05-25', '16:11:11', 'Pulang', 7),
(10, '2022-05-25', '16:16:34', 'Masuk', 6),
(11, '2022-05-25', '16:20:50', 'Pulang', 6),
(12, '2022-05-30', '10:46:49', 'Masuk', 14),
(13, '2022-05-30', '10:53:43', 'Masuk', 15),
(14, '2022-05-30', '10:59:52', 'Pulang', 15),
(15, '2022-05-30', '11:00:58', 'Masuk', 7),
(16, '2022-05-30', '11:09:22', 'Pulang', 7),
(17, '2022-06-06', '10:55:41', 'Masuk', 6),
(18, '2022-06-06', '10:59:17', 'Masuk', 7),
(19, '2022-06-06', '11:01:38', 'Pulang', 7),
(20, '2022-06-08', '10:50:59', 'Masuk', 16),
(21, '2022-06-08', '11:00:06', 'Pulang', 16),
(22, '2022-06-08', '11:01:36', 'Masuk', 7),
(23, '2022-06-08', '11:01:42', 'Pulang', 7),
(24, '2022-06-08', '11:02:48', 'Masuk', 7),
(25, '2022-06-08', '11:04:05', 'Masuk', 7),
(26, '2022-06-08', '11:04:10', 'Masuk', 7),
(27, '2022-06-08', '11:05:14', 'Masuk', 7),
(28, '2022-06-08', '11:06:21', 'Masuk', 7),
(29, '2022-06-08', '11:07:11', 'Masuk', 6),
(30, '2022-06-08', '11:08:41', 'Pulang', 6),
(31, '2022-06-08', '11:12:50', 'Masuk', 15),
(32, '2022-06-08', '11:13:02', 'Pulang', 15),
(33, '2022-06-08', '11:13:21', 'Masuk', 14),
(34, '2022-06-08', '11:15:07', 'Pulang', 14),
(35, '2022-06-13', '10:58:42', 'Masuk', 7),
(36, '2022-06-13', '11:15:57', 'Masuk', 6),
(37, '2022-06-20', '00:58:48', 'Masuk', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` smallint(3) NOT NULL,
  `nama_divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`) VALUES
(1, 'Marketing'),
(2, 'IT '),
(3, 'Akuntan'),
(4, 'Kebersihan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam`
--

CREATE TABLE `jam` (
  `id_jam` tinyint(1) NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jam`
--

INSERT INTO `jam` (`id_jam`, `start`, `finish`, `keterangan`) VALUES
(1, '06:00:00', '23:00:00', 'Masuk'),
(2, '17:00:00', '23:30:00', 'Pulang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` smallint(5) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(20) DEFAULT 'no-foto.png',
  `divisi` smallint(5) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('Manager','Karyawan') NOT NULL DEFAULT 'Karyawan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nik`, `nama`, `telp`, `email`, `foto`, `divisi`, `username`, `password`, `level`) VALUES
(1, '', 'Kholil', '081326173608', 'amdkhl2@gmail.com', '', NULL, 'ahmad', '$2y$10$UwqloCX7PFLM3aQvgQxh6e9UgifqwQOZiF1zdogtLF6iVDR7Yr7IW', 'Manager'),
(6, '', 'Adrian', '08151231902', 'adriankuhhh01@gmail.com', '1653470441.png', 1, 'adrian', '$2y$10$XBweEOEYix1tMGYBHuhI9et0FB9f8FDxXAvfslV1jUH6.VQ4WkU1q', 'Karyawan'),
(7, '', 'Raihan', '0812312381', 'raihansofyan@mail.com', '1653469842.png', 3, 'raihan', '$2y$10$RwLC3tsEu0Tuw.SsjuMCaO6Ahpe8QbdJccSwNIRTeK/DVQZtWZR5O', 'Karyawan'),
(8, '8931289124891', 'Manager 1', '', '', 'no-foto.png', NULL, 'manager_1', '$2y$10$XtMY01KEOd5I065s8Exs0OcQ373RvRNG1JznORr6TmmBNWnZ3vjjK', 'Manager'),
(9, '1231231238900', 'Manager 2', '', '', 'no-foto.png', NULL, 'manager_2', '$2y$10$iJWUOXDznGEmxo.bqnhtmeFL51jN5130LfDlKg8VROfoEmlgC.cFW', 'Manager'),
(10, '908121310291', 'Manager 3', '', '', 'no-foto.png', NULL, 'manager_3', '$2y$10$uGsLvgl.6ji2iZ7tWkNvPelTwZdLQ6QA81Yawa20wsLairCXqV8BO', 'Manager'),
(11, '123801204012', 'Manager 4', '', '', 'no-foto.png', NULL, 'master_4', '$2y$10$Kot81WNqrho4WlcYI13kT.Y5V2sMg1ZSAXcITrp8cj3dqHpbl4vrS', 'Manager'),
(14, '1456783456', 'Alfian Masykur', '082345483993', 'alfiancintaku@gmail.com', 'no-foto.png', 3, 'alfian', '$2y$10$HL2KWQ.95OCMSUjgttALaOe6mv2AGhA.DgOIMSxMlclGcMSmGwn7q', 'Karyawan'),
(15, '101140976426', 'Zabal', '081457654321', 'Zabal21@gmail.com', 'no-foto.png', 4, 'zabal', '$2y$10$DnT09lR.J9KDs1qZFcA9TOcYwnp6vJ.k6WmTjBmqcxE6LAQoxYnF.', 'Karyawan'),
(16, '1234567890', 'Muhammad Fadli', '085732769157', 'fadlimuhammad435@gmail.com', 'no-foto.png', 1, 'fadli', '$2y$10$Go.crOZgvQu8Y.ZFcYeo5eMUFrJlnON6o8bQc.eB1n4R.Hz51M5CS', 'Karyawan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indeks untuk tabel `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indeks untuk tabel `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id_jam`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jam`
--
ALTER TABLE `jam`
  MODIFY `id_jam` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
