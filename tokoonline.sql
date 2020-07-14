-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14 Jul 2020 pada 03.03
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoonline`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `passaword` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `passaword`, `nama_lengkap`) VALUES
(1, 'tokoonline', 'tokoonline', 'nara anindya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Elektronik'),
(2, 'Alat tulis'),
(3, 'Jilbab'),
(4, 'Sepatu'),
(5, 'Hoodie'),
(6, 'Gamis'),
(7, 'Baju koko');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Tegal', 25000),
(2, 'Pemalang', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `no_telp_pelanggan` varchar(25) NOT NULL,
  `alamat_pelangaan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `no_telp_pelanggan`, `alamat_pelangaan`) VALUES
(1, 'naraanindya2001@gmail.com', 'natan', 'nasywa natania', '081466759755', ''),
(2, 'leonel@gmail.com', 'leonel', 'leonel arsya', '081280168151', ''),
(3, 'aca@gmail.com', 'aca', 'aca', '08192787', 'tegal'),
(4, 'andi@gmail.com', 'andi', 'Andi', '00000', 'tegal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(11, 8, 'Nara Anindya Guna', 'Bri', 1580000, '2020-04-18', '20200418134942111.JPG'),
(12, 10, 'Nara Anindya Guna', 'Bri', 3130000, '2020-04-18', '20200418175744IMG-20190711-WA0000.jpg'),
(13, 11, 'nara', 'Bri', 2347000, '2020-04-20', '20200420062636th.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'Pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(1, 2, 1, '2020-04-07', 1500000, '', 0, '', 'Pending', ''),
(2, 2, 1, '2020-04-07', 500000, '', 0, '', 'Pending', ''),
(3, 2, 2, '2020-04-17', 1080000, '', 0, '', 'Pending', ''),
(4, 2, 2, '2020-04-17', 1080000, '', 0, '', 'Pending', ''),
(5, 2, 1, '2020-04-17', 1075000, '', 0, '', 'Pending', ''),
(6, 2, 1, '2020-04-17', 1075000, '', 0, '', 'Pending', ''),
(7, 2, 2, '2020-04-17', 1080000, '', 0, '', 'Pending', ''),
(8, 1, 2, '2020-04-17', 1580000, 'Pemalang', 30000, '', 'lunas', 'ABCDE'),
(9, 1, 1, '2020-04-17', 1575000, 'Tegal', 25000, 'jl raya kendayakan warureja kab.tegal 50128', 'Pending', ''),
(10, 1, 2, '2020-04-18', 3130000, 'Pemalang', 30000, 'pml', 'sudah kirim pembayaran', ''),
(11, 1, 2, '2020-04-20', 2347000, 'Pemalang', 30000, 'Aalun-alun pemalang', 'barang dikirim', 'ABC1234'),
(12, 1, 1, '2020-04-21', 389000, 'Tegal', 25000, 'tegal', 'Pending', ''),
(13, 3, 1, '2020-07-07', 354000, 'Tegal', 25000, 'tegal', 'Pending', ''),
(14, 3, 2, '2020-07-07', 359000, 'Pemalang', 30000, 'tegal', 'Pending', ''),
(15, 3, 0, '2020-07-07', 67000, '', 0, '', 'Pending', ''),
(16, 3, 0, '2020-07-07', 67000, '', 0, 'tgnyh', 'Pending', ''),
(17, 3, 1, '2020-07-07', 92000, 'Tegal', 25000, 'hhy6jpj', 'Pending', ''),
(18, 3, 1, '2020-07-07', 293000, 'Tegal', 25000, 'brebs jaya ', 'Pending', ''),
(19, 3, 1, '2020-07-07', 92000, 'Tegal', 25000, 'sfadsg', 'Pending', ''),
(20, 3, 0, '2020-07-07', 67000, '', 0, 'dsg', 'Pending', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(9, 7, 1, 1, 'laptop ASUS ', 1000000, 1000, 1000, 1000000),
(10, 7, 4, 1, 'buku', 50000, 1000, 1000, 50000),
(11, 8, 1, 1, 'laptop ASUS ', 1500000, 1000, 1000, 1500000),
(12, 8, 4, 1, 'buku', 50000, 1000, 1000, 50000),
(13, 9, 1, 1, 'laptop ASUS ', 1500000, 1000, 1000, 1500000),
(14, 9, 4, 1, 'buku', 50000, 1000, 1000, 50000),
(15, 10, 1, 2, 'laptop ASUS ', 1500000, 1000, 2000, 3000000),
(16, 10, 4, 2, 'buku', 50000, 1000, 2000, 100000),
(17, 11, 7, 5, 'Seatu Futsal Nike', 450000, 100, 500, 2250000),
(18, 11, 9, 1, 'Jilbab Rabbani', 67000, 45, 45, 67000),
(19, 12, 10, 1, 'scarf Elzata', 329000, 250, 250, 329000),
(20, 12, 11, 1, 'Scarf', 35000, 100, 100, 35000),
(21, 13, 10, 1, 'scarf Elzata', 329000, 250, 250, 329000),
(22, 14, 10, 1, 'scarf Elzata', 329000, 250, 250, 329000),
(23, 15, 9, 1, 'Jilbab Rabbani', 67000, 45, 45, 67000),
(24, 16, 9, 1, 'Jilbab Rabbani', 67000, 45, 45, 67000),
(25, 17, 9, 1, 'Jilbab Rabbani', 67000, 45, 45, 67000),
(26, 18, 9, 4, 'Jilbab Rabbani', 67000, 45, 180, 268000),
(27, 19, 9, 1, 'Jilbab Rabbani', 67000, 45, 45, 67000),
(28, 20, 9, 1, 'Jilbab Rabbani', 67000, 45, 45, 67000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(9, 3, 'Jilbab Rabbani', 67000, 45, 'Jilbab-rabbani-kerudung-syelikaa.jpg', 'Jilbab rabbani\r\nBahan : Wolfies\r\nWarna : peach, hitam, merah, biru, hijau army, Cream\r\n ', 215),
(10, 3, 'scarf Elzata', 329000, 250, 'Shopee_2c0b52a1a811e6482188bb841084f94f[1].jpg', '            Gamis bagus \r\nwarna : abu-abu, Navy        ', 57),
(11, 3, 'Scarf', 35000, 100, 'Shopee_63be32f0a1eb9257ae0e9a35b13aa3d6[1].jpg', 'Scarf bagus', 44),
(12, 3, 'Scarf betany zoya', 59000, 100, 'Shopee_d6c0126210aa150f3a04a11ba1c04b20[1].jpg', 'scarf lembut', 24),
(13, 0, 'Scarf zig zag', 59000, 100, 'Shopee_9e008da01aa09fa55a52ad9ae0268c13[1].jpg', 'scarf lembut', 25),
(14, 6, 'Gamis zoya', 345000, 350, 'Shopee_0c1cc9712032419ec0a3aeb29455f4eb[1].jpg', 'Gamis bagus', 25),
(15, 7, 'Baju koko zoya', 245000, 350, 'Shopee_60ead399c4c910dc5e71ce3d8a68e157[1].jpg', 'Baju koko bagus', 45);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
