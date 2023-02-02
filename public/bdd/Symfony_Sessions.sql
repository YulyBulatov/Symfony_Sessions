-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour symfonysessions_yuly
CREATE DATABASE IF NOT EXISTS `symfonysessions_yuly` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `symfonysessions_yuly`;

-- Listage de la structure de la table symfonysessions_yuly. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.categorie : ~4 rows (environ)
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` (`id`, `nom`) VALUES
	(1, 'Webdesign'),
	(2, 'Bureautique'),
	(3, 'Développement web'),
	(4, 'Vente');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. cours
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FDCA8C9CBCF5E72D` (`categorie_id`) USING BTREE,
  CONSTRAINT `FK_FDCA8C9C12469DE2` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.cours : ~8 rows (environ)
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` (`id`, `categorie_id`, `nom`) VALUES
	(1, 1, 'Figma'),
	(2, 2, 'Word'),
	(3, 2, 'Excel'),
	(4, 2, 'Powerpoint'),
	(5, 3, 'HTML'),
	(6, 3, 'CSS'),
	(7, 3, 'PHP'),
	(8, 3, 'SQL'),
	(9, 1, 'Photoshop'),
	(10, 4, 'E-commerce');
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.doctrine_migration_versions : ~1 rows (environ)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230202084639', '2023-02-02 08:49:11', 1829);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. formateur
CREATE TABLE IF NOT EXISTS `formateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.formateur : ~3 rows (environ)
/*!40000 ALTER TABLE `formateur` DISABLE KEYS */;
INSERT INTO `formateur` (`id`, `prenom`, `nom`, `email`, `telephone`, `ville`, `adresse`, `password`) VALUES
	(1, 'Stéphane', 'SMAIL', 'stephane.smail@formateur.fr', '0784521645', 'Colmar', '3 pl. du Capitaine Dreyfus', 'uchitel@68'),
	(2, 'Mickaël', 'MURMANN', 'mickael.murmann@formateur.fr', '0645781543', 'Strasbourg', '14 route de Rhone', 'koderovschik@67'),
	(3, 'Quentin', 'MATHIEU', 'quentin.mathieu@formateur.fr', '0647154239', 'Mulhouse', '130 rue de la Mer Rouge', 'desayner@682');
/*!40000 ALTER TABLE `formateur` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. formation
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.formation : ~2 rows (environ)
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
INSERT INTO `formation` (`id`, `nom`) VALUES
	(1, 'Développement Web'),
	(2, 'Webdesign');
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.messenger_messages : ~0 rows (environ)
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. programme
CREATE TABLE IF NOT EXISTS `programme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cours_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `duree` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3DDCB9FF7ECF78B0` (`cours_id`),
  KEY `IDX_3DDCB9FF613FECDF` (`session_id`),
  CONSTRAINT `FK_3DDCB9FF613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_3DDCB9FF7ECF78B0` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.programme : ~0 rows (environ)
/*!40000 ALTER TABLE `programme` DISABLE KEYS */;
INSERT INTO `programme` (`id`, `cours_id`, `session_id`, `duree`) VALUES
	(1, 1, 1, 3),
	(2, 2, 1, 5),
	(3, 3, 1, 6);
/*!40000 ALTER TABLE `programme` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. session
CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formateur_id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `nbre_places` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D044D5D4155D8F51` (`formateur_id`),
  KEY `IDX_D044D5D45200282E` (`formation_id`),
  CONSTRAINT `FK_D044D5D4155D8F51` FOREIGN KEY (`formateur_id`) REFERENCES `formateur` (`id`),
  CONSTRAINT `FK_D044D5D45200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.session : ~0 rows (environ)
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` (`id`, `formateur_id`, `formation_id`, `date_debut`, `date_fin`, `nbre_places`, `nom`) VALUES
	(1, 1, 1, '2022-11-04', '2023-07-03', 25, 'Plateau numérique'),
	(2, 3, 2, '2023-03-02', '2023-05-20', 20, 'Design web'),
	(3, 2, 1, '2018-02-02', '2019-02-02', 25, 'Développeeur web');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. session_stagiaire
CREATE TABLE IF NOT EXISTS `session_stagiaire` (
  `session_id` int(11) NOT NULL,
  `stagiaire_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`,`stagiaire_id`),
  KEY `IDX_C80B23B613FECDF` (`session_id`),
  KEY `IDX_C80B23BBBA93DD6` (`stagiaire_id`),
  CONSTRAINT `FK_C80B23B613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C80B23BBBA93DD6` FOREIGN KEY (`stagiaire_id`) REFERENCES `stagiaire` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.session_stagiaire : ~0 rows (environ)
/*!40000 ALTER TABLE `session_stagiaire` DISABLE KEYS */;
INSERT INTO `session_stagiaire` (`session_id`, `stagiaire_id`) VALUES
	(1, 2),
	(1, 4),
	(1, 5),
	(1, 9),
	(1, 10),
	(2, 1),
	(2, 3),
	(2, 8);
/*!40000 ALTER TABLE `session_stagiaire` ENABLE KEYS */;

-- Listage de la structure de la table symfonysessions_yuly. stagiaire
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table symfonysessions_yuly.stagiaire : ~10 rows (environ)
/*!40000 ALTER TABLE `stagiaire` DISABLE KEYS */;
INSERT INTO `stagiaire` (`id`, `prenom`, `nom`, `email`, `telephone`, `ville`, `adresse`, `password`) VALUES
	(1, 'Marie', 'Dupont', 'marie.dupont@gmail.com', '+33611223344', 'Paris', '43 Avenue des Champs-Elysées', 'Mdupont1'),
	(2, 'Paul', 'Martins', ' paul.martins@hotmail.fr', '+33699887766', 'Marseil', '12 Boulevard de la Canebière', 'Pmartins2'),
	(3, 'Nathalie', 'Lewis', ' nathalie.lewis@hotmail.fr', '+33699112266', 'Rennes', ' 13 Rue Saint-Michel', 'Nlewis10'),
	(4, 'Anne', 'Leroy', 'anne.leroy@email.fr', '+33611121314', 'Lyon', '7 Rue de la Republique', 'AnneLeroy2020§'),
	(5, 'Jean', 'Petit', 'jean.petit@email.fr', '+33631322333', 'Toulouse', '9 Plave du Captiole', 'JeanPetit2020!'),
	(6, 'Sophie', 'Durand', 'sophie.durand@email.fr', '+33641424344', 'Nice', '11 Promenade des Anglais', 'SophieDurand2020!'),
	(7, 'Luc', 'Dubois', 'luc.dubois@email.fr', '+33651525354', 'Nantes', '13 Place Royale', 'LucDubois2020!'),
	(8, 'Matthieu', 'Moreau', 'matthieu.mooreau@email.fr', '+33661626364', 'Bordeaux', '15 Place des Quinconces', 'MathieuMoreau2020!'),
	(9, 'Chloé', 'Leroux', 'chloe.leroux@email.fr', '+33671727374', 'Rennes', '17 Places des Lices', 'ChloeLeroux2020!'),
	(10, 'Victor', 'Rousseau', 'victor.rousseau@email.fr', '+33681828384', 'Strasbourg', '19 Place Kléber', 'VictorRousseau2020!');
/*!40000 ALTER TABLE `stagiaire` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
