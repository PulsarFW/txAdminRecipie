/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `app_profile_history` (
  `sid` bigint(20) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `app` varchar(32) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `picture` varchar(2048) DEFAULT NULL,
  `meta` longtext DEFAULT NULL,
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `account` int(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `balance` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`account`) USING BTREE,
  KEY `Owner` (`owner`) USING BTREE,
  KEY `Type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `bank_accounts_permissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` int(10) NOT NULL,
  `type` int(10) NOT NULL,
  `jointOwner` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `workplace` varchar(255) DEFAULT NULL,
  `jobPermissions` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job` (`job`) USING BTREE,
  KEY `workplace` (`workplace`) USING BTREE,
  KEY `jointOwner` (`jointOwner`) USING BTREE,
  KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `bank_accounts_transactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `account` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(1024) NOT NULL DEFAULT '',
  `data` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `bench_schematics` (
  `bench` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `schematic` char(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  KEY `bench` (`bench`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `blueline_race_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `host` varchar(32) NOT NULL,
  `track` int(11) unsigned NOT NULL,
  `class` varchar(4) NOT NULL,
  `racers` longtext NOT NULL DEFAULT '[]',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pd_race_history_track` (`track`) USING BTREE,
  KEY `host` (`host`),
  CONSTRAINT `pd_race_history_track` FOREIGN KEY (`track`) REFERENCES `blueline_tracks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `blueline_track_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `track` int(11) unsigned NOT NULL,
  `race` int(11) unsigned NOT NULL,
  `callsign` varchar(32) NOT NULL,
  `lap_start` int(11) NOT NULL,
  `lap_end` int(11) NOT NULL,
  `laptime` int(11) NOT NULL,
  `car` varchar(256) NOT NULL,
  `owned` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pd_track_history_track` (`track`) USING BTREE,
  KEY `pd_track_history_race` (`race`) USING BTREE,
  KEY `callsign` (`callsign`),
  CONSTRAINT `pd_track_history_race` FOREIGN KEY (`race`) REFERENCES `blueline_race_history` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pd_track_history_track` FOREIGN KEY (`track`) REFERENCES `blueline_tracks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `blueline_tracks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `distance` varchar(256) NOT NULL,
  `type` varchar(16) NOT NULL,
  `checkpoints` longtext NOT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `business_phones` (
  `id` char(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `number` varchar(50) NOT NULL DEFAULT '0',
  `muted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `business_phones` (`id`, `number`, `muted`) VALUES
	('autoexotics', '622-970-6947', NULL),
	('bahama', '096-892-5597', NULL),
	('bakery', '289-221-1843', NULL),
	('beanmachine', '197-789-8287', NULL),
	('bennys', '710-471-9435', NULL),
	('bowling', '463-026-5329', NULL),
	('burgershot', '174-303-6501', NULL),
	('casino', '931-155-9964', NULL),
	('dreamworks', '129-466-4878', NULL),
	('garcon_pawn', '612-504-4785', NULL),
	('harmony', '278-880-2215', NULL),
	('hayes', '747-525-9582', NULL),
	('lasttrain', '370-885-9015', NULL),
	('noodle', '856-602-0847', NULL),
	('ottos', '521-316-6145', NULL),
	('paleto_tuners', '521-720-7694', NULL),
	('pdm', '612-146-3360', NULL),
	('pepega_pawn', '393-207-4426', NULL),
	('pizza_this', '658-390-9596', NULL),
	('prego', '471-171-7066', NULL),
	('realestate', '922-959-4131', NULL),
	('rustybrowns', '652-158-0014', NULL),
	('triad', '426-344-9862', NULL),
	('tuna', '063-060-3147', NULL),
	('unicorn', '501-139-7594', NULL),
	('uwu', '730-824-3068', NULL),
	('vangelico', '989-757-8322', NULL),
	('vangelico_grapeseed', '983-214-0741', NULL),
	('woods_saloon', '236-188-7710', NULL);

CREATE TABLE IF NOT EXISTS `character_app_profiles` (
  `sid` bigint(20) unsigned NOT NULL,
  `app` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `picture` varchar(512) DEFAULT NULL,
  `meta` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`sid`,`app`),
  UNIQUE KEY `app` (`app`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(12) NOT NULL,
  `number` varchar(12) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `method` bit(1) NOT NULL DEFAULT b'0',
  `duration` int(11) NOT NULL DEFAULT -1,
  `anonymous` bit(1) NOT NULL DEFAULT b'0',
  `decryptable` bit(1) NOT NULL DEFAULT b'0',
  `limited` bit(1) NOT NULL DEFAULT b'0',
  `unread` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_chatter_groups` (
  `sid` bigint(20) unsigned NOT NULL,
  `chatty_group` bigint(20) unsigned NOT NULL,
  `joined_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sid`,`chatty_group`) USING BTREE,
  KEY `chatter_char_group` (`chatty_group`),
  CONSTRAINT `chatter_char_group` FOREIGN KEY (`chatty_group`) REFERENCES `chatter_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NOT NULL,
  `number` varchar(12) NOT NULL,
  `name` varchar(64) NOT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `favorite` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_documents_shared` (
  `doc_id` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `sharer` int(10) unsigned NOT NULL,
  `sharer_name` varchar(256) DEFAULT NULL,
  `shared_date` datetime NOT NULL DEFAULT current_timestamp(),
  `signature_required` tinyint(1) NOT NULL DEFAULT 0,
  `signed` datetime DEFAULT NULL,
  `signed_name` varchar(256) DEFAULT NULL,
  UNIQUE KEY `doc_id_sid` (`doc_id`,`sid`),
  KEY `sid` (`sid`),
  KEY `sharer` (`sharer`),
  KEY `doc_sid` (`doc_id`) USING BTREE,
  CONSTRAINT `doc_shared` FOREIGN KEY (`doc_id`) REFERENCES `character_documents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL,
  `sender` varchar(256) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `body` longtext NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `unread` bit(1) NOT NULL DEFAULT b'1',
  `flags` longtext DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(12) NOT NULL,
  `number` varchar(12) NOT NULL,
  `method` tinyint(1) NOT NULL DEFAULT 0,
  `unread` bit(1) NOT NULL DEFAULT b'1',
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `message` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `number` (`number`),
  KEY `ownu` (`owner`,`number`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_parole` (
  `SID` int(11) NOT NULL,
  `end` datetime NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `parole` int(11) NOT NULL DEFAULT 0,
  `sentence` int(11) NOT NULL DEFAULT 0,
  `fine` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `character_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) NOT NULL,
  `image_url` text NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `character_schematics` (
  `sid` int(11) DEFAULT NULL,
  `bench` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `schematic` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  KEY `sid` (`sid`,`bench`),
  KEY `schematic` (`schematic`,`bench`,`sid`),
  KEY `sid_schem` (`sid`,`schematic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `chatter_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL DEFAULT 'Chatter Group',
  `icon` varchar(1024) DEFAULT NULL,
  `owner` bigint(20) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `chatter_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group` bigint(20) unsigned NOT NULL,
  `author` bigint(20) unsigned NOT NULL,
  `message` varchar(256) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `chatter_msg_group` (`group`),
  KEY `chatter_msg_author` (`author`),
  CONSTRAINT `chatter_msg_group` FOREIGN KEY (`group`) REFERENCES `chatter_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `crafting_cooldowns` (
  `bench` varchar(64) NOT NULL,
  `id` varchar(64) NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `doors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) DEFAULT NULL,
  `type` varchar(16) NOT NULL DEFAULT 'standard',
  `category` varchar(32) NOT NULL DEFAULT 'misc',
  `label` varchar(64) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1055 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `doors` (`id`, `identifier`, `type`, `category`, `label`, `data`, `created_at`, `updated_at`) VALUES
	(970, 'bank_fleeca_mall_office', 'standard', 'misc', 'bank fleeca mall office', '{"restricted":[],"doors":[{"coords":{"z":41.58000183105469,"y":-583.469970703125,"x":-567.2000122070313},"model":-551608542}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(971, 'bank_fleeca_vinewood_door_1', 'standard', 'misc', 'bank fleeca vinewood door 1', '{"restricted":[],"doors":[{"coords":{"z":106.37999725341797,"y":206.47999572753907,"x":272.7900085449219},"model":267980221}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(972, 'bank_fleeca_vinewood_door_2', 'standard', 'misc', 'bank fleeca vinewood door 2', '{"restricted":[],"doors":[{"coords":{"z":106.37000274658203,"y":215.7100067138672,"x":251.52000427246095},"model":-2121568016}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(973, 'bank_fleeca_vinewood_door_3', 'standard', 'misc', 'bank fleeca vinewood door 3', '{"restricted":[],"doors":[{"coords":{"z":106.37000274658203,"y":213.41000366210938,"x":267.3699951171875},"model":-2121568016}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(974, 'bank_fleeca_vinewood_door_4', 'standard', 'misc', 'bank fleeca vinewood door 4', '{"restricted":[],"doors":[{"coords":{"z":106.37000274658203,"y":221.27000427246095,"x":270.2300109863281},"model":-2121568016}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(975, 'bank_fleeca_vinewood_door_5', 'standard', 'misc', 'bank fleeca vinewood door 5', '{"restricted":[],"doors":[{"coords":{"z":106.37000274658203,"y":229.69000244140626,"x":256.6099853515625},"model":-2121568016}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(976, 'bank_fleeca_vinewood_door_6', 'standard', 'misc', 'bank fleeca vinewood door 6', '{"restricted":[],"doors":[{"coords":{"z":106.37000274658203,"y":229.69000244140626,"x":256.6099853515625},"model":-2121568016}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(977, 'bank_fleeca_vinewood_gate_1', 'standard', 'misc', 'bank fleeca vinewood gate 1', '{"restricted":[],"doors":[{"coords":{"z":97.31999969482422,"y":219.89999389648438,"x":272.6400146484375},"model":409280169}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(978, 'bank_fleeca_vinewood_gate_2', 'standard', 'misc', 'bank fleeca vinewood gate 2', '{"restricted":[],"doors":[{"coords":{"z":97.31999969482422,"y":212.9199981689453,"x":270.1000061035156},"model":409280169}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(979, 'bank_fleeca_vinewood_offices_1', 'standard', 'misc', 'bank fleeca vinewood offices 1', '{"restricted":[],"doors":[{"coords":{"z":106.37999725341797,"y":210.33999633789063,"x":262.17999267578127},"model":1721645826}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(980, 'bank_fleeca_vinewood_offices_2', 'standard', 'misc', 'bank fleeca vinewood offices 2', '{"restricted":[],"doors":[{"coords":{"z":106.37999725341797,"y":213.75999450683595,"x":252.7899932861328},"model":1721645826}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(981, 'bank_fleeca_vinewood_offices_3', 'standard', 'misc', 'bank fleeca vinewood offices 3', '{"restricted":[],"doors":[{"coords":{"z":106.37999725341797,"y":230.3800048828125,"x":258.82000732421877},"model":1721645826}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(982, 'bank_fleeca_vinewood_offices_4', 'standard', 'misc', 'bank fleeca vinewood offices 4', '{"restricted":[],"doors":[{"coords":{"z":106.37999725341797,"y":226.9600067138672,"x":268.2099914550781},"model":1721645826}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(983, 'bank_fleeca_vinewood_offices_5_1', 'standard', 'misc', 'bank fleeca vinewood offices 5 1', '{"restricted":[],"doors":[{"coords":{"z":110.27999877929688,"y":216.86000061035157,"x":273.17999267578127},"model":1109357065}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(984, 'bank_fleeca_vinewood_offices_5_2', 'standard', 'misc', 'bank fleeca vinewood offices 5 2', '{"restricted":[],"doors":[{"coords":{"z":110.27999877929688,"y":214.91000366210938,"x":272.4700012207031},"model":1109357065}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(985, 'bank_fleeca_vinewood_offices_6', 'standard', 'misc', 'bank fleeca vinewood offices 6', '{"restricted":[],"doors":[{"coords":{"z":110.27999877929688,"y":210.33999633789063,"x":262.17999267578127},"model":1721645826}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(986, 'bank_fleeca_vinewood_offices_7', 'standard', 'misc', 'bank fleeca vinewood offices 7', '{"restricted":[],"doors":[{"coords":{"z":110.27999877929688,"y":213.75999450683595,"x":252.7899932861328},"model":1721645826}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(987, 'bank_fleeca_vinewood_offices_8', 'standard', 'misc', 'bank fleeca vinewood offices 8', '{"restricted":[],"doors":[{"coords":{"z":110.27999877929688,"y":230.3800048828125,"x":258.82000732421877},"model":1721645826}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(988, 'bank_fleeca_vinewood_offices_9', 'standard', 'misc', 'bank fleeca vinewood offices 9', '{"restricted":[],"doors":[{"coords":{"z":110.27999877929688,"y":226.9600067138672,"x":268.2099914550781},"model":1721645826}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(989, 'bank_fleeca_vinewood_stairs_1', 'standard', 'misc', 'bank fleeca vinewood stairs 1', '{"restricted":[],"doors":[{"coords":{"z":106.37999725341797,"y":223.5399932861328,"x":277.6000061035156},"model":267980221}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(990, 'bank_fleeca_vinewood_stairs_2', 'standard', 'misc', 'bank fleeca vinewood stairs 2', '{"restricted":[],"doors":[{"coords":{"z":110.27999877929688,"y":223.5399932861328,"x":277.6000061035156},"model":267980221}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(991, 'bank_fleeca_vinewood_roof_1', 'standard', 'misc', 'bank fleeca vinewood roof 1', '{"restricted":[],"aliases":["bank_fleeca_vinewood_roof_2"],"doors":[{"coords":{"z":123.97000122070313,"y":235.47999572753907,"x":271.45001220703127},"model":726025323},{"coords":{"z":123.97000122070313,"y":234.58999633789063,"x":273.8999938964844},"model":1577691629}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(992, 'bank_savings_paleto_office_1', 'standard', 'misc', 'bank savings paleto office 1', '{"restricted":[],"doors":[{"coords":{"z":31.79000091552734,"y":6463.77001953125,"x":-104.83999633789063},"model":2110946875}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(993, 'bank_savings_paleto_office_2', 'standard', 'misc', 'bank savings paleto office 2', '{"restricted":[],"doors":[{"coords":{"z":31.79000091552734,"y":6467.990234375,"x":-100.62000274658203},"model":1754616769}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(994, 'bank_savings_paleto_office_3', 'standard', 'misc', 'bank savings paleto office 3', '{"restricted":[],"doors":[{"coords":{"z":31.79000091552734,"y":6473.919921875,"x":-104.70999908447266},"model":-368548260}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(995, 'bank_savings_paleto_corridor_1', 'standard', 'misc', 'bank savings paleto corridor 1', '{"restricted":[],"doors":[{"coords":{"z":31.79000091552734,"y":6475.330078125,"x":-111.04000091552735},"model":-56652918}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(996, 'bank_savings_paleto_corridor_2', 'standard', 'misc', 'bank savings paleto corridor 2', '{"restricted":[],"doors":[{"coords":{"z":31.79000091552734,"y":6474.39013671875,"x":-100.11000061035156},"model":-147325430}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(997, 'bank_savings_paleto_security', 'standard', 'misc', 'bank savings paleto security', '{"restricted":[],"doors":[{"coords":{"z":31.79000091552734,"y":6468.9599609375,"x":-92.2300033569336},"model":-147325430}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(998, 'bank_savings_paleto_back_1', 'standard', 'misc', 'bank savings paleto back 1', '{"restricted":[],"doors":[{"coords":{"z":31.79000091552734,"y":6474.06005859375,"x":-96.70999908447266},"model":1248599813}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(999, 'bank_savings_paleto_back_2', 'standard', 'misc', 'bank savings paleto back 2', '{"restricted":[],"doors":[{"coords":{"z":31.79000091552734,"y":6478.9599609375,"x":-116.51000213623047},"model":1248599813}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1000, 'bank_savings_paleto_gate', 'standard', 'misc', 'bank savings paleto gate', '{"restricted":[],"doors":[{"coords":{"z":31.20999908447265,"y":6468.009765625,"x":-112.56999969482422},"model":1784650867}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1001, 'bank_savings_paleto_vault', 'standard', 'misc', 'bank savings paleto vault', '{"restricted":[],"doors":[{"coords":{"z":31.8799991607666,"y":6464.5498046875,"x":-100.23999786376953},"model":-2050208642}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1002, 'fleeca_hawick_east_gate', 'standard', 'misc', 'fleeca hawick east gate', '{"restricted":[],"doors":[{"coords":{"z":54.45999908447265,"y":-285.989990234375,"x":314.6199951171875},"model":-1591004109}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1003, 'fleeca_hawick_west_gate', 'standard', 'misc', 'fleeca hawick west gate', '{"restricted":[],"doors":[{"coords":{"z":49.33000183105469,"y":-56.79999923706055,"x":-350.4100036621094},"model":-1591004109}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1004, 'fleeca_delperro_gate', 'standard', 'misc', 'fleeca delperro gate', '{"restricted":[],"doors":[{"coords":{"z":38.08000183105469,"y":-335.1300048828125,"x":-1207.3299560546876},"model":-1591004109}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1005, 'fleeca_great_ocean_gate', 'standard', 'misc', 'fleeca great ocean gate', '{"restricted":[],"doors":[{"coords":{"z":16.0,"y":485.4200134277344,"x":-2956.1201171875},"model":-1591004109}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1006, 'fleeca_route68_gate', 'standard', 'misc', 'fleeca route68 gate', '{"restricted":[],"doors":[{"coords":{"z":38.38999938964844,"y":2713.14990234375,"x":1172.2900390625},"model":-1591004109}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1007, 'fleeca_vespucci_gate', 'standard', 'misc', 'fleeca vespucci gate', '{"restricted":[],"doors":[{"coords":{"z":29.67000007629394,"y":-1047.6300048828126,"x":150.2899932861328},"model":-1591004109}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1008, 'fleeca_hawick_east_tills', 'standard', 'misc', 'fleeca hawick east tills', '{"restricted":[],"doors":[{"coords":{"z":54.31999969482422,"y":-280.29998779296877,"x":309.70001220703127},"model":-147325430}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1009, 'fleeca_hawick_west_tills', 'standard', 'misc', 'fleeca hawick west tills', '{"restricted":[],"doors":[{"coords":{"z":49.18999862670898,"y":-51.18999862670898,"x":-355.44000244140627},"model":-147325430}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1010, 'fleeca_delperro_tills', 'standard', 'misc', 'fleeca delperro tills', '{"restricted":[],"doors":[{"coords":{"z":37.93999862670898,"y":-334.8500061035156,"x":-1214.8499755859376},"model":-147325430}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1011, 'fleeca_great_ocean_tills', 'standard', 'misc', 'fleeca great ocean tills', '{"restricted":[],"doors":[{"coords":{"z":15.85000038146972,"y":479.0,"x":-2960.0400390625},"model":-147325430}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1012, 'fleeca_route68_tills', 'standard', 'misc', 'fleeca route68 tills', '{"restricted":[],"doors":[{"coords":{"z":38.25,"y":2709.5,"x":1178.8699951171876},"model":-147325430}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1013, 'fleeca_vespucci_tills', 'standard', 'misc', 'fleeca vespucci tills', '{"restricted":[],"doors":[{"coords":{"z":29.5300006866455,"y":-1041.93994140625,"x":145.3699951171875},"model":-147325430}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1014, 'bobcat_extr', 'standard', 'misc', 'bobcat extr', '{"restricted":[],"aliases":["bobcat_extr_2"],"doors":[{"coords":{"z":30.55999946594238,"y":-2258.31005859375,"x":880.9000244140625},"model":-1563799200},{"coords":{"z":30.55999946594238,"y":-2258.530029296875,"x":883.47998046875},"model":-1259801187}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1015, 'bobcat_front', 'standard', 'misc', 'bobcat front', '{"restricted":[],"doors":[{"coords":{"z":30.6200008392334,"y":-2264.669921875,"x":881.6199951171875},"model":-551608542}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1016, 'bobcat_inner', 'standard', 'misc', 'bobcat inner', '{"restricted":[],"aliases":["bobcat_inner_2"],"doors":[{"coords":{"z":30.6200008392334,"y":-2268.179931640625,"x":880.030029296875},"model":933053701},{"coords":{"z":30.6200008392334,"y":-2268.409912109375,"x":882.6199951171875},"model":933053701}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1017, 'bobcat_surveillance', 'standard', 'misc', 'bobcat surveillance', '{"restricted":[],"doors":[{"coords":{"z":30.6200008392334,"y":-2295.27001953125,"x":882.3400268554688},"model":-311575617}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1018, 'bobcat_rear_left', 'standard', 'misc', 'bobcat rear left', '{"restricted":[],"aliases":["bobcat_rear_right"],"doors":[{"coords":{"z":31.01000022888183,"y":-2306.949951171875,"x":864.989990234375},"model":838685283},{"coords":{"z":31.01000022888183,"y":-2309.949951171875,"x":864.72998046875},"model":-1020431159}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1019, 'coke_hidden_entrance', 'standard', 'misc', 'coke hidden entrance', '{"restricted":[],"doors":[{"coords":{"z":7.46000003814697,"y":-2444.47998046875,"x":-321.489990234375},"model":1013228087}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1020, 'coke_seadoor', 'standard', 'misc', 'coke seadoor', '{"restricted":[],"aliases":["coke_seadoor_2"],"doors":[{"coords":{"z":-1.63999998569488,"y":-2468.719970703125,"x":-335.9100036621094},"model":1988553027},{"coords":{"z":-1.63999998569488,"y":-2473.679931640625,"x":-330.0299987792969},"model":1625505276}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1021, 'coke_garage', 'standard', 'misc', 'coke garage', '{"restricted":[],"doors":[{"coords":{"z":9.39000034332275,"y":-2438.39990234375,"x":-318.0899963378906},"model":-1291669313}],"locked":true}', 1785168909, 1785168909),
	(1022, 'robbery_gallery_vault', 'standard', 'misc', 'robbery gallery vault', '{"restricted":[],"doors":[{"coords":{"z":93.9800033569336,"y":138.72000122070313,"x":14.76000022888183},"model":-660779536}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1023, 'robbery_gallery_cage1', 'standard', 'misc', 'robbery gallery cage1', '{"restricted":[],"doors":[{"coords":{"z":93.91999816894531,"y":144.9600067138672,"x":37.47000122070312},"model":-1508355822}],"autoRate":10.0,"locked":false}', 1785168909, 1785168909),
	(1024, 'robbery_gallery_cage2', 'standard', 'misc', 'robbery gallery cage2', '{"restricted":[],"doors":[{"coords":{"z":93.94000244140625,"y":135.05999755859376,"x":33.83000183105469},"model":-1508355822}],"autoRate":10.0,"locked":false}', 1785168909, 1785168909),
	(1025, 'robbery_gallery_office', 'standard', 'misc', 'robbery gallery office', '{"restricted":[],"aliases":["robbery_gallery_office2"],"doors":[{"coords":{"z":93.91999816894531,"y":154.0800018310547,"x":20.34000015258789},"model":110411286},{"coords":{"z":93.91000366210938,"y":156.52000427246095,"x":21.22999954223632},"model":110411286}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1026, 'robbery_gallery_front', 'standard', 'misc', 'robbery gallery front', '{"restricted":[],"aliases":["robbery_gallery_front2"],"doors":[{"coords":{"z":93.91999816894531,"y":147.63999938964845,"x":11.19999980926513},"model":110411286},{"coords":{"z":93.91000366210938,"y":150.0800018310547,"x":12.09000015258789},"model":110411286}],"autoRate":10.0,"locked":false}', 1785168909, 1785168909),
	(1027, 'lombank_front_gate', 'standard', 'misc', 'lombank front gate', '{"restricted":[],"doors":[{"coords":{"z":30.04999923706054,"y":-919.9500122070313,"x":17.98999977111816},"model":-222270721}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1028, 'lombank_office', 'standard', 'misc', 'lombank office', '{"restricted":[],"aliases":["lombank_office_2"],"doors":[{"coords":{"z":33.84000015258789,"y":-933.8499755859375,"x":25.3799991607666},"model":964838196},{"coords":{"z":33.84000015258789,"y":-942.3900146484375,"x":22.29000091552734},"model":964838196}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1029, 'lombank_cargo', 'standard', 'misc', 'lombank cargo', '{"restricted":[],"doors":[{"coords":{"z":31.80999946594238,"y":-917.5999755859375,"x":28.95999908447265},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1030, 'lombank_cargo_2', 'standard', 'misc', 'lombank cargo 2', '{"restricted":[],"doors":[{"coords":{"z":31.80999946594238,"y":-920.6400146484375,"x":27.86000061035156},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1031, 'lombank_hidden', 'standard', 'misc', 'lombank hidden', '{"restricted":[],"doors":[{"coords":{"z":29.90999984741211,"y":-922.1599731445313,"x":37.38999938964844},"model":30403864}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1032, 'lombank_upper_gate', 'standard', 'misc', 'lombank upper gate', '{"restricted":[],"doors":[{"coords":{"z":30.21999931335449,"y":-931.5999755859375,"x":22.70000076293945},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1033, 'lombank_upper_vault', 'standard', 'misc', 'lombank upper vault', '{"restricted":[],"doors":[{"coords":{"z":30.05999946594238,"y":-940.3800048828125,"x":19.06999969482422},"model":-1185205679}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1034, 'lombank_upper_vault_gate', 'standard', 'misc', 'lombank upper vault gate', '{"restricted":[],"doors":[{"coords":{"z":30.21999931335449,"y":-943.8099975585938,"x":21.90999984741211},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1035, 'lombank_lower_gate', 'standard', 'misc', 'lombank lower gate', '{"restricted":[],"doors":[{"coords":{"z":26.05999946594238,"y":-930.260009765625,"x":25.32999992370605},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1036, 'lombank_lower_vault', 'standard', 'misc', 'lombank lower vault', '{"restricted":[],"holdOpen":true,"doors":[{"coords":{"z":26.45000076293945,"y":-918.3499755859375,"x":26.29999923706054},"model":961976194}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1037, 'lombank_lower_room_1', 'standard', 'misc', 'lombank lower room 1', '{"restricted":[],"doors":[{"coords":{"z":26.05999946594238,"y":-915.280029296875,"x":23.93000030517578},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1038, 'lombank_lower_room_2', 'standard', 'misc', 'lombank lower room 2', '{"restricted":[],"doors":[{"coords":{"z":26.05999946594238,"y":-918.5800170898438,"x":33.0},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1039, 'lombank_lower_room_3', 'standard', 'misc', 'lombank lower room 3', '{"restricted":[],"doors":[{"coords":{"z":26.05999946594238,"y":-908.2000122070313,"x":26.5},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1040, 'lombank_lower_room_4', 'standard', 'misc', 'lombank lower room 4', '{"restricted":[],"doors":[{"coords":{"z":26.05999946594238,"y":-911.5,"x":35.56999969482422},"model":1309269072}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1041, 'lombank_hidden_entrance', 'standard', 'misc', 'lombank hidden entrance', '{"restricted":[],"doors":[{"coords":{"z":31.70999908447265,"y":-810.969970703125,"x":43.40999984741211},"model":-1997783829}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1042, 'lombank_office_3', 'standard', 'misc', 'lombank office 3', '{"restricted":[],"doors":[{"coords":{"z":30.04999923706054,"y":-933.3300170898438,"x":35.7400016784668},"model":964838196}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1043, 'lombank_supply_closet', 'standard', 'misc', 'lombank supply closet', '{"restricted":[],"doors":[{"coords":{"z":30.06999969482422,"y":-926.2100219726563,"x":38.31999969482422},"model":964838196}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1044, 'lombank_lasers', 'standard', 'misc', 'lombank lasers', '{"restricted":[],"holdOpen":true,"doors":[{"coords":{"z":26.73406028747558,"y":-926.6845703125,"x":25.96659088134765},"model":-1596396219}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1045, 'lombank_garage', 'standard', 'misc', 'lombank garage', '{"restricted":[],"holdOpen":true,"doors":[{"coords":{"z":33.40999984741211,"y":-908.97998046875,"x":36.54000091552734},"model":-1906310003}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1046, 'mazebank_tills', 'standard', 'misc', 'mazebank tills', '{"restricted":[],"doors":[{"coords":{"z":16.93000030517578,"y":-816.6099853515625,"x":-1308.4599609375},"model":-774701539}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1047, 'mazebank_gate', 'standard', 'misc', 'mazebank gate', '{"restricted":[],"doors":[{"coords":{"z":16.8700008392334,"y":-819.969970703125,"x":-1301.280029296875},"model":-1269579347}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1048, 'mazebank_vault_gate', 'standard', 'misc', 'mazebank vault gate', '{"restricted":[],"doors":[{"coords":{"z":17.11000061035156,"y":-816.030029296875,"x":-1294.6400146484376},"model":-1591004109}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1049, 'mazebank_offices', 'standard', 'misc', 'mazebank offices', '{"restricted":[{"job":"police","reqDuty":true,"workplace":false,"type":"job","gradeLevel":0,"jobPermission":false}],"doors":[{"coords":{"z":17.21999931335449,"y":-830.3800048828125,"x":-1302.47998046875},"model":-1960292781}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1050, 'mazebank_office_1', 'standard', 'misc', 'mazebank office 1', '{"restricted":[{"job":"police","reqDuty":true,"workplace":false,"type":"job","gradeLevel":0,"jobPermission":false}],"doors":[{"coords":{"z":17.21999931335449,"y":-830.8599853515625,"x":-1300.5899658203126},"model":-1960292781}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1051, 'mazebank_office_2', 'standard', 'misc', 'mazebank office 2', '{"restricted":[{"job":"police","reqDuty":true,"workplace":false,"type":"job","gradeLevel":0,"jobPermission":false}],"doors":[{"coords":{"z":17.21999931335449,"y":-834.1400146484375,"x":-1298.1300048828126},"model":-1960292781}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1052, 'mazebank_office_3', 'standard', 'misc', 'mazebank office 3', '{"restricted":[{"job":"police","reqDuty":true,"workplace":false,"type":"job","gradeLevel":0,"jobPermission":false}],"doors":[{"coords":{"z":17.21999931335449,"y":-840.8900146484375,"x":-1293.06005859375},"model":-1960292781}],"autoRate":10.0,"locked":true}', 1785168909, 1785168909),
	(1053, 'robbery_vangelico_office', 'standard', 'misc', 'robbery vangelico office', '{"restricted":[],"doors":[{"coords":{"z":38.20999908447265,"y":-230.14999389648438,"x":-629.1300048828125},"model":1335309163}],"autoRate":6.0,"locked":true}', 1785168909, 1785168909),
	(1054, 'robbery_xgems_office', 'standard', 'misc', 'robbery xgems office', '{"restricted":[],"doors":[{"coords":{"z":106.30000305175781,"y":369.1300048828125,"x":225.9600067138672},"model":1335309163}],"autoRate":6.0,"locked":true}', 1785168909, 1785168909);

CREATE TABLE IF NOT EXISTS `firearms` (
  `police_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial` char(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `scratched` tinyint(1) NOT NULL DEFAULT 0,
  `purchased` datetime NOT NULL DEFAULT current_timestamp(),
  `model` varchar(128) NOT NULL,
  `item` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `owner_sid` int(11) unsigned DEFAULT NULL,
  `owner_name` varchar(512) DEFAULT NULL,
  `police_filed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`police_id`),
  KEY `owner_sid` (`owner_sid`) USING BTREE,
  KEY `police_filed` (`police_filed`) USING BTREE,
  KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=2010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `firearms_flags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial` char(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `type` char(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` longtext NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `author_sid` int(11) unsigned NOT NULL,
  `author_first` varchar(128) NOT NULL,
  `author_last` varchar(128) NOT NULL,
  `author_callsign` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `inventory_shop_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `inventory` varchar(255) NOT NULL DEFAULT '0',
  `item` varchar(255) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT 0,
  `itemId` bigint(20) DEFAULT NULL,
  `buyer` int(11) NOT NULL DEFAULT 0,
  `metadata` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `mdt_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `title` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fine` int(11) NOT NULL DEFAULT 0,
  `jail` int(11) NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `mdt_charges` (`id`, `type`, `title`, `description`, `fine`, `jail`, `points`) VALUES
	(1, 3, 'Capital Murder', '1st Degree Murder with specific circumstances. The special circumstances are defined as such:- Killing a government employee;- Killing an active member of a jury;- Killing a witness to prevent testimony in court;- Killing more than one victim (serial);', 0, 999, 0),
	(2, 3, ' Accessory to Capital Murder', 'Accessory to Capital Murder', 0, 999, 0),
	(3, 3, '1st Degree Murder', 'The unlawful killing of another human without justification or valid excuse, with malice aforethought/premeditation.', 0, 999, 0),
	(4, 3, 'Accessory to 1st Degree Murder', 'Aids and or Abets the unlawful killing of another human without justification or valid excuse, especially the unlawful killing of another human with malice aforethought / premeditation.', 0, 999, 0),
	(5, 3, 'Attempted 1st Degree Murder', 'The attempt to unlawfully kill another human without justification or valid excuse, with malice aforethought/premeditation.', 5000, 85, 0),
	(6, 3, '2nd Degree Murder', 'The act of unlawfully killing that doesn’t involve malice aforethought—intent to seriously harm or kill, or extreme, reckless disregard for life. Heat of passion, callous disregard for human life.', 30000, 350, 0),
	(7, 3, 'Accessory to 2nd Degree Murder', 'Aids and or Abets the unlawfully killing that doesn’t involve malice aforethought—intent to seriously harm or kill, or extreme, reckless disregard for life. Heat of passion, callous disregard for human life.', 0, 300, 0),
	(8, 3, 'Attempted 2nd Degree Murder', 'The attempt to unlawfully kill that doesn’t involve malice aforethought—intent to seriously harm or kill, or extreme, reckless disregard for life. Heat of passion, callous disregard for human life.', 3000, 65, 0),
	(9, 3, 'Voluntary Manslaughter', 'The accidental, criminally negligent, or criminally reckless killing of another individual with the intent to physically harm them. ', 20000, 130, 0),
	(10, 3, 'Vehiclular Manslaughter', 'The accidental, criminally negligent, or criminally reckless killing of another individual whilst driving a motor vehicle. ', 16000, 115, 0),
	(11, 3, 'Involuntary Manslaughter', 'The accidental, criminally negligent, or criminally reckless killing of another individual with no intent to physically harm them. ', 15000, 100, 0),
	(12, 3, 'Gang Related Shooting', 'Any individual who, with one or more members of their “gang” engages in a shooting/shootout with two or more members of other gangs. A “gang” is defined as an ongoing group, club, organization, or association of three or more persons which has the primary purpose of the commission of criminal offenses, or the members of which over the last ninety days have engaged in continuing or ongoing series of felony offenses. Alternatively, any individual or individuals flagged as “gang related” based on knowledge or probable cause by Law Enforcement. ', 10000, 75, 0),
	(13, 3, 'Kidnapping a Government Employee', 'Abducts a government employee and holds them against their will.', 5000, 30, 0),
	(14, 3, 'Kidnapping', 'Abducts another person and holds them against their will.', 2000, 20, 0),
	(15, 3, 'Assault with a Deadly Weapon', 'Attempts to commit a violent injury upon another person with a deadly weapon. A weapon is descibed as a firearm or any type of melee item, also including motor vehicles.', 2000, 25, 0),
	(16, 3, 'Reckless Endangerment ', 'Person creates a substantial risk of serious physical injury to themselves or another person. The accused person isn\'t required to intend the resulting or potential harm, but must have acted in a way that showed a disregard for the foreseeable consequences of the actions.', 1000, 15, 0),
	(17, 2, 'Unlawful Imprisonment', 'Restricts a person\'s movement within any area without justification or consent.', 1000, 15, 0),
	(18, 2, 'Criminal Threats', 'A "criminal threat" is when you threaten to kill or physically harm someone.That person is thereby placed in a state of reasonably sustained fear for his/her safety or for the safety of his/her immediate family, the threat is specific and unequivocal and you communicate the threat verbally, in writing, or via an electronically transmitted device.', 1250, 15, 0),
	(19, 2, 'Assault & Battery', 'Openly threatens violence or injury upon an individual either orally or thru their actions and acts upon that threat.', 825, 15, 0),
	(20, 3, 'Terrorism ', 'The unlawful use of Extreme Violence and Intimidation against the Civilian Population that would pursue political aims, compromise medical neutrality, or in the name of religious ideology. The unlawful use of Extreme Violence and Intimidation against Government Entities that would pursue the disruption, destabilization or destruction of those entities for political or religious aims.', 0, 999, 0),
	(21, 3, 'Weapons Trafficking', 'The unlawful transportation of a large quantity of any class of firearms and/or molotov cocktails and/or explosives, with the intent to distribute. Intent to distribute can be inferred through circumstances surrounding the discovery of the firearms or a pattern of behavior of the suspects, including large sums of money, and/or the possession of six or more firearms.', 0, 999, 0),
	(22, 3, 'Criminal Possession of a Government-Issue Firearm', 'It is illegal to possess a government-owned or issued firearm, without being a duly sworn Peace Officer. This also includes flashbangs.', 22500, 210, 0),
	(23, 3, 'Criminal Possession of a Government-Issue Less Lethal Firearm/Weapon', 'It is illegal to possess a government-owned or issued less-lethal firearm, without being a duly sworn Peace Officer. This would include tasers, batons and beanbag shotguns.', 12000, 70, 0),
	(24, 3, 'Criminal Possession of a Firearm [Class 3]', 'Possesses a Class 3 weapon. LMG, RPG, DMR\'s', 3000, 35, 0),
	(25, 3, 'Criminal Possession of a Firearm [Class 2]', 'Possess a Class 2 weapon. Possesses semi-automatic to automatic firearms, and shotguns.', 2000, 28, 0),
	(26, 2, 'Criminal Possession of a Firearm [Class 1]', 'Possess a Class 1 weapon without a proper license or a weapon which is not registered to the individual possessing it.', 500, 10, 0),
	(27, 3, 'Criminal Sale of a Firearm [Class 2 and 3]', 'The unlawful sale of a Class 2 or Class 3 weapon', 3000, 35, 0),
	(28, 3, 'Criminal Sale of a Firearm [Class 1]', 'The unlawful sale, or purchase, of a Class 1 firearm, when a person does not own a proper weapon license.', 1000, 12, 0),
	(29, 3, 'Possession of Explosives', 'Possesses explosives on his or her person. Includes transport of explosives.', 5000, 100, 0),
	(30, 3, 'Criminal Use of Explosives', 'A person is guilty of criminal use of explosives if they intentionally place, use, or attempt to use explosives against any real person or property and detonate said explosives, directly or indirectly. This shall include the use of tanker trucks, cars ignited in gasoline, or tanks/barrels full of combustible liquid for the purpose of causing an explosion. This charge may be issued in addition to Attempted Murder.', 3000, 35, 0),
	(31, 3, 'Criminal Possession of a Government Issued Equipment', 'It is illegal to possess a government-owned or issued equipment (non weapons) without being a government employee with the right to possess them.', 1250, 20, 0),
	(32, 3, 'Possession of a Molotov', 'Person possesses a molotov or other improvised incendiary weapons.', 3000, 30, 0),
	(33, 3, 'Possession of a Silencer / Suppressor', 'It is illegal to possess a silencer/suppressor. No person shall possess any type of device that alters the sound of a firearm.', 1000, 25, 0),
	(34, 2, 'Resisting Arrest', 'Flees from a Law Enforcement Officer to avoid being apprehended, detained, or arrested while on foot, or a passenger in a vehicle.', 1000, 10, 0),
	(35, 2, 'Criminal Use of a Firearm', 'Discharges a firearm for no legal reason, or using a firearm in the commission to aid in a crime.', 1000, 15, 0),
	(36, 2, 'Brandishing of a Firearm', 'Displaying a firearm in public without a legal reason. "Open Carry" is not a legal reason to have a weapon in your hand. To open carry, the weapon must be holstered or attached to a sling. ', 1000, 10, 0),
	(37, 2, 'Brandishing of a non Firearm', 'It is unlawful for you to draw or exhibit a potentially deadly weapon in a rude, angry, or threatening way in the presence of another person and not in defense of self or others', 500, 10, 0),
	(38, 1, 'Jaywalking', 'Crosses a road without the use of a crosswalk, or without a marked crossing light.', 100, 0, 0),
	(39, 3, 'Aggravated Robbery', 'A robbery in which the victim, a hostage, or a third party otherwise uninvolved in the crime is physically injured. ', 2250, 35, 0),
	(40, 3, 'Accessory to Aggravated Robbery', 'Harboring, concealing or aiding a person in the act/attempt to commit Aggravated Robbery.', 1500, 30, 0),
	(41, 3, 'Robbery', 'The taking or carrying away with the intent to steal any thing of value in the care, custody, control, management, or possession of any store, bank, or financial institution, including but not limited to all Fleeca Banks, 24/7 Gas Stations, LTD Gas Stations, or Vangelico’s Jewelry Stores. Alternatively, the taking or carrying away with the intent to steal any thing of value from the direct custody of another person.', 2000, 25, 0),
	(42, 3, 'Accessory to Robbery', 'Harboring, concealing or aiding a person in the act/attempt to commit Robbery.', 1050, 20, 0),
	(43, 3, 'First Degree Money Laundering', 'Possesses money in the amount of $30,000 or more with the specific intent to use it to promote criminal activity or the knowledge that the money involved came from criminal activity.', 5000, 35, 0),
	(44, 3, 'Second Degree Money Laundering', 'Possesses money in the amount of $10,000 or more with the specific intent to use it to promote criminal activity or the knowledge that the money involved came from criminal activity.', 2500, 20, 0),
	(45, 2, 'Third Degree Money Laundering', 'Possesses money in the amount of less than $10,000 with the specific intent to use it to promote criminal activity or the knowledge that the money involved came from criminal activity.', 1500, 15, 0),
	(46, 2, 'Sale of Stolen Goods or Stolen Property', 'The bartering or selling of wares, merchandise, or property that has been stolen from another and the person knew or has reason to know the property was stolen. Color coded bank cards are per se considered to be stolen goods or property under this statute. ', 2000, 25, 0),
	(47, 3, 'Receiving Stolen Property in the First Degree', 'A person who bought, received, sold or participated in selling, concealed or withheld property that has been stolen from another, and the individual knew the property was stolen.  To include possession of color coded bank cards in the amount of 11 or more.', 1500, 15, 0),
	(48, 2, 'Receiving Stolen Property in the Second Degree', 'A person who bought, received, sold or participated in selling, concealed or withheld property that has been stolen from another, and the individual knew the property was stolen. To included color coded bank cards in the amount of 6 to 10', 1000, 12, 0),
	(49, 2, 'Receiving Stolen Property in the Third Degree', 'A person who bought, received, sold or participated in selling, concealed or withheld property that has been stolen from another, and the individual knew the property was stolen. To included color coded bank cards in the amount of 5 or less.', 500, 10, 0),
	(50, 3, 'Possession of Stolen Goods', 'Possesion of Valuable Goods without proof of ownership.', 1050, 15, 0),
	(51, 2, 'Possession of a Stolen Identification ', 'Possesses the Identification Card of another citizen without consent.', 1000, 12, 0),
	(52, 2, 'Leaving Without Paying', 'It is illegal for a person to obtain services by deception, force, threat or other unlawful means, or without lawfully compensating the provider for these services provided. This will include garages and restaurants.', 1000, 12, 0),
	(53, 3, 'Grand Theft Auto', 'Unlawfully taking a vehicle belonging to another, or driving the vehicle without the owner\'s consent, with the intent to permanently deprive the owner of the vehicle.', 1050, 15, 0),
	(54, 2, 'Joyriding', 'The taking or operating of a vehicle without the owner\'s consent, without the intent to deprive the owner of the vehicle permanently.', 500, 10, 4),
	(55, 2, 'Tampering with a Vehicle', 'No person shall either individually or in association with one or more other persons, willfully tamper with any vehicle or the contents thereof, or break or remove any part of a vehicle without the consent of the owner.', 500, 10, 0),
	(56, 2, 'Grand Theft', 'Steals property in the value of $1,000 or more from another person.', 1500, 10, 0),
	(57, 2, 'Petty Theft', 'Steals property in the value of less than $1,000 from another person.', 500, 10, 0),
	(58, 3, 'Arson', 'Person maliciously sets fire to a structure, forest land, or other property. To include the use of thermite at banks, vaults, or other locations.', 2000, 25, 0),
	(59, 3, 'Felony Trespassing', 'Enters knowingly or remains unlawfully in or upon a government property without permission or the right to do so. Includes power plants.', 1500, 15, 0),
	(60, 3, 'Burglary', 'Any person who breaks and enters any property or attempts to break and enter into a property with the intent either to commit theft or to commit any misdemeanor or felony within.', 1000, 15, 0),
	(61, 2, 'Trespassing', 'Enters knowingly or remains unlawfully upon a property without the permission or the right to do so.', 500, 10, 0),
	(62, 2, 'Contempt of Court', 'The act of being disobedient to or discourteous towards a court of law and its officers in the form of behavior that opposes or defies the authority, justice and dignity of the court. Time/Fine is at Judge discretion.', 0, 999, 0),
	(63, 2, 'Failure to Appear', 'Failure to appear in Court when summoned.', 0, 999, 0),
	(64, 3, 'Perjury', 'Knowingly lies under oath in judicial proceedings.', 0, 999, 0),
	(65, 3, 'Witness Tampering', 'The use of physical force, threat of physical force, use of intimidation, or use of threats in an attempt to hinder, delay, or prevent, an individual from producing testimony or evidence before the court or an attempt to alter or destroy the evidence or testimony to be produced. ', 0, 999, 0),
	(66, 3, 'Prison Break', 'Breaks into government buildings, vehicles designated for detainment, or imprisonment with intent to break a prisoner out. Steals a law enforcement vehicle intending to transport an individual/individuals to prison after processing has occurred. Includes the act of an inmate or suspect leaving prison through unofficial or illegal ways.', 4000, 75, 0),
	(67, 3, 'Attempted Prison Break', 'Aids in the act of, or attempt to break an individual out of prison, or prison transport after processing has occurred.', 2500, 40, 0),
	(68, 3, 'Harboring or Aiding an Escaped Violent Felon', 'Whoever knowingly harbors or conceals any prisoner wanted for a capital level offense after their escape from custody of Bolingbroke State Penitentiary or any other State correctional institution shall be guilty of this offense. This offense shall include but not be limited to providing residence for the prisoner, assisting the prisoner in escape from the authorities, and/or failing to notify the proper authorities of the prisoner\'s location if the suspect should reasonably know the prisoner is wanted for arrest on capital level offenses. ', 3000, 65, 0),
	(69, 3, 'Introducing Contraband Into a Government Facility', 'It is unlawful to introduce contraband into or upon the grounds of Bolingbroke State Penitentiary or any other State correctional institution shall be guilty of this offense.Contraband is described as any controlled substance, intoxicating beverage, weapon, explosive, radio, telephone or any writing or recording device to be used to transmit information.', 1500, 20, 0),
	(70, 3, 'Violating a Court Order', 'Willful disobedience of the terms written in a court order. To include a sentence imposed on a citizen, protective, and restraining orders.', 2000, 30, 0),
	(71, 3, 'Embezzlement ', 'Steals or misappropriates funds or property that has been entrusted in you with the intent of depriving the rightful owner.', 500, 25, 0),
	(72, 3, 'Bribery', 'The offering, giving or recieving of anything of value in exchange for the recipient to perform an act such as a favour. The bribe can consist of anything that the recipient may view as valuable like cash or personal favours. This charge includes the recipient of a bribe.', 2000, 20, 0),
	(73, 3, 'Escaping Custody', 'Escapes the custody of law enforcement once that person has been, detained/arrested but before processing occurs.', 1500, 15, 0),
	(74, 3, 'Accessory to Escaping Custody', 'Person aids or assists, another citizen in escaping the custody of law enforcement once that person has been, detained/arrested but before processing occurs.', 1000, 15, 0),
	(75, 3, 'Parole Violation ', 'Person who violates their parole time, set by their previous arrest.', 1000, 10, 0),
	(76, 2, 'Conspiracy', 'Conspires to commit a crime.', 1000, 10, 0),
	(77, 2, 'Unauthorized Practice of Law', 'Practices law without a proper Bar certification.', 2500, 10, 0),
	(78, 2, 'Misuse of a 911 System', 'Person makes a request for emergency response when no actual emergency exists, and when the caller does not have a good faith basis to request emergency assistance.', 1000, 5, 0),
	(79, 3, 'Human Trafficking', 'The unlawful act of forcefully transporting or coercing individuals into preforming an act or service, being that of forced labor or otherwise, without that indviduals consent. ', 0, 999, 0),
	(80, 3, 'Drug Trafficking', 'Any person who is found guilty of Felony Possession with Intent to Distribute and which meets one or more of the following requirements: (1) The suspect shows a pattern of drug distribution or felony possession of controlled dangerous substances, demonstrable through three or more provable instances;(2) Proof or evidence that the suspect has manufactured or cultivated a controlled dangerous substance;', 0, 999, 0),
	(81, 3, 'Felony Possession with intent to Distribute', 'Any person who is found to have large quantities of drugs on their person, vehicle, and or property with intent to distribute. Intent to distribute can be inferred through circumstances surrounding the discovery of the drugs or a pattern of behavior of the suspect such as large sums of money, high-grade weaponry, or other paraphernalia used in the measuring/weighing or breaking down of large quantities to smaller quantities', 12500, 150, 0),
	(82, 3, 'Sale of Drugs', 'Sale of a controlled substance or controlled dangerous substance.', 2500, 35, 0),
	(83, 3, 'Felony Possession of a Controlled Dangerous Substance', 'Possesses a controlled dangerous substance. 27+ units of OXY. Possesses methamphetamine. 20+ units of methamphetamine.', 2000, 30, 0),
	(84, 3, 'Felony Possession of a Controlled Substance', 'Possesses 50+ grams (10 bags @ 5g per bag) of Crack Cocaine.Possessing 50+ grams (10 bags @ 5g per bag) of Cocaine.Possesses 10 or more LSD tabs.Possesses any amount of marijuana greater than 15 lbs, or greater than 25 joints.', 2000, 25, 0),
	(85, 3, 'Cultivation of Marijuana', 'Person possesses 3 or more marijuana plants in a single location.', 2000, 25, 0),
	(86, 2, 'Misdemeanor Possession of Controlled Dangerous Substance', 'Possesses a controlled dangerous substance. 5+ units of Oxy. Possesses methamphetamine.', 1000, 15, 0),
	(87, 2, 'Misdemeanor Possession of a Controlled Substance', 'Possesses up to 50 grams (10 bags @ 5g per bag) of Crack Cocaine.Possesses up to 50 grams (10 bags @ 5g per bag) of Cocaine.Possesses less than 10 LSD tabs.Possesses any amount of marijuana greater than 5 lbs, or greater than 9 joints.', 750, 10, 0),
	(88, 2, 'Possession of Drug Paraphernalia ', 'Any item that is used in the manufacturing, production, distribution, sale, or consumption of drugs. This is to include marijuana seeds, and scales that are used to weigh drugs.', 500, 5, 0),
	(89, 3, 'Desecration of a Human Corpse', 'Desecration of a human corpse means any act committed after the death of a human being including, but not limited to, dismemberment, disfigurement, mutilation, burning, or any act committed to cause the dead body to be devoured, scattered or dissipated; except, those procedures performed by a state agency or licensed authority in due course of its duties and responsibilities. This includes the removal of a corpse from the custody of the morgue.', 1500, 20, 0),
	(90, 3, 'Illegal Exhumation', 'The removal of a body without authorization from where it lies in state, or it\'s final resting place.', 1000, 15, 0),
	(91, 2, 'Practicing Medicine Without a License', 'Practicing medicine without a proper license. Treating citizens for any medical, or health related issue without proper documentation or licensing. Law Enforcement is exempt only during their qualified duties. ', 1500, 12, 0),
	(92, 2, 'Public Indecency', 'A lewd caress or indecent fondling of the body. Public place shall also include jails, and correctional institutions of the state.', 500, 10, 0),
	(93, 1, 'Littering', 'The act of throwing objects on the ground in a disobedient manner. Leaving trash and other items on the ground.', 250, 0, 0),
	(94, 1, 'Public Intoxication ', 'A person who is under the influence of Alcohol or a Controlled Dangerous Substance, in a public place.', 100, 0, 0),
	(95, 3, 'Impersonating a Judge', 'Acting as a Judge or introducing themselves to others a judge and attempting to perform judicial duties', 10000, 40, 0),
	(96, 3, 'Impersonating a Government Employee', 'Acting as public servant or introducing themselves to others as a public servant, and attempting to perform their duties. This includes public servants and all other government employees that are not otherwise listed under a higher impersonation charge.', 5000, 30, 0),
	(97, 3, 'Impersonation', 'Providing law enforcement with a false, or fictitious name, while under detainment or under arrest.', 1250, 15, 0),
	(98, 3, 'Identity Theft', 'A person secures an undeserved financial benefit for themselves. Cause the victim to suffer a loss, which could be financial, emotional or some other type of damage. Escapes criminal liability by using another person\'s name, birth date or other identifying information.', 1500, 20, 0),
	(99, 3, 'Vehicle Registration Fraud', 'Person(s) possesses or displays a falsified license plate on a motor vehicle. Person(s) manufactures a falsified license plates.', 1500, 20, 0),
	(100, 3, 'Extortion', 'The use of force or threats to compel another person to relinquish money or property or to compel a public officer or State employee to perform an official act within the course and scope of their employment. ', 1000, 15, 0),
	(101, 3, 'Fraud', 'Wrongfully deceits intending to receive financial or personal gain.', 1000, 10, 0),
	(102, 3, 'Disruption of a Public Utility', 'Disruption of a Public Utility - The attempt, or successful execution of the disruption of any electrical power grid.', 6000, 35, 0),
	(103, 3, 'Inciting a Riot', 'Organizes an event/assembly which results in violent conduct or creates a risk of causing public harm with a group of at least four people.', 5000, 30, 0),
	(104, 3, 'Felony Obstruction of Justice', 'Intentionally hinders the discovery, apprehension, conviction, or punishment of a person who committed a crime, including intentionally involving oneself in an ongoing criminal act or investigation in such a way that peace officers are impeded from administering justice.', 2500, 25, 0),
	(105, 2, 'Misdemeanor Obstruction of Justice', 'Recklessly or with criminal negligence hinders the discovery, apprehension, conviction, or punishment of a person who committed a crime, including issuing threats of violence, impeding the administration of justice, or withholding of non-privileged information or evidence from peace officers.', 1500, 20, 0),
	(106, 2, 'Planting or Tampering of Evidence', 'Destroy, plant, conceal, or remove a piece of evidence with the purpose of hiding the truth, altering the truth or make an item unavailable for proceeding investigation.', 1000, 15, 0),
	(107, 2, 'Disobeying a Peace Officer ', 'Willfully refusing or failing to comply with a lawful order, signal, or direction of any peace officer.', 1000, 12, 0),
	(108, 2, 'Disorderly Conduct', 'Engages in behavior intending to cause public inconvenience.', 500, 10, 0),
	(109, 2, 'Harassment', 'Intimidates or pressures another person aggressively with unwelcome words, deeds, actions, or gestures.', 1000, 10, 0),
	(110, 2, 'False Reporting', 'Reports a false or non-existent crime.', 1000, 10, 0),
	(111, 3, 'Poaching', 'No person shall either individually or in association with one or more other persons, bait, trap, hunt injure, maim, kill, otherwise harm, or maintain possession of the pelt, carcass, or any other part of an a wild animal without the correct license to hunt such animal or the animal is defined as being protected by the DOJ.', 1500, 15, 0),
	(112, 2, 'Animal Cruelty', 'Maliciously and intentionally wounds or kills an animal.', 500, 10, 0),
	(113, 2, 'Stalking', 'The following, harassing, threatening of another person, to the point where an individual fears for his/her safety.', 250, 10, 0),
	(114, 2, 'Disturbing the Peace', 'Unlawfully fighting, or challenging another person to fight, in a public place. Disturbing another person by loud and unreasonable noise; if this is done willfully and maliciously. Using offensive words in a public place, if the words are likely to provoke an immediate violent reaction.', 500, 5, 0),
	(115, 2, 'Vandalism of Government Property', 'Intentionally causing damage to Government Property.', 500, 5, 0),
	(116, 1, 'Vandalism', 'Intentionally causing damage to property they do not own.', 250, 0, 0),
	(117, 1, 'Loitering', 'Intentionally standing or waiting idly without apparent purpose.', 250, 0, 0),
	(118, 3, 'Piloting Without a Proper License', 'Operating (or attempting to operate) an aircraft without the proper license. This includes, Helicopters, and Fixed Wing Aircraft.', 3500, 40, 0),
	(119, 3, 'Flying into Restricted Airspace', 'The unauthorized flight into, or landing in restricted airspace. The restricted areas are as follows. Aircraft carrier, any and all power plants. This includes landing on Pillbox Medical Center, and any Government building or property without permission to do so. Certified pilots will lose their license for any of of the above listed. Law Enforcement and EMS are exempt.', 5000, 30, 0),
	(120, 3, 'Street Racing', 'A person shall not engage (organize or partake) in a street race on a highway or public roadway of any kind whether it be as a sport of for material gain.A street race can be against another vehicle or any kind of timing device.Adds 4 points on License.', 4000, 25, 4),
	(121, 3, 'Reckless Evading', 'Dangerously flees from law enforcement while operating a motor vehicle to avoid being apprehended, detained, or arrested. Crossing into oncoming lanes of traffic, causing damage to property, putting lives in danger.', 2000, 20, 5),
	(122, 3, 'Operating a Motor Vehicle on a Suspended or Revoked License', 'Person operates a motor vehicle on a suspended and revoked license. Vehicle is to be Impounded, and the operator of the vehicle arrested for not having the proper license to drive legally.', 2000, 15, 0),
	(123, 3, 'Felony Hit and Run', 'Leaving a scene of an accident that resulted in injury to others, without identifying yourself to the parties involved.', 2000, 15, 4),
	(124, 3, 'Reckless Driving', 'Drives in a way that is careless and with gross disregard for human life.', 1000, 12, 4),
	(125, 2, 'Unauthorized Operation of an Off-Road Vehicle', 'It is unlawful to operate an off-road, or off highway vehicle on city streets, highways, county roads, and sidewalks. Off-road vehicles are classified as ATV\'s, Dirt Bikes, Farm Tractors, Golf Carts, and Dune Buggies that don\'t have a visible license plate displayed. Law enforcement may use discretion if the person is transporting from a car dealership after purchase.', 750, 10, 0),
	(126, 2, 'Misdemeanor Hit and Run', 'Leaving a scene of an accident with property damage, without identifying yourself to the parties involved.', 500, 10, 0),
	(127, 2, 'Evading', 'Flees from law enforcement in a vehicle to avoid being apprehended, detained, or arrested.', 750, 10, 3),
	(128, 1, 'Driving While Intoxicated', 'Drives while affected by drug or alcohol intoxication. Licenses is suspended ', 500, 5, 3),
	(129, 1, 'First Degree Speeding', 'Speeds exceeding the limit by more than 55 mph. Add 3 license points.', 1500, 0, 3),
	(130, 1, 'Second Degree Speeding', 'Speeds exceeding the limit by 35-55 mph. Add 2 license points.', 1000, 0, 2),
	(131, 1, 'Third Degree Speeding', 'Speeds exceeding the limit by 0-34 mph. Add 1 license point', 500, 0, 1),
	(132, 1, 'Improper Window Tint', 'Operating a vehicle with tint that obscures the view from the outside. Window tint must be completely be dark to where Law Enforcement can\'t see citizens in the vehicle.  Law Enforcement may use discretion to give a verbal warning, or written violation. Vehicle may be impounded. **Government vehicles are exempt.**', 250, 0, 0),
	(133, 1, 'Failure to Yield to Emergency Vehicle', 'Does not pull to the side of the road when an emergency vehicle is trying to pass with sirens and or lights enabled.', 250, 0, 0),
	(134, 1, 'Failure to Obey a Traffic Control Device', 'Does not obey a sign or signal defined as regulatory.', 250, 0, 0),
	(135, 1, 'Negligent Driving', 'Drives in a way that is negligent with no regard to basic traffic rules.', 500, 0, 2),
	(136, 1, 'Illegal Passing', 'Passing another vehicle by a shoulder, median, or solid lines. Passing must be completely made without interfering with safe operation of any approaching vehicle from the opposite direction.', 250, 0, 0),
	(137, 1, 'Driving on the Wrong Side of The Road', 'Driving on the left side of the road, against opposing traffic.', 250, 0, 0),
	(138, 1, 'Illegal Turn', 'Performing a turn at a stop sign or red light without coming to a full and complete stop, or failure to yield to pedestrians. Making a left-hand turn where signs posted prohibit such a turn.', 250, 0, 0),
	(139, 1, 'Failure to Stop', 'Failure to come to a complete and full stop at a posted stop sign or red light. Right on red is permitted when a full stop is completed and after yielding to traffic and pedestrians.', 250, 0, 0),
	(140, 1, 'Unauthorized Parking', 'Parks in an area that is unsafe or on government property. Parking on a sidewalk, to include ANY portion of the tire touching the curb. Parking in the wrong direction of traffic. Parking on a red line. Parking in front of a fire hydrant. Parking vehicle across multiple parking spaces. Vehicle is subject to being towed. Government vehicles with lights and/or sirens on are exempt. Further, a vehicle may be driven onto a curb or sidewalk for the purposes of immediately parking that vehicle within a garage or driveway. ', 500, 0, 0),
	(141, 1, 'Operating a Motor Vehicle Without Proper Identification ', 'Person has a valid drivers license but is unable to provide a valid citizen identification to law enforcement upon request. Vehicle is to be impounded by law enforcement. This law is to ensure that citizens provide proper identification to law enforcement while operating a motor vehicle.', 250, 0, 0),
	(142, 1, 'Failure to Signal', 'Does not use a turn signal when necessary.', 100, 0, 0),
	(143, 1, 'Driving Without Headlights During Darkness', 'Driving after dusk and before dawn or in other poor visiblity conditions without headlights.', 100, 0, 0),
	(144, 2, 'Accessory to Assault & Battery', 'Assits in the threatens violence or injury upon an individual either orally or thru their actions and acts upon that threat.', 1000, 15, 0);

CREATE TABLE IF NOT EXISTS `mdt_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `link` varchar(1024) NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `workplace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job` (`job`),
  KEY `workplace` (`workplace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `mdt_notices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `creator` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `restricted` varchar(50) NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job` (`restricted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `allowAttorney` tinyint(4) NOT NULL DEFAULT 0,
  `creatorSID` int(11) NOT NULL,
  `creatorName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creatorCallsign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `type` (`type`),
  KEY `creatorSID` (`creatorSID`),
  KEY `creatorName` (`creatorName`),
  KEY `creatorCallsign` (`creatorCallsign`),
  KEY `allowAttorney` (`allowAttorney`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `mdt_reports_evidence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report` (`report`),
  CONSTRAINT `FK1_mdt_reports_evidence` FOREIGN KEY (`report`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `mdt_reports_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'person',
  `SID` int(11) NOT NULL,
  `First` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Last` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Callsign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Licenses` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '{}',
  `charges` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '{}',
  `sentenced` tinyint(4) NOT NULL DEFAULT 0,
  `sentencedAt` datetime DEFAULT NULL,
  `plea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'unknown',
  `points` int(11) NOT NULL DEFAULT 0,
  `fine` int(11) NOT NULL DEFAULT 0,
  `jail` int(11) NOT NULL DEFAULT 0,
  `parole` int(11) NOT NULL DEFAULT 0,
  `reduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `revoked` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doc` tinyint(4) NOT NULL DEFAULT 0,
  `expunged` tinyint(4) NOT NULL DEFAULT 0,
  `warrant` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SID` (`SID`),
  KEY `Callsign` (`Callsign`),
  KEY `FK_mdt_reports_people` (`report`),
  KEY `type` (`type`),
  KEY `sentenced` (`sentenced`),
  KEY `expunged` (`expunged`),
  KEY `FK2_mdt_reports_people` (`warrant`),
  CONSTRAINT `FK2_mdt_reports_people` FOREIGN KEY (`warrant`) REFERENCES `mdt_warrants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mdt_reports_people` FOREIGN KEY (`report`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `state` varchar(50) NOT NULL DEFAULT 'active',
  `title` varchar(1024) NOT NULL,
  `report` int(10) NOT NULL,
  `suspect` int(10) NOT NULL,
  `notes` longtext NOT NULL,
  `creatorSID` int(11) NOT NULL,
  `creatorName` varchar(255) NOT NULL DEFAULT '',
  `creatorCallsign` varchar(255) NOT NULL DEFAULT '',
  `issued` datetime NOT NULL DEFAULT current_timestamp(),
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suspect` (`suspect`),
  KEY `report` (`report`),
  KEY `expires` (`expires`),
  CONSTRAINT `FK1_mdt_warrants` FOREIGN KEY (`report`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK2_mdt_warrants` FOREIGN KEY (`suspect`) REFERENCES `mdt_reports_people` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `meth_tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tier` int(11) NOT NULL DEFAULT 1,
  `created` bigint(20) NOT NULL,
  `cooldown` bigint(20) DEFAULT NULL,
  `recipe` varchar(512) NOT NULL,
  `active_cook` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `placed_meth_tables` (
  `table_id` int(11) NOT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `placed` bigint(20) NOT NULL DEFAULT 0,
  `expires` bigint(20) NOT NULL DEFAULT 0,
  `coords` varchar(255) NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `placed_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL DEFAULT '',
  `coords` varchar(255) NOT NULL,
  `rotation` varchar(255) NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `creator` bigint(20) NOT NULL,
  `is_frozen` tinyint(1) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `type` int(11) NOT NULL DEFAULT 0,
  `name_override` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `player_shops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `ped_model` varchar(256) DEFAULT NULL,
  `position` text NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `owner_bank` int(11) NOT NULL,
  `job` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `player_shops_moderators` (
  `shop` int(10) unsigned NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `sid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`shop`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `redline_race_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `buyin` int(11) unsigned NOT NULL DEFAULT 0,
  `host` int(11) unsigned NOT NULL,
  `track` int(11) unsigned NOT NULL,
  `class` varchar(4) NOT NULL,
  `racers` longtext NOT NULL DEFAULT '[]',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `race_history_track` (`track`),
  CONSTRAINT `race_history_track` FOREIGN KEY (`track`) REFERENCES `redline_tracks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `redline_racer_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `placing` int(11) NOT NULL,
  `winnings` text DEFAULT NULL,
  `vehicle` varchar(128) NOT NULL,
  `vehicle_class` varchar(4) NOT NULL,
  `track` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `racer_history_track` (`track`),
  KEY `racer_history` (`sid`) USING BTREE,
  CONSTRAINT `racer_history_track` FOREIGN KEY (`track`) REFERENCES `redline_tracks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `redline_track_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `track` int(11) unsigned NOT NULL,
  `race` int(11) unsigned NOT NULL,
  `sid` int(11) NOT NULL,
  `lap_start` int(11) NOT NULL,
  `lap_end` int(11) NOT NULL,
  `laptime` int(11) NOT NULL,
  `car` varchar(256) NOT NULL,
  `owned` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `track_history_track` (`track`),
  KEY `track_history_race` (`race`),
  KEY `sid` (`sid`),
  CONSTRAINT `track_history_race` FOREIGN KEY (`race`) REFERENCES `redline_race_history` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `track_history_track` FOREIGN KEY (`track`) REFERENCES `redline_tracks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `redline_tracks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `distance` varchar(256) NOT NULL,
  `type` varchar(16) NOT NULL,
  `checkpoints` longtext NOT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `sequence` (
  `id` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `sequence` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `shop_bank_accounts` (
  `shop` int(10) unsigned NOT NULL,
  `bank` int(10) unsigned NOT NULL,
  PRIMARY KEY (`shop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
