-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 31 May 2023, 09:46:37
-- Sunucu sürümü: 5.7.36
-- PHP Sürümü: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `osym_elmas_mengu`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alanlar`
--

DROP TABLE IF EXISTS `alanlar`;
CREATE TABLE IF NOT EXISTS `alanlar` (
  `alan_id` int(11) NOT NULL AUTO_INCREMENT,
  `alan_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`alan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `alanlar`
--

INSERT INTO `alanlar` (`alan_id`, `alan_ad`) VALUES
(1, 'Sayisal'),
(2, 'Esit_agirlik'),
(3, 'Sozel'),
(4, 'Dil'),
(5, 'BİLİŞİM');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `basari_yuzdesi`
--

DROP TABLE IF EXISTS `basari_yuzdesi`;
CREATE TABLE IF NOT EXISTS `basari_yuzdesi` (
  `basari_id` int(11) NOT NULL AUTO_INCREMENT,
  `yuzde` int(11) NOT NULL,
  `yil` year(4) NOT NULL,
  PRIMARY KEY (`basari_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `basari_yuzdesi`
--

INSERT INTO `basari_yuzdesi` (`basari_id`, `yuzde`, `yil`) VALUES
(1, 25, 2018),
(2, 50, 2019),
(3, 70, 2019),
(4, 75, 2018),
(5, 30, 2020),
(6, 55, 2021),
(7, 65, 2020),
(8, 60, 2022),
(9, 75, 2021),
(10, 35, 2018),
(11, 40, 2019),
(12, 60, 2022),
(13, 70, 2021),
(14, 80, 2020),
(15, 85, 2018),
(16, 10, 2019);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolumler`
--

DROP TABLE IF EXISTS `bolumler`;
CREATE TABLE IF NOT EXISTS `bolumler` (
  `bolum_id` int(11) NOT NULL AUTO_INCREMENT,
  `bolum_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `universite_id` int(11) NOT NULL,
  PRIMARY KEY (`bolum_id`),
  KEY `universite_id` (`universite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `bolumler`
--

INSERT INTO `bolumler` (`bolum_id`, `bolum_ad`, `universite_id`) VALUES
(1, 'BİLGİSAYAR MÜHENDİSLİĞİ', 6),
(2, 'HUKUK', 4),
(3, 'HEMŞİRELİK', 6),
(4, 'TIP', 1),
(5, 'TIP', 2),
(6, 'HEMŞİRELİK', 2),
(7, 'TIP', 2),
(8, 'PSİKOLOJİ', 6),
(9, 'SOSYOLOJİ', 2),
(10, 'İLETİŞİM', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dallar`
--

DROP TABLE IF EXISTS `dallar`;
CREATE TABLE IF NOT EXISTS `dallar` (
  `dal_id` int(11) NOT NULL AUTO_INCREMENT,
  `bolum_id` int(11) NOT NULL,
  `alan_id` int(11) NOT NULL,
  PRIMARY KEY (`dal_id`),
  KEY `alan_id` (`alan_id`),
  KEY `bolum_id` (`bolum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `dallar`
--

INSERT INTO `dallar` (`dal_id`, `bolum_id`, `alan_id`) VALUES
(1, 3, 1),
(2, 6, 1),
(3, 4, 1),
(4, 1, 1),
(5, 2, 2),
(6, 8, 2),
(7, 8, 2),
(8, 9, 2),
(9, 10, 3),
(10, 7, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dersler`
--

DROP TABLE IF EXISTS `dersler`;
CREATE TABLE IF NOT EXISTS `dersler` (
  `ders_id` int(11) NOT NULL AUTO_INCREMENT,
  `ders_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ogretmen_id` int(11) NOT NULL,
  `ogrenci_id` int(11) NOT NULL,
  PRIMARY KEY (`ders_id`),
  KEY `ogrenci_id` (`ogrenci_id`),
  KEY `ogretmen_id` (`ogretmen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `dersler`
--

INSERT INTO `dersler` (`ders_id`, `ders_ad`, `ogretmen_id`, `ogrenci_id`) VALUES
(1, 'MATEMATİK', 2, 8),
(2, 'FEN', 3, 8),
(3, 'TÜRKÇE', 4, 8),
(4, 'İNGİLİZCE', 5, 7),
(5, 'COĞRAFYA', 7, 5),
(6, 'TARİH', 2, 5),
(7, 'FİZİK', 4, 1),
(8, 'KİMYA', 1, 10),
(9, 'BİYOLOJİ', 10, 7),
(10, 'EDEBİYAT', 6, 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `diller`
--

DROP TABLE IF EXISTS `diller`;
CREATE TABLE IF NOT EXISTS `diller` (
  `dil_id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`dil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `diller`
--

INSERT INTO `diller` (`dil_id`, `dil_ad`) VALUES
(1, 'İNGİLİZCE'),
(2, 'TÜRKÇE'),
(3, 'FRANSIZCA'),
(4, 'İTALYANCA'),
(5, 'İSPANYOLCA'),
(6, 'ALMANCA'),
(7, 'ARAPÇA'),
(8, 'HİNTÇE'),
(9, 'RUSÇA'),
(10, 'ÇİNCE'),
(11, 'JAPONCA'),
(12, 'KORECE'),
(13, 'TAYCA'),
(14, 'URDUCA');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lisanlar`
--

DROP TABLE IF EXISTS `lisanlar`;
CREATE TABLE IF NOT EXISTS `lisanlar` (
  `lisan_id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL,
  `ogrenci_id` int(11) NOT NULL,
  `ogretmen_id` int(11) NOT NULL,
  PRIMARY KEY (`lisan_id`),
  KEY `dil_id` (`dil_id`),
  KEY `ogrenci_id` (`ogrenci_id`),
  KEY `ogretmen_id` (`ogretmen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `lisanlar`
--

INSERT INTO `lisanlar` (`lisan_id`, `dil_id`, `ogrenci_id`, `ogretmen_id`) VALUES
(1, 3, 8, 2),
(2, 3, 8, 2),
(3, 11, 7, 7),
(4, 3, 4, 7),
(5, 11, 7, 7),
(6, 11, 4, 5),
(7, 12, 5, 10),
(8, 3, 3, 1),
(9, 3, 2, 9),
(10, 1, 1, 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `liseler`
--

DROP TABLE IF EXISTS `liseler`;
CREATE TABLE IF NOT EXISTS `liseler` (
  `lise_id` int(11) NOT NULL AUTO_INCREMENT,
  `lise_tur` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`lise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `liseler`
--

INSERT INTO `liseler` (`lise_id`, `lise_tur`) VALUES
(1, 'DUZ'),
(2, 'FEN'),
(3, 'ANADOLU'),
(4, 'SUPER'),
(5, 'TEKNİK MESLEK');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenciler`
--

DROP TABLE IF EXISTS `ogrenciler`;
CREATE TABLE IF NOT EXISTS `ogrenciler` (
  `ogrenci_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `alan_id` int(11) NOT NULL,
  `lise_id` int(11) NOT NULL,
  `universite_id` int(11) NOT NULL,
  `basari_id` int(11) NOT NULL,
  PRIMARY KEY (`ogrenci_id`),
  KEY `lise_id` (`lise_id`),
  KEY `universite_id` (`universite_id`),
  KEY `alan_id` (`alan_id`),
  KEY `basari_id` (`basari_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ogrenciler`
--

INSERT INTO `ogrenciler` (`ogrenci_id`, `ad`, `soyad`, `alan_id`, `lise_id`, `universite_id`, `basari_id`) VALUES
(1, 'AYŞE', 'DERİN', 1, 3, 7, 16),
(2, 'SERRA', 'DEMİR', 4, 5, 4, 9),
(3, 'CENGİZ', 'GÜVEN', 1, 3, 2, 12),
(4, 'ZEYNEP', 'GÜRLER', 2, 5, 2, 11),
(5, 'SEVGİ', 'DENİZ', 1, 4, 2, 10),
(6, 'HASAN', 'TOLGA', 1, 4, 2, 10),
(7, 'OKTAY', 'VURAN', 3, 2, 2, 10),
(8, 'SEDA', 'AKMAN', 1, 3, 2, 10),
(9, 'SİMAY', 'KEKLİK', 3, 2, 7, 10),
(10, 'MERVE', 'SEVİN', 3, 1, 7, 10),
(11, 'FATMA', 'DAĞCI', 1, 2, 4, 14);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogretmenler`
--

DROP TABLE IF EXISTS `ogretmenler`;
CREATE TABLE IF NOT EXISTS `ogretmenler` (
  `ogretmen_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `alan_id` int(11) NOT NULL,
  PRIMARY KEY (`ogretmen_id`),
  KEY `alan_id` (`alan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ogretmenler`
--

INSERT INTO `ogretmenler` (`ogretmen_id`, `ad`, `soyad`, `alan_id`) VALUES
(1, 'NERMİN ', 'TEPE', 1),
(2, 'ESRA', 'ŞAKRAK', 1),
(3, 'ÖMER ', 'ASLANTEKİN', 1),
(4, 'SERKAN', 'MUTLU', 1),
(5, 'ÖZER ', 'ÜLENGİN', 1),
(6, 'ORHAN', 'SİLAY', 2),
(7, 'ÇİĞDEM', 'ASLANBAYRAK', 3),
(8, 'AHMET', 'ALKAN', 4),
(9, 'MESUT', 'ATİK', 1),
(10, 'ÖZGE', 'TÜR', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rektorluk`
--

DROP TABLE IF EXISTS `rektorluk`;
CREATE TABLE IF NOT EXISTS `rektorluk` (
  `rektorluk_id` int(11) NOT NULL AUTO_INCREMENT,
  `rektorluk_tur` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`rektorluk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `rektorluk`
--

INSERT INTO `rektorluk` (`rektorluk_id`, `rektorluk_tur`) VALUES
(1, 'DEVLET'),
(2, 'ÖZEL');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sehirler`
--

DROP TABLE IF EXISTS `sehirler`;
CREATE TABLE IF NOT EXISTS `sehirler` (
  `sehir_id` int(11) NOT NULL AUTO_INCREMENT,
  `sehir_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`sehir_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sehirler`
--

INSERT INTO `sehirler` (`sehir_id`, `sehir_ad`) VALUES
(1, 'İSTANBUL'),
(2, 'ANKARA'),
(3, 'BURSA'),
(4, 'MANİSA'),
(5, 'KONYA'),
(6, 'BALIKESİR'),
(7, 'İSTANBUL'),
(8, 'KOCAELİ'),
(9, 'TRABZON'),
(10, 'KAYSERİ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `seneler`
--

DROP TABLE IF EXISTS `seneler`;
CREATE TABLE IF NOT EXISTS `seneler` (
  `sene_id` int(11) NOT NULL AUTO_INCREMENT,
  `ogrenci_id` int(11) NOT NULL,
  `yil_id` int(11) NOT NULL,
  PRIMARY KEY (`sene_id`),
  KEY `ogrenci_id` (`ogrenci_id`),
  KEY `yil_id` (`yil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `seneler`
--

INSERT INTO `seneler` (`sene_id`, `ogrenci_id`, `yil_id`) VALUES
(1, 4, 2),
(2, 6, 2),
(3, 7, 2),
(4, 7, 1),
(5, 10, 2),
(6, 2, 6),
(7, 9, 2),
(8, 5, 7),
(9, 4, 2),
(10, 4, 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `universiteler`
--

DROP TABLE IF EXISTS `universiteler`;
CREATE TABLE IF NOT EXISTS `universiteler` (
  `universite_id` int(11) NOT NULL AUTO_INCREMENT,
  `universite_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sinav_id` int(11) NOT NULL,
  `sehir_id` int(11) NOT NULL,
  `rektorluk_id` int(11) NOT NULL,
  PRIMARY KEY (`universite_id`),
  KEY `sehir_id` (`sehir_id`),
  KEY `rektorluk_id` (`rektorluk_id`),
  KEY `sinav_id` (`sinav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `universiteler`
--

INSERT INTO `universiteler` (`universite_id`, `universite_ad`, `sinav_id`, `sehir_id`, `rektorluk_id`) VALUES
(1, 'İSTANBUL ÜNİVERSİTESİ', 4, 1, 1),
(2, 'ANKARA ÜNİVERSİTESİ', 5, 2, 1),
(3, 'GAZİ ÜNİVERSİTESİ', 7, 2, 1),
(4, 'ODTÜ', 5, 2, 1),
(6, 'CELAL BAYAR ÜNİVERSİTESİ', 3, 4, 1),
(7, 'MARMARA ÜNİVERSİTESİ', 6, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yillar`
--

DROP TABLE IF EXISTS `yillar`;
CREATE TABLE IF NOT EXISTS `yillar` (
  `yil_id` int(11) NOT NULL AUTO_INCREMENT,
  `yil` year(4) NOT NULL,
  PRIMARY KEY (`yil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yillar`
--

INSERT INTO `yillar` (`yil_id`, `yil`) VALUES
(1, 2018),
(2, 2018),
(3, 2020),
(4, 2021),
(5, 2019),
(6, 2020),
(7, 2021),
(8, 2019),
(9, 2018),
(10, 2018),
(11, 2019),
(12, 2020),
(13, 2022),
(14, 2022),
(15, 2021),
(16, 2022),
(17, 2019),
(18, 2019),
(19, 2018),
(20, 2020),
(21, 2020);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yok`
--

DROP TABLE IF EXISTS `yok`;
CREATE TABLE IF NOT EXISTS `yok` (
  `sinav_id` int(11) NOT NULL AUTO_INCREMENT,
  `sinav_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`sinav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yok`
--

INSERT INTO `yok` (`sinav_id`, `sinav_ad`) VALUES
(1, 'DGS'),
(2, 'ÖSYM'),
(3, 'KPSS'),
(4, 'ALES'),
(5, 'YDS'),
(6, 'YÖKDİL'),
(7, 'TUS'),
(8, 'EKYS');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `bolumler`
--
ALTER TABLE `bolumler`
  ADD CONSTRAINT `bolumler_ibfk_1` FOREIGN KEY (`universite_id`) REFERENCES `universiteler` (`universite_id`);

--
-- Tablo kısıtlamaları `dallar`
--
ALTER TABLE `dallar`
  ADD CONSTRAINT `dallar_ibfk_1` FOREIGN KEY (`alan_id`) REFERENCES `alanlar` (`alan_id`),
  ADD CONSTRAINT `dallar_ibfk_2` FOREIGN KEY (`bolum_id`) REFERENCES `bolumler` (`bolum_id`);

--
-- Tablo kısıtlamaları `dersler`
--
ALTER TABLE `dersler`
  ADD CONSTRAINT `dersler_ibfk_1` FOREIGN KEY (`ogrenci_id`) REFERENCES `ogrenciler` (`ogrenci_id`),
  ADD CONSTRAINT `dersler_ibfk_2` FOREIGN KEY (`ogretmen_id`) REFERENCES `ogretmenler` (`ogretmen_id`);

--
-- Tablo kısıtlamaları `lisanlar`
--
ALTER TABLE `lisanlar`
  ADD CONSTRAINT `lisanlar_ibfk_1` FOREIGN KEY (`dil_id`) REFERENCES `diller` (`dil_id`),
  ADD CONSTRAINT `lisanlar_ibfk_2` FOREIGN KEY (`ogrenci_id`) REFERENCES `ogrenciler` (`ogrenci_id`),
  ADD CONSTRAINT `lisanlar_ibfk_3` FOREIGN KEY (`ogretmen_id`) REFERENCES `ogretmenler` (`ogretmen_id`);

--
-- Tablo kısıtlamaları `ogrenciler`
--
ALTER TABLE `ogrenciler`
  ADD CONSTRAINT `ogrenciler_ibfk_1` FOREIGN KEY (`lise_id`) REFERENCES `liseler` (`lise_id`),
  ADD CONSTRAINT `ogrenciler_ibfk_2` FOREIGN KEY (`universite_id`) REFERENCES `universiteler` (`universite_id`),
  ADD CONSTRAINT `ogrenciler_ibfk_3` FOREIGN KEY (`alan_id`) REFERENCES `alanlar` (`alan_id`),
  ADD CONSTRAINT `ogrenciler_ibfk_4` FOREIGN KEY (`basari_id`) REFERENCES `basari_yuzdesi` (`basari_id`);

--
-- Tablo kısıtlamaları `ogretmenler`
--
ALTER TABLE `ogretmenler`
  ADD CONSTRAINT `ogretmenler_ibfk_1` FOREIGN KEY (`alan_id`) REFERENCES `alanlar` (`alan_id`);

--
-- Tablo kısıtlamaları `seneler`
--
ALTER TABLE `seneler`
  ADD CONSTRAINT `seneler_ibfk_1` FOREIGN KEY (`ogrenci_id`) REFERENCES `ogrenciler` (`ogrenci_id`),
  ADD CONSTRAINT `seneler_ibfk_2` FOREIGN KEY (`yil_id`) REFERENCES `yillar` (`yil_id`);

--
-- Tablo kısıtlamaları `universiteler`
--
ALTER TABLE `universiteler`
  ADD CONSTRAINT `universiteler_ibfk_1` FOREIGN KEY (`sehir_id`) REFERENCES `sehirler` (`sehir_id`),
  ADD CONSTRAINT `universiteler_ibfk_2` FOREIGN KEY (`rektorluk_id`) REFERENCES `rektorluk` (`rektorluk_id`),
  ADD CONSTRAINT `universiteler_ibfk_3` FOREIGN KEY (`sinav_id`) REFERENCES `yok` (`sinav_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
