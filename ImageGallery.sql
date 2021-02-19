-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_image_gallery
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Abstract Images','2020-05-13 00:00:00'),(2,'Inspirational Art Images','2020-05-17 00:00:00'),(3,'Pattern Photos','2020-04-23 00:00:00'),(4,'Vintage Photos','2020-04-02 00:00:00'),(5,'Forest Pictures','2020-05-08 00:00:00'),(6,'City Pictures','2020-03-30 00:00:00'),(7,'Empty Album','2020-04-26 00:00:00');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `text` varchar(255) NOT NULL,
  `image` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_comment` (`image`),
  CONSTRAINT `image_comment` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Lorenzo','Ut imperdiet massa purus, interdum faucibus nisi molestie eu. Duis posuere ut sapien eget tincidunt. Aenean imperdiet sem ut augue consectetur euismod.',1),(2,'lorenzofratus','That\'s awesome',32),(3,'Anonymous','Comment',32),(4,'Anonymous','Wow',32),(5,'lorenzo','Wow',32);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src` varchar(255) NOT NULL,
  `album` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_image` (`album`),
  CONSTRAINT `album_image` FOREIGN KEY (`album`) REFERENCES `album` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'Abstract Acrylic Painting','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ac diam risus. Duis venenatis a nunc id tempus. Maecenas tempor, magna fringilla hendrerit tincidunt, nunc massa egestas elit, ac placerat purus enim a neque.','2020-05-13 00:00:00','abstract-images/abstract-abstract-painting-acrylic-acrylic-paint-1585325.jpg',1),(2,'Abstract Art Canvas','Suspendisse vulputate risus sollicitudin, varius nibh vitae, rutrum lorem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2020-05-12 00:00:00','abstract-images/abstract-art-canvas-colors-288099.jpg',1),(3,'Abstract Painting','Aenean commodo suscipit neque, non cursus felis pellentesque eget. Quisque quam ipsum, vestibulum ut maximus a, tempor eu tellus.','2020-04-13 00:00:00','abstract-images/abstract-painting-1255372.jpg',1),(4,'Abstract Painting','Donec a dui elit. In id imperdiet eros. Morbi posuere at mi sit amet aliquam. In hac habitasse platea dictumst. Praesent at nisl in quam euismod posuere eget pretium mi.','2020-05-18 00:00:00','abstract-images/abstract-painting-1418595.jpg',1),(5,'Aerial Photography','Duis condimentum semper felis, eu lobortis ligula feugiat pharetra. Donec tincidunt lectus eu dui fringilla, at tempus nibh tristique.','2020-03-28 00:00:00','abstract-images/aerial-photography-of-seashore-1624450.jpg',1),(6,'Alexander Ant','Praesent lectus diam, mollis lacinia ullamcorper eget, ultrices et justo. Sed sed sollicitudin nulla. Integer aliquet nibh id posuere viverra. Duis dapibus et elit a iaculis.','2020-05-02 00:00:00','abstract-images/alexander-ant-hEkBlWPOQc8-unsplash.jpg',1),(7,'Black and Grey','Curabitur nibh lorem, pulvinar pretium eros eget, vehicula dapibus mi. Phasellus nec mi id orci placerat fermentum.','2020-03-12 00:00:00','abstract-images/black-and-grey-abstract-painting-1142006.jpg',1),(8,'Blue Shade Painting','Ut bibendum, dui vitae posuere luctus, orci diam faucibus lectus, vitae facilisis ante neque non mi. Fusce pulvinar pellentesque dui, ut hendrerit quam.','2020-04-15 00:00:00','abstract-images/blue-shade-painting-1762973.jpg',1),(9,'Bosco Shots','Morbi non accumsan arcu. Fusce tempus malesuada porttitor. Praesent placerat neque eget purus eleifend, non euismod lorem vulputate. In volutpat iaculis lacus.','2020-05-12 00:00:00','abstract-images/bosco-shots-r2qkF8tMbRw-unsplash.jpg',1),(10,'Multicolored Painting','Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vulputate varius mauris sit amet vestibulum.','2020-04-29 00:00:00','abstract-images/multicolored-abstract-painting-2035413.jpg',1),(11,'Multicolored Illustration','Integer vitae sollicitudin mauris. Suspendisse ac convallis magna. Ut ac diam quis ligula hendrerit ultricies eu vitae diam. Vivamus aliquet pretium odio sollicitudin molestie.','2020-03-21 00:00:00','abstract-images/photo-of-multicolored-illustration-2832382.jpg',1),(12,'Pink and Blue','Etiam ante velit, hendrerit ut justo non, fringilla varius neque. Donec placerat odio orci, nec varius ante lobortis id. Vestibulum at dapibus nunc.','2020-05-05 00:00:00','abstract-images/photo-of-pink-and-blue-abstract-painting-2471235.jpg',1),(13,'Red Orange Waves','Fusce scelerisque dolor non vestibulum tincidunt. Sed pretium blandit neque, efficitur consectetur est viverra quis. Donec eu mauris volutpat, pretium magna non, condimentum diam.','2020-04-30 00:00:00','abstract-images/red-orange-waves-wallpaper-1998479.jpg',1),(14,'Red Pink and Blue','Etiam a odio at risus finibus ultrices. Praesent posuere efficitur ullamcorper. Proin id nisl libero.','2020-04-24 00:00:00','abstract-images/red-pink-and-blue-wallpaper-1910236.jpg',1),(15,'Aerial Architecture','Morbi suscipit, ligula vitae malesuada lobortis, enim dolor cursus velit, lobortis mollis lacus diam non diam.','2020-04-12 00:00:00','city-pictures/aerial-architectural-design-architecture-buildings-373912.jpg',6),(16,'Blue Sky Architecture','Ut viverra justo metus, sit amet lobortis mi bibendum eget. Suspendisse augue nulla, lobortis in lectus in, semper gravida urna. Nam maximus nec libero a posuere.','2020-05-13 00:00:00','city-pictures/aerial-architecture-blue-sky-buildings-466685.jpg',6),(17,'Cars on the Road','Aliquam nulla neque, pulvinar vitae felis quis, bibendum tempor lorem. Mauris porttitor mollis ex a bibendum. Vivamus blandit tellus vitae metus tempor vulputate.','2020-04-17 00:00:00','city-pictures/aerial-photography-of-cars-on-the-road-1123972.jpg',6),(18,'High Angle View','Pellentesque vel metus lorem. Donec non odio lacus. Donec augue ante, luctus eu velit vitae, tempor aliquam lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2020-03-15 00:00:00','city-pictures/high-angle-view-of-cityscape-against-cloudy-sky-313782.jpg',6),(19,'Low Angle Photo','Donec rutrum non lectus eu hendrerit. Nulla facilisi. Vivamus bibendum fermentum dictum. Vivamus vitae elit elementum, tempor ipsum pellentesque, aliquam ex.','2020-04-16 00:00:00','city-pictures/low-angle-photo-of-four-high-rise-curtain-wall-buildings-830891.jpg',6),(20,'Roadway Photography','Nam in neque nisl. Nunc vitae magna quis ligula fringilla tincidunt. Sed ultrices posuere iaculis. Donec eu felis congue, commodo neque nec, vestibulum ligula.','2020-05-18 00:00:00','city-pictures/photography-of-roadway-during-dusk-1034662.jpg',6),(21,'White and Red Car','Mauris viverra dolor non mi molestie tristique. Praesent posuere, odio non porttitor posuere, augue purus euismod sapien, vitae rutrum nisl urna ut augue. Fusce mauris metus, consectetur non quam eget, lobortis faucibus est.','2020-04-11 00:00:00','city-pictures/white-and-red-car-on-black-concrete-narrow-road-in-between-129830.jpg',6),(22,'Black Hanging Bridge','In pellentesque nisl tortor, vel tincidunt magna suscipit eget. Nulla non mauris pretium, lacinia leo a, euismod urna. Morbi magna mi, rutrum a est in, eleifend euismod odio.','2020-04-28 00:00:00','forest-pictures/black-hanging-bridge-surrounded-by-green-forest-trees-775201.jpg',5),(23,'Environment Forest','Morbi facilisis ac tortor sodales ultricies. Phasellus placerat auctor est, a hendrerit sem mattis vel. Praesent posuere id erat eget dignissim.','2020-05-12 00:00:00','forest-pictures/environment-forest-grass-leaves-142497.jpg',5),(24,'Forest Sunlight','Curabitur massa orci, facilisis a euismod in, finibus ac lacus. Phasellus tempor lectus id risus elementum scelerisque. Fusce luctus ante ac posuere dictum.','2020-04-12 00:00:00','forest-pictures/forest-with-sunlight-158251.jpg',5),(25,'Gray Bridge','Quisque nunc nulla, bibendum nec malesuada vel, aliquam sed nibh. Sed aliquet vestibulum turpis, a varius ligula iaculis sit amet.','2020-03-26 00:00:00','forest-pictures/gray-bridge-and-trees-814499.jpg',5),(26,'Nature Forest','Vivamus sollicitudin ante tristique orci sodales, vitae posuere augue tempor. Cras et commodo dolor. Fusce interdum ut diam in eleifend. Fusce cursus velit et venenatis dictum.','2020-05-15 00:00:00','forest-pictures/nature-forest-trees-fog-4827.jpg',5),(27,'Path Among the Trees','Suspendisse ut nisi dolor. Phasellus fermentum varius mauris. Morbi purus tortor, tincidunt et sapien et, aliquet dignissim augue.','2020-03-31 00:00:00','forest-pictures/the-path-among-the-trees-6037.jpg',5),(28,'Afterglow Art','Nunc volutpat venenatis feugiat. Aliquam vel leo consectetur dolor auctor consequat nec sit amet mi. Nam ac blandit elit.','2020-03-21 00:00:00','inspirational-art-images/afterglow-art-backlit-birds-556669.jpg',2),(29,'Art Bazar','Nullam convallis turpis sed ante ultrices vestibulum. Phasellus mauris dolor, efficitur vitae sapien at, feugiat rutrum nulla. Morbi fermentum fringilla dui.','2020-04-21 00:00:00','inspirational-art-images/anise-aroma-art-bazaar-277253.jpg',2),(30,'Brush Painting','Mauris tristique nibh sit amet massa tempus pellentesque. Etiam porttitor enim ac massa maximus, vel mattis nibh congue.','2020-04-12 00:00:00','inspirational-art-images/brush-painting-color-paint-102127.jpg',2),(31,'Shallow Focus Photo','Morbi consectetur sodales metus sit amet hendrerit. Maecenas malesuada dui erat, id cursus ante maximus ac. Quisque ornare ligula eu justo fermentum placerat.','2020-04-15 00:00:00','inspirational-art-images/shallow-focus-photo-of-paint-brushes-1646953.jpg',2),(32,'Umbrellas Art Flying','Ut ut dapibus leo. Pellentesque porttitor odio ut egestas rhoncus. Suspendisse sed massa risus. Duis at consequat augue, a sagittis metus.','2020-05-18 00:00:00','inspirational-art-images/umbrellas-art-flying-17679.jpg',2),(33,'Yellow and Blue','Curabitur eu est eu quam pulvinar feugiat. Integer in augue porttitor, efficitur ex sed, volutpat nulla. Nulla quis nisl euismod, mollis odio ac, faucibus urna.','2020-05-04 00:00:00','inspirational-art-images/yellow-and-and-blue-colored-pencils-1762851.jpg',2),(34,'Architectural Photograph','Vivamus non justo consectetur, viverra augue non, pharetra leo. Aliquam venenatis lorem ac egestas porttitor. Sed vehicula elementum lorem et semper.','2020-05-12 00:00:00','pattern-photos/architectural-photography-of-stairs-2555533.jpg',3),(35,'Blue and Red Plants','Suspendisse ante tellus, gravida vel lacus ac, euismod hendrerit justo. Aenean sed molestie turpis. Cras tincidunt mi sapien, a condimentum augue porta ac.','2020-04-12 00:00:00','pattern-photos/blue-and-red-plants-2505693.jpg',3),(36,'Grey and Black Hive','Donec augue elit, pellentesque eget finibus ut, fermentum nec quam. Cras congue magna in ex accumsan suscipit quis id ligula.','2020-05-12 00:00:00','pattern-photos/gray-and-black-hive-printed-textile-691710.jpg',3),(37,'Orange and White Seashell','Mauris cursus, nulla pellentesque tristique tincidunt, quam lacus convallis felis, auctor volutpat ligula odio at mauris.','2020-03-25 00:00:00','pattern-photos/orange-and-white-seashell-on-white-surface-33234.jpg',3),(38,'Palm Tree','Suspendisse semper semper orci, in efficitur libero facilisis quis.','2020-03-05 00:00:00','pattern-photos/palm-tree-926641.jpg',3),(39,'Time Lapse','Cras placerat, orci et malesuada feugiat, massa augue laoreet tortor, in varius eros felis sed enim. Praesent eu nunc id elit efficitur iaculis. Proin at justo non urna ullamcorper pharetra sed id orci.','2020-04-17 00:00:00','pattern-photos/time-lapse-photo-of-stars-on-night-924824.jpg',3),(40,'Worms Eye','Aenean in nisl purus. Vivamus a accumsan dui, id laoreet sem. Donec suscipit justo eu libero pellentesque, id volutpat neque volutpat.','2020-05-01 00:00:00','pattern-photos/worms-eye-view-of-spiral-stained-glass-decors-through-the-161154.jpg',3),(41,'Beige Analog Gauge','Sed blandit at est eget aliquet. Morbi convallis elit vel lorem tempus convallis. Etiam id lorem ut eros dictum porta. Sed blandit commodo elementum.','2020-04-18 00:00:00','vintage-photos/beige-analog-gauge-697662.jpg',4),(42,'Black Cassette Tape','Nunc eget mauris in lorem fermentum lobortis nec eget ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.','2020-05-13 00:00:00','vintage-photos/black-cassette-tape-on-top-of-red-and-yellow-surface-1626481.jpg',4),(43,'Black CRT TV','Morbi et massa quis diam feugiat eleifend in et tortor. Donec posuere blandit gravida. Sed ante tortor, ullamcorper sit amet consequat eu, vulputate quis eros.','2020-03-03 00:00:00','vintage-photos/black-crt-tv-showing-gray-screen-704555.jpg',4),(44,'Man in Bus','Aliquam imperdiet varius accumsan. Nam et tincidunt diam, ut vulputate libero. Nullam posuere leo iaculis felis placerat pharetra.','2020-04-30 00:00:00','vintage-photos/man-in-bus-247929.jpg',4);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-19 20:26:00
