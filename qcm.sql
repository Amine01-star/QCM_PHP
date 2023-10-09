-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 15 avr. 2023 à 21:07
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `qcm`
--

-- --------------------------------------------------------

--
-- Structure de la table `answerquiz`
--

DROP TABLE IF EXISTS `answerquiz`;
CREATE TABLE IF NOT EXISTS `answerquiz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enonce` varchar(255) DEFAULT NULL,
  `id_quest` int DEFAULT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_quest` (`id_quest`)
) ENGINE=InnoDB AUTO_INCREMENT=2280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `answerquiz`
--

INSERT INTO `answerquiz` (`id`, `enonce`, `id_quest`, `is_correct`) VALUES
(2262, 'reponse1', 360, 0),
(2263, 'reponse2', 360, 1),
(2264, 'reponse3', 360, 0),
(2265, 'reponse4', 360, 0),
(2266, 'quest2', 361, 0),
(2267, 'repose5', 361, 1),
(2268, 'reponse6', 361, 0),
(2269, 'reponse7', 361, 0),
(2270, 'reponse8', 361, 1),
(2271, 'reponse1', 364, 1),
(2272, 'reponse2', 364, 0),
(2273, 'reponse3', 364, 0),
(2274, 'reponse4', 365, 1),
(2275, 'reponse5', 365, 0),
(2276, 'reponse6', 365, 0),
(2277, 'reponse7', 366, 1),
(2278, 'reponse8', 366, 0),
(2279, 'reponse9', 366, 0);

-- --------------------------------------------------------

--
-- Structure de la table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `question_id` int NOT NULL,
  `answer_value` int DEFAULT '0',
  `is_correct` tinyint(1) DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `answers`
--

INSERT INTO `answers` (`user_id`, `quiz_id`, `question_id`, `answer_value`, `is_correct`) VALUES
(399, 238, 361, 2270, 1);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int DEFAULT NULL,
  `enonce` varchar(255) DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `quiz_id`, `enonce`, `score`) VALUES
(360, 238, 'quest1', 10),
(361, 238, 'quest2', 5),
(364, 241, 'quest1', 2),
(365, 241, 'quest2', 3),
(366, 241, 'quest3', 6);

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Creator_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` timestamp NULL DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Creator_id` (`Creator_id`),
  KEY `id_admin` (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id`, `Creator_id`, `title`, `description`, `duration`, `created_at`, `updated_at`, `status`, `id_admin`) VALUES
(238, 398, 'Quiz1', 'Ce quiz supporte une seule réponse comme plusieurs réponses', 10, '2023-04-15 20:18:42', NULL, '2023-04-15 20:41:23', 399),
(241, 398, 'Quiz2', 'ce qcm supporte une seule réponse', 15, '2023-04-15 20:59:07', NULL, NULL, 399);

-- --------------------------------------------------------

--
-- Structure de la table `quiz_users`
--

DROP TABLE IF EXISTS `quiz_users`;
CREATE TABLE IF NOT EXISTS `quiz_users` (
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `score` int DEFAULT '0',
  `date_quiz` datetime NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `quiz_users`
--

INSERT INTO `quiz_users` (`user_id`, `quiz_id`, `score`, `date_quiz`) VALUES
(399, 238, 0, '2023-04-15 22:41:57'),
(399, 238, 0, '2023-04-15 22:42:35'),
(399, 238, 5, '2023-04-15 22:42:43'),
(399, 238, 0, '2023-04-15 22:43:09'),
(399, 238, 5, '2023-04-15 22:44:24'),
(398, 238, 0, '2023-04-15 22:45:29');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`, `slug`, `level`) VALUES
(1, 'membre', 'member', 1),
(2, 'admin', 'admin', 2),
(3, 'superAdmin', 'super', 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `confirmation_token` varchar(60) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `role_id` int NOT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_constraint_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `password`, `confirmation_token`, `reset_token`, `reset_at`, `role_id`, `confirmed_at`) VALUES
(398, 'alaoui', 'asma', 'belghitialaouia@gmail.com', '$2y$10$iDnWDxaw9bqdtjhsaqAI8uVTivTDhoAdWBx5l4b2JQYHH1HDsdB0a', '', NULL, NULL, 1, '2023-04-15 22:16:52'),
(399, 'belghiti alaoui', 'asmae', 'asmae@gmail.com', '$2y$10$iDnWDxaw9bqdtjhsaqAI8uVTivTDhoAdWBx5l4b2JQYHH1HDsdB0a', '', NULL, NULL, 3, '2023-04-15 22:16:52'),
(400, 'bourass', 'ahlam', 'ahlam@gmail.com', '$2y$10$iDnWDxaw9bqdtjhsaqAI8uVTivTDhoAdWBx5l4b2JQYHH1HDsdB0a', '', NULL, NULL, 2, '2023-04-15 22:16:52');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `answerquiz`
--
ALTER TABLE `answerquiz`
  ADD CONSTRAINT `answerquiz_ibfk_1` FOREIGN KEY (`id_quest`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`Creator_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_constraint_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
