-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 04, 2026 at 04:05 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomers_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `nama_penerima` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `is_utama` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_produk` int NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `ukuran` varchar(10) DEFAULT NULL,
  `warna` varchar(20) DEFAULT NULL,
  `ditambah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `total` int NOT NULL,
  `status` enum('Pending','Diproses','Dikirim','Diterima','Selesai','Dibatalkan') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Pending',
  `metode_bayar` varchar(50) DEFAULT NULL,
  `alamat_pengiriman` text,
  `dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_item`
--

CREATE TABLE `pesanan_item` (
  `id` int NOT NULL,
  `id_pesanan` int NOT NULL,
  `id_produk` int NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` int NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `ukuran` varchar(20) DEFAULT NULL,
  `warna` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `harga` int NOT NULL,
  `stok` int NOT NULL DEFAULT '0',
  `material` varchar(100) DEFAULT NULL,
  `kondisi` varchar(50) DEFAULT NULL,
  `berat` varchar(50) DEFAULT NULL,
  `perawatan` text,
  `deskripsi` text,
  `ukuran` varchar(100) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `harga_lama` int DEFAULT NULL,
  `terjual` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama`, `kategori`, `harga`, `stok`, `material`, `kondisi`, `berat`, `perawatan`, `deskripsi`, `ukuran`, `warna`, `gambar`, `dibuat`, `harga_lama`, `terjual`) VALUES
(4, 'Good Pink Casual Drawstring Tee', 'Fashion', 89000, 6, 'Cotton Combed 24s', 'Baru', '180 gram', 'Cuci mesin suhu rendah, jangan gunakan pemutih, setrika suhu sedang', 'Kaos wanita casual dengan desain tulisan \"Good Pink\" yang trendy dan modern. Dilengkapi detail tali serut di kedua sisi yang dapat disesuaikan untuk menciptakan tampilan lebih stylish. Terbuat dari bahan cotton combed yang lembut, nyaman dipakai sehari-hari, dan mudah dipadukan dengan berbagai outfit.', 'S,M,L,XL', '#E8E0D5', 'prod_6a364e39ce87d.jpg', '2026-06-20 08:24:25', NULL, 6),
(5, 'Aviator Black Sunglasses', 'Aksesoris', 75000, 11, 'Metal Frame & Polycarbonate Lens', 'Baru', '45 gram', 'Bersihkan dengan kain microfiber, simpan dalam hard case saat tidak digunakan', 'Kacamata hitam model aviator dengan desain klasik yang cocok digunakan pria maupun wanita. Lensa berwarna gelap membantu mengurangi silau saat beraktivitas di luar ruangan. Frame metal ringan memberikan kenyamanan penggunaan dalam waktu lama.', '', '#2C2C2C', 'prod_6a364e9628fd0.jpg', '2026-06-20 08:25:58', NULL, 9),
(6, 'Casual Beige Sneakers', 'Sepatu', 199000, 14, 'Canvas Premium & Rubber Sole', 'Baru', '650 gram', 'Bersihkan dengan sikat lembut, hindari perendaman terlalu lama', '', 'S,M,L,XL', '#E8E0D5', 'prod_6a364edd78ccf.jpg', '2026-06-20 08:27:09', NULL, 6),
(7, 'Black Slim Fit Pants', 'Fashion', 169000, 13, 'Cotton Twill Stretch', 'Baru', '420 gram', 'Cuci terpisah pada pencucian pertama, setrika suhu rendah', 'Celana panjang slim fit dengan potongan modern yang memberikan tampilan rapi dan elegan. Menggunakan bahan cotton twill stretch yang nyaman dan tidak mudah kusut. Cocok digunakan untuk kegiatan formal maupun semi-formal.', 'S,M,L,XL,XXL', '#E8E0D5,#FFFFFF,#3B5998', 'prod_6a364f3ac62e5.jpg', '2026-06-20 08:28:42', NULL, 7),
(8, 'Ribbon Neck Peplum Blouse', 'Fashion', 139000, 15, 'Premium Rayon', 'Baru', '250 gram', 'Hand wash atau dry clean, jangan gunakan pemutih', 'Blouse wanita dengan desain pita pada bagian leher dan model peplum yang memberikan kesan feminin dan elegan. Bahan rayon premium terasa ringan, lembut, dan nyaman digunakan sepanjang hari. Cocok dipadukan dengan celana maupun rok untuk berbagai kesempatan.', 'S,M,L', '#C4916A,#2C2C2C,#7B8B6F', 'prod_6a364fae05954.jpg', '2026-06-20 08:30:38', NULL, 5),
(9, 'Urban White Sneakers', 'Sepatu', 229000, 17, 'Synthetic Leather & Rubber Sole', 'Baru', '750 gram', 'Bersihkan dengan kain lembab atau sikat halus, hindari pencucian menggunakan mesin', 'Deskripsi Produk:\r\nSneakers casual dengan desain modern dan kombinasi warna putih serta abu-abu yang elegan. Dilengkapi sol karet yang kuat dan nyaman untuk penggunaan sehari-hari. Cocok digunakan untuk aktivitas santai, kuliah, maupun hangout karena mudah dipadukan dengan berbagai outfit.', 'S,M,L,XL', '#C4916A,#2C2C2C,#E8E0D5,#7B8B6F', 'prod_6a365272d5b23.jpg', '2026-06-20 08:42:26', NULL, 3),
(10, 'Kids Velcro Casual Shoes', 'Sepatu', 149000, 18, 'Synthetic Leather & Rubber Sole', 'Baru', '350 gram', 'Bersihkan dengan kain lembut dan sabun ringan, keringkan di tempat teduh', 'Sepatu anak dengan desain sporty dan sistem perekat velcro yang memudahkan penggunaan tanpa perlu mengikat tali. Material ringan dan nyaman digunakan untuk aktivitas sehari-hari. Tersedia dalam beberapa pilihan warna menarik yang cocok untuk anak laki-laki maupun perempuan. Cocok digunakan saat bermain, jalan-jalan, maupun ke sekolah.', 'XS,S', '#2C2C2C,#E8E0D5,#7B8B6F', 'prod_6a3652aa15a86.jpg', '2026-06-20 08:43:22', NULL, 2),
(11, 'Sepatu Running Gradient Sport Unisex', 'Sepatu', 329000, 17, 'Upper Mesh Premium, Midsole EVA Foam, Outsole Rubber', 'Baru', '850 gram', 'Lap menggunakan kain lembab. Cuci manual jika diperlukan dan hindari mesin cuci.', 'Sepatu running dengan desain modern dan bobot ringan yang nyaman digunakan untuk olahraga maupun aktivitas harian. Upper berbahan mesh memberikan sirkulasi udara yang baik sehingga kaki tetap nyaman meski dipakai dalam waktu lama. Sol empuk membantu meredam benturan saat berjalan maupun berlari.', 'S,M,L', '#E8E0D5,#3B5998', 'prod_6a3654802100a.jpg', '2026-06-20 08:51:12', NULL, 3),
(12, 'Kacamata Safety Pelindung Transparan', 'Aksesoris', 69000, 19, 'Polycarbonate Lens, Frame ABS', 'Baru', '120 gram', 'Bersihkan menggunakan kain microfiber.', 'Kacamata safety dengan lensa bening yang melindungi mata dari debu, percikan ringan, dan partikel kecil. Ringan dipakai serta nyaman digunakan dalam aktivitas kerja maupun proyek.', 'S,M,L', '#2C2C2C,#7B8B6F', 'prod_6a3654c190e3a.jpg', '2026-06-20 08:52:17', NULL, 1),
(13, 'Kacamata Frame Kotak Metal', 'Aksesoris', 145000, 22, 'Metal Alloy, Nose Pad Silicone', 'Baru', '110 gram', 'Bersihkan menggunakan kain microfiber dan simpan di dalam hard case.', 'Frame kacamata bergaya minimalis dengan desain kotak yang cocok digunakan pria maupun wanita. Material ringan dan nyaman dipakai sepanjang hari serta mudah dipadukan dengan berbagai gaya.', 'XS,S,M,L,XL,XXL', '#E8E0D5,#3B5998', 'prod_6a3654fe6800e.jpg', '2026-06-20 08:53:18', NULL, 0),
(14, 'Frame Kacamata Transparan Fashion', 'Aksesoris', 119000, 21, 'TR90 Premium', 'Baru', '100 gram', 'Bersihkan menggunakan kain microfiber.', 'Frame kacamata wanita dengan warna transparan yang memberikan tampilan modern dan manis. Material fleksibel membuat frame lebih nyaman dipakai untuk aktivitas sehari-hari.', 'S,M', '#7B8B6F,#3B5998', 'prod_6a36552d8c63e.jpg', '2026-06-20 08:54:05', NULL, 1),
(15, 'Piyama Wanita Lengan Pendek Premium', 'Fashion', 189, 20, 'Rayon Premium', 'Baru', '450 gram', 'Cuci menggunakan air dingin, jangan gunakan pemutih.', 'Setelan piyama berbahan rayon yang lembut, adem, dan nyaman dipakai saat beristirahat. Model simpel dengan detail piping memberikan kesan elegan sekaligus nyaman digunakan sepanjang malam.', 'XS,S,M,L', '#E8E0D5,#7B8B6F,#3B5998', 'prod_6a365560c73b8.jpg', '2026-06-20 08:54:56', NULL, 2),
(16, 'Kemeja Koko Oversize Pria', 'Fashion', 229000, 21, 'Katun Oxford Premium', 'Baru', '350 gram', 'Cuci mesin dengan air dingin, setrika suhu sedang.', 'Kemeja koko bergaya modern dengan potongan oversize yang nyaman dipakai untuk kegiatan formal maupun kasual. Material katun terasa sejuk dan tetap rapi digunakan sepanjang hari.', 'M,L,XL', '#E8E0D5,#3B5998', 'prod_6a3655dc50771.jpg', '2026-06-20 08:57:00', NULL, 1),
(17, 'Setelan Casual Wanita Motif Garis', 'Fashion', 269000, 18, 'Linen Cotton', 'Baru', '520 gram', 'Cuci manual atau mesin dengan mode lembut.', 'Setelan atasan dan celana panjang dengan motif garis yang memberikan tampilan santai namun tetap elegan. Material linen cotton nyaman dipakai di cuaca tropis dan cocok digunakan untuk aktivitas harian.', 'S,M', '#7B8B6F,#FFFFFF,#3B5998', 'prod_6a3656104e778.jpg', '2026-06-20 08:57:52', NULL, 4),
(18, 'Celana Jeans Skinny Fit Pria', 'Fashion', 249000, 21, 'Denim Stretch', 'Baru', '600 gram', 'Cuci terbalik menggunakan air dingin agar warna tetap awet.', 'Celana jeans skinny fit dengan bahan stretch yang nyaman dipakai sepanjang hari. Mudah dipadukan dengan kaos maupun kemeja sehingga cocok untuk berbagai kesempatan.', 'S,M', '#FFFFFF', 'prod_6a36564c35cea.jpg', '2026-06-20 08:58:52', NULL, 1),
(19, 'Celana High Waist Wanita Formal', 'Fashion', 199000, 21, 'Polyester Premium', 'Baru', '430 gram', 'Cuci manual atau dry clean untuk hasil terbaik.', 'Celana high waist dengan potongan lurus yang memberikan tampilan elegan dan profesional. Cocok dipakai untuk bekerja, acara formal, maupun gaya smart casual.', 'S,M,L', '#C4916A,#2C2C2C', 'prod_6a3656846dfd8.jpg', '2026-06-20 08:59:48', NULL, 1),
(20, 'Celana Jeans Wide Leg Wanita', 'Fashion', 259000, 18, 'Denim Cotton', 'Baru', '650 gram', 'Cuci dengan air dingin dan hindari pemutih.', 'Celana jeans wide leg dengan desain modern yang memberikan kesan stylish dan nyaman digunakan. Potongan longgar membuat ruang gerak lebih leluasa serta cocok dipadukan dengan berbagai jenis atasan untuk tampilan kasual maupun semi formal.', 'S,M,L', '#3B5998', 'prod_6a3656bbd5198.jpg', '2026-06-20 09:00:43', NULL, 4),
(21, 'Celana Kulot Plisket Wanita Casual', 'Fashion', 189000, 15, 'Polyester Plisket Premium', 'Baru', '380 gram', 'Cuci manual atau mesin dengan mode lembut.', 'Celana kulot plisket dengan potongan wide leg yang nyaman digunakan untuk aktivitas sehari-hari. Dilengkapi karet pinggang elastis dan tali serut sehingga pas dipakai. Bahannya ringan, jatuh, dan tidak mudah kusut.', 'S,M', '#2C2C2C,#7B8B6F,#FFFFFF', 'prod_6a365731955a2.jpg', '2026-06-20 09:02:41', NULL, 7),
(22, 'Jam Tangan Analog Lorenzo Classic', 'Aksesoris', 259000, 16, 'Stainless Steel Case, Silicone Strap, Mineral Glass', 'Baru', '180 gram', 'Bersihkan menggunakan kain microfiber dan hindari benturan keras.', 'Jam tangan analog dengan desain minimalis dan elegan yang cocok digunakan untuk acara formal maupun kasual. Strap silikon nyaman dipakai sepanjang hari dengan tampilan modern.', 'S,M', '#2C2C2C', 'prod_6a365796727bf.jpg', '2026-06-20 09:04:22', NULL, 6),
(23, 'Jam Tangan Digital Sport Outdoor', 'Aksesoris', 179000, 19, 'ABS Resin, Silicone Strap', 'Baru', '160 gram', 'Lap menggunakan kain kering setelah terkena air.', 'Jam tangan digital bergaya outdoor dengan tampilan sporty. Memiliki fitur penunjuk waktu digital, alarm, stopwatch, dan desain yang kokoh sehingga cocok digunakan untuk aktivitas harian maupun olahraga.', 'S,M', '#C4916A', 'prod_6a3657c0e769f.jpg', '2026-06-20 09:05:04', NULL, 3),
(24, 'Jam Tangan Analog SKMEI Waterproof', 'Aksesoris', 229000, 19, 'Alloy Case, Silicone Strap, Mineral Glass', 'Baru', '170 gram', 'Bersihkan menggunakan kain lembut dan simpan di tempat kering.', 'Jam tangan analog dengan desain elegan dan modern yang cocok digunakan sehari-hari. Strap silikon nyaman dipakai dan desainnya mudah dipadukan dengan berbagai gaya berpakaian.', 'S', '#2C2C2C', 'prod_6a3657ef81ec0.jpg', '2026-06-20 09:05:51', NULL, 3),
(25, 'Jam Tangan Digital Sport Square', 'Aksesoris', 215000, 21, 'ABS Plastic, Silicone Strap', 'Baru', '165 gram', 'Lap menggunakan kain microfiber dan hindari benturan keras.', 'Jam tangan digital bergaya modern dengan layar persegi yang mudah dibaca. Cocok digunakan untuk aktivitas sehari-hari maupun olahraga ringan dengan desain simpel dan ringan.', 'XS,S,M,L,XL,XXL', '#C4916A,#2C2C2C', 'prod_6a36581f89e88.jpg', '2026-06-20 09:06:39', NULL, 1),
(26, 'Kemeja Koko Pria Lengan Pendek Premium', 'Fashion', 239000, 11, 'Katun Premium', 'Baru', '340 gram', 'Cuci menggunakan air dingin dan setrika suhu sedang.', 'Kemeja koko pria dengan desain modern dan potongan regular fit yang nyaman digunakan untuk ibadah maupun aktivitas formal. Material katun terasa adem, lembut, dan nyaman dipakai sepanjang hari.', 'M,L,XL,XXL', '#2C2C2C,#FFFFFF,#3B5998', 'prod_6a3658611e2b6.webp', '2026-06-20 09:07:45', NULL, 11),
(28, 'Elegant Mini Handbag Black', 'Tas', 189000, 17, 'Premium PU Leather', 'Baru', '480 gram', 'Bersihkan dengan kain lembut yang sedikit lembab, hindari paparan sinar matahari langsung dalam waktu lama', 'Tas tangan wanita dengan desain minimalis dan elegan yang cocok untuk berbagai acara formal maupun kasual. Dilengkapi aksen pengunci metal premium yang memberikan kesan mewah dan modern. Ukurannya praktis untuk membawa kebutuhan penting seperti dompet, ponsel, kosmetik, dan aksesori lainnya.', 'XS,S,M,L,XL,XXL', '#2C2C2C', 'prod_6a3bd44d63665.jpg', '2026-06-24 12:57:49', NULL, 3),
(29, 'Quilted Chain Shoulder Bag', 'Tas', 259000, 16, 'Quilted Synthetic Leather & Metal Chain Strap', 'Baru', '650 gram', 'Lap dengan kain microfiber, simpan dalam dust bag saat tidak digunakan', 'Tas selempang wanita dengan motif quilted klasik yang memberikan tampilan fashionable dan berkelas. Dilengkapi tali rantai metal yang kuat dan nyaman digunakan. Cocok untuk melengkapi gaya sehari-hari, acara santai, maupun acara spesial. Memiliki ruang penyimpanan yang cukup untuk membawa barang-barang esensial dengan tetap tampil stylish.', 'S,M,L,XL,XXL', '#E8E0D5,#7B8B6F,#3B5998', 'prod_6a3bd48cbc16b.webp', '2026-06-24 12:58:52', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_produk` int NOT NULL,
  `id_pesanan` int NOT NULL,
  `rating` tinyint NOT NULL,
  `komentar` text,
  `dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nama_depan` varchar(50) NOT NULL,
  `nama_belakang` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `promo_email` tinyint NOT NULL DEFAULT '0',
  `role` enum('customer','admin') NOT NULL DEFAULT 'customer',
  `terdaftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('aktif','diblokir') NOT NULL DEFAULT 'aktif',
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_produk` int NOT NULL,
  `dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_cart` (`id_user`,`id_produk`,`ukuran`,`warna`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pesanan_item`
--
ALTER TABLE `pesanan_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ulasan` (`id_user`,`id_produk`,`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_wishlist` (`id_user`,`id_produk`),
  ADD KEY `id_produk` (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan_item`
--
ALTER TABLE `pesanan_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pesanan_item`
--
ALTER TABLE `pesanan_item`
  ADD CONSTRAINT `pesanan_item_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pesanan_item_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulasan_ibfk_3` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
