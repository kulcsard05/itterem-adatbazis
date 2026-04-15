-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Ápr 15. 12:24
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `itterem`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hozzavalok`
--

CREATE TABLE `hozzavalok` (
  `id` int(11) NOT NULL,
  `hozzavalo_nev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jogok`
--

CREATE TABLE `jogok` (
  `id` int(11) NOT NULL,
  `szint` int(1) NOT NULL,
  `nev` varchar(64) NOT NULL,
  `leiras` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL,
  `nev` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `keszetelek`
--

CREATE TABLE `keszetelek` (
  `id` int(11) NOT NULL,
  `nev` varchar(64) NOT NULL,
  `leiras` varchar(100) NOT NULL,
  `elerheto` tinyint(4) NOT NULL,
  `kategoria_id` int(11) NOT NULL,
  `ar` int(11) NOT NULL,
  `kep` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `keszetel_hozzavalok_kapcsolo`
--

CREATE TABLE `keszetel_hozzavalok_kapcsolo` (
  `keszetel_id` int(11) NOT NULL,
  `hozzavalok_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `koretek`
--

CREATE TABLE `koretek` (
  `id` int(11) NOT NULL,
  `nev` varchar(64) NOT NULL,
  `leiras` varchar(100) NOT NULL,
  `elerheto` tinyint(4) NOT NULL,
  `ar` int(11) NOT NULL,
  `kep` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menuk`
--

CREATE TABLE `menuk` (
  `id` int(11) NOT NULL,
  `menu_nev` varchar(20) NOT NULL,
  `keszetel_id` int(11) NOT NULL,
  `koret_id` int(11) DEFAULT NULL,
  `udito_id` int(11) DEFAULT NULL,
  `elerheto` tinyint(4) NOT NULL,
  `ar` int(11) NOT NULL,
  `kep` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `id` int(11) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL,
  `datum` datetime NOT NULL DEFAULT current_timestamp(),
  `statusz` varchar(50) DEFAULT 'Függőben',
  `osszes_ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_elemek`
--

CREATE TABLE `rendeles_elemek` (
  `id` int(11) NOT NULL,
  `rendeles_id` int(11) NOT NULL,
  `keszetel_id` int(11) DEFAULT NULL,
  `udito_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `koret_id` int(11) DEFAULT NULL,
  `mennyiseg` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `uditok`
--

CREATE TABLE `uditok` (
  `id` int(11) NOT NULL,
  `nev` varchar(20) NOT NULL,
  `elerheto` tinyint(4) NOT NULL,
  `ar` int(11) NOT NULL,
  `kep` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `jogosultsag` int(1) NOT NULL,
  `teljes_nev` varchar(64) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefonszam` varchar(20) NOT NULL,
  `Hash` varchar(64) NOT NULL,
  `Salt` varchar(64) NOT NULL,
  `aktiv` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `hozzavalok`
--
ALTER TABLE `hozzavalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `jogok`
--
ALTER TABLE `jogok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `szint` (`szint`);

--
-- A tábla indexei `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `keszetelek`
--
ALTER TABLE `keszetelek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategoria_id` (`kategoria_id`);

--
-- A tábla indexei `keszetel_hozzavalok_kapcsolo`
--
ALTER TABLE `keszetel_hozzavalok_kapcsolo`
  ADD PRIMARY KEY (`keszetel_id`,`hozzavalok_id`),
  ADD KEY `keszetel_id` (`keszetel_id`),
  ADD KEY `hozzavalok_id` (`hozzavalok_id`);

--
-- A tábla indexei `koretek`
--
ALTER TABLE `koretek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `menuk`
--
ALTER TABLE `menuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keszetel_id` (`keszetel_id`,`koret_id`),
  ADD KEY `koret_id` (`koret_id`),
  ADD KEY `index` (`udito_id`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `felhasznalo_id` (`felhasznalo_id`);

--
-- A tábla indexei `rendeles_elemek`
--
ALTER TABLE `rendeles_elemek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_re_rendeles` (`rendeles_id`),
  ADD KEY `fk_re_keszetel` (`keszetel_id`),
  ADD KEY `fk_re_udito` (`udito_id`),
  ADD KEY `fk_re_menu` (`menu_id`),
  ADD KEY `indexkoret` (`koret_id`);

--
-- A tábla indexei `uditok`
--
ALTER TABLE `uditok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`,`telefonszam`),
  ADD KEY `jogosultsag` (`jogosultsag`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `hozzavalok`
--
ALTER TABLE `hozzavalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `jogok`
--
ALTER TABLE `jogok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `keszetelek`
--
ALTER TABLE `keszetelek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `koretek`
--
ALTER TABLE `koretek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `menuk`
--
ALTER TABLE `menuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendeles_elemek`
--
ALTER TABLE `rendeles_elemek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `uditok`
--
ALTER TABLE `uditok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `keszetel_hozzavalok_kapcsolo`
--
ALTER TABLE `keszetel_hozzavalok_kapcsolo`
  ADD CONSTRAINT `keszetel_hozzavalok_kapcsolo_ibfk_1` FOREIGN KEY (`keszetel_id`) REFERENCES `keszetelek` (`id`),
  ADD CONSTRAINT `keszetel_hozzavalok_kapcsolo_ibfk_2` FOREIGN KEY (`hozzavalok_id`) REFERENCES `hozzavalok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `menuk`
--
ALTER TABLE `menuk`
  ADD CONSTRAINT `menuk_ibfk_1` FOREIGN KEY (`keszetel_id`) REFERENCES `keszetelek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `menuk_ibfk_2` FOREIGN KEY (`koret_id`) REFERENCES `koretek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `udito_menu_kapcs` FOREIGN KEY (`udito_id`) REFERENCES `uditok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `fk_rendeles_user` FOREIGN KEY (`felhasznalo_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `rendeles_elemek`
--
ALTER TABLE `rendeles_elemek`
  ADD CONSTRAINT `fk_re_keszetel` FOREIGN KEY (`keszetel_id`) REFERENCES `keszetelek` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_re_menu` FOREIGN KEY (`menu_id`) REFERENCES `menuk` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_re_rendeles` FOREIGN KEY (`rendeles_id`) REFERENCES `rendelesek` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_re_udito` FOREIGN KEY (`udito_id`) REFERENCES `uditok` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rendeles_elemek_ibfk_1` FOREIGN KEY (`koret_id`) REFERENCES `koretek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`jogosultsag`) REFERENCES `jogok` (`szint`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
