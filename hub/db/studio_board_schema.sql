-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: studio_board
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `Contents`
--

DROP TABLE IF EXISTS `Contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `writer` varchar(32) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contents`
--

LOCK TABLES `Contents` WRITE;
/*!40000 ALTER TABLE `Contents` DISABLE KEYS */;
INSERT INTO `Contents` VALUES (1,'첫 게시글 테스트','조영완','난 개발실 게시판을 만들고 있지'),(2,'내친김에 글 하나 더 써야지','조영완','두번째도 잘 되겠지'),(3,'진짜 잘 써지네','조영완','1'),(4,'돌체구스토','네스카페','많이 이용해 주세요'),(5,'치킨개발','일친이','잘해주세요'),(6,'[치킨] 스테이지 선택창 해상도 문제','안성훈','일부 리소스가 부족해서 영태씨한테 부탁드려야 완성 할 수 있을것 같습니다.'),(7,'[치킨] 인게임에서 로비로 돌아왔을때 위치','안성훈','인게임에서 로비로 돌아왔을때 입장했던 스테이지가 아닌 다른 스테이지가 잠깐 보입니다.'),(8,'[치킨]스테이지선택창이 스테이지에 가려짐','최원평','[치킨]스테이지선택창이 스테이지에 가려짐'),(9,'[치킨] 캐릭터 연구실 해상도 대응','최원평','배경 레이어 를 디바이스 해상도에 따라 전체 싸이즈로 나올 수 있게 변경 하였습니다.'),(10,'아 힘들다','마일드세븐','ㄹ언ㄹㅇㅁ너ㅏ링ㄴ머라ㅣ;언ㅁ리;ㅇ나ㅣ미ㅏㅇㄴ머라ㅣㅣㅏㅇㄴㅁㄹ'),(11,'얍','브맨치치','얍 다음페이지로'),(12,'나눗셈 연산 잘못했어','작업자','반올림이 되더라고 그래서 페이징에 버그가 생겼어'),(13,'야야야','야야야','야야야'),(14,'드디어','조영완','집에 갈수 있다.'),(15,'mysql 데몬을 백그라운드에서 실행시키지 위해','이제가자','30분을 삽질'),(16,'dsadasdsad','asdsadasdasd','dasdasdasdsa'),(17,'제발 되라','되라','되라'),(18,'되냐','되냐','되냐'),(19,'되냐','되냐','되냐'),(20,'321321321','321321321','321312312321'),(21,'백그라운드에서 좀 느린데','왜지','아 집에 가자'),(22,'왜 안되','도대체','왜'),(23,'수고','조영완','하셨습니다.'),(24,'집에서도','조영완','써진다'),(25,'ㅋㅋㅋㅋㅋ','엄마','엄마가! 컴터는! 잘 끄고! 다니랬지!!'),(26,'진짜 엄마 인줄','모지','...'),(27,'뿌뿌뿡','뿌뿌뿡','뿌뿌뿡'),(28,'pm2를 설치했습니다.','조영완','과연 잘될까요?'),(29,'원격 서버에서 로그아웃 했는데','조영완','과연 잘될까?'),(30,'pm2 쓰니까 되네?','조영완','냉무'),(31,'왜 되는건지','조영완','1'),(32,'이렇게 쉽게 해결 될 수 없어','조영완','1'),(33,'여전히 되겠지?','조영완','되냐'),(34,'굿','조영완','pm2 굿'),(35,'게시판 업데이트 진행','조영완','완료');
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

-- Dump completed on 2018-08-21 23:09:11
