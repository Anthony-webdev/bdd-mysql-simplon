-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 23 août 2022 à 14:49
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `comics_simplon`
--

-- --------------------------------------------------------

--
-- Structure de la table `collections`
--

CREATE TABLE `collections` (
  `id_collection` int(11) NOT NULL,
  `Nom` varchar(200) NOT NULL,
  `Prestige` varchar(100) NOT NULL,
  `DateParution` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `comics`
--

CREATE TABLE `comics` (
  `id_comics` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Resume` text NOT NULL,
  `Scenariste` varchar(200) NOT NULL,
  `Dessinateur` varchar(200) NOT NULL,
  `DatePublication` datetime NOT NULL,
  `NombrePages` int(11) NOT NULL,
  `id_collection` int(11) NOT NULL,
  `id_serie` int(11) NOT NULL,
  `id_editeur` int(11) NOT NULL,
  `id_epoque` int(11) NOT NULL,
  `id_recompense` int(11) NOT NULL,
  `id_univers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

CREATE TABLE `editeurs` (
  `id_editeur` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `epoques`
--

CREATE TABLE `epoques` (
  `id_epoque` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Annees` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `personnages`
--

CREATE TABLE `personnages` (
  `id_personnage` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Alias` varchar(100) NOT NULL,
  `Statut` varchar(100) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `possession`
--

CREATE TABLE `possession` (
  `id_note` int(11) NOT NULL,
  `id_comics` int(11) NOT NULL,
  `id_personnage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `recompenses`
--

CREATE TABLE `recompenses` (
  `id_recompense` int(11) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `AnneeObtenue` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `series`
--

CREATE TABLE `series` (
  `id_serie` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `NombreDeVolumes` int(11) NOT NULL,
  `Descriptif` text NOT NULL,
  `AnneeParution` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `univers`
--

CREATE TABLE `univers` (
  `id_univers` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id_collection`);

--
-- Index pour la table `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`id_comics`),
  ADD KEY `id_collection` (`id_collection`),
  ADD KEY `id_serie` (`id_serie`),
  ADD KEY `id_editeur` (`id_editeur`),
  ADD KEY `id_epoque` (`id_epoque`),
  ADD KEY `id_univers` (`id_univers`);

--
-- Index pour la table `editeurs`
--
ALTER TABLE `editeurs`
  ADD PRIMARY KEY (`id_editeur`);

--
-- Index pour la table `epoques`
--
ALTER TABLE `epoques`
  ADD PRIMARY KEY (`id_epoque`);

--
-- Index pour la table `personnages`
--
ALTER TABLE `personnages`
  ADD PRIMARY KEY (`id_personnage`);

--
-- Index pour la table `possession`
--
ALTER TABLE `possession`
  ADD PRIMARY KEY (`id_note`),
  ADD KEY `id_comics` (`id_comics`),
  ADD KEY `id_personnage` (`id_personnage`);

--
-- Index pour la table `recompenses`
--
ALTER TABLE `recompenses`
  ADD PRIMARY KEY (`id_recompense`),
  ADD KEY `id_comics` (`id_comics`);

--
-- Index pour la table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id_serie`);

--
-- Index pour la table `univers`
--
ALTER TABLE `univers`
  ADD PRIMARY KEY (`id_univers`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `collections`
--
ALTER TABLE `collections`
  MODIFY `id_collection` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comics`
--
ALTER TABLE `comics`
  MODIFY `id_comics` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `editeurs`
--
ALTER TABLE `editeurs`
  MODIFY `id_editeur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `epoques`
--
ALTER TABLE `epoques`
  MODIFY `id_epoque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personnages`
--
ALTER TABLE `personnages`
  MODIFY `id_personnage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `possession`
--
ALTER TABLE `possession`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recompenses`
--
ALTER TABLE `recompenses`
  MODIFY `id_recompense` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `series`
--
ALTER TABLE `series`
  MODIFY `id_serie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `univers`
--
ALTER TABLE `univers`
  MODIFY `id_univers` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `recompenses`
--
ALTER TABLE `recompenses`
  ADD CONSTRAINT `recompenses_ibfk_1` FOREIGN KEY (`id_comics`) REFERENCES `comics` (`id_comics`);

--

--
-- Contraintes pour la table `comics`
--
ALTER TABLE `comics`
  ADD CONSTRAINT `comics_ibfk_1` FOREIGN KEY (`id_collection`) REFERENCES `collections` (`id_collection`),
  ADD CONSTRAINT `comics_ibfk_2` FOREIGN KEY (`id_serie`) REFERENCES `series` (`id_serie`),
  ADD CONSTRAINT `comics_ibfk_3` FOREIGN KEY (`id_editeur`) REFERENCES `editeurs` (`id_editeur`),
  ADD CONSTRAINT `comics_ibfk_5` FOREIGN KEY (`id_univers`) REFERENCES `univers` (`id_univers`);

--
-- Contraintes pour la table `possession`
--
ALTER TABLE `possession`
  ADD CONSTRAINT `possession_ibfk_1` FOREIGN KEY (`id_comics`) REFERENCES `comics` (`id_comics`),
  ADD CONSTRAINT `possession_ibfk_2` FOREIGN KEY (`id_personnage`) REFERENCES `personnages` (`id_personnage`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
