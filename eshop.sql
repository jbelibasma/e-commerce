-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 14 mars 2022 à 15:21
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'Watch'),
(2, 'Clothes');

-- --------------------------------------------------------

--
-- Structure de la table `orderlines`
--

CREATE TABLE `orderlines` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `prix` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `orderlines`
--

INSERT INTO `orderlines` (`id`, `order_id`, `product_id`, `quantity`, `prix`) VALUES
(1, 1, 13, 4, 60),
(3, 2, 13, 4, 60),
(5, 3, 13, 4, 60),
(7, 4, 13, 4, 60),
(9, 5, 13, 4, 60),
(11, 6, 13, 4, 60),
(13, 7, 13, 4, 60),
(15, 8, 13, 4, 60),
(17, 9, 12, 1, 120),
(18, 9, 13, 1, 60),
(19, 9, 10, 1, 50),
(22, 12, 7, 5, 140),
(25, 15, 6, 1, 140),
(38, 24, 10, 1, 50),
(39, 26, 12, 2, 120);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `created_at`) VALUES
(1, 5, 380, '2021-12-16'),
(2, 5, 380, '2021-12-16'),
(3, 5, 380, '2021-12-16'),
(4, 5, 380, '2021-12-16'),
(5, 5, 380, '2021-12-16'),
(6, 5, 380, '2021-12-16'),
(7, 5, 380, '2021-12-16'),
(8, 5, 380, '2021-12-16'),
(9, 5, 230, '2021-12-16'),
(10, 6, 560, '2021-12-16'),
(11, 6, 0, '2021-12-16'),
(12, 6, 840, '2021-12-16'),
(13, 6, 140, '2021-12-16'),
(14, 6, 280, '2021-12-16'),
(15, 7, 2380, '2021-12-18'),
(24, 6, 470, '2022-03-06'),
(25, 6, 0, '2022-03-06'),
(26, 6, 240, '2022-03-06'),
(27, 6, 0, '2022-03-06');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `couleur` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `prix` double NOT NULL,
  `description` text NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `category_id`, `nom`, `couleur`, `size`, `genre`, `prix`, `description`, `image`, `created_at`) VALUES
(4, 1, 'Thermo Ball Etip Gloves', 'black', 'standard', 'male', 140, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'watch4.png', '2021-12-12 16:13:51'),
(5, 2, 'Thermo Ball Etip Gloves', 'rose', 'standard', 'male', 140, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'homme1.jpg', '2021-12-12 16:13:51'),
(6, 1, 'Thermo Ball Etip Gloves', 'blue', 'standard', 'male', 140, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'watch5.png', '2021-12-12 16:13:51'),
(7, 1, 'Thermo Ball Etip Gloves', 'maron', 'standard', 'male', 140, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'watch6.png', '2021-12-12 16:13:51'),
(9, 1, 'Thermo Ball Etip Gloves', 'bleu et rouge', 'standard', 'male', 140, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'watch8.png', '2021-12-12 16:13:51'),
(10, 1, 'Thermo Ball Etip Gloves', 'doré', 'standard', 'male', 50, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'watch9.png', '2021-12-12 16:13:51'),
(11, 1, 'Thermo Ball Etip Gloves', 'silver', 'standard', 'male', 140, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'watch10.png', '2021-12-12 16:13:51'),
(12, 2, 'Thermo Ball Etip Gloves', 'bleu', 'standard', 'male', 120, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'homme2.jpg', '2021-12-12 16:13:51'),
(13, 1, 'Thermo Ball Etip Gloves', 'doré', 'standard', 'male', 60, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, optio dolorum, maxime aut amet eligendi dolores nesciunt quos libero cupiditate dicta corrupti voluptatibus veritatis nisi facilis magni unde impedit? Odit!', 'watch11.png', '2021-12-12 16:13:51'),
(17, 2, 'clothes', 'red', '120', '120', 120, 'choix', '1640959068gallery3.jpg', '2021-12-31 13:57:48');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `roles` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `roles`) VALUES
(5, 'med med', 'med@gmail.com', '$2y$10$5FnFx2BvSpBNjQt/gtN0OupfK.hAQJF/tZgsqHLhHcubmmiZemcFS', 1452789, 'qsdqsdqsdqsd', '0'),
(6, 'jbeli basma', 'jbelibasma22@gmail.com', '$2y$10$YtCJjTI5g8c8zTMMP.t.2e.l633RTLhz6LlHVE2LPu2Y1B/8s2Csi', 58662695, 'avenuarianae mostfa mohsen', '1'),
(7, 'basma', 'basma@gmail.com', '$2y$10$s1l6lPLUgtTGZts8108xAuwp0CYuWsJfz5seWvHnGO7Ba7JP8ob2C', 0, 'khfhfEFE', '0'),
(8, 'jbeli basma', 'souad@gmail.com', '$2y$10$PC2W/Zh5t9IVjWHrkRe5oeD7H6qlOFR3TUkiExccfYvqW2FoQoDbm', 58662695, 'avenue mostfa mohsen', '0');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orderlines`
--
ALTER TABLE `orderlines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `orderlines`
--
ALTER TABLE `orderlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orderlines`
--
ALTER TABLE `orderlines`
  ADD CONSTRAINT `orderlines_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `orderlines_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
