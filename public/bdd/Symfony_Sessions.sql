-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage des données de la table symfonysessions_yuly.categorie : ~4 rows (environ)
DELETE FROM `categorie`;
INSERT INTO `categorie` (`id`, `nom`) VALUES
	(1, 'Webdesign'),
	(2, 'Bureautique'),
	(3, 'Développement web'),
	(4, 'Vente');

-- Listage des données de la table symfonysessions_yuly.cours : ~10 rows (environ)
DELETE FROM `cours`;
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

-- Listage des données de la table symfonysessions_yuly.doctrine_migration_versions : ~0 rows (environ)
DELETE FROM `doctrine_migration_versions`;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230202084639', '2023-02-02 08:49:11', 1829),
	('DoctrineMigrations\\Version20230209085922', '2023-02-09 08:59:53', 66);

-- Listage des données de la table symfonysessions_yuly.formateur : ~3 rows (environ)
DELETE FROM `formateur`;
INSERT INTO `formateur` (`id`, `prenom`, `nom`, `email`, `telephone`, `ville`, `adresse`, `password`) VALUES
	(1, 'Stéphane', 'SMAIL', 'stephane.smail@formateur.fr', '0784521645', 'Colmar', '3 pl. du Capitaine Dreyfus', 'uchitel@68'),
	(2, 'Mickaël', 'MURMANN', 'mickael.murmann@formateur.fr', '0645781543', 'Strasbourg', '14 route de Rhone', 'koderovschik@67'),
	(3, 'Quentin', 'MATHIEU', 'quentin.mathieu@formateur.fr', '0647154239', 'Mulhouse', '130 rue de la Mer Rouge', 'desayner@682');

-- Listage des données de la table symfonysessions_yuly.formation : ~2 rows (environ)
DELETE FROM `formation`;
INSERT INTO `formation` (`id`, `nom`) VALUES
	(1, 'Développement Web'),
	(2, 'Webdesign');

-- Listage des données de la table symfonysessions_yuly.messenger_messages : ~0 rows (environ)
DELETE FROM `messenger_messages`;

-- Listage des données de la table symfonysessions_yuly.programme : ~3 rows (environ)
DELETE FROM `programme`;
INSERT INTO `programme` (`id`, `cours_id`, `session_id`, `duree`) VALUES
	(1, 1, 1, 3),
	(2, 2, 1, 5),
	(3, 3, 1, 6),
	(5, 6, 3, 5),
	(6, 7, 1, 5);

-- Listage des données de la table symfonysessions_yuly.session : ~0 rows (environ)
DELETE FROM `session`;
INSERT INTO `session` (`id`, `formateur_id`, `formation_id`, `date_debut`, `date_fin`, `nbre_places`, `nom`) VALUES
	(1, 1, 1, '2022-11-04', '2023-07-03', 25, 'Plateau numérique'),
	(2, 3, 2, '2023-03-02', '2023-05-20', 20, 'Design web'),
	(3, 2, 1, '2018-02-02', '2019-02-02', 25, 'Développeur web');

-- Listage des données de la table symfonysessions_yuly.session_stagiaire : ~0 rows (environ)
DELETE FROM `session_stagiaire`;
INSERT INTO `session_stagiaire` (`session_id`, `stagiaire_id`) VALUES
	(1, 2),
	(1, 4),
	(1, 5),
	(1, 9),
	(1, 10),
	(2, 1),
	(2, 3),
	(2, 8),
	(3, 4);

-- Listage des données de la table symfonysessions_yuly.stagiaire : ~0 rows (environ)
DELETE FROM `stagiaire`;
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

-- Listage des données de la table symfonysessions_yuly.user : ~0 rows (environ)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
	(1, 'admin@email.com', '["ROLE_ADMIN"]', '$2y$13$Qa/BlD6s2i92oqngdNl/ZOWGIQtOxoH/ns.4LYPAjjPvdrNxK5TcS'),
	(3, 'test@test.com', '[]', '$2y$13$4cMem6Zk2h2blM55N6S9TeEBAdG8582mX/NeHjVTGfwA5lzsPDiKm');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
