-- MySQL dump 10.13  Distrib 5.7.23, for osx10.13 (x86_64)
--
-- Host: localhost    Database: studio_board
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` bigint(20) unsigned NOT NULL,
  `writer` varchar(32) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,1,'조영완','첫 코멘트 작성'),(2,1,'조영완','반갑습니다.'),(3,1,'조영완','세번째 코멘트 작성'),(4,8,'조영완','댓글 등록'),(5,8,'조영완','두번째 댓글을 이용해보자'),(6,8,'조영완','다음 부터 글 짧게 쓰지 마세요'),(7,8,'View','꽤 어렵네'),(8,16,'조영완','글좀 길게 적어주세요 삭제 조치 합니다.'),(9,19,'조영완 ','할말은 없는데 작성 작성 작성'),(10,15,'그만하자','응 으응으응ㅇ'),(11,10,'조영완','아무글이나 싸지르지 마세요');
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contents`
--

DROP TABLE IF EXISTS `Contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` bigint(20) unsigned NOT NULL,
  `grpid` bigint(20) unsigned NOT NULL,
  `grpord` tinyint(4) unsigned NOT NULL,
  `depth` tinyint(4) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `writer` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contents`
--

LOCK TABLES `Contents` WRITE;
/*!40000 ALTER TABLE `Contents` DISABLE KEYS */;
INSERT INTO `Contents` VALUES (1,1,1,0,0,'첫번째 글 작성','조영완','어ㅏㅣㅇㄴㅁ라ㅣㅇㄴ미ㅏㅇㄴ머리'),(2,2,2,0,0,'두번째 글 작성','조영완','러ㅏ인ㅁ;리;ㅏㅇㅁ나ㅣㅇㄴㅁ;ㅣ;ㅁㄴ'),(3,3,3,0,0,'세번째 글 작성','조영완','러ㅏㅣㅇ너리ㅏㅇㄴ미ㅏㅇ;ㅁㄴ리;'),(4,2,2,2,1,'두번째 글 작성의 답글','조영완','ㅓ리ㅏㅇㄴ머ㅣㅏ;ㅇㅁㄴ리ㅏㅇㄴㅁ리;ㅇㅁㄴ'),(5,2,2,3,1,'두번째 글 작성의 답글2','조영완','라ㅣ;ㅇㅁㄴ;ㅣㅇㅁㄴ리;ㅁㅇ너리ㅏ;ㅇㅁㄴ라ㅣㅇㄴ머라ㅣ;ㅓㄴㅇㅁ;'),(6,4,2,2,2,'두번째 글 작성의 답글의 답글','조영완','러ㅏㅇ니ㅓㅇ니ㅏ;ㅇㄴㅁ;ㅏㅣㅇㄴㅁ러ㅏㅣㅓ리ㅏㅇ먼리;ㅓㅏㅣㅇㅁ'),(7,2,2,4,1,'두번째 글 작성의 답글3','조영완','러아ㅣㄴㄹ;ㄴㅇ미;이ㅏ나ㅣㅇㄴㅁ라ㅣㅇ;ㄴ\'츠,ㅌ.ㅋ프,ㅊㅌ쿠ㅏㅣ;ㅁ'),(8,3,3,4,1,'세번째 글 작성의 답글','조영완','라ㅓ인ㅁ리ㅏ;ㅁㅇㄴ라ㅣㅓ차티픝ㅋ,./ㅡㅍㅊㅌㅋ,ㅜ파ㅣㅁㅇㄹ너이나ㅓ링ㄴ머ㅣㅏ'),(9,3,3,5,1,'세번째 글 작성의 답글2','조영완','이얏호'),(10,8,3,4,2,'세번째 글 작성의 답글의 답글','조영완','ㄹㅇㄴㄹㅇㄴㅁㅇㄴㅁㄹㅁ'),(11,10,3,4,3,'','',''),(12,11,3,4,4,'세번째 글 작성의 답글의 답글의 답글의 답글','조영완 ','의미 없는 내용글은 삭제해주세요');
/*!40000 ALTER TABLE `Contents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-31 14:32:49
