-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thrifted_warmth
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `size` varchar(45) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `product_id_idx` (`product_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (11,1,9,'1','M'),(12,6,9,'1','M'),(30,2,25,'1','S'),(31,3,25,'1','S'),(42,1,26,'1','M');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,516,33,1,300.98,'2025-03-06 10:25:29'),(2,517,33,1,300.98,'2025-03-06 10:25:42'),(3,518,33,1,300.98,'2025-03-06 10:26:26'),(4,519,33,1,300.98,'2025-03-06 10:28:16'),(5,520,2,1,559.99,'2025-03-06 10:29:45'),(6,520,1,2,250.00,'2025-03-06 10:29:45'),(7,521,2,1,559.99,'2025-03-06 10:41:10'),(8,521,2,1,559.99,'2025-03-06 10:41:10'),(9,521,3,1,129.99,'2025-03-06 10:41:10'),(10,521,2,1,559.99,'2025-03-06 10:41:10'),(11,522,2,5,559.99,'2025-03-06 13:47:42'),(12,523,1,1,250.00,'2025-03-06 21:37:43'),(13,524,66,1,225.90,'2025-03-06 22:09:02'),(14,525,60,1,719.99,'2025-03-06 23:28:57'),(15,525,59,1,700.00,'2025-03-06 23:28:57'),(16,525,63,1,150.00,'2025-03-06 23:28:57'),(17,525,9,1,350.00,'2025-03-06 23:28:57'),(18,526,2,1,559.99,'2025-03-07 06:36:05'),(19,527,1,1,250.00,'2025-03-07 10:20:40'),(20,528,2,1,559.99,'2025-03-07 11:12:44'),(21,528,3,1,129.99,'2025-03-07 11:12:44');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tracking_number` int DEFAULT NULL,
  `carrier` varchar(45) DEFAULT 'Postguy',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (501,1,850.99,'Shipped','2025-02-18 08:07:41',12345,'Postguy'),(502,2,1249.50,'Pending','2025-02-18 08:07:41',NULL,'Postguy'),(503,1,549.99,'Shipped','2025-02-18 08:07:41',NULL,'Postguy'),(504,17,1560.98,'Delivered','2025-03-03 11:27:59',1234567,'Postguy'),(505,17,1560.98,'Shipped','2025-03-03 11:28:09',12345,'Postguy'),(506,17,1660.98,'Pending','2025-03-03 13:59:47',NULL,'Postguy'),(507,24,559.99,'Pending','2025-03-06 06:59:17',NULL,'Postguy'),(508,24,559.99,'Pending','2025-03-06 07:01:19',NULL,'Postguy'),(509,24,559.99,'Pending','2025-03-06 07:03:00',9999,'Postguy'),(510,22,809.99,'Pending','2025-03-06 09:55:36',NULL,'Postguy'),(511,21,300.98,'Pending','2025-03-06 10:05:46',NULL,'Postguy'),(512,21,300.98,'Pending','2025-03-06 10:09:17',NULL,'Postguy'),(513,21,300.98,'Pending','2025-03-06 10:10:59',NULL,'Postguy'),(514,21,300.98,'Pending','2025-03-06 10:11:30',NULL,'Postguy'),(515,21,300.98,'Pending','2025-03-06 10:25:05',NULL,'Postguy'),(516,21,300.98,'Pending','2025-03-06 10:25:29',NULL,'Postguy'),(517,21,300.98,'Pending','2025-03-06 10:25:42',NULL,'Postguy'),(518,21,300.98,'Pending','2025-03-06 10:26:26',NULL,'Postguy'),(519,21,300.98,'Pending','2025-03-06 10:28:16',NULL,'Postguy'),(520,22,1059.99,'Pending','2025-03-06 10:29:45',NULL,'Postguy'),(521,24,1809.96,'Pending','2025-03-06 10:41:10',NULL,'Postguy'),(522,24,2799.95,'Pending','2025-03-06 13:47:42',NULL,'Postguy'),(523,27,250.00,'Pending','2025-03-06 21:37:43',NULL,'Postguy'),(524,27,225.90,'Pending','2025-03-06 22:09:02',NULL,'Postguy'),(525,27,1919.99,'Pending','2025-03-06 23:28:57',NULL,'Postguy'),(526,26,559.99,'Pending','2025-03-07 06:36:05',NULL,'Postguy'),(527,26,250.00,'Pending','2025-03-07 10:20:40',NULL,'Postguy'),(528,26,689.98,'Pending','2025-03-07 11:12:44',NULL,'Postguy');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_expiry` varchar(225) DEFAULT NULL,
  `card_cvc` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,22,0.00,'credit_card','Pending','$2b$12$WlqvEO4nYG8W1n1Izo9IKeQ8L68H/gJHq3pFydPs90kZwQAyt.Lo.','$2b$12$1WgvQybgO9jY0tEm3s.ry.WMsTqhbpa9e6qfbw6e2vY/QwnTu976S','$2b$12$wKtZ6tnFCYFz5966KSX9lO5QyhMoQsVZBcK4hLO1TBKhijkLVxWH6'),(2,22,0.00,'credit_card','Pending','$2b$12$VkiftKa62b5uDMPJczEJ/e6qi040XOcoK1KE4bseZN8qm0gZhUTVO','$2b$12$cELdqjugi6rtFO3DFWKUWuSI6L1SK.N5QtlGT8AiJQsWPg2GviNBG','$2b$12$qxAIztohk4FqWfuwUAkZweqEIQRIoHxQHMRAvUdWRpsTpYb9aaixi'),(3,22,0.00,'credit_card','Pending','$2b$12$G8akfEc2rBGfHStwZFkx/e.c4UR142dDhH9aSqxp3IFZe6tDu5NL.','$2b$12$XgZsTxL8Ox2yK/3dwyq.Bu.31M2fDxx98UhxIO7mPbig2qVHBdoRC','$2b$12$xXkume5atWPTZYS1BdRPFeXLw6jDq5h11KoeoC6V19MU.rjZ91WTa'),(4,22,0.00,'credit_card','Pending','$2b$12$ST/REsgqROEMwDvyZcr5a.uQd0/YlDxlzS0JEbPPd6Xsjt6xJBmCa','$2b$12$UfxrxNQf.EbvaIyXHMr4X.r/J.6SP0w3Bd.WzqXkUW1OWQ1legii2','$2b$12$ivIj8uNztm6qAS3n1f.2POdEh0UIji9OaQzLfFht1AcFIwqsAIra.'),(5,22,0.00,'credit_card','Pending','$2b$12$/9q3qSj4e0Xl5ns9vvH/AuBO78KfbsDvRfnYzfcu.HBOzX01DnQDu','$2b$12$XgeJiFbOapUptkEGqe4TAeCM5hGYUKmSaDSz3N2rxSZ.6dYVXGRJm','$2b$12$mBYCByQvr3aDluoMDjdQW.XQ.uBhAhwU4jMvoB6T2tXlmAegx2oVy'),(6,22,0.00,'credit_card','Pending','$2b$12$1XYRby/7WL8ikSt5SrUK9u2ZqgPhjH6zxVUeIJKWwuTgxSI6Z5oVW','$2b$12$Ip2BXzoX5K/xISNUJtExqu8OMTKZ2OTw9TYJl.wcIpUAZofPdXG8u','$2b$12$GGQWBQ3sN6UPvM445M00iuCB3haIgo.ZRYI9whanQemvb6K1JMeYi'),(7,22,0.00,'credit_card','Pending','$2b$12$yAyAi6oTFJ7CPzD1l3chOeaCYsbJVLH4S8imLaLv0bqRiS26L.GX2','$2b$12$7dxzSIC2hFAdx2hZg/aMhei9THTC9nJo1/lmks1lM3syQYegtps9q','$2b$12$YO204qg9ZiZTuC3lC0O24eX5XpUiarzZnPXe87EkiMWuXZv9dZ/6G'),(8,21,199.95,'credit_card','Pending','$2b$12$AG1DrY5hseWXzOYxnDRSQeZE2YLdkNHE9nHmHUmepezCwEq14qNNm','$2b$12$lRUv14zsfmfYknE.tnEC2.kq5A8QOzxe8NCN2QqZLI1k.xYeQVAri','$2b$12$ChDUTvkMCAjXcccaTnYy/uLCxXfTx6QoUbJrJ27gYyXXgibLEKZ5q'),(9,21,990.97,'credit_card','Pending','$2b$12$u17kDt3gV7VfB8FhLLd7FeIFnchrT9yIYlpmIJcLoUVwsO1N0ICKi','$2b$12$rZdajLG76K.CYNrsBAUwNO9xBadEqCoGsYZDXsLuCz203zPGuBeKm','$2b$12$Vu1agUwaLxDaNb8TWPLgv.fEcspszO7GnxNtwBlD5bHbgapO8HOki'),(10,21,990.97,'credit_card','Pending','$2b$12$sKDfFHshTycauLo0utzAy.oGV7VKanJc2iA6NgnzVDpqpicQPn.1u','$2b$12$A9e66ZZkQBTmCJ8cDZjt8eZ/f1yT88SV1tJUFBZ7gt1WEacR/cidi','$2b$12$OCNLZYlKatyyWZvic9wcD.fMVSonXQ1JpNjDiP52vxEW4q1aFo/9a'),(11,21,990.97,'credit_card','Pending','$2b$12$pNkU25E0CW13gJMkvOw3.uWfx7bD94nrJhi77gl6AikT9EEFBy8IO','$2b$12$SKfEKTQH2TuLoqrJtB8Pne5S8jSF6PbJNbPobj0ehCG2d2W9Lbm5m','$2b$12$50fl2eDaSqPFWLuX26ZlneC5kK8b3WouHBwwlGZrdT0oQmF7BRxMC'),(12,24,559.99,'credit_card','Pending','$2b$12$cYqCtzWLfb8ZY4wTfYBUJ.PzEuB0mwyPBUadKqCddu5oLwmtCVgHi','$2b$12$fwKQ8W.82exC4KBG1nx4HupQx7v5K.Tc3B246/fIjsvO8kzw593.e','$2b$12$E.pdQGeP1ZAYozydOmWym.NHrzFD0slvVFbM1EDqOqPisMqj8sfYi'),(13,24,559.99,'credit_card','Pending','$2b$12$s5deDRxm06KqEGBFpfG5veXdaFt2ncA6cFUHgbiyf5sTRUcdEY.Ta','$2b$12$GYIuZk1NlMf4Iy4yenu4KOHNtk71FiRfaD3r75J8x1xu6KxScOUdq','$2b$12$gfKQ1xlcBnGJwjVteBB6R.0R7utTLGpA.e6U9t5XjlgdwB1GVb7Ca'),(14,24,559.99,'credit_card','Pending','$2b$12$k0E3zuKb2Kt5QSRoo.sRsuaGhVcRmQ0xcn6x09/uEkaNWcCJjnmba','$2b$12$rxo9.WpfvYbXOfPq9zo/be.FDpIR1PhqjwBLO/rMixWQsnDwLui6G','$2b$12$tCWfojP8PzThys.HZ1TPjuxhudFrUmoqWmE6rrsweAVGyCEWAghEu'),(15,24,559.99,'credit_card','Pending','$2b$12$lUs6LmzJX28TIkvnrOfti.JbClK2MWxnZQRO1OfV6zlddmSzGvls6','$2b$12$piak2WUr.WX7RolERf3nw.zbbni7cQj6hmq2IfOuoJqOj59TXntRG','$2b$12$RK7CAHTdRWnsEiPAWGsX2u6omiC1SsP4NhaYNv6sSgh7iPWQc3UN6'),(16,24,559.99,'credit_card','Pending','$2b$12$z/2kjWZF7ZF875MWF0wCa.4slnhaMgc.KgfqwFDtyYzY/njAWchOO','$2b$12$XZFAFtdpWBxY8ltZDJZO6O9cuuNKCTsEaF.nB8ZGTPDqp22xnClxu','$2b$12$5ibaIx9xPMX6zZDp9XujJue3K97J3dLN.DSMSLIVaNbcchE0qW43W'),(17,24,1119.98,'credit_card','Pending','$2b$12$fnRtPQdQOD67xY4/wLpOxOE9JXm.n.iJQ5NpB/eM6TllVcRQYJzF6','$2b$12$tq1GoCWOepDIcxybjyJr8.tiPPfxC.CniFftJwMG6AiB.ZqCXROtu','$2b$12$qn/o2UTuopqZzUH/cTnTtuzk1QHCPyHVahlSjQNkdK/UtPp0OP5vS'),(18,24,0.00,'credit_card','Pending','$2b$12$H6GpCxhCty27M0PQvDwugOEzr0vqzXRZlava9FrnlWFMnXzHhcQcq','$2b$12$qPRckbOl7SI34KO7VQySNu5L3kwbaDzWZ2/QabSD7L.G6pyjM0GFm','$2b$12$901w2Pc139s5q/ewWxAom.tGaqGCpdHaWN.DSTkNSdLYChkl/yHUC'),(19,24,0.00,'credit_card','Pending','$2b$12$X08VMdW5NmzUpsxgLHmXg.kCbm62e2RSEy3gA0R9KULlL6crAFhqS','$2b$12$u6QPNQgg9b8Wjv8n1dECbONiE1voYlO8OtMHd0ndE2r7KQ0jDqNtK','$2b$12$P9ezGP.zbhZEfIsK.pFP8.fw/LhSRXt7WeYlFHUE1Y37vHnpZ7A8.'),(20,21,990.97,'credit_card','Pending','$2b$12$wXYwKAb1wHU6NzzPxz4ybOjmDicN.RkGaFLOepX4aRfymYL0tZy.S','$2b$12$8jI7mAvKie7ZF5Hp7YLXLuZwla0ptTDO5Z4L1gsLSKqSdz7Xxmuc6','$2b$12$NHrUJWLqnWth.n9so6SxOOEZ8IpANo.W/mdlKxIxUqHxnAdNLxM.C'),(21,21,990.97,'credit_card','Pending','$2b$12$g54uncgcpin7OlMZm8ECh.TWatsauQsH7h2wUi2lw8fJmkm5NODIO','$2b$12$jjTtVTcCi0alQjKs3586Ku6zqLICliq8IXtW7gS/E2BGqwadDGQeG','$2b$12$yA3ThBRfRHE0XG3hD5us8u5OdPhKpFCfouvCn1J6J8VyLrn3gZrzK'),(22,21,250.00,'credit_card','Pending','$2b$12$kX8tY8SvpliWv0LKAbrPPO1qk1OwGuAiUReL9jagwW7D6WFvzIjIm','$2b$12$6kEsbmcQZDEcyFfrOqHIQezUSLfirY.XUkiPrgTsFIUWGT.QJvgcK','$2b$12$K0JJBeeV68rncz00KoA6pOzz64bz1UpTTwK3PdMu8MT2TLxx8q0cK'),(23,21,300.98,'credit_card','Pending','$2b$12$GNHLzYJ.qlWPy7VSyXVwEeY1.uiaWFIBnoX.JC0zsUDu8MBx8BasW','$2b$12$dFueR13KIQfgcX.lMIGAuu7u0jlXh.ene0cC.368PMKH6TCTEUCJm','$2b$12$5ucAvb4K6cwh4eLV4O0WAe2xPq1BHh1YLtsXq0yazXpuqKC/LQY7y'),(24,22,809.99,'credit_card','Pending','$2b$12$/saiksUd.JylII49uEd6mO4AERCqNBA5QNBAMPTyQm6V52jOd88zO','$2b$12$kouH2qEasLAJ/ccSzLdYq.XrQEyBkNLwKIlwp19pzqT9UmmKVAwLe','$2b$12$YVSeCzuPOICkQ4..Vq/Vouysqml6Jtnow34HhIVYHKQxB4NStcUCe'),(25,22,809.99,'credit_card','Pending','$2b$12$0Jo5EltNrTg10GqDSfLJ3ut0Wc4FP4hGw6rvCMXhtqmAgtRgq1AXi','$2b$12$oPhqpFVa4vzBNYD2zdXLGOiR7M8fAmJCYfoW3eOocPcv.F9I8G7lO','$2b$12$gofAGiXdC2r5ghYd2dowqe8ZEgbFFFoV10IcXiyAf2MinWsL.kJ1S'),(26,22,809.99,'credit_card','Pending','$2b$12$iieKeYTt10GrZ/o6wMYe.O6cDfrB5BOxDQ17JmqtcKk9XMZKyOGpK','$2b$12$dg.Ewbk7t7KWPRt./g1uy.PK9kmmN8OtWbg7.MjKvFAoIejEz.2Uu','$2b$12$fJfJM8PuAz16ShbbFSCzN.V94tpQ4REicGpZIMKdWD2Rg2zGpzRtq'),(27,22,809.99,'credit_card','Pending','$2b$12$Fvwl/JueE7uDz2fJUP/KUeByXTsVjNKVQ0xwhD8akTSvBLkGtTsYS','$2b$12$IQtGqFk81CXwkGBDni3OIOZk.p3.oK23rQG1.oHuODG/BNQ7hxGSS','$2b$12$HEYEoDd1jkOYbcJibwLNdey/g1PNf/2kU/k5kNPmTjpNEXTdFBO/O'),(28,21,300.98,'credit_card','Pending','$2b$12$.zs1UkW8FeMbnFevfaH4v.fyZhdDib2zrET7U9QVfCeQKgl6NDMjm','$2b$12$OqotxyMoWp0wezIPw8Nrz.HzXItUTs7H0yCx2lBA.H.OwrY.zSspi','$2b$12$9vWrC8K0ZfoDqtlnQVuMAurrkW.yTq365X5CCsCOLFLpyW40WUfJe'),(29,21,300.98,'credit_card','Pending','$2b$12$NH367nGQF91yQWCkL7soIOaDslZoIlR1oYh/EWnJbLrOECPJLPX/2','$2b$12$0OKIv3bP7AcbL4p3pHYcBeYvkhRTuJc58L8ixkCJjdFlupdPFggwO','$2b$12$EAdEo9iuSQFKIykgtHi4i.RdFkUMWmQteMZ14nWIwTlZpPxGySrre'),(30,21,300.98,'credit_card','Pending','$2b$12$.eXtusTaUUhtcGEshdOyV.jnmXH2a3ZlOntS.880E6PBXhGQzcBnW','$2b$12$fVl188x/VhpXN0pdI0puK.7gwm.ccgu1MqUNAd.TxhH87nXoZhHfK','$2b$12$p03TEdoBV8fwD8Hpwx0yf.PaiAK35FpZLdgVjpyL44fCEGC0AwBsC'),(31,21,300.98,'credit_card','Pending','$2b$12$rBYuaHxJoOlj1olxJP.8GesaErtBMwXB1QtAORHnR3621Pmj2nGIC','$2b$12$8yd8GTvvEF.UaOmsXGhT0.4HmZon6cJAlzbXdGDAnzp/JUERgSAhy','$2b$12$IbD71W/b85XnOnbNdOPjZetpgvvWBWfA6zu7VQAEAsLlMbLpij5dW'),(32,21,300.98,'credit_card','Pending','$2b$12$4CrqgR/V8smwoSB5ZFQjNug9ebc1FXpyZ/8w/eUDKlTOmBK8AJ6fG','$2b$12$8QHqtZOIVsGcKfVuU8XnZOkqZHpUPGYt8csAZqxwP.7bayg6Jix5S','$2b$12$0.S6TN5xseZ6uWNFx7W.U.ecI6WjULUOsf50CrThZDKkx3yR4a3Uq'),(33,21,300.98,'credit_card','Pending','$2b$12$odzY88b/Wzhgnt6hKxuXkuqb8w866Fs9bPxz1YWbVNS0LjC4KSIZC','$2b$12$ljVnOsUzCsBUWqPC3i61k.vuhiHiAbMtiLXOM8OUlQBumRElog74a','$2b$12$Wwnj1zk21wYUOIUK9YcITuOAjY.f44w3mzt4OlKeQaQS4y.xGQGpm'),(34,21,300.98,'credit_card','Pending','$2b$12$6H0akUB5SUTG7yiLVrkoi.Y5OflSL3VdT147UFVfmNbOHILvR.2Yq','$2b$12$d6t/oUBTUgBcA/ssWoCiQuqFoZUvLyhcnUSVz2HbVcG.Yx7x9rfu.','$2b$12$UTpZlNQbCWaFPhAIjFqBlO5UchohZWr4VvBZxD1Jk/u/46CQZDKWm'),(35,21,300.98,'credit_card','Pending','$2b$12$So3Pn.NXmaYHgz/EkKn7Z.HEXrv9B29JoBewknpzzq0VRbO0Ef3VC','$2b$12$Gv7TvG0PoXPhvVxMDtnmpOzAZbcBMQIdzfpWHLeqxoRo9uVKdYH9W','$2b$12$xBSM834bIA6n7kzYslru0uKPjjJQKuuKIRem9jhtC2HINfS9OO/rW'),(36,21,300.98,'credit_card','Pending','$2b$12$M0zMvJ0hYbdSEkhBkLHEBuVzYQuGaNgSh0R4W9fq9RdTW5YqtF8w.','$2b$12$4IPZ5DyErtW2Vhg0KnoIjeMLzTsV72YcJcwLM0DdMq9KOmsBTwd9S','$2b$12$BsBl9ks8xy12XxpXXXn9U.fLS7MZdETllzw/JRzeewwgRqfMZBZ1C'),(37,22,1059.99,'credit_card','Pending','$2b$12$tyZx.fR6nhYeYmNnx7Ov.OLel0i8SkQ81ZSdNVR34CXuDHSp/r41e','$2b$12$kiow4XZDimAPajFs3gkEJeAsNVT3idv3p9IDfOdDmiFRtDFpwlhW6','$2b$12$fyOCa8NK9fiPm2w5s7wowOUuqreJYZpzD2ULjdQNTxmNxZL7t5wZu'),(38,24,1809.96,'credit_card','Pending','$2b$12$m0NiIsKHVsr23iXNUY.jC.4XSr0YsoH1AaCDACqeY09A6kTHQinWm','$2b$12$oL60MHz6Bl3KZKYMerTe.OoYny7nNDg60nnRSq1dku1tdHgWGzqlO','$2b$12$0IwY0wbGZZ2IMSgrTStfkObwkwsu0/kPRPGXWtKYWfpcMyLFAHpuO'),(39,24,559.99,'credit_card','Pending','$2b$12$AZ5DZshH7Ln/JbDn0TNr0.gDR4vm83Yfz2OCCpphO8qI86MuUTQ/a','$2b$12$zAYK21gDgAmDtMIfwkuTce7XdFwrhXp9qcMDcRacEfArHw2fvTYU6','$2b$12$OWUCJSfr1SJ6kZgTCjSrPe.oqIcHA2wCXFhhqh6fiWz81bbl9TDp.'),(40,24,559.99,'credit_card','Pending','$2b$12$7oiyLGdWNW3gfVq1LTAnyeThDWYTT9g9XzoA3iRRZskv2/Mi8qvcu','$2b$12$n4fQ32XFBiGQa/lZj/6StuFpKnLDzwCKpiBDnoQKojVuTKB0CrkbC','$2b$12$qSJYjqDYOP0PXfCl9GSvEeX0KbMYZ5zRoDkR0Q8jMGhIExtst403u'),(41,24,559.99,'credit_card','Pending','$2b$12$Io977SX7TTbV2oV4FpKlY.sxRZm/jGLtv3PZblPxZNhvNmb4pKBJa','$2b$12$Oi5BLdDAQIcGDrmGdVDbVuQWjUlndmq6ciC5CRzsuVMUSwea.JK1y','$2b$12$laGPx3kJc63yfvNACgcwsef1bkvTOSunz2I3cVZagK1vQweJWYI5K'),(42,24,559.99,'credit_card','Pending','$2b$12$AVeHWsP9QgQDAnEiPfaWYOQVwi/CIbv32t91ejjo6lnOTF7s5hix2','$2b$12$yqi0AmzaOO8CKWtL1pLeJePVuvorgqttByju68wuNDzym2f7lSr3e','$2b$12$3U4J3tsgP3C7RPB01iW2VOiRtKH6iMfzSY1Bi0aFSH0MbaNbmLQeO'),(43,25,559.99,'credit_card','Pending','$2b$12$hqQBW/7NTRmKCFi2aoWBauSZVUu/QSgDCF0MTMDOJAerQnFiug65m','$2b$12$QL7RoOVBs2BgHdNajX5Ra.B5e.XU0fRasWFeew6yI8o9vwWLR.cLe','$2b$12$l3YyyZhWaypuNARYOx3Tee4HhMHpjtHHJKGmZUG/ibR793lH66wO2'),(44,24,2799.95,'credit_card','Pending','$2b$12$iV5w3ScJnRVpVL9fbFHLLOhkPD1A43D0VItDMbAZOCaa50Rax9nKy','$2b$12$E3UOfScZcVk6WgVZAmSh0O4wprZ2wUOnA9axIAtVQnhf8RdV9yJmK','$2b$12$Cqy4foZUDg1evQm5ZQovA.mCR6R9fI76sKuqaPcguxMFCnDMqHL6q'),(45,25,689.98,'credit_card','Pending','$2b$12$DV576v35wz5PNdJmyLPW4eL18WV44qUJGQ0hUuhzxgUr1n7oUmZHi','$2b$12$QL5RaB3p0iMRQ.RAymq0RO2gfQLusQGyVTBQscE/5gMUZcqmvwnd.','$2b$12$ZL.ekecyB3gOEBJvUXnSP.H3PS40qIH1lom4ervUVSwWOe4DodzPy'),(46,24,2799.95,'credit_card','Pending','$2b$12$MuLBTCcwLZSnn.H9hO5tnuOvEsXpBk89hHQvpn/DUoYkb1I.QSuxm','$2b$12$EQtdEwAb4QbMjVaZILPuuurFiwNNVMPeHnKt2FdppuYLWGQpJiVwy','$2b$12$ilQC8EbQ1dsYGhaY.p0TGeLZ2l4by2fIvSz//N96185O7/JJLC/xG'),(47,27,250.00,'credit_card','Pending','$2b$12$H8ocVOE862Al43zdKiTBVeG7m1/7nEtfJZ4YG.JtlJ32aWKF4Lw2O','$2b$12$PTR4AfQbQiK41irpZDWZd.XhOkHBaBYm77ie31caxqiv3tUVNCTfy','$2b$12$X7ys8KokBPue88mYE6r2IuzN8Dm6bbMp6NP8jcYDG6YUCMPcalvS2'),(48,27,225.90,'credit_card','Pending','$2b$12$Zs2HZz.Y7PmCckM3cHHMM.kmsAmfVTlj6w3FtOTr3TFnSlsP6O1yC','$2b$12$MTV6lUucCMmUOL5dwhLj6uwnk7LXFNH5t2MAGZPfdNADZUphc9FSa','$2b$12$ulOFWMBw5EaD8M92H/5gT.B.nLISay1tLyOKz6u0lh7yG1VNo9QeS'),(49,27,1919.99,'credit_card','Pending','$2b$12$OR90sZCfx32pFEotAeEKXupZ7ibBcAH7FVYGYSJLJD6zSPnqQpRZm','$2b$12$jQ4lN6S/kqF1jIxP3B/ayepY6ZnWzk35lCa/mpkh01xUJNH9cfL2.','$2b$12$L214qAEDvKxbth0LTgyN0OJiYusTcP21/Msp.S0twyJb0UrlszN7K'),(50,26,559.99,'credit_card','Pending','$2b$12$5599dqoGhGzEwWWqn4FakuXGqzH0cr30xafsphsllJCE8vcE4quem','$2b$12$/IDiOtHH2m9L5HGeHczSoeSIKTsIN4/trBoaPjlNTXVprg6VDr.QS','$2b$12$rQKYGUkOF18NY/87P.8SZew/Xn3.CfR6DWighBLVkwh68L5Denji6'),(51,26,250.00,'credit_card','Pending','$2b$12$hYOotjHH/r8d6GqA1P/5Z.uSzfZCL66cyxTpOeCcLi/F4RUh0mGmO','$2b$12$FeUfknm2EBXq3tSwnB1QeuibXFzIGrdZoate5MFPphxHwuQcACKgq','$2b$12$cs5nNOHN3aBDgyip7NtBp.O64GMMdx.BpbtU3vxXNyUEhEGkaYlYm'),(52,26,689.98,'credit_card','Pending','$2b$12$ap9ZUFJQvIsVz1R1z7jKReijG9qjKZfHWa/tU88J97aiMh6VKXHE2','$2b$12$c6Fzzg8Cl8EAs4s6ePey5OB7bOdaQiahr3XHToi.WmM..1oJOAeEq','$2b$12$wGfLbtNae8QBzlRhITaSH.kCNV94e3op9E2Ua1kPbEN3Vhooe3to2');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'Women'),(2,'Men'),(3,'Kids');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `color` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Green Cardigan','Cozy green cardigan for casual wear','Green',250.00,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/Green%20cardigan%20.jpg','2025-02-18 08:07:41'),(2,1,'Beige Wool Coat','Warm beige wool coat perfect for winter','Beige',559.99,15,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/beige%20wool%20coat.jpg','2025-02-18 08:07:41'),(3,1,'Black Denim Jacket with Hood','Stylish black denim jacket with hood for cooler weather','Black',129.99,12,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/black%20denim%20jacket%20with%20hood.jpg','2025-02-18 08:07:41'),(5,1,'Black Wool Coat','Classic black wool coat for warmth and style','Black',495.00,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/black%20wool%20coat.jpg','2025-02-18 08:07:41'),(6,1,'Blue Wool Coat with Fur','Elegant blue wool coat with luxurious fur trim','Blue',499.99,5,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/blue%20wool%20coat%20with%20fur.jpg','2025-02-18 08:07:41'),(7,1,'Brown Leather Puffer Jacket','Stylish brown leather puffer jacket for cold weather','Brown',249.99,8,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/brown%20leather%20puffer%20jacketjpg.jpg','2025-02-18 08:07:41'),(8,1,'Brown Plaid Wool Coat','Timeless brown plaid wool coat for winter comfort','Brown',679.99,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/brown%20plaid%20wool%20coat.jpg','2025-02-18 08:07:41'),(9,1,'Brown Puffer Jacket with Fur','Warm brown puffer jacket with fur lining for extra comfort','Brown',350.00,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/brown%20puffer%20jacket%20with%20fur%20.jpg','2025-02-18 08:07:41'),(10,1,'Burgundy Cardigan','Stylish burgundy cardigan for cozy layering','Burgundy',135.00,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/burgundy%20%20cardigan.jpg','2025-02-18 08:07:41'),(11,1,'Cream-White Cardigan','Elegant cream-white cardigan for winter layering','Cream',189.95,12,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/cream-white%20cardigan.jpg','2025-02-18 08:07:41'),(12,1,'Denim Jacket with Fur','Denim jacket with cozy fur lining for colder months','Blue',225.95,8,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/denim%20jacket%20with%20fur.jpg','2025-02-18 08:07:41'),(13,1,'Double-Breasted Trench Coat','Classic double-breasted trench coat for a timeless look','Beige',850.00,6,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/double-breasted%20trench%20coat.jpg','2025-02-18 08:07:41'),(14,1,'Double-Breasted Wool Coat','Elegant double-breasted wool coat for winter warmth','Camel',799.99,7,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/double-breasted%20wool%20coat.jpg','2025-02-18 08:07:41'),(15,1,'Ivory Oversized Knit Wear','Cozy ivory oversized knit wear for ultimate comfort','Ivory',199.95,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/ivory%20oversized%20knit%20wear.jpg','2025-02-18 08:07:41'),(16,1,'Leather Black Puffer Jacket','Sleek leather black puffer jacket for winter protection','Black',129.99,5,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/leather%20black%20puffer%20jacket.jpg','2025-02-18 08:07:41'),(17,1,'Long Black Puffer Jacket with Hood','Long black puffer jacket with a hood for extra warmth','Black',279.99,8,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/long%20black%20puffer%20jacket%20with%20hood.jpg','2025-02-18 08:07:41'),(18,1,'Long Grey Hood Puffer Jacket','Stylish long grey puffer jacket with hood','Grey',289.99,7,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/long%20grey%20hood%20puffer%20jacket.jpg','2025-02-18 08:07:41'),(19,1,'Long Wool Coat','Classic long wool coat for winter elegance','Camel',769.00,6,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/long%20wool%20coat.jpg','2025-02-18 08:07:41'),(20,1,'Maroon Crop Jersey','Trendy maroon crop jersey for casual outfits','Maroon',129.99,12,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/maroon%20crop%20jersey.jpg','2025-02-18 08:07:41'),(21,1,'Oversized Knit Wear','Comfortable oversized knit wear for cooler days','Beige',149.99,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/oversized%20knit%20wear.jpg','2025-02-18 08:07:41'),(22,1,'Oversized Poloneck Knit Wear','Warm oversized poloneck knit wear for ultimate comfort','Beige',225.00,9,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/oversized%20poloneck%20knit%20wear.jpg','2025-02-18 08:07:41'),(23,1,'Oversized Stylish Cardigan','Fashionable oversized cardigan for easy layering','Grey',239.99,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/oversized%20stylish%20cardigan.jpg','2025-02-18 08:07:41'),(24,1,'Pink Plaid Short Coat','Cute pink plaid short coat for casual winter days','Pink',315.00,8,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/pink%20plaid%20short%20coat%20.jpg','2025-02-18 08:07:41'),(25,1,'Pink & White Plaid Wool Coat','Charming pink & white plaid wool coat for winter','Pink',449.99,6,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/pink%26%20white%20plaid%20wool%20coat.jpg','2025-02-18 08:07:41'),(26,1,'Short Beige Trench Coat','Short beige trench coat for stylish protection','Beige',380.00,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/short%20beige%20trench%20coat%20jpg.jpg','2025-02-18 08:07:41'),(27,1,'Short Plaid Coat','Fashionable short plaid coat for winter layering','Plaid',350.00,7,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/short%20plaid%20coat.jpg','2025-02-18 08:07:41'),(28,1,'Single-Breasted Beige Trench Coat','Classic single-breasted beige trench coat for timeless style','Beige',660.00,8,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/single-breasted%20beige%20trench%20coat%20.jpg','2025-02-18 08:07:41'),(29,1,'Single-Breasted Trench Coat','Stylish single-breasted trench coat for any occasion','Beige',595.00,10,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/single-breasted%20trench%20coat.jpg','2025-02-18 08:07:41'),(30,1,'White Knit Jersey','Elegant white knit jersey for cozy days','White',159.99,15,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/white%20knit%20jersey.jpg','2025-02-18 08:07:41'),(31,1,'White Puffer Jacket','Classic white puffer jacket for winter warmth','White',265.95,8,'https://github.com/awonkenkibi/images/blob/main/WomenProducts/white%20puffer%20jacket%20%20.jpg','2025-02-18 08:07:41'),(32,2,'Black Coat','Elegant black coat for formal or casual wear','Black',550.95,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Black%20coat.jpg','2025-02-18 08:07:41'),(33,2,'Black Denim Jacket with Fur','Stylish black denim jacket with fur lining for added warmth','Black',300.98,15,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Black%20denim%20jacket%20with%20fur.jpg','2025-02-18 08:07:41'),(34,2,'Black Hood Puffer Jacket','Sleek black puffer jacket with a hood for cold days','Black',99.99,8,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Black%20hood%20puffer%20jacket.jpg','2025-02-18 08:07:41'),(35,2,'Black Long Puffer Jacket','Long black puffer jacket for ultimate warmth and protection','Black',355.99,7,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Black%20long%20puffer%20jacket.jpg','2025-02-18 08:07:41'),(36,2,'Black Puffer Jacket','Classic black puffer jacket for winter layering','Black',299.99,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Black%20puffer%20jacket.jpg','2025-02-18 08:07:41'),(37,2,'Black Trench Coat','Stylish black trench coat with a classic cut','Black',659.99,6,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Black%20trench%20coat.jpg','2025-02-18 08:07:41'),(38,2,'Burgundy Wool Coat','Elegant burgundy wool coat for the winter season','Burgundy',700.90,8,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Burgundy%20wool%20coat.jpg','2025-02-18 08:07:41'),(39,2,'Casual Fleece Lined Puffer Jacket','Casual fleece-lined puffer jacket for a warm and relaxed look','Navy Blue',315.95,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Casual%20Fleece%20Lined%20Puffer%20Jacket.jpg','2025-02-18 08:07:41'),(40,2,'Grey Hood Jacket','Cozy grey hoodie jacket for layering in cold weather','Grey',319.99,12,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Grey%20hoodjacket.jpg','2025-02-18 08:07:41'),(41,2,'Men Plaid Print Teddy Lined','Plaid print teddy-lined jacket for extra warmth','Plaid',459.99,7,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Men%20Plaid%20print%20teddy%20lined.jpg','2025-02-18 08:07:41'),(42,2,'Men\'s Brown Puffer Jackets','Classic brown puffer jackets for the cold season','Brown',349.99,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Men\'s%20%20brown%20puffer%20jackets%20.jpg','2025-02-18 08:07:41'),(43,2,'Men\'s Black-Cabled Knit Wear','Warm black cabled knit wear for chilly days','Black',249.99,12,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Men\'s%20Black-cabled%20Knit%20wear%20%20.jpg','2025-02-18 08:07:41'),(44,2,'Men\'s Blush Pink Knit Wear','Trendy blush pink knit wear for winter','Blush Pink',259.99,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Men\'s%20Blush%20Pink%20Knit%20Wear.jpg','2025-02-18 08:07:41'),(45,2,'Men\'s Cozy Fleece Button-Up Jacket','Cozy fleece button-up jacket for warmth and style','Grey',400.00,8,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Men\'s%20Cozy%20Fleece%20Button-Up%20Jacket.jpg','2025-02-18 08:07:41'),(46,2,'Men\'s Green Knit Jersey','Stylish green knit jersey for layering','Green',210.90,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Men\'s%20green%20Kint%20Jersey.jpg','2025-02-18 08:07:41'),(47,2,'Men\'s Multi-Coloured Knit Sweater','Multicoloured knit sweater for a trendy and warm look','Multicolour',199.95,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Men\'s%20multi-coloured%20Knit%20Sweater.jpg','2025-02-18 08:07:41'),(48,2,'Men\'s Peacoat','Classic men\'s peacoat for winter elegance','Navy Blue',749.99,6,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Men\'s%20peacoat.jpg','2025-02-18 08:07:41'),(49,2,'Olive Wool Coat','Stylish olive wool coat for winter fashion','Olive',519.99,8,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Olive%20wool%20coat.jpg','2025-02-18 08:07:41'),(50,2,'Outdoor Casual Daily Hiking Winter Jersey','Durable and warm jersey perfect for winter hiking','Olive Green',119.99,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Outdoor%20Casual%20Daily%20Hiking%20Winter%20Jersey.jpg','2025-02-18 08:07:41'),(51,2,'Oversized Knit Wear','Comfortable oversized knit wear for colder days','Beige',120.95,15,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Oversized%20Knit%20wear.jpg','2025-02-18 08:07:41'),(52,2,'Striped Knit Wear White & Beige','Elegant striped knit wear for winter layering','White & Beige',129.99,12,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Striped%20Knit%20Wear%20white%26beige.jpg','2025-02-18 08:07:41'),(53,2,'Trench Coat','Classic men\'s trench coat for a formal look','Beige',689.99,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Trench%20coat.jpg','2025-02-18 08:07:41'),(54,2,'Vintage Corduroy','Vintage-style corduroy jacket for a trendy winter look','Brown',449.99,7,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Vintage%20Corduuroy.jpg','2025-02-18 08:07:41'),(55,2,'Warm Puffer Jacket with Removable Hood','Warm puffer jacket with removable hood for cold days','Grey',350.00,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Warm%20Puffer%20Jacket%20with%20Removable%20Hood%20.jpg','2025-02-18 08:07:41'),(56,2,'White Hood Puffer Jackets','Sleek white puffer jacket with hood for a stylish winter look','White',329.00,8,'https://github.com/awonkenkibi/images/blob/main/MenProducts/White%20hood%20puffer%20jackets.jpg','2025-02-18 08:07:41'),(57,2,'Zip-Up Jersey','Casual zip-up jersey for daily wear','Black',189.99,15,'https://github.com/awonkenkibi/images/blob/main/MenProducts/Zip-up%20jersey.jpg','2025-02-18 08:07:41'),(58,2,'Beige & Navy Plaid Coat','Plaid beige and navy coat for stylish winter days','Beige & Navy',669.95,8,'https://github.com/awonkenkibi/images/blob/main/MenProducts/beige%26navy%20plaid%20coat.jpg','2025-02-18 08:07:41'),(59,2,'Brown Plaid Coat','Classic brown plaid coat for cold weather','Brown',700.00,10,'https://github.com/awonkenkibi/images/blob/main/MenProducts/brown%20plaid%20coat.jpg','2025-02-18 08:07:41'),(60,2,'Grey Plaid Coat','Trendy grey plaid coat for a fashionable winter look','Grey',719.99,12,'https://github.com/awonkenkibi/images/blob/main/MenProducts/grey%20plaid%20coat.jpg','2025-02-18 08:07:41'),(61,2,'Striped Knit Jersey','Elegant striped knit jersey for a warm winter outfit','Stripes',149.95,10,'http://github.com/awonkenkibi/images/blob/main/MenProducts/striped%20knit%20jersey%20.jpg','2025-02-18 08:07:41'),(62,3,'Boys Plaid Teddy Lined Hooded Jacket','Warm plaid teddy-lined jacket with a hood for boys','Plaid',290.00,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/Boys%20Plaid%20Teddy%20Lined%20Hooded%20Jacket.jpg','2025-02-18 08:07:41'),(63,3,'Boys Hooded Puffer Jacket Water Resistant','Water-resistant hooded puffer jacket for boys','Blue',150.00,12,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/Boys\'%20Hooded%20Puffer%20Jacket%20Water%20Resistant.jpg','2025-02-18 08:07:41'),(64,3,'ColdControl Max Puffer Jacket','ColdControl Max puffer jacket for maximum warmth and comfort','Black',180.00,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/ColdControl%20Max%20Puffer%20Jacket.jpg','2025-02-18 08:07:41'),(65,3,'Girls Buffalo Plaid Print Coat','Buffalo plaid print coat for girls, perfect for winter','Red Plaid',250.98,15,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/Girls%20Buffalo%20Plaid%20Print%20coat.jpg','2025-02-18 08:07:41'),(66,3,'Girls Dual Pocket Teddy Coat','Cozy dual-pocket teddy coat for girls','Beige',225.90,12,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/Girls%20Dual%20pocket%20teddy%20coat.jpg','2025-02-18 08:07:41'),(67,3,'Boys Leather Bomber Jacket','Classic leather bomber jacket for boys','Brown',199.98,8,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20Leather%20Bomber%20Jacket-.jpg','2025-02-18 08:07:41'),(68,3,'Boys Wool-Blend Coat','Stylish wool-blend coat for boys for winter days','Grey',219.95,7,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20Wool-Blend%20Coat.jpg','2025-02-18 08:07:41'),(69,3,'Boys Black Coat with Fur & Hood','Black coat with fur and hood for boys to stay warm in style','Black',195.95,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20black%20coat%20with%20fur%26hood.jpg','2025-02-18 08:07:41'),(70,3,'Boys Blue Puffer Jacket','Warm and stylish blue puffer jacket for boys','Blue',170.99,12,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20blue%20puffer%20jacket.jpg','2025-02-18 08:07:41'),(71,3,'Boys Cabled Knit Wear','Cozy cabled knit wear for boys','Blue',109.99,15,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20caled%20knit%20wear.jpg','2025-02-18 08:07:41'),(72,3,'Boys Corduroy Fleeced-Lined Jacket','Corduroy jacket with fleece lining for extra warmth','Brown',119.99,8,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20corduroy%20fleeced-lined%20jacket%20%20.jpg','2025-02-18 08:07:41'),(73,3,'Boys Denim Jacket with a Hood','Classic denim jacket with a hood for boys','Denim Blue',129.99,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20denim%20jacket%20with%20a%20hood.jpg','2025-02-18 08:07:41'),(74,3,'Boys Denim Jacket with Fur','Stylish denim jacket with fur lining for boys','Blue',139.95,8,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20denim%20jacket%20with%20fur.jpg','2025-02-18 08:07:41'),(75,3,'Boys Plaid Wool Coat','Warm plaid wool coat for boys','Plaid',129.87,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20plaid%20wool%20coat%20jpg.jpg','2025-02-18 08:07:41'),(76,3,'Boys Puffer Jacket with Hood','Warm puffer jacket with a hood for boys','Black',144.99,12,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20puffer%20jacket%20with%20hood.jpg','2025-02-18 08:07:41'),(77,3,'Boys Short Grey Wool Coat','Short grey wool coat for boys','Grey',115.99,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20short%20grey%20wool%20coat.jpg','2025-02-18 08:07:41'),(78,3,'Boys Wool Coat','Classic wool coat for boys','Camel',125.76,8,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20wool%20coat%20jpg.jpg','2025-02-18 08:07:41'),(79,3,'Boys Zip-Up Jersey','Comfortable zip-up jersey for boys','Green',105.98,15,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/boys%20zip-up%20jersey.jpg','2025-02-18 08:07:41'),(80,3,'Girls Black Coat','Stylish black coat for girls','Black',199.99,12,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20%20black%20coat.jpg','2025-02-18 08:07:41'),(81,3,'Girls Black Puffer Jacket','Warm black puffer jacket for girls','Black',120.00,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20black%20puffer%20jacket.jpg','2025-02-18 08:07:41'),(82,3,'Girls Cable Knit Collar Jersey','Cozy cable knit jersey for girls with collar','Grey',109.99,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20cable%20knit%20collar%20jersey.jpg','2025-02-18 08:07:41'),(83,3,'Girls Cardigans Drop Shoulder','Chic drop-shoulder cardigan for girls','Pink',115.95,12,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20cardigans%20drop%20shoulder.jpg','2025-02-18 08:07:41'),(84,3,'Girls Colorblock Knitwear Jersey','Trendy colorblock knitwear jersey for girls','Multicolor',107.99,8,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20colorblock%20knitwear%20jersey.jpg','2025-02-18 08:07:41'),(85,3,'Girls Double-Breasted Coat','Elegant double-breasted coat for girls','Beige',219.99,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20double-breasted%20coat.jpg','2025-02-18 08:07:41'),(86,3,'Girls Long Parka Warm Hooded Puffer','Warm long parka with hood for girls','Pink',189.98,8,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20long%20parka%20warm%20hooded%20puffer.jpg','2025-02-18 08:07:41'),(87,3,'Girls Plaid Fuzzy Trim Hooded Belted','Plaid fuzzy trim hooded coat with belt for girls','Plaid',220.00,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20plaid%20fuzzy%20trim%20hooded%20belted.jpg','2025-02-18 08:07:41'),(88,3,'Girls Solid Neck Teddy Coat','Cozy teddy coat with solid neck for girls','Cream',159.99,12,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20solid%20neck%20teddy%20coat.jpg','2025-02-18 08:07:41'),(89,3,'Girls Toddler Puffer Jacket','Warm puffer jacket for toddler girls','Pink',120.99,15,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20toddler%20Puffer%20Jacket.jpg','2025-02-18 08:07:41'),(90,3,'Girls Wool Coat in Grey','Classic grey wool coat for girls','Grey',210.00,10,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/girls%20wool%20coat%20in%20grey.jpg','2025-02-18 08:07:41'),(91,3,'Tweed Coat with Faux Fur','Stylish tweed coat with faux fur for girls','Tweed',229.96,8,'https://github.com/awonkenkibi/images/blob/main/KidsProducts/tweed%20coat%20with%20faux%20fur.jpg','2025-02-18 08:07:41');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `shipping_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`shipping_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,21,'Sam sam','n233 block 01','Cape Town','8000','South Africa'),(2,21,'Sam sam','n233 block 01','Cape Town','8000','South Africa'),(3,21,'Sam sam','n233 block 01','Cape Town','8000','South Africa'),(4,21,'Sam sam','n233 block 01','Cape Town','8000','South Africa'),(5,21,'Sam sam','n223 zwelitsha drive','Cape Town','8000','South Africa'),(6,24,'You ','657 Mrytle','cape town','8000','South Africa'),(7,24,'Alu','1234 MUYVVD','Cape Town','8000','South Africa'),(8,24,'Ertyybu','thvfzhb','cape town','8000','South Africa'),(9,24,'uyytd','7 cathji','cape town','8000','South Africa'),(10,24,'rget sd','Bobo','cape town ','8000','South Africa'),(11,24,'ertggfd','sgsb','sfdf','8000','South Africa'),(12,21,'sam','n221 zwelitsha','Cape town','8000','South Africa'),(13,21,'sam','n221 zwelitsha','Cape town','8000','South Africa'),(14,21,'sam','n221 zwelitsha','Cape town','8000','South Africa'),(15,21,'sam','n223','cape town','8000','South Africa'),(16,22,'niki','n234 zwe','durban','7009','South Africa'),(17,22,'nik','n234 zwe','durban','7009','South Africa'),(18,21,'sam','n123','cape town','8000','South Africa'),(19,21,'sam','n123','cape town','8000','South Africa'),(20,21,'sam','n123','cape town','8000','South Africa'),(21,21,'sam','n123','cape town','8000','South Africa'),(22,21,'sam','n123','cape town','8000','South Africa'),(23,21,'sam','n123','cape town','8000','South Africa'),(24,22,'sam','n123','cape town','8000','South Africa'),(25,22,'sam','n123','cape town','8000','South Africa'),(26,24,'sam','n123','cape town','8000','South Africa'),(27,24,'sam','n123','cape town','8000','South Africa'),(28,25,'Siyavuya SK Khohlani','n233 block 01','Cape Town','8000','South Africa'),(29,24,'Siyavuya SK Khohlani','n233 block 01','Cape Town','8000','South Africa'),(30,25,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(31,24,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(32,24,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(33,27,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(34,27,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(35,27,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(36,27,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(37,27,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(38,26,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(39,26,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(40,26,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(41,26,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa'),(42,26,'Siyavuya SK Khohlani','n223 block 01','Cape Town','8000','South Africa');
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('user','admin') DEFAULT 'user',
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alice Johnson','alice@example.com','hashedpassword1','123-456-7890','123 Elm St, Springfield','2025-02-18 08:07:41','user',NULL,NULL),(2,'Bob Smith','bob@example.com','hashedpassword2','987-654-3210','456 Oak St, Riverside','2025-02-18 08:07:41','user',NULL,NULL),(3,'Mulalo  Mabuda','mulalomabuda@gmail.com','$2b$12$EXpn7NhBQjHKOqirOwnGueZaObKGbeegCyjXK9Lcp4rF3NseLQtDS','0607827398','28 Odin Drive, Kraaifontein','2025-02-24 11:21:15','user','f5cd91c7438c967e0ed9e3cd0bd4ad346faae1bda53a45c43dde9908a4ed745c','2025-03-07 09:57:03'),(16,'Moesha','moeshaH@gmail.com','$2b$12$ArtJ4TZp6OYKUeN9Dxy6S.TOEn9O/W9MDEp6v1riElHIoaeFqPfDa','087654321','28 Odin Drive, Kraaifontein','2025-02-25 13:12:41','user',NULL,NULL),(17,'Mulalo','mulalo@gmail.com','$2b$12$YnaGhayzT9L6jmKFSkayEOPlv7yZ8M0Zy1k5S29PtYVyQ.52G1nle','0607827398','28 Odin Drive, Kraaifontein','2025-02-25 18:59:00','user',NULL,NULL),(19,'Admin User','admin@example.com','$2a$12$H7Y8nX8YROG1KZ9U9LQu/uJ.kNwGbJz0fI0LCq/1v3GMeJDCtq4ma','1234567890','Admin Address','2025-02-28 09:08:58','admin',NULL,NULL),(20,'Thendo','thendo@gmail.com','$2b$12$5rGZiTlv.r35H3cQ1bqDqOy3xFdAEjCM6HYDOdicmaHMqCZS1R1XG',NULL,'28 Odin Drive, Kraaifontein','2025-02-28 09:45:41','admin',NULL,NULL),(21,'Sam sam','Sam@gmail.com','$2b$12$XY7lf/v6F.TUQ5faXMNIleO6dwvQGmTbsD4Pab25oKEEan3CvOYdC','0695370991','n233 block 01','2025-03-04 10:44:42','user',NULL,NULL),(22,'Moesha Hlongwane','Nikiwe22@gmail.com','$2b$12$Q3VzTFNXcjBfdd/d4s86lObYcX1Wp.QLBZMZ1iBJ1icFC9txj.sTm',NULL,NULL,'2025-03-06 06:25:50','admin',NULL,NULL),(24,'Aluluthu','Nikiwe44@gmail.com','$2b$12$BIknuJoeqyc1nkGhrVk8du3QyG5SXtK7LKPfBEQhymCPfRGaA5aLO','0695370991','n233 block 01','2025-03-06 06:35:54','user',NULL,NULL),(25,'Azola Ndoda','Azola@gmail.com','$2b$12$DSRRTrwhD599E./9lMUnH.LI3cudOVgwOV94qGaW8uBJYGTHC1v5y','0695370991','Is following too much a violation? if it is I did not know. That the only thing I did.','2025-03-06 11:38:00','user',NULL,NULL),(26,'Vuyo','Vuyo@gmail.com','$2b$12$Mane.n.k86BJGIDiqV0hx.Sru3rc92iz3erPSeGOZVUwqhW0ybqQq','0695370991','n223 block 01','2025-03-06 20:42:54','user',NULL,NULL),(27,'Dee','dee@gmail.com','$2b$12$sU5yH/AaQBZpfE.mGElMJOkNYowcHjAe4KLWqPQXp9HsnZJV7EyXG','0695370991','n234 zwe','2025-03-06 21:18:57','user',NULL,NULL),(28,'leo mesi','leo@gmail.com','$2b$12$TzWv5nhrN9ll4qndZYNJuujcrWjX9KlrEz5kYtnyreY81iR2/Z5hq',NULL,NULL,'2025-03-06 23:32:51','admin',NULL,NULL),(29,'Siyavuya Khohlani','siyakhohlani@gmail.com','$2b$12$d7QUN4dGSXkkEr7d8JpkfeJ5zdB/os5Vkmbe1Hh19PmmmOBAfTgmO','0695370991','N223 Zwelitsha drive, Nyanga East 7750','2025-04-10 06:36:19','user',NULL,NULL),(30,'Siya Khohlani','admin2@gmail.com','$2b$12$lByi3XTdkTcD0MRd4hNweeU2zBXUEEiv09sxVVaPbN3asrsM8DKi2',NULL,NULL,'2025-04-10 06:46:47','admin',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-20 19:41:50
