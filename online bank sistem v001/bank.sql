-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-01-2024 a las 17:59:54
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bank`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `idAccount` int(4) NOT NULL,
  `idClient` int(3) NOT NULL,
  `accountNumber` int(10) NOT NULL,
  `withdrawalLimit` int(5) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `idTypeAccount` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`idAccount`, `idClient`, `accountNumber`, `withdrawalLimit`, `balance`, `idTypeAccount`) VALUES
(1, 1, 5108754, 128519718, '31832.00', 1),
(2, 2, 4966, 363196428, '985.00', 1),
(3, 3, 5048373, 192274286, '1484217.00', 1),
(4, 4, 504837, 579696684, '531162.00', 1),
(5, 5, 9491746, 782418235, '58236.00', 1),
(6, 6, 28543529, 71877107, '187.00', 2),
(7, 7, 516983820, 805688269, '71460.00', 2),
(8, 8, 51058496, 349221726, '2011.00', 2),
(9, 9, 2147483647, 348453967, '8292.00', 2),
(10, 10, 58366151, 824189895, '617736.00', 1),
(11, 11, 50434436, 414404885, '99999999.99', 1),
(12, 12, 5108785, 450742338, '4690.00', 1),
(13, 13, 56100456, 765599124, '0.00', 1),
(14, 14, 8374620, 366323149, '4303.00', 1),
(15, 15, 56075543, 134612282, '0.00', 2),
(16, 16, 760126886, 648052778, '99999999.99', 1),
(17, 17, 2225513, 332260591, '99999999.99', 2),
(18, 18, 33942, 473924204, '0.00', 1),
(19, 19, 87878, 403584893, '100.00', 1),
(20, 38, 987217, 903715778, '1000.00', 1),
(21, 21, 7753983, 702063403, '0.00', 2),
(22, 22, 2147483647, 189140593, '10000.00', 2),
(23, 23, 2147483647, 746312418, '100.00', 2),
(24, 24, 5108752, 552117116, '0.00', 1),
(25, 25, 51087225, 352677322, '10000.00', 2),
(26, 26, 504839300, 512564867, '0.00', 1),
(27, 27, 5056808, 707854836, '86242.00', 2),
(28, 28, 56577, 138985660, '18246.00', 1),
(29, 29, 482379, 80220417, '912127.00', 1),
(30, 30, 51828, 513495213, '0.00', 1),
(31, 31, 54289708, 625332303, '96374.00', 1),
(32, 32, 82338091, 903129466, '739582.00', 2),
(33, 33, 19877, 146029774, '90195.00', 2),
(34, 34, 3968287, 323317149, '99999999.99', 2),
(35, 35, 2752783, 816724149, '907827.00', 1),
(36, 36, 1087301, 410465176, '0.00', 1),
(37, 37, 779980, 540842426, '942.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cards`
--

CREATE TABLE `cards` (
  `idCard` int(4) NOT NULL,
  `idAccount` int(3) NOT NULL,
  `cardNumber` bigint(16) NOT NULL,
  `vendor` varchar(30) NOT NULL,
  `pin` int(5) DEFAULT NULL,
  `securityNumber` int(4) NOT NULL,
  `expirationDate` date NOT NULL,
  `validThru` date NOT NULL,
  `cardLimit` int(6) DEFAULT NULL,
  `idTypeCard` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cards`
--

INSERT INTO `cards` (`idCard`, `idAccount`, `cardNumber`, `vendor`, `pin`, `securityNumber`, `expirationDate`, `validThru`, `cardLimit`, `idTypeCard`) VALUES
(1, 23, 3633110016420922, 'visa-electron', 9219, 353, '2026-06-17', '2023-01-13', 1271, 2),
(2, 19, 5491317686902880, 'mastercard', 3628, 634, '2025-12-23', '2023-02-21', 33428, 1),
(3, 35, 816125422380843, 'visa-electron', 5444, 283, '2026-11-29', '2023-06-25', 646282, 2),
(4, 32, 3218950931543836, 'americanexpress', 4069, 172, '2024-11-11', '2023-10-17', 689559, 1),
(5, 33, 8663549077210657, 'americanexpress', 7615, 405, '2025-06-29', '2023-06-10', 792213, 1),
(6, 21, 9409419750122667, 'mastercard', 5341, 165, '2026-01-12', '2023-11-08', 627038, 1),
(7, 9, 1722932801961824, 'americanexpress', 4527, 758, '2024-11-17', '2023-05-22', 273620, 1),
(8, 10, 6850569006331349, 'americanexpress', 888, 492, '2024-03-22', '2023-10-03', 162046, 1),
(9, 3, 5727823128068485, 'mastercard', 6094, 67, '2025-06-19', '2023-09-23', 132461, 1),
(10, 14, 6684158979649866, 'visa-electron', 4372, 383, '2024-08-28', '2023-04-17', 337589, 2),
(11, 6, 6994784758998243, 'visa-electron', 5724, 203, '2026-06-16', '2023-03-14', 854667, 2),
(12, 7, 7114323645615461, 'visa-electron', 854, 680, '2024-04-02', '2023-08-09', 306780, 2),
(13, 35, 897332682807042, 'visa-electron', 2314, 36, '2025-12-10', '2023-04-05', 135236, 2),
(14, 2, 947673926955271, 'visa-electron', 6916, 746, '2026-12-31', '2023-06-02', 627406, 2),
(15, 20, 1210561025724274, 'americanexpress', 6293, 773, '2025-10-04', '2023-01-08', 941848, 1),
(16, 6, 3151748666811420, 'visa', 5659, 354, '2024-10-24', '2023-09-22', 569339, 1),
(17, 11, 9896473557271984, 'visa-electron', 4409, 950, '2025-07-10', '2023-03-20', 834334, 1),
(18, 16, 3610501073662570, 'visa', 6443, 293, '2026-10-23', '2023-06-15', 673088, 1),
(19, 15, 9019741903196818, 'visa-electron', 1207, 812, '2026-02-07', '2023-07-01', 182896, 1),
(20, 28, 2837459708993865, 'mastercard', 2535, 481, '2026-02-12', '2023-05-02', 535053, 1),
(21, 7, 4014766121700109, 'americanexpress', 2474, 653, '2025-02-05', '2023-06-08', 23953, 1),
(22, 9, 6665393716569812, 'visa', 5307, 226, '2025-01-08', '2023-09-20', 136189, 1),
(23, 20, 2284468102960872, 'americanexpress', 4814, 5, '2024-12-23', '2023-01-27', 619594, 1),
(24, 10, 5945837598669254, 'americanexpress', 6569, 276, '2024-03-02', '2023-03-25', 264855, 1),
(25, 6, 3997145124248347, 'mastercard', 8074, 614, '2024-09-07', '2023-03-11', 279703, 1),
(26, 19, 5252889987067076, 'visa', 4648, 511, '2024-12-25', '2023-10-12', 931955, 1),
(27, 17, 1169330366305077, 'visa', 4050, 748, '2026-04-19', '2023-05-09', 557232, 1),
(28, 6, 5029177333988558, 'americanexpress', 4230, 29, '2025-12-06', '2023-11-25', 58605, 1),
(29, 26, 2814570689632880, 'americanexpress', 4375, 459, '2026-06-08', '2023-07-20', 3352, 1),
(30, 33, 4712313129531466, 'americanexpress', 6641, 554, '2026-05-12', '2023-10-29', 301844, 1),
(31, 26, 3778031143974664, 'mastercard', 2038, 359, '2024-09-14', '2023-02-19', 307081, 1),
(32, 7, 3345774404165597, 'visa-electron', 2294, 654, '2026-04-07', '2023-06-19', 525405, 2),
(33, 16, 1210362794217605, 'americanexpress', 5249, 996, '2025-01-05', '2023-09-27', 527382, 1),
(34, 32, 922700440234366, 'mastercard', 2184, 839, '2026-03-26', '2023-03-13', 919628, 1),
(35, 24, 7745017452954432, 'mastercard', 4677, 958, '2026-07-07', '2023-05-20', 239902, 1),
(36, 26, 6212788031939597, 'visa-electron', 6832, 684, '2024-04-08', '2023-11-18', 938709, 1),
(37, 32, 385868259289276, 'visa-electron', 6251, 848, '2025-12-24', '2023-01-17', 45977, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `idClient` int(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `street` varchar(40) NOT NULL,
  `streetNumber` varchar(3) NOT NULL,
  `apartment` int(4) DEFAULT NULL,
  `floor` int(3) DEFAULT NULL,
  `state` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `country` enum('United States','Mexico','Canada','Brazil','Argentina','Uruguay','Chile') DEFAULT NULL,
  `identification` varchar(10) NOT NULL,
  `idLogIn` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`idClient`, `name`, `lastName`, `birthDate`, `email`, `phone`, `street`, `streetNumber`, `apartment`, `floor`, `state`, `city`, `country`, `identification`, `idLogIn`) VALUES
(1, 'Cortney', 'Carlin', '2022-04-27', 'ccarlin0@ameblo.jp', '634 516 7241', 'Oxford', '3', 1, 1, 'City', 'Nanganumba', '', '5216149015', 1),
(2, 'Fran', 'Salvatore', '2008-05-19', 'fsalvatore1@themeforest.net', '353 448 9417', 'Pond', '438', 2, 2, 'City', 'Formosa', 'Brazil', '1629350524', 2),
(3, 'Dana', 'Silcox', '2016-12-30', 'dsilcox2@cnbc.com', '686 918 7518', 'Hollow Ridge', '34', 3, 3, 'City', 'Kertosari', '', '3653357616', 5),
(4, 'Desiree', 'Bushen', '1998-04-19', 'dbushen3@ed.gov', '542 921 9962', 'Ludington', '810', 4, 4, 'City', 'Kabardinka', '', '5756049320', 9),
(5, 'Kalinda', 'Spratt', '2001-05-24', 'kspratt4@uol.com.br', '890 313 7709', 'Farmco', '504', 5, 5, 'Skåne', 'Skanör', '', '0236240803', 12),
(6, 'Griswold', 'Tuting', '2002-04-01', 'gtuting5@irs.gov', '560 156 1961', 'Manitowish', '193', 6, 6, 'City', 'Tubli', '', '9334253010', 15),
(7, 'Ermina', 'Bowring', '2003-06-14', 'ebowring6@indiegogo.com', '455 781 3117', 'Montana', '213', 7, 7, 'City', 'Kampungruweh', '', '7851822866', 18),
(8, 'Obadiah', 'Coutthart', '2008-06-29', 'ocoutthart7@hc360.com', '859 256 4157', 'Forest Run', '368', 8, 8, 'Kronoberg', 'Ljungby', '', '2183633638', 23),
(9, 'Florella', 'Tregonna', '2021-09-07', 'ftregonna8@phoca.cz', '261 439 7442', 'Cottonwood', '554', 9, 9, 'City', 'Wufu', '', '7817136920', 25),
(10, 'Ophelie', 'Veeler', '1994-08-29', 'oveeler9@utexas.edu', '949 350 5439', 'Browning', '0', 10, 10, 'City', 'Carmen', '', '9321108440', 27),
(11, 'Justine', 'Maharry', '2016-12-22', 'jmaharrya@imdb.com', '759 668 7388', 'Jenifer', '79', 11, 11, 'Île-de-France', 'Paris 01', '', '5527794532', 28),
(12, 'Alphard', 'Allso', '2004-01-01', 'aallsob@ted.com', '731 374 7629', 'Spohn', '461', 12, 12, 'City', 'Lawa-an', '', '3443345433', 29),
(13, 'Georg', 'Doncom', '1993-10-28', 'gdoncomc@bandcamp.com', '799 552 8009', 'Macpherson', '258', 13, 13, 'City', 'Glempang Tengah', '', '7559206670', 30),
(14, 'Noble', 'Crone', '2001-09-27', 'ncroned@linkedin.com', '993 175 4046', 'Orin', '484', 14, 14, 'City', 'Huaqiu', '', '2006613901', 36),
(15, 'Garvy', 'Olive', '2010-03-28', 'golivee@webnode.com', '228 608 8145', 'Green', '828', 15, 15, 'City', 'Qianpai', '', '5376294269', 37),
(16, 'Arney', 'Salway', '2019-01-27', 'asalwayf@furl.net', '228 449 2426', 'Spaight', '021', 16, 16, 'City', 'Xaysetha', '', '7742874326', 38),
(17, 'Diahann', 'Langston', '2002-06-18', 'dlangstong@google.it', '457 392 0073', 'Rutledge', '513', 17, 17, 'City', 'Cabricán', '', '6511389162', 39),
(18, 'Elvera', 'Witz', '2011-06-14', 'ewitzh@salon.com', '273 851 9614', 'Lake View', '749', 18, 18, 'City', 'Niu', '', '5873436975', 40),
(19, 'Staford', 'Rizzotto', '2022-07-18', 'srizzottoi@google.es', '728 679 6618', 'Forest Dale', '849', 19, 19, 'City', 'Zhixia', '', '9308564101', 41),
(21, 'Ethel', 'Piggin', '2010-06-21', 'epiggink@mozilla.org', '261 671 4474', 'Lunder', '733', 21, 21, 'City', 'Jetafe', '', '3421714592', 43),
(22, 'Laurel', 'Dibbert', '2008-10-29', 'ldibbertl@pinterest.com', '510 336 2498', 'Hoffman', '575', 22, 22, 'City', 'Piquillín', 'Argentina', '5599600386', 45),
(23, 'Goldia', 'Braune', '2008-11-28', 'gbraunem@nifty.com', '329 288 0688', 'Bashford', '568', 23, 23, 'City', 'Jiwuwu', '', '6891101689', 47),
(24, 'Donia', 'Kubatsch', '2021-09-22', 'dkubatschn@npr.org', '546 663 9263', 'Schlimgen', '34', 24, 24, 'City', 'Qinggis Han', '', '9597353814', 49),
(25, 'Karil', 'Tolussi', '1999-07-25', 'ktolussio@plala.or.jp', '852 542 9518', 'Merry', '61', 25, 25, 'City', 'Hòa Bình', '', '8538957112', 50),
(26, 'Joelly', 'Beningfield', '2010-04-12', 'jbeningfieldp@mysql.com', '207 140 7192', 'Westend', '301', 26, 26, 'City', 'Xiji', '', '4394067081', 51),
(27, 'Milli', 'House', '1994-04-04', 'mhouseq@google.com.br', '319 822 9752', 'Chive', '764', 27, 27, 'City', 'Gaoxing', '', '2058293762', 52),
(28, 'Reyna', 'Clarycott', '2021-09-20', 'rclarycottr@harvard.edu', '504 778 7072', 'Algoma', '3', 28, 28, 'City', 'Kamyshin', '', '6139458374', 53),
(29, 'Maurise', 'Pantin', '1998-11-18', 'mpantins@youtube.com', '703 530 2726', 'Larry', '925', 29, 29, 'Sicilia', 'Palermo', '', '3369111411', 54),
(30, 'Georg', 'Doncom', '1993-10-28', 'gdoncomc@bandcamp.com', '799 552 8009', 'Macpherson', '258', 13, 13, 'City', 'Glempang Tengah', '', '7559206670', 30),
(31, 'Daphne', 'Gatteridge', '2023-08-28', 'dgatteridgeu@google.ca', '409 799 7441', 'Mcguire', '63', 31, 31, 'City', 'Gitega', '', '5569521070', 56),
(32, 'Laurens', 'Alenichev', '1995-08-18', 'lalenichevv@paypal.com', '629 704 2511', 'Fairfield', '9', 32, 32, 'Örebro', 'Hällefors', '', '8503512939', 57),
(33, 'Carrol', 'Matessian', '2009-02-08', 'cmatessianw@weebly.com', '248 221 5407', 'Cottonwood', '988', 33, 33, 'City', 'Ekimchan', '', '7848288846', 58),
(34, 'Marlie', 'Dunston', '2010-12-20', 'mdunstonx@a8.net', '784 821 2534', 'Doe Crossing', '264', 34, 34, 'City', 'Kuishan', '', '0605370583', 59),
(35, 'Willette', 'Caccavari', '1993-04-04', 'wcaccavariy@prnewswire.com', '969 177 0800', 'Fisk', '924', 35, 35, 'City', 'Limache', 'Chile', '4336367868', 60),
(36, 'Tilda', 'Cheers', '2003-06-18', 'tcheersz@parallels.com', '192 958 2980', 'Sherman', '981', 36, 36, 'City', 'Kuaidamao', '', '8790372484', 61),
(37, 'Griffith', 'Kelmere', '2017-09-16', 'gkelmere10@instagram.com', '956 272 8975', 'Glacier Hill', '59', 37, 37, 'City', 'Majiao', '', '5765326145', 62),
(38, 'Ingram', 'Gladman', '2021-10-02', 'igladman11@nhs.uk', '557 298 1162', 'Bellgrove', '00', 38, 38, 'City', 'Casa Quemada', '', '9157384142', 63);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `idLogIn` int(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idUser` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`idLogIn`, `name`, `password`, `idUser`) VALUES
(1, 'akaneclient', '$5$rounds=535000$I2BS8dXV2hMxrSRj$8HyPg7ZCwg/VHijN08soAm13uglUdovRCFDTGJgZEE0', 2),
(2, 'user123', '$5$rounds=535000$XqqrWq9p5y.wachX$zyjvWJyKbkZyhLSArvtIgk/Iy0LVUeewTmBc6r7Jv77', 2),
(3, 'johndoe', '$5$rounds=535000$RfgjZm2MOTeRNosP$Y9qqo2g0lzXftdBI1oyypU./XGP7tVPcSAUR.mHURwD', 3),
(4, 'cooluser', '$5$rounds=535000$Wr5yeE83Z5pZy3lt$OojmsqQgj/51e0n.fCgNAOGmOwZKAQNELlseTNjzub3', 1),
(5, 'testuser', '$5$rounds=535000$TBcZ.xji2736Nfbo$sIoLhUx3s571wXYoMB2Y6ojbNyG3pynVDQ1rIGXCxX0', 2),
(6, 'random123', '$5$rounds=535000$SESwgmnq2QVJ7Iq1$tFS92Mx5O8dgzmTpbPmKp4y9NyPTv6qqukX/8UXl6oD', 3),
(7, 'abc', '$5$rounds=535000$fb53Ea3N3/IGrGJA$c0aq8U/5PnGvHNRzOfXTjykgwKqbAetUnZu7/rf7un9', 1),
(9, 'newuser', '$5$rounds=535000$TrkzNxRofmxuFDQ7$NlbQLyuKXEzFk4.mdFjoqyNzJixINgC7hHE/83KC.n1', 2),
(10, 'someonelse', '$5$rounds=535000$bRK5hTaH0gA2rl6.$Umv4t5xnldX1rmWN3rtMKhIfHvTUIlxMTQN0ebi81e9', 3),
(11, 'blackcat', '$5$rounds=535000$ri4j5h6Unn2reRpK$7FcYn1Fg997S8.39xlM5SEayk.ZWHebREJ8niPFLCt7', 1),
(12, 'whitedog', '$5$rounds=535000$X6RAY/aI5H6VlTQZ$0gMp1fdtZAojbGF8jCy0Ax0gQhb3lkaN/mLRGPjg79A', 2),
(13, 'randomuser', '$5$rounds=535000$0amvY1/osU6VJeIp$PDBVYO6XbEzOO6VfRzUuRle3tocdF0fi.bcN3kJVOoA', 3),
(14, 'test', '$5$rounds=535000$x5LUxdVxCMdc5pZs$tM2JPLOFnkmTkrtPnMwcCisbs5mWVQXn8alhZsEpBzB', 1),
(15, 'new', '$5$rounds=535000$Odb.PrwfsCTRzYIa$xLIgaRJhsW00k2WDoJWPXPYovTrCG1YG0H91u1fLJ.C', 2),
(16, 'dontknow', '$5$rounds=535000$4LBWCCdj4FeEpuv4$mWnYTDy0IyfnQn/xR2YBfXaPWUsSJsLoFs60eABY.h2', 3),
(17, 'accessuser', '$5$rounds=535000$8NJcsIhptfABLfwB$l1.MC.5GwOfMxU5kWfrkq.gMonyzfWz7RgTHRee3jyC', 1),
(18, 'securelogin', '$5$rounds=535000$Vpo2ljr8G4WKjwKH$vuS4Y6p.mvo.d9134NTTKj5qwC9aNUBvpkfPJOB.rz/', 2),
(19, 'secretuser', '$5$rounds=535000$DtaXb35DD1yrnry9$yazOoURC5cSSiO6yjFWM8zcMF.jPPx80LXHzLIh7LQ8', 3),
(20, 'akanecashier', '$5$rounds=535000$VwnXt6pXNidyhl6u$w3qJ.tIYGlhX9FZioGbwiEdC4K8tse76KkQvPC8M3u2', 3),
(21, 'akaneadmin', '$5$rounds=535000$JjAmuu/uipt.yQh.$EmHfK7F17z6iz5RP16Ffp.DiKitqA28Iwhrq6ozbc//', 1),
(23, 'akaneflor', '$5$rounds=535000$xxWaBJqx2DPvpMmo$ZGh.aX5FEXZmqmOhJ5CltGBgV5fedCnOj9yuN1EAFoA', 2),
(25, 'cristian', '$5$rounds=535000$m09GQkbTUyAZyxf8$zCB4xXEZAhr1neKVsyq/Q54wFDrGxMx6GGy35WV5ud1', 2),
(26, 'flor', '$5$rounds=535000$JFOpV/LeYhE1RtMb$TExRjfp7AssB3It/gXCsLYk6RLgy5bhzDWa67Awtd38', 2),
(27, 'cachita', '$5$rounds=535000$/6EKt7LABkJ0Qqn4$7coRDVM.YzgMi2tEDQIktFsieBIegHz3jGnL3Kl9rDD', 2),
(28, 'yoru', '$5$rounds=535000$uO/.GzlJMNtwPe4U$mkkkO5qwQBx45w6OoYfywVJpPZ/QlIkWy9cQYZzWQY/', 2),
(29, 'malena', '$5$rounds=535000$dnUrySLJ12qhHNO9$SjWmDB8BWtzOUmcKWz2.nqylGY218d2Ud5wDQFkH/q1', 2),
(30, 'ebi', '$5$rounds=535000$zdVp/BimcPLkrqKl$LnIKhf4MnfsQc8K902yP410uJ9sVPzdpgo3BY9H9VnC', 2),
(36, 'hachiko', '$5$rounds=535000$el.p3YC16/e/3ui7$tMcRpuMKfw8IKGWSkP6pHTvHcmdxmIydoj6LLV2HCF4', 2),
(37, 'goku', '$5$rounds=535000$7I.sPonAkeLyTqEn$a13/JVWkXM8N6Uw4jAXvLxJkc3FNaZ3JviXUxSjDAP5', 2),
(38, 'hannako', '$5$rounds=535000$Qtc/KX5mM/hYHInh$nBIwl9g41HlD7kdSBGAM8PFrJmlO0PlLS4wFdaaaWv4', 2),
(39, 'newprueba', '$5$rounds=535000$CeFu5cI0iA/0aaxI$5ZR44nGbpyrnFHSVnfgcj1w/v5IT0B0BOUvZznEjHI8', 2),
(40, 'prueba1', '$5$rounds=535000$EVxq.G0oNMe.OEQA$G1L0WvNomrGFdlxZc0omh2LjVbVTMSOo0dpZ6xAOjD6', 2),
(41, 'prueba', '$5$rounds=535000$UtpfpIBU56RQiWr2$HkynwYXx.pNl2oPEahI2PdyGuWtiu2g539Gz8wSTun1', 2),
(43, 'great', '$5$rounds=535000$HKgbjFXlW7wFGXUz$QXmJbA72JppYq5dSHhEwT9HfqC3CIsM.y.PbbM1bg11', 2),
(45, 'id', '$5$rounds=535000$7RoSuOSiHqQ6WJdg$JLWBkQ1NkO0fM41/TyPrG/I6AogWlyQlC1dIinUirf4', 2),
(47, 'mariela', '$5$rounds=535000$mjyuHlXQu5OAnwBs$ENwoHYcB1vrOJUN/jbxxF12KVacju2y19eN3m5Ji5Z3', 2),
(49, 'nico', '$5$rounds=535000$HWSS6DMuqcBlbfGp$Ujmyv5qopt0abP4brJFKErhTdtJxrbXP.G5se90bxw/', 2),
(50, 'tecito', '$5$rounds=535000$SlCOwjhuVgABioDg$DPrpwZQ55fv7XFiVOdmlQHFACnzxFabEHyy0JyyH0H0', 2),
(51, 'mouse', '$5$rounds=535000$wjG330BIk5iiQpSf$rR36c65Tey8.tgA9MTDKQ5tzG6eDWOWB4yAiy4Oy.FD', 2),
(52, 'navidad', '$5$rounds=535000$Bek9hFLj6POcf14M$RjjpKHdNAckWO3ThRtH93Va9oXyfvPBftzJ2szGguYA', 2),
(53, 'carlos', '$5$rounds=535000$2CD.0I3REor0J7Xr$Vm5hPban6l4zpCVV4ajLuGa78SDQ4ktjhq5WESFY/UD', 2),
(54, 'gatito', '$5$rounds=535000$pjM6KMKxUyHIKcuX$L0OkTlrTithfGHukZHkeFSPcSQ0mBKRKkuyMXtxznM4', 2),
(56, 'sony', '$5$rounds=535000$hR1ZogRirI28beoy$KzoO4LSNxz5sxS8f4TwvHXWiFI32QIJdA/CqlXgYdF.', 2),
(57, 'renos', '$5$rounds=535000$vLSxM6mODniSmyX.$knyZrbIKpMswbxzyOGa11OeK/Wfq488dcRcKXzkTCg9', 2),
(58, 'hohoho', '$5$rounds=535000$yd/gLp6aiw716pIT$aQR35NKBOa0aLxe5JDFVY0Q4UqmlrCxsO6zYpGfGuAA', 2),
(59, 'atb', '$5$rounds=535000$lYCIAydJCpW5Yy6H$s8bhxVp.52nt7AGINvn5LwCtG2Y8muJXCyoJgGV5ah6', 2),
(60, 'matecito', '$5$rounds=535000$.M16fbqr.wg9mZjC$G/NxDqVFE8EMlAYKnkb0jmoXGCBcid9E6eM/vwKfJJC', 2),
(61, 'ipa', '$5$rounds=535000$2VTDsJSoOCrHNSoy$ZwOcglt7NPdze1XiGf2JGqNHh4JKqtpc4YRJAwcqgh.', 2),
(62, 'vitel', '$5$rounds=535000$yPu6Y7x4jBXKRGR9$vSgDFp7F.BmCjLhRZ7MpKNH.QMBP4ZdhBN.aq5kOE55', 2),
(63, 'python', '$5$rounds=535000$cQqSNV/K./jSvhpk$MkgYPKDODlniWsl5FBo03Fn1xjiuJZnA3S8MmLGp9O1', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_accounts`
--

CREATE TABLE `type_accounts` (
  `idTypeAccount` int(1) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `type_accounts`
--

INSERT INTO `type_accounts` (`idTypeAccount`, `type`) VALUES
(1, 'savingsAccount'),
(2, 'checkingAccount');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_card`
--

CREATE TABLE `type_card` (
  `idTypeCard` int(1) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `type_card`
--

INSERT INTO `type_card` (`idTypeCard`, `type`) VALUES
(1, 'creditCard'),
(2, 'debitCard');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUser` int(3) NOT NULL,
  `rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUser`, `rol`) VALUES
(1, 'administrator'),
(2, 'client'),
(3, 'cashier');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`idAccount`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idTypeAccount` (`idTypeAccount`),
  ADD KEY `idTypeAccount_2` (`idTypeAccount`),
  ADD KEY `idTypeAccount_3` (`idTypeAccount`),
  ADD KEY `idClient_2` (`idClient`),
  ADD KEY `idClient_3` (`idClient`);

--
-- Indices de la tabla `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`idCard`),
  ADD KEY `idAccount` (`idAccount`),
  ADD KEY `idTypeCard` (`idTypeCard`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `idLogIn` (`idLogIn`),
  ADD KEY `idLogIn_2` (`idLogIn`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idLogIn`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `type_accounts`
--
ALTER TABLE `type_accounts`
  ADD PRIMARY KEY (`idTypeAccount`);

--
-- Indices de la tabla `type_card`
--
ALTER TABLE `type_card`
  ADD PRIMARY KEY (`idTypeCard`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `idAccount` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `cards`
--
ALTER TABLE `cards`
  MODIFY `idCard` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `idClient` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `idLogIn` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `type_accounts`
--
ALTER TABLE `type_accounts`
  MODIFY `idTypeAccount` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `type_card`
--
ALTER TABLE `type_card`
  MODIFY `idTypeCard` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`idTypeAccount`) REFERENCES `type_accounts` (`idTypeAccount`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`idTypeCard`) REFERENCES `type_card` (`idTypeCard`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`idLogIn`) REFERENCES `login` (`idLogIn`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
