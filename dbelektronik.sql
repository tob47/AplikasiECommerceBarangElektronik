-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 30, 2013 at 12:41 
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbelektronik`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'dadang@yahoo.com', '085123456789', 'admin', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `hubungi`
--

CREATE TABLE IF NOT EXISTS `hubungi` (
  `id_hubungi` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_hubungi`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=35 ;

--
-- Dumping data for table `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `nama`, `email`, `subjek`, `pesan`, `tanggal`) VALUES
(34, 'dadang tes', 'dadang@yahoo.com', 'tes pesan', 'tes pesan sodara sodara', '2013-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `kategori_seo`) VALUES
(17, 'Video', 'video'),
(16, 'Audio', 'audio'),
(15, 'Video Games', 'video-games'),
(14, 'Air Conditioner', 'air-conditioner'),
(18, 'TV', 'tv');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `id_kota` int(3) NOT NULL AUTO_INCREMENT,
  `id_perusahaan` int(10) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL,
  PRIMARY KEY (`id_kota`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `id_perusahaan`, `nama_kota`, `ongkos_kirim`) VALUES
(5, 5, 'Jakarta', 15000),
(6, 6, 'Bandung', 15000),
(7, 5, 'Surabaya', 13000),
(8, 5, 'Semarang', 17500),
(9, 6, 'Medan', 20000),
(10, 6, 'Aceh', 25000),
(11, 6, 'Banjarmasin', 17500);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(5) NOT NULL AUTO_INCREMENT,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status` enum('user','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `urutan` int(5) NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=64 ;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `static_content`, `gambar`, `status`, `aktif`, `urutan`) VALUES
(18, 'Tambah Produk', '?module=produk', '', '', 'admin', 'Y', 5),
(42, 'Lihat Order Masuk', '?module=order', '', '', 'admin', 'Y', 8),
(10, 'Manajemen Modul', '?module=modul', '', '', 'admin', 'Y', 19),
(31, 'Tambah Kategori Produk', '?module=kategori', '', '', 'admin', 'Y', 4),
(43, 'Edit Profil', '?module=profil', '<p class="MsoNormal">\r\n<!--[if gte mso 9]><xml>\r\n<w:WordDocument>\r\n<w:View>Normal</w:View>\r\n<w:Zoom>0</w:Zoom>\r\n<w:Compatibility>\r\n<w:BreakWrappedTables/>\r\n<w:SnapToGridInCell/>\r\n<w:WrapTextWithPunct/>\r\n<w:UseAsianBreakRules/>\r\n</w:Compatibility>\r\n<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n</w:WordDocument>\r\n</xml><![endif]-->\r\n<!--\r\n/* Style Definitions */\r\np.MsoNormal, li.MsoNormal, div.MsoNormal\r\n{mso-style-parent:"";\r\nmargin:0cm;\r\nmargin-bottom:.0001pt;\r\nmso-pagination:widow-orphan;\r\nfont-size:12.0pt;\r\nfont-family:"Times New Roman";\r\nmso-fareast-font-family:"Times New Roman";}\r\n@page Section1\r\n{size:612.0pt 792.0pt;\r\nmargin:72.0pt 90.0pt 72.0pt 90.0pt;\r\nmso-header-margin:35.4pt;\r\nmso-footer-margin:35.4pt;\r\nmso-paper-source:0;}\r\ndiv.Section1\r\n{page:Section1;}\r\n-->\r\n<!--[if gte mso 10]>\r\n<style>\r\n/* Style Definitions */\r\ntable.MsoNormalTable\r\n{mso-style-name:"Table Normal";\r\nmso-tstyle-rowband-size:0;\r\nmso-tstyle-colband-size:0;\r\nmso-style-noshow:yes;\r\nmso-style-parent:"";\r\nmso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\nmso-para-margin:0cm;\r\nmso-para-margin-bottom:.0001pt;\r\nmso-pagination:widow-orphan;\r\nfont-size:10.0pt;\r\nfont-family:"Times New Roman";}\r\n</style>\r\n<![endif]--><font size="2">Buana Elektronik adalah toko elektronik online, yang menyediakan segala kebutuhan barang-barang elektronik anda. Buana elektronik&nbsp;</font><font size="2">ingin memberikan kemudahan kepada para calon pembeli, cara santai, mudah dan hemat dalam berbelanja barang elektronik berkualias dengan harga yang terjangkau.\r\n</font>\r\n</p>\r\n<p class="MsoNormal">\r\n<font size="2">Karena itulah website ini dibuat sedemikian sederhananya sehingga diharapkan dapat membantu para pengunjung untuk dapat menelusuri produk-produk yang ditawarkan secara lebih mudah.<br />\r\n</font>\r\n</p>\r\n<p class="MsoNormal">\r\n<font size="2">Selain melayani pesanan produk-produk yang ada di toko online, kami menerima pembelian secara offline dengan datang ke toko kami yang ada di Jl. Singaparna No.99 Tasikmalaya.<br />\r\n</font>\r\n</p>\r\n<p class="MsoNormal">\r\n<font size="2">Akhirnya, kami mengucapkan terima kasih atas kunjungan anda di Buana Elektronik.</font>\r\n</p>\r\n', '12sfhijau.jpg', 'admin', 'Y', 7),
(44, 'Lihat Pesan Masuk', '?module=hubungi', '', '', 'admin', 'Y', 9),
(45, ' Edit Cara Pembelian', '?module=carabeli', '<ol>\r\n	<li>Klik pada tombol&nbsp;<span style="font-weight: bold">Beli</span> pada produk yang ingin Anda pesan.</li>\r\n	<li>Produk yang Anda pesan akan masuk ke dalam <span style="font-weight: bold">Keranjang Belanja</span>. Anda dapat melakukan perubahan jumlah produk yang diinginkan dengan mengganti angka di kolom <span style="font-weight: bold">Jumlah</span>, kemudian klik tombol <span style="font-weight: bold">Update</span>. Sedangkan untuk menghapus sebuah produk dari Keranjang Belanja, klik tombol Kali yang berada di kolom paling kanan.</li>\r\n	<li>Jika sudah selesai, klik tombol <span style="font-weight: bold">Selesai Belanja</span>, maka akan tampil form untuk pengisian data kustomer/pembeli.</li>\r\n	<li>Setelah data pembeli selesai diisikan, klik tombol <span style="font-weight: bold">Proses</span>, maka akan tampil data pembeli beserta produk yang dipesannya (jika diperlukan catat nomor ordernya). Dan juga ada total pembayaran serta nomor rekening pembayaran.</li>\r\n	<li>Apabila telah melakukan pembayaran, maka produk/barang akan segera kami kirimkan. <br />\r\n	</li>\r\n</ol>\r\n', 'gedung.jpg', 'admin', 'Y', 10),
(48, 'Edit Ongkos Kirim', '?module=ongkoskirim', '', '', 'user', 'Y', 11),
(49, 'Ganti Password', '?module=password', '', '', 'user', 'Y', 1),
(52, 'Lihat Laporan Transaksi', '?module=laporan', '', '', 'user', 'Y', 14),
(56, 'Edit Jasa Pengiriman', '?module=jasapengiriman', '', 'hai.jpg', 'user', 'Y', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id_orders` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kustomer` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kota` int(3) NOT NULL,
  PRIMARY KEY (`id_orders`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=46 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `nama_kustomer`, `alamat`, `telpon`, `email`, `status_order`, `tgl_order`, `jam_order`, `id_kota`) VALUES
(45, 'Dadang', 'Singaparna', '123456', 'dadang@yahoo.com', 'Lunas/Terkirim', '2013-03-30', '12:32:29', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `id_produk`, `jumlah`) VALUES
(45, 16, 1),
(45, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
  `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL,
  PRIMARY KEY (`id_orders_temp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders_temp`
--


-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `produk_seo` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  `diskon` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_produk`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `produk_seo`, `deskripsi`, `harga`, `stok`, `berat`, `tgl_masuk`, `gambar`, `dibeli`, `diskon`) VALUES
(1, 15, 'SONY PLAYSTATION PS2 SLIM BLACK', 'sony-playstation-ps2-slim-black', 'Type Game pad - ExternalConnectivity Technology WiredPointing Device / Manipulator Game padFeatures Pressure sensitivity , VibrationConnector Type : 2 x Game controller , 2 x USB ( 4 pin USB Type A ) , 1 x Network ( RJ-45 ) , 1 x Phone line ( RJ-11 ) , 1 x PlayStation 2 AV output , 1 x SPDIF output ( TOSLINK ) , 1 x DC power inputExpansion Slots Total (Free) ( 2 ) , 2 Memory\r\n', 1305000, 3, '1.00', '2013-03-30', '9ps2.jpg', 1, 0),
(2, 15, 'SONY PLAYSTATION PS3 BLACK', 'sony-playstation-ps3-black', '<div>\r\n160GB HDD\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nGeneralConsole dimensions (approx.) (W/H/D) 290 x 65 x 290 mmConsole mass (approx.) 3.2 kgCPU Cell Broadband Engine&trade;GPU RSXSound Dolby Digital Plus / Dolby Digital 5.1ch / DTS 5.1ch / LPCM 7.1ch / AAC / etcMemory 256MB XDR Main RAM / 256MB GDDR3 VRAMWireless Controller (Bluetooth) YESBD/DVD/CD Driver (Read Only) BD 2x (BD-ROM) / DVD 8x (DVD-ROM) / CD 24x (CD-ROM)BRAVIA Sync YesHDD2.5&rsquo; Serial ATA 120GBInputs / OutputsUSB 2.0 YES ( x 2 )CommunicationEthernet YES ( x 1 / 10BASE-T, 100BASE-TX, 1000BASE-T )IEEE 802.11b/g YESBluetooth 2.0 (EDR) YESAV OuputScreen Size 480i / 480p / 576i / 576p / 720p / 1080i / 1080pHDMI Ouput YES ( x 1 / HDMI Compatible with Ver1.3a Deep Color and x.v.Color (xvYCC) )AV Multi Output YES ( x 1 )Digital Output YES ( x 1 )\r\n</div>\r\n', 3000000, 2, '1.00', '2013-03-30', '75ps3.jpg', 1, 0),
(3, 15, 'SONY PLAYSTATION PS3 WHITE', 'sony-playstation-ps3-white', 'GeneralConsole dimensions (approx.) (W/H/D) 290 x 65 x 290 mmConsole mass (approx.) 3.2 kgCPU Cell Broadband Engine&trade;GPU RSXSound Dolby Digital Plus / Dolby Digital 5.1ch / DTS 5.1ch / LPCM 7.1ch / AAC / etcMemory 256MB XDR Main RAM / 256MB GDDR3 VRAMWireless Controller (Bluetooth) YESBD/DVD/CD Driver (Read Only) BD 2x (BD-ROM) / DVD 8x (DVD-ROM) / CD 24x (CD-ROM)BRAVIA Sync YesHDD2.5&rsquo; Serial ATA 120GBInputs / OutputsUSB 2.0 YES ( x 2 )CommunicationEthernet YES ( x 1 / 10BASE-T, 100BASE-TX, 1000BASE-T )IEEE 802.11b/g YESBluetooth 2.0 (EDR) YESAV OuputScreen Size 480i / 480p / 576i / 576p / 720p / 1080i / 1080pHDMI Ouput YES ( x 1 / HDMI Compatible with Ver1.3a Deep Color and x.v.Color (xvYCC) )AV Multi Output YES ( x 1 )Digital Output YES ( x 1 )\r\n', 3000000, 2, '1.00', '2013-03-30', '2PS3 WHITE.jpeg', 1, 0),
(4, 15, 'SONY PLAYSTATION PSP BLUE', 'sony-playstation-psp-blue', '<div>\r\nCPU PSP CPU (System clock frequency 1-333MHz)\r\n</div>\r\n<div>\r\nLCD Screen 4.3 inches (16:9) full-transparent type, TFT drive Approximately 16,770,000 colours displayed\r\n</div>\r\n<div>\r\nSound Built-in stereo speakers\r\n</div>\r\n<div>\r\nInternal disc drive Read-only UMD&trade; drive\r\n</div>\r\n<div>\r\nMain Input / Out put Wireless Network (IEEE 802.11b) (Wi-Fi) Hi-Speed USB (mini-B) Memory Stick PRO Duo&trade; / Analog Video Out / Microphone\r\n</div>\r\n<div>\r\nMain Interface DC IN 5V connector / DC OUT connector Video / Earphone / Microphone terminals USB Slot / Memory Stick Duo&trade; Slot\r\n</div>\r\n', 1753000, 3, '1.00', '2013-03-30', '57PSP_BLUE.jpeg', 1, 0),
(5, 18, 'SONY KLV40BX450', 'sony-klv40bx450', '<div>\r\nLCD TV 40&quot;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nTV System Analog: B/G, D/K, I, M\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nColour System NTSC 3.58, NTSC 4.43, PAL, SECAM\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nVideo Signal 480/60i, 480/60p, 576/50i, 576/50p, 720/50p, 720/60p,\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n1080/50i, 1080/60i, 1080/24p (HDMI&trade; only), 1080/50p (HDMI&trade; /\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nComponent), 1080/60p (HDMI&trade; / Component)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nDisplay Resolution Full HD\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nVideo Processing BRAVIA Engine&trade; 3\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nBacklight Module CCFL\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nIntelligent Picture Intelligent Picture Plus\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nDigital Noise Reduction\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nMPEG Noise Reduction\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nAdvanced Contrast Enhancer (ACE)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n24p True Cinema&trade;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nViewing Angle 178&deg; (Right/Left), 178&deg; (Up/Down)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nScreen Format TV: Full/ Normal/ Wide Zoom/ Zoom\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPicture Mode Vivid/ Standard/ Custom/ Cinema/ Photo/ Sports/ Game/\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nGraphics\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nCineMotion/Film Mode/Cinema Drive\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n3D Comb Filter\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nBass Booster&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSound Mode Dynamic / Standard / Clear Voice\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSurround Mode Cinema / Music / Sports / Game\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nDolby&reg; Digital\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSimulated Stereo\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nStereo System NICAM/ A2\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nAudio Output Power 8W + 8W\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nHDMI&trade; / Audio In 2 Rear\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nUSB 2.0 1 (Side)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nComposite Video Input(s) 1 (Rear/ Hybrid with Component)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nComponent Video (Y/Pb/Pr) Input(s) 1 (Rear/ Hybrid)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nRF Connection Input(s) 1 (Rear)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nHD15 PC Input / Audio\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nAnalog Audio Input(s) 3 (1 Side/ 2 Rear)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nAudio Out 1 (Side/ Hybrid)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nHeadphone Out 1 (Side/ Hybrid)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nBRAVIA Sync\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nFM Radio\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nControl for HDMI (HDMI CEC)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nUSB Play\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPicture Frame Mode\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nScene Select Photo/ Music/ Cinema/ Game/ Graphics/ Sports\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nParental Control\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSleep Timer\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nTeletext Yes (1000 pages)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPAP (Picture And Picture) PAP (Fixed)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPIP (Picture In Picture)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nOSD Language English, Simplified Chinese, French, Russian, Arabic,\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPersian, Thai, Vietnamese, Portuguese, Swahili, Indonesian\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nEco Features\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nDynamic Backlight Control\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nBacklight Off Mode\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPackaging Materials Recycled Carton (more than 70%)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPower Requirements AC 110-240V, 50/60Hz\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPower Consumption Approx. 121.84W (In operation)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nStandby Power Consumption Approx. 0.20W or Less\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nDimensions (W x H x D) with Stand Approx. 980 x 639 x 220 mm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nDimensions (W x H x D) without Stand Approx. 980 x 601 x 94(90) mm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nWeight with Stand Approx. 14.0kg\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nWeight without Stand Approx. 13.2kg\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSupplied Accessories\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nRemote Control RM-GA021\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nBatteries 2 x AA\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nFREE WALL BRACKET ( S/D 31 MAR 2013 )\r\n</div>\r\n', 4600000, 3, '3.00', '2013-03-30', '56sony.jpg', 1, 0),
(6, 18, 'LG 22LS2100', 'lg-22ls2100', '<div>\r\nLED TV 22&quot;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nFull HD ( 1920 X 1080)\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nMega Contrast Ratio 50.000 : 1\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nResponse Time 5ms\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nIPS Panel\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nAudio Output 7W x 2\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nUSB 2.0 Port\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nHDMI Input\r\n</div>\r\n', 1449000, 5, '3.00', '2013-03-30', '43LG 22LS2100.jpg', 1, 0),
(7, 18, 'LG 32LM3410', 'lg-32lm3410', '<div>\r\nFEATURES\r\n</div>\r\n<div>\r\n3D Yang Nyaman\r\n</div>\r\n<div>\r\n3D Bebas Kedipan\r\n</div>\r\n<div>\r\nKonversi 2D ke 3D\r\n</div>\r\n<div>\r\nFPR 3D Panel\r\n</div>\r\n<div>\r\nMCI 100\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSPECIFICATION\r\n</div>\r\n<div>\r\nDisplay Type LED TV\r\n</div>\r\n<div>\r\nScreen Size ( Inch ) 32\r\n</div>\r\n<div>\r\nBroadcasting Digital Yes\r\n</div>\r\n<div>\r\nResolution 1366x768\r\n</div>\r\n<div>\r\nBLU Type (Backlight ) LED\r\n</div>\r\n<div>\r\nMotion Clarity Index (MCI) MCI 100\r\n</div>\r\n<div>\r\nIPS\r\n</div>\r\n<div>\r\nResponse Time(MPRT) 10ms\r\n</div>\r\n<div>\r\nPicture Status Mode 8 Modes (Vivid/Standard/Natural/Cinema/Sports/Game/Expert 1/Expert 2)\r\n</div>\r\n<div>\r\nPicture Wizard II Yes\r\n</div>\r\n<div>\r\nMono/Stereo/Dual (MTS/SAP) Yes/Yes/Yes\r\n</div>\r\n<div>\r\nDolby Digital Decoder Yes\r\n</div>\r\n<div>\r\nSpeaker System 1 Way 2 Speakers\r\n</div>\r\n<div>\r\nSurround System Infinite Surround\r\n</div>\r\n<div>\r\nAudio Output 5W+5W\r\n</div>\r\n<div>\r\nClear Voice II Yes\r\n</div>\r\n<div>\r\nSound Mode 5 Modes (Music/Cinema/Sport/Game/Standard)\r\n</div>\r\n<div>\r\n3D Type (SG/FPR/AR/GPR/Non-Glass) FPR\r\n</div>\r\n<div>\r\n2D to 3D/3D to 2D Convert Yes\r\n</div>\r\n<div>\r\n3D Depth Control Yes\r\n</div>\r\n<div>\r\nView Point Control Yes\r\n</div>\r\n<div>\r\nDual Play / 3D Yes\r\n</div>\r\n<div>\r\nSIMPLINK (HDMI CEC) Yes\r\n</div>\r\n<div>\r\nUSB 2.0 1\r\n</div>\r\n<div>\r\nRF In 1\r\n</div>\r\n<div>\r\nAV In 1 (Public)\r\n</div>\r\n<div>\r\nComponent in (Y,Pb,Pr) + Audio 1 (Composite Public)\r\n</div>\r\n<div>\r\nHDMI/HDCP Input 1 - ARC X\r\n</div>\r\n<div>\r\nVoltage, Hz 100 ~ 240V 50/60Hz\r\n</div>\r\n<div>\r\nStandby (Stand by mode) 0.3W\r\n</div>\r\n<div>\r\nWeight (Kg)\r\n</div>\r\n<div>\r\nSET(w/ostand) 8.0\r\n</div>\r\n<div>\r\nIncluded stand 9.5\r\n</div>\r\n<div>\r\nDimension(WxHxD) (mm)\r\n</div>\r\n<div>\r\nSET 795x504x73.5\r\n</div>\r\n<div>\r\nIncluded stand 795x566x207\r\n</div>\r\n<div>\r\nFREE 4 PCS KACAMATA + WALL BRACKET ( PRINCIPAL REIMBURSE S/D 31 MAR 2013 )\r\n</div>\r\n', 3819000, 2, '3.00', '2013-03-30', '11cinema 3d.jpg', 1, 0),
(8, 18, 'LG 47LM4610', 'lg-47lm4610', '<div>\r\nLED 3D TV 47&quot;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nFULL HD ( 1920 X 1080 )\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nDynamic MCI\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nResponse Time 6ms\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nLGD IPS Panel Type\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n24p Real Cinema\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nAudio Output 10W X 2\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nClear Voice II\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nInvisible Speaker\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nUSB 2.0 ( MP3 / JPEG / HD DivX )\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nUSB Cloning\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSmart Energy Saving\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nHDMI / Component / RGB / AV / LAN Input\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nDigital Audio Out ( Optical )\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\ne-Streamer\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\ne-Manual\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nIntelligent Sensor\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nFREE 4 PCS KACAMATA + EXTERNAL HARD DISK 500GB ( PRINCIPAL REIMBURSE S/D 31 MAR 2013 ) + BLURAY PLAYER ( S/D 31 MAR 2013 )\r\n</div>\r\n', 10649000, 3, '3.00', '2013-03-30', '17LG 47LM4610.jpg', 1, 0),
(9, 17, 'LG BP125', 'lg-bp125', '<div>\r\nBLU-RAY DISC PLAYBACK\r\n</div>\r\n<div>\r\nUSB CONTENTS PLAYBACK\r\n</div>\r\n<div>\r\nEXTERNAL HDD PLAYBACK\r\n</div>\r\n<div>\r\nHD GRADE MOVIE FILE PLAYBACK\r\n</div>\r\n<div>\r\nHDMI INPUT\r\n</div>\r\n<div>\r\nAUDIO OUT COAXIAL\r\n</div>\r\n', 629000, 3, '2.00', '2013-03-30', '77BP125.jpg', 1, 0),
(10, 17, 'PHILIPS BDP2600', 'philips-bdp2600', '<div>\r\n&middot; DivX Plus HD Certified\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n&middot; Dolby TrueHD and DTS-HD MA\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n&middot; 1080p at 24 fps\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n&middot; Subtitle Shift\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n&middot; HDMI\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n&middot; Digital coaxial out\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nFREE KABEL HDMI ( S/D 30 APRIL 2013 )\r\n</div>\r\n', 1089000, 4, '2.00', '2013-03-30', '56BDP2600.jpeg', 1, 0),
(11, 17, 'SAMSUNG BDE5900', 'samsung-bde5900', '<div>\r\n&bull; &nbsp; &nbsp;3D Blu-ray Player\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Wireless Lan Built-in\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Smart Content\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;LED Front Display\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;BD Wise available\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;USB\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Ethernet available\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Wireless LAN Built-in available\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;AnyNet+ (HDMI - CEC) available\r\n</div>\r\n', 1699000, 3, '2.00', '2013-03-30', '91BDE5900.jpg', 1, 0),
(12, 17, 'SONY BDPS190', 'sony-bdps190', '<div>\r\nEndless Entertainment Possibilities.\r\n</div>\r\n<div>\r\nSony Entertainment Network\r\n</div>\r\n<div>\r\nWi-Fi Integrated\r\n</div>\r\n<div>\r\nWeb Browser\r\n</div>\r\n<div>\r\nDLNA\r\n</div>\r\n<div>\r\nContent Throw\r\n</div>\r\n<div>\r\nStylish and Compact Design\r\n</div>\r\n<div>\r\nHDMI\r\n</div>\r\n<div>\r\nUSB\r\n</div>\r\n<div>\r\nEthernet Port\r\n</div>\r\n<div>\r\nFull HD 1080p\r\n</div>\r\n', 1299000, 4, '2.00', '2013-03-30', '62samsung BDPS190.jpeg', 1, 0),
(13, 16, 'JBL CS5_1/230', 'jbl-cs5_1230', '<div>\r\nHIGH-PERFORMANCE DVD PLAYER/TUNER&nbsp;\r\n</div>\r\n<div>\r\nHDMI, composite, component and S-video output; Dolby&reg; Pro Logic&reg; ll and Dolby Digital audio processing; DVD-Audio, DVD, CD/VCD, MP3, MP4, Kodak&reg; Picture CD, JPEG, CD-R/RW and DVD-R/RW playback; USB 2.0 input; on-screen display; full-function universal remote\r\n</div>\r\n<div>\r\nPOWERED SUBWOOFER\r\n</div>\r\n<div>\r\n8&quot; 120W powered subwoofer with a 300W RMS 5.1-channel amplifier\r\n</div>\r\n<div>\r\nSPEAKER SYSTEM&nbsp;\r\n</div>\r\n<div>\r\nFour two-way satellites with 3&quot; woofers and 1/2&quot; titanium-laminate tweeters; one two-way center channel speaker with dual 3&quot; woofers and 1/2&quot; titanium tweeter, magnetically shielded for placement near video displays\r\n</div>\r\n', 7499000, 5, '4.00', '2013-03-30', '58CS5_1-230.jpg', 1, 0),
(14, 16, 'LG BH6320H', 'lg-bh6320h', '<div>\r\n&bull; &nbsp; &nbsp;3D Blu-ray 5.1 Home Cinema System 850 watt dengan Fitur LG Smart TV\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Full HD 3D Blu-ray&trade; Playback&nbsp;\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;LG Smart TV&nbsp;\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Bass Blast\r\n</div>\r\n', 2929000, 2, '4.00', '2013-03-30', '90BH6320H.jpg', 1, 0),
(15, 16, 'ONKYO HTX22HDX', 'onkyo-htx22hdx', '<div>\r\n- Audio and 1080p video processing via HDMI&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- 3 HDMI inputs, 1 HDMI output&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- HDMI v1.4a to support 3D and Audio Return Channel&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Supports Dolby&reg; TrueHD, DTS-HD Master Audio&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Deep Color, x.v.Color, LipSync&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- CEC compatible&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- VLSC (Vector Linear Shaping Circuitry)&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Burr-Brown 192 kHz/24-Bit DACs (PCM1690) for All Channels&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Jitter-Cleaning Circuit Technology&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Overlaid On-Screen Display (OSD) via HDMI&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- EX.Bass for Deeper, More Dynamic Bass&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- 3 DSP Modes: Rock, Sports, Action (plus RPG in the 5.1 system only)&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Theater-Dimensional Virtual Surround Function&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Music Optimizer for Compressed Digital Music Files&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Optimum Gain Volume Circuitry&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- CinemaFILTER&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Advanced 32-Bit Processing DSP Chip&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- 3 digital audio inputs (2 optical and 1 coaxial)&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- 2 stereo audio inputs (red/white RCAs)&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Auto Power On/Off Function&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- RIHD (Remote Interactive over HDMI) for System Control&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Compatible with RI (Remote Interactive) Dock for iPod&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Includes remote control&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- 16cm subwoofer driver&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Max input power: 40W&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Impedance: 6 Ohm&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Frequency response: 70 Hz - 20 kHz&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- Magnetically shielded&nbsp;\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\n- 8cm drivers&nbsp;\r\n</div>\r\n', 6099000, 2, '5.00', '2013-03-30', '48HTX22HDX.jpg', 1, 0),
(16, 16, 'LG BH9320H', 'lg-bh9320h', '<div>\r\n&bull; &nbsp; &nbsp;3D Sound Zooming Blu-ray 9.1 Home Cinema System 1125 watt dengan Fitur LG Smart TV\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Full HD 3D Blu-ray&trade; Playback\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;9.1 Speakers\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;360&deg; Reflector\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Sound Field Expansion\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;LG Smart TV\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;Wi-Fi Direct&trade;\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;LG Remote via Smartphone\r\n</div>\r\n<div>\r\n&bull; &nbsp; &nbsp;iPhone/iPod Playback &amp; Recharge\r\n</div>\r\n', 4379000, 2, '4.00', '2013-03-30', '70LG BH9320H.jpg', 2, 0),
(17, 14, 'CHANGHONG CSC05J', 'changhong-csc05j', '<div>\r\nRapid Cooling\r\n</div>\r\n<div>\r\nFreeze Prevention\r\n</div>\r\n<div>\r\nLED Display\r\n</div>\r\n<div>\r\nSleep Mode\r\n</div>\r\n<div>\r\n8-Hour ON of OFF Timer\r\n</div>\r\n<div>\r\nAuto Operation or Smart\r\n</div>\r\n<div>\r\nCooling Capacity 5500\r\n</div>\r\n<div>\r\nRated Input (W) 620\r\n</div>\r\n<div>\r\nVasionable curbe design\r\n</div>\r\n<div>\r\nFreeze Prevention\r\n</div>\r\n<div>\r\nLED Display\r\n</div>\r\n<div>\r\nFREE PIPA + SIKU ( S/D 30 APR 2013 )\r\n</div>\r\n', 1959000, 1, '3.00', '2013-03-30', '41CSC05J.jpg', 2, 0),
(18, 14, 'ELECTROLUX ESM12CRD', 'electrolux-esm12crd', '<div>\r\nLowwatt\r\n</div>\r\n<div>\r\n1.5PK\r\n</div>\r\n<div>\r\nHD Filter\r\n</div>\r\n<div>\r\nVitamin C filter\r\n</div>\r\n<div>\r\nBIO Filter\r\n</div>\r\n<div>\r\nHepa Filter\r\n</div>\r\n<div>\r\nActive Plasma\r\n</div>\r\n', 3599000, 2, '3.00', '2013-03-30', '61ESM12CRD.jpg', 1, 0),
(19, 14, 'DAIKIN FTKD25GVM', 'daikin-ftkd25gvm', '<div>\r\nFEATURES :\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nComfort AirFlow Mode\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nIndoor Unit Quiet Operation\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nIntelligence Eye\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nEcono Mode\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nMould-Proof Operation\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSPESIFICATION :\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nAC Single Split 1 PK\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nInverter Class\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nCooling Capacity 10.900 BTU\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nPower Consumption 725 Watt ( Stabil Condition )\r\n</div>\r\n', 3899000, 2, '3.00', '2013-03-30', '9FTKD35GVM.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_pengiriman`
--

CREATE TABLE IF NOT EXISTS `shop_pengiriman` (
  `id_perusahaan` int(10) NOT NULL AUTO_INCREMENT,
  `nama_perusahaan` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  PRIMARY KEY (`id_perusahaan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `shop_pengiriman`
--

INSERT INTO `shop_pengiriman` (`id_perusahaan`, `nama_perusahaan`, `gambar`) VALUES
(6, 'JNE', ''),
(5, 'TIKI', ''),
(7, 'POS EKSPRESS', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
