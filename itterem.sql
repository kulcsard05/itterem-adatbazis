-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Okt 30. 11:19
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
-- Tábla szerkezet ehhez a táblához `alergenek`
--

CREATE TABLE `alergenek` (
  `id` int(11) NOT NULL,
  `nev` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `alergenek`
--

INSERT INTO `alergenek` (`id`, `nev`) VALUES
(1, 'testalergén1');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hozzavalok`
--

CREATE TABLE `hozzavalok` (
  `id` int(11) NOT NULL,
  `nev` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `hozzavalok`
--

INSERT INTO `hozzavalok` (`id`, `nev`) VALUES
(1, 'testhozzavalo\r\n');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hozzavalok_alergenek_kapcsolo`
--

CREATE TABLE `hozzavalok_alergenek_kapcsolo` (
  `Hozzavalok_id` int(11) NOT NULL,
  `alergenek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `hozzavalok_alergenek_kapcsolo`
--

INSERT INTO `hozzavalok_alergenek_kapcsolo` (`Hozzavalok_id`, `alergenek_id`) VALUES
(1, 1);

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

--
-- A tábla adatainak kiíratása `jogok`
--

INSERT INTO `jogok` (`id`, `szint`, `nev`, `leiras`) VALUES
(1, 0, 'Felhasználó', 'Bejelentkezett felhasználó, alap jog');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `keszetelek`
--

CREATE TABLE `keszetelek` (
  `id` int(11) NOT NULL,
  `nev` varchar(64) NOT NULL,
  `leiras` varchar(100) NOT NULL
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
  `leiras` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `koretek`
--

INSERT INTO `koretek` (`id`, `nev`, `leiras`) VALUES
(1, 'testköret1', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `koretek_alergenek_kapcsolo`
--

CREATE TABLE `koretek_alergenek_kapcsolo` (
  `koret_id` int(11) NOT NULL,
  `alergenek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `koretek_alergenek_kapcsolo`
--

INSERT INTO `koretek_alergenek_kapcsolo` (`koret_id`, `alergenek_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menuk`
--

CREATE TABLE `menuk` (
  `id` int(11) NOT NULL,
  `keszetel_id` int(11) NOT NULL,
  `koret_id` int(11) NOT NULL
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
  `telefonszam` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `jogosultsag`, `teljes_nev`, `email`, `telefonszam`) VALUES
(1, 0, 'Teszt Elek', 'Email@email.com', '+36 20 2579632');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `alergenek`
--
ALTER TABLE `alergenek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `hozzavalok`
--
ALTER TABLE `hozzavalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `hozzavalok_alergenek_kapcsolo`
--
ALTER TABLE `hozzavalok_alergenek_kapcsolo`
  ADD KEY `hozzavalok_id` (`Hozzavalok_id`),
  ADD KEY `alergenek_id` (`alergenek_id`);

--
-- A tábla indexei `jogok`
--
ALTER TABLE `jogok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `szint` (`szint`);

--
-- A tábla indexei `keszetelek`
--
ALTER TABLE `keszetelek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `keszetel_hozzavalok_kapcsolo`
--
ALTER TABLE `keszetel_hozzavalok_kapcsolo`
  ADD KEY `keszetel_id` (`keszetel_id`),
  ADD KEY `hozzavalok_id` (`hozzavalok_id`);

--
-- A tábla indexei `koretek`
--
ALTER TABLE `koretek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `koretek_alergenek_kapcsolo`
--
ALTER TABLE `koretek_alergenek_kapcsolo`
  ADD KEY `koret_id` (`koret_id`,`alergenek_id`),
  ADD KEY `alergenek_id` (`alergenek_id`);

--
-- A tábla indexei `menuk`
--
ALTER TABLE `menuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keszetel_id` (`keszetel_id`,`koret_id`),
  ADD KEY `koret_id` (`koret_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `jogosultsag` (`jogosultsag`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `alergenek`
--
ALTER TABLE `alergenek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `hozzavalok`
--
ALTER TABLE `hozzavalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `jogok`
--
ALTER TABLE `jogok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `keszetelek`
--
ALTER TABLE `keszetelek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `koretek`
--
ALTER TABLE `koretek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `menuk`
--
ALTER TABLE `menuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `hozzavalok_alergenek_kapcsolo`
--
ALTER TABLE `hozzavalok_alergenek_kapcsolo`
  ADD CONSTRAINT `hozzavalok_alergenek_kapcsolo_ibfk_1` FOREIGN KEY (`Hozzavalok_id`) REFERENCES `hozzavalok` (`id`),
  ADD CONSTRAINT `hozzavalok_alergenek_kapcsolo_ibfk_2` FOREIGN KEY (`alergenek_id`) REFERENCES `alergenek` (`id`);

--
-- Megkötések a táblához `keszetel_hozzavalok_kapcsolo`
--
ALTER TABLE `keszetel_hozzavalok_kapcsolo`
  ADD CONSTRAINT `keszetel_hozzavalok_kapcsolo_ibfk_1` FOREIGN KEY (`keszetel_id`) REFERENCES `keszetelek` (`id`),
  ADD CONSTRAINT `keszetel_hozzavalok_kapcsolo_ibfk_2` FOREIGN KEY (`hozzavalok_id`) REFERENCES `hozzavalok` (`id`);

--
-- Megkötések a táblához `koretek_alergenek_kapcsolo`
--
ALTER TABLE `koretek_alergenek_kapcsolo`
  ADD CONSTRAINT `koretek_alergenek_kapcsolo_ibfk_1` FOREIGN KEY (`koret_id`) REFERENCES `koretek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `koretek_alergenek_kapcsolo_ibfk_2` FOREIGN KEY (`alergenek_id`) REFERENCES `alergenek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `menuk`
--
ALTER TABLE `menuk`
  ADD CONSTRAINT `menuk_ibfk_1` FOREIGN KEY (`keszetel_id`) REFERENCES `keszetelek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `menuk_ibfk_2` FOREIGN KEY (`koret_id`) REFERENCES `koretek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`jogosultsag`) REFERENCES `jogok` (`szint`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
