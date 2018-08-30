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
  `grpid` bigint(20) unsigned DEFAULT NULL,
  `writer` varchar(32) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,1,'조영완','첫 코멘트 작성'),(2,1,'조영완','반갑습니다.'),(3,1,'조영완','세번째 코멘트 작성'),(4,8,'조영완','댓글 등록'),(5,8,'조영완','두번째 댓글을 이용해보자'),(6,8,'조영완','다음 부터 글 짧게 쓰지 마세요'),(7,8,'View','꽤 어렵네'),(8,16,'조영완','글좀 길게 적어주세요 삭제 조치 합니다.'),(9,19,'조영완 ','할말은 없는데 작성 작성 작성'),(10,15,'그만하자','응 으응으응ㅇ');
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
  `grpid` bigint(20) NOT NULL,
  `grpord` tinyint(4) NOT NULL,
  `depth` tinyint(4) NOT NULL,
  `title` varchar(255) NOT NULL,
  `writer` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contents`
--

LOCK TABLES `Contents` WRITE;
/*!40000 ALTER TABLE `Contents` DISABLE KEYS */;
INSERT INTO `Contents` VALUES (1,1,0,0,'첫번째 게시글','조영완','첫번째 게시글'),(2,1,1,1,'첫번째 게시글의 첫번째 답변','조영완','첫번째 게시글의 첫번째 답변'),(3,1,2,2,'첫번째 게시글의 첫번째 답변의 첫번째 답변','조영완','1'),(4,1,3,3,'첫번째 게시글의 첫번째 답변의 첫번쨰 답변의 첫번째 답변','조영완','첫번째 게시글의 첫번째 답변의 첫번째 답변의 첫번째 답변'),(6,5,1,1,'두번째 게시글의 첫번째 답글','조영완','두번째 게시글의 첫번째 답글'),(7,1,4,4,'뷰를 이용한 답글','조영완','뷰를 이용한 답글'),(8,1,5,5,'뷰를 이용한 답글','조영완','뷰를 이용한 답글의 답글'),(9,5,2,2,'두번째 게시글의 첫번째 답글','조영완','내용을 입력해수제쇼여'),(10,5,3,1,'두번째 게시글','조영완','나의 깊이를 모르겠다'),(11,5,4,2,'두번째 게시글','페이지가 넘어가면 어떻게 하지','ㄹㅇㄴㅁㄹㅇㅁㄴㅇㄴㅁㅇㅁㄴㅇㄴㅁ'),(12,12,0,0,'세번째 게시글','조영완','이건 세번째 게시글\r\n이건 세번째 게시글이건 세번째 게시글\r\n이건 세번째 게시글\r\n이건 세번째 게시글이건 세번째 게시글이건 세번째 게시글\r\n이건 세번째 게시글이건 세번째 게시글이건 세번째 게시글\r\n이건 세번째 게시글이건 세번째 게시글\r\n이건 세번째 게시글\r\n이건 세번째 게시글\r\n이건 세번째 게시글\r\n이건 세번째 게시글\r\n이건 세번째 게시글'),(13,12,1,1,'세번째 게시글','집에가자','이제 집에 가타'),(14,12,2,1,'','',''),(15,12,3,2,'','',''),(16,16,0,0,'네번째 게시글','조영완','네 번째 게시글'),(17,16,1,1,'네번째 게시글','조영완','답글 답글'),(18,16,2,2,'네번째 게시글','조영완','답글의 답글'),(19,16,3,3,'네번째 게시글','조영완','답글'),(20,16,3,3,'답글 뎁스 테스트','조영완','답글 뎁스 테스트'),(21,16,4,4,'답글 뎁스 테스트','조영완','렁나ㅣㄹ\'ㄴㅇ머ㅏ리;ㅇ먼리;ㅏㅁ언리;ㅇㅁ너라ㅣㅁ'),(22,22,0,0,'원본 게시글','조영완','ㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴ'),(23,22,1,1,'원본 게시글의 답글','조영완','조영완'),(24,22,2,2,'원본 게시글의 답글의 답글','조영완','조여어리ㅏㅇ너ㅣㅏㅇ니ㅏ;ㅁㅇ니ㅏㄴㅁㅇ랑ㅁㄴ;'),(25,22,2,2,'원본 게시글의 답글의 답글2','조영완','ㄹㅇㄴㄹㅇㄴㅁㄹㅁㄴㅇㄹㅇㄴㅁㄹ'),(26,22,3,1,'원본 게시글의 답글2','조영완 ','조아ㅓㄹ이남리ㅏ;ㅁㅇ니;ㅏㅇㄴㅁ');
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

-- Dump completed on 2018-08-30 19:14:34
