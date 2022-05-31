-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: mamomo
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1

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
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`authority_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES ('ROLE_ADMIN'),('ROLE_USER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` bigint(20) NOT NULL,
  `banner_id` varchar(255) DEFAULT NULL,
  `bg_color1` varchar(255) DEFAULT NULL,
  `bg_color2` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `site_type` varchar(255) DEFAULT NULL,
  `text_color1` varchar(255) DEFAULT NULL,
  `text_color2` varchar(255) DEFAULT NULL,
  `text_color3` varchar(255) DEFAULT NULL,
  `text_font1` varchar(255) DEFAULT NULL,
  `text_font2` varchar(255) DEFAULT NULL,
  `text_font3` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `original_img` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8r7cnv2chr54hmp27x12glpij` (`user_id`),
  CONSTRAINT `FK8r7cnv2chr54hmp27x12glpij` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (382,'202205182159','#ee95f3','#ffffff','2022-05-18 21:03:59','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205182159','시민이 직접 공약을 제안합니다.우리 익산을 위해 필요하다고 생각하는 아이디어가 있는 시민이면 누구나 참여 가능하며, 아이디어를 구체적인 공약으로 만들어 직접 제안하는 것입니다.','happybean','#6d6d6d','#f9bfbf','#bfa7a7','14','24','16','익산시민 희망공약제안 캠페인을 응원해주세요.','500','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(469,'202205281140','#a2a6ff','#f3f1f1','2022-05-28 11:14:39','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205281140','행복이 넘치는 가정의 달...하지만..따뜻한 봄과 함께 사랑이 넘치는 가정의 달 5월이 다가옵니다. 하지만 아이들과 함께 나들이를 가고, 선물을 주며 가족이 모여 맛있는 외식을 하는 평범한 가족의 행복을 누리지 못하...','happybean','#fca8ff','#ffffff','#ffffff','14','24','16','서글픈 가정의달, 다문화가정에 작은 행복을 배달합니다','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(490,'202205291634','#a2a6ff','#f3f1f1','2022-05-29 16:26:34','200','https://storage.googleapis.com/mamomo-banner-storage/3a45a5c2-c885-4f19-85a5-c2c8859f19a4/202205291634','시민이 직접 공약을 제안합니다.우리 익산을 위해 필요하다고 생각하는 아이디어가 있는 시민이면 누구나 참여 가능하며, 아이디어를 구체적인 공약으로 만들어 직접 제안하는 것입니다.','happybean','#fca8ff','#ffffff','#ffffff','14','24','16','익산시민 희망공약제안 캠페인을 응원해주세요.','1000','3a45a5c2-c885-4f19-85a5-c2c8859f19a4','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(491,'202205291634','#a2a6ff','#f3f1f1','2022-05-29 16:26:34','200','https://storage.googleapis.com/mamomo-banner-storage/3a45a5c2-c885-4f19-85a5-c2c8859f19a4/202205291634','시민이 직접 공약을 제안합니다.우리 익산을 위해 필요하다고 생각하는 아이디어가 있는 시민이면 누구나 참여 가능하며, 아이디어를 구체적인 공약으로 만들어 직접 제안하는 것입니다.','happybean','#fca8ff','#ffffff','#ffffff','14','24','16','익산시민 희망공약제안 캠페인을 응원해주세요.','1000','3a45a5c2-c885-4f19-85a5-c2c8859f19a4','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(582,'202205292234','#e5e6ff','#ffb1b1','2022-05-29 22:24:33','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205292234','지희에게는 멘토 선생님이 최고예요!중학교 3학년 지희(가명)는 6명의 어린 남동생들 틈에서 정신없는 하루를 보냅니다. 사춘기 지희에겐 속마음을 털어놓을 수 있는 상대가 필요하지만 엄마는 동생들을 챙기느라 바쁘고, 학...','happybean','#be9cbf','#bf938c','#a4928f','14','24','16,16','취약계층 아동을 위한 꿈키움 멘토링에 함께해 주세요.','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(583,'202205292210','#ffffff','#87ffea','2022-05-29 22:28:10','300','https://storage.googleapis.com/mamomo-banner-storage/550e8400-e29b-41d4-a716-446655440000/202205292210','아이들의 재능은 발견하는것 보다, 발전하기가 더 어려워요! 우리 친구들은 다양한 프로그램을 경험하면서 저마다 각기 다른 재능을 발견합니다. 하지만 다양한 재능을 발견했다 하여 단체생활 안에서 그 소수의 아이들만을 위...','kakao','#000000','#000000','#4c4444','14','24','16','그림으로 표현하는 우리들의 꿈! 이야기','1000','550e8400-e29b-41d4-a716-446655440000','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(590,'202205300046','#5dcef3','#f3f1f1','2022-05-30 00:09:45','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300046','코로나 거리두기는 풀렸지만..코로나19로 인한 거리두기 제약이 전면해제 되면서 많은 아이들이 가족들과 함께 여행을 떠날 준비를 하며 들떠 있는 반면 여전히 홀로 집을 지키고 있는 아이들이 있습니다. 경제적인 어려움과...','happybean','#fca8ff','#ffffff','#ffffff','14','24','16,16','여행을 꿈꾸지 못하는 아이들에게 꿈을 선물해주세요','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(591,'202205300055','#1e2324','#ff4949','2022-05-30 00:58:55','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300055','2000년 이후 최대 피해 규모인 산불 지난 3월 4일 오후, 경북 울진에서 발생한 산불이 강원 삼척까지 계속되며 피해가 더욱 커지고 있습니다. 이는 2000년에 발생한 동해안 산불 이후 역대 두 번째로 큰 산불입니...','kakao','#db3327','#d54b41','#ff948d','14','24','16,16','울진. 강원 산불 피해 아동과 주민들의 손을 잡아주세요','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(592,'202205300105','#889092','#181818','2022-05-30 01:00:05','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300105','국제앰네스티가 조사한 현재 우크라이나 사람들의 모습 블라디미르 푸틴 대통령과 러시아 정부 및 군대는 우크라이나에서 저지르고 있는 전쟁범죄에 대한 진실을 감추기 위해 필사적입니다. 앰네스티는 러시아의 침공이 가져온 인...','happybean','#ffffff','#ffffff','#d8d5d5','14','24','16,16','우크라이나에서 일어나는 전쟁범죄, 멈춰야 합니다','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(593,'202205300159','#b8ff71','#cbfcb6','2022-05-30 01:00:59','300','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300159','다문화 엄마나라 음식체험 만들기코로나로 엄마나라를  가보지 못한 아동들의 욕구와 부모의 욕구 충족을 돕고 자존감 확립을 향상시키며 건강한 미래의 꿈나무로 성장 할 수 있도록  점진적인 효과를 기대합니다.각나라 필리핀...','happybean','#000000','#838383','#585858','14','32','20,20','\"세계 다문화 엄마나라 음식체험\"','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(594,'202205300101','#000000','#6a5a04','2022-05-30 01:03:01','250','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300101','죽음을 감수하면서까지 한국에 왔습니다.안녕하세요. 저는 사람다운 삶을 살고 싶어서 죽음을 감수하면서까지 한국에 왔습니다. 사실 북한에서의 감옥생활 중 당한 고문으로 몸이 좋지 않았습니다. 입국 초기 쓰러져 뇌 수술도...','happybean','#ffffff','#ffffff','#ffffff','12','26','15,15','죽음을 감수하였고 이제 아들과 살 수 있게 되었습니다.','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(595,'202205300136','#83ff28','#ffe342','2022-05-30 01:04:36','240','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300136','모든 게 불안정하지만 어린이날만큼은 코로나19의 여파인 불안정한 시장경제로 인해 일자리를 구하는데 어려움이 있지만 최선을 다해 아르바이트를 하면서 자녀를 돌보고 생계를 유지하고 있는 재가 한부모 가정의 상황은 그리 ...','happybean','#5c704a','#5c704a','#5c704a','12','26','15,15','어린이날~! 아이들 얼굴에 웃음꽃이 활짝 피기를 ','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(596,'202205300109','#b3ff0d','#ffe342','2022-05-30 01:05:08','240','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300109','모든 게 불안정하지만 어린이날만큼은 코로나19의 여파인 불안정한 시장경제로 인해 일자리를 구하는데 어려움이 있지만 최선을 다해 아르바이트를 하면서 자녀를 돌보고 생계를 유지하고 있는 재가 한부모 가정의 상황은 그리 ...','happybean','#449200','#50b000','#449200','12','26','15,15','어린이날~! 아이들 얼굴에 웃음꽃이 활짝 피기를 ','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(597,'202205300111','#b3ff0d','#ffe342','2022-05-30 01:05:11','240','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300111','모든 게 불안정하지만 어린이날만큼은 코로나19의 여파인 불안정한 시장경제로 인해 일자리를 구하는데 어려움이 있지만 최선을 다해 아르바이트를 하면서 자녀를 돌보고 생계를 유지하고 있는 재가 한부모 가정의 상황은 그리 ...','happybean','#449200','#50b000','#449200','12','26','15,15','어린이날~! 아이들 얼굴에 웃음꽃이 활짝 피기를 ','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(598,'202205300100','#dedede','#ffe342','2022-05-30 01:08:00','240','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300100','더 힘든 곳을 위해 떠나야만 합니다코로나가 기승을 하고 메타버스로 온라인 미팅을 하는 2022년문명의 사회와는 거리가 먼, 제대로 된 교육조차 이루어지지 않고 있는 곳이 있습니다.비전칠드런은 현재 레바논, 방글라데시...','happybean','#bfc5b9','#151515','#000000','12','26','15,15','하루만 이라도 학비 걱정 없이 공부하고 싶어요','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(599,'202205300102','#dedede','#ffe342','2022-05-30 01:08:02','240','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300102','더 힘든 곳을 위해 떠나야만 합니다코로나가 기승을 하고 메타버스로 온라인 미팅을 하는 2022년문명의 사회와는 거리가 먼, 제대로 된 교육조차 이루어지지 않고 있는 곳이 있습니다.비전칠드런은 현재 레바논, 방글라데시...','happybean','#bfc5b9','#151515','#000000','12','26','15,15','하루만 이라도 학비 걱정 없이 공부하고 싶어요','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(600,'202205300147','#ffffff','#c3f9ac','2022-05-30 01:08:47','240','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205300147','장애인에게 이동할 권리는 가장 기본적인 권리입니다.어디를 가고 싶어도 이동을 할 수가 없다면 아무것도 할 수가 없습니다.휠체어장애인에게 이동권은 더더욱 절실합니다.교통약자를 위한 저상버스나 특별교통수단인 장애인콜택시...','happybean','#6fb924','#6fb924','#6fb924','12','26','15,15','휠체어장애인의 이동지원에 동참해 주세요.','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/6a79273a-6c30-4615-b927-3a6c30d6150c/original_202205301348',NULL),(638,'202205301901','#e3bae3','#ffffff','2022-05-30 19:32:00','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205301901','“어버이날 카네이션 달고 다니는 노인들이 제일 부러워 ” “어버이날 이웃집에서 자녀들이랑 손주들이 카네이션 달아주는 모습을 보면 너무 부러워..”  신 OO 어르신은 이렇게 이야기하시며 눈물지으십니다. 남편과 아들이...','kakao','#ffffff','#ffffff','#ffffff','5','18','12,12','더 이상 혼자가 아닌 어버이날, 함께 만들어요!','700','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205301901','https://together.kakao.com/fundraisings/92381'),(639,'202205301927','#e3bae3','#ffffff','2022-05-30 19:32:27','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205301927','“어버이날 카네이션 달고 다니는 노인들이 제일 부러워 ” “어버이날 이웃집에서 자녀들이랑 손주들이 카네이션 달아주는 모습을 보면 너무 부러워..”  신 OO 어르신은 이렇게 이야기하시며 눈물지으십니다. 남편과 아들이...','kakao','#ffffff','#ffffff','#ffffff','5','18','12,12','더 이상 혼자가 아닌 어버이날, 함께 만들어요!','700','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205301927','https://together.kakao.com/fundraisings/92381'),(640,'202205301942','#cee1ba','#ffffff','2022-05-30 19:43:42','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205301942','팅커벨 입양센터에는 선택에서 외면당한 믹스견 아이들이 훨씬 더 많습니다. 서울시 강서구 곰달래로 255에 위치한 팅커벨 유기동물 입양센터는 2014년 4월 21일에 설립하여 만 8년이 지난 지금까지 단 하루도 거르지...','happybean','#646464','#494848','#2a2828','5','22','15,15','입양센터의 유기견들을 지켜주는 사람들','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205301942','https://happybean.naver.com/donations/H000000182961'),(641,'202205302043','#cee1ba','#ffffff','2022-05-30 20:07:43','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302043','팅커벨 입양센터에는 선택에서 외면당한 믹스견 아이들이 훨씬 더 많습니다. 서울시 강서구 곰달래로 255에 위치한 팅커벨 유기동물 입양센터는 2014년 4월 21일에 설립하여 만 8년이 지난 지금까지 단 하루도 거르지...','happybean','#646464','#494848','#2a2828','5','22','15,15,15,15','입양센터의 유기견들을 지켜주는 사람들','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302043','https://happybean.naver.com/donations/H000000182961'),(642,'202205302034','#adad7d','#bf8b1f','2022-05-30 20:16:33','300','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302034','회사 나가지마~~회사 나가지마~~회사 나가지마~~','kakao','#ffffff','#ffffff','#ffffff','5','50','15,15','회사 나가지마~~','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302034','https://together.kakao.com/fundraisings/92381'),(643,'202205302010','#cee1ba','#94c7ff','2022-05-30 20:30:10','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302010','중증후유장애1급 아버지 대신 가장이 된 채연이채연(가명)이는 교통사고 피해가정 자녀이자, 현재 간호학을 공부하고 있는 대학교 2학년입니다. 채연이가 6살이었을 때, 채연이의 아버지께서는 교통사고로 중증후유장애 1급인...','happybean','#646464','#494848','#2a2828','5','22','15,15','새학기가 올 때마다 눈물 흘리는 피해가정 아이들','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302010','https://happybean.naver.com/donations/H000000182847'),(644,'202205302017','#cee1ba','#94c7ff','2022-05-30 20:31:16','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302017','외로움의 무게를 당신은 어쩔 수 없이 받아들이고 있을 뿐입니다 다가오는 5월, 어버이날은 어르신들에게 있어서 마냥 기쁘지만은 않습니다. 당신을 위한 날이지만 오히려 당신을 챙겨줄 사람이 없어 어르신들은 쓸쓸함과 외로...','kakao','#646464','#494848','#2a2828','5','22','14,14','어버이 효(孝) 드림, \'오늘은 당신이 주인공\'','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302017','https://together.kakao.com/fundraisings/94119'),(645,'202205302014','#cee1ba','#94c7ff','2022-05-30 20:49:14','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302014','쌍둥이 기저귀 값이 막막한 외국인 엄마 태어난 지 3개월이 된 쌍둥이를 양육하고 있는 필리핀 이주여성 레이첼(가명)씨의 집은 습기로 가득 차 있습니다. 아이 둘의 일회용 기저귀를 감당할 수 없어 천기저귀와 같이 사용...','happybean','#646464','#494848','#2a2828','5','22','12,12','생김새가 다른 우리나라 아이들에게 기저귀가 필요해요','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302014','https://happybean.naver.com/donations/H000000183521'),(647,'202205302115','#cee1ba','#94c7ff','2022-05-30 21:10:15','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302115','식용으로 팔려가다 구조된 수달이수달이는 식용으로 팔려가던 중 극적으로 구조되었습니다. 시골개 누렁이로 겨우겨우 살아가던 중 보호자는 수달이를 식용으로 팔아버렸었고, 수달이는 곧 무서운 곳으로 끌려가게 되었습니다.하지...','happybean','#646464','#494848','#2a2828','5','22','14','식용으로 팔려가던 수달이의 가족을 찾아주세요','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302115','https://happybean.naver.com/donations/H000000183694'),(665,'202205302246','#cee1ba','#94c7ff','2022-05-30 22:23:46','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302246','식용으로 팔려가다 구조된 수달이수달이는 식용으로 팔려가던 중 극적으로 구조되었습니다. 시골개 누렁이로 겨우겨우 살아가던 중 보호자는 수달이를 식용으로 팔아버렸었고, 수달이는 곧 무서운 곳으로 끌려가게 되었습니다.하지...','happybean','#646464','#494848','#2a2828','5','22','14','해킹중...','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302246','https://happybean.naver.com/donations/H000000183694'),(666,'202205302222','#cee1ba','#94c7ff','2022-05-30 22:32:22','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302222','코로나 거리두기는 풀렸지만..코로나19로 인한 거리두기 제약이 전면해제 되면서 많은 아이들이 가족들과 함께 여행을 떠날 준비를 하며 들떠 있는 반면 여전히 홀로 집을 지키고 있는 아이들이 있습니다. 경제적인 어려움과...','happybean','#646464','#494848','#2a2828','5','22','14','여행을 꿈꾸지 못하는 아이들에게 꿈을 선물해주세요','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302222','https://happybean.naver.com/donations/H000000184310'),(667,'202205302257','#cee1ba','#94c7ff','2022-05-30 22:32:57','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302257','중증후유장애1급 아버지 대신 가장이 된 채연이채연(가명)이는 교통사고 피해가정 자녀이자, 현재 간호학을 공부하고 있는 대학교 2학년입니다. 채연이가 6살이었을 때, 채연이의 아버지께서는 교통사고로 중증후유장애 1급인...','happybean','#646464','#494848','#2a2828','5','22','14','새학기가 올 때마다 눈물 흘리는 피해가정 아이들','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302257','https://happybean.naver.com/donations/H000000182847'),(668,'202205302234','#cee1ba','#94c7ff','2022-05-30 22:45:34','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205302234','식용으로 팔려가다 구조된 수달이수달이는 식용으로 팔려가던 중 극적으로 구조되었습니다. 시골개 누렁이로 겨우겨우 살아가던 중 보호자는 수달이를 식용으로 팔아버렸었고, 수달이는 곧 무서운 곳으로 끌려가게 되었습니다.하지...','happybean','#646464','#494848','#2a2828','5','22','14','식용으로 팔려가던 수달이의 가족을 찾아주세요요용?','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205302234','https://happybean.naver.com/donations/H000000183694'),(669,'202205310132','#cee1ba','#94c7ff','2022-05-31 01:46:31','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205310132','중증후유장애1급 아버지 대신 가장이 된 채연이채연(가명)이는 교통사고 피해가정 자녀이자, 현재 간호학을 공부하고 있는 대학교 2학년입니다. 채연이가 6살이었을 때, 채연이의 아버지께서는 교통사고로 중증후유장애 1급인...','happybean','#646464','#494848','#2a2828','5','22','14','새학기가 올 때마다 눈물 흘리는 피해가정 아이들','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205310132','https://happybean.naver.com/donations/H000000182847'),(670,'202205310153','#cee1ba','#94c7ff','2022-05-31 01:46:52','200','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/202205310153','중증후유장애1급 아버지 대신 가장이 된 채연이채연(가명)이는 교통사고 피해가정 자녀이자, 현재 간호학을 공부하고 있는 대학교 2학년입니다. 채연이가 6살이었을 때, 채연이의 아버지께서는 교통사고로 중증후유장애 1급인...','happybean','#646464','#494848','#2a2828','5','22','14','새학기가 올 때마다 눈물 흘리는 피해가정 아이들??!!','1000','fa5c8d30-78e7-49c3-9c8d-3078e739c318','https://storage.googleapis.com/mamomo-banner-storage/fa5c8d30-78e7-49c3-9c8d-3078e739c318/original_202205310153','https://happybean.naver.com/donations/H000000182847'),(673,'202205312059','#b8e7cb','#ffffff','2022-05-31 20:16:59','200','https://storage.googleapis.com/mamomo-banner-storage/3a45a5c2-c885-4f19-85a5-c2c8859f19a4/202205312059','본능을 따라 삶을 찾아 떠나는 두꺼비들의 여정로드킬의 위협을 이기고 산으로 돌아가 무사히 겨울잠에서 깬 두꺼비들이 다시금 산란을 위해 저수지를 찾습니다. 전년과 다르게 인위적으로 설치된 경작 시설 등의 시설물들에 길...','happybean','#12675b','#000000','#000000','14','24','16','아기 두꺼비들의 목숨을 건 여정','1000','3a45a5c2-c885-4f19-85a5-c2c8859f19a4','https://storage.googleapis.com/mamomo-banner-storage/3a45a5c2-c885-4f19-85a5-c2c8859f19a4/original_202205312059','https://happybean.naver.com/donations/H000000183770');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fav_topic`
--

DROP TABLE IF EXISTS `fav_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fav_topic` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK36d3q5a4l9qi1q2v123rj4tne` (`topic_id`),
  KEY `FKrh0dtsjncy8g2tdmq8r4864nr` (`user_id`),
  CONSTRAINT `FK36d3q5a4l9qi1q2v123rj4tne` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`),
  CONSTRAINT `FKrh0dtsjncy8g2tdmq8r4864nr` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fav_topic`
--

LOCK TABLES `fav_topic` WRITE;
/*!40000 ALTER TABLE `fav_topic` DISABLE KEYS */;
INSERT INTO `fav_topic` VALUES (3,2,'fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(10,2,'826b284c-c7c2-49cf-ab28-4cc7c259cf01'),(11,5,'826b284c-c7c2-49cf-ab28-4cc7c259cf01'),(32,1,'9645911f-253b-46b2-8591-1f253bb6b245'),(33,2,'9645911f-253b-46b2-8591-1f253bb6b245'),(62,1,'46b6bf8f-4a3a-4061-b6bf-8f4a3ac0617f'),(63,2,'46b6bf8f-4a3a-4061-b6bf-8f4a3ac0617f'),(112,1,'6a79273a-6c30-4615-b927-3a6c30d6150c'),(199,1,'550e8400-e29b-41d4-a716-446655440000'),(200,2,'550e8400-e29b-41d4-a716-446655440000'),(201,3,'550e8400-e29b-41d4-a716-446655440000'),(422,2,'bd0c891b-4c1b-4191-8c89-1b4c1be1918c'),(423,2,'bd0c891b-4c1b-4191-8c89-1b4c1be1918c'),(580,1,'3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(581,2,'3a45a5c2-c885-4f19-85a5-c2c8859f19a4');
/*!40000 ALTER TABLE `fav_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heart`
--

DROP TABLE IF EXISTS `heart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heart` (
  `id` bigint(20) NOT NULL,
  `campaign_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5pv32bwn1jhofpwouomqupc6u` (`user_id`),
  CONSTRAINT `FK5pv32bwn1jhofpwouomqupc6u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heart`
--

LOCK TABLES `heart` WRITE;
/*!40000 ALTER TABLE `heart` DISABLE KEYS */;
INSERT INTO `heart` VALUES (12,'94991','826b284c-c7c2-49cf-ab28-4cc7c259cf01'),(13,'H000000184414','826b284c-c7c2-49cf-ab28-4cc7c259cf01'),(14,'H000000184173','826b284c-c7c2-49cf-ab28-4cc7c259cf01'),(17,'1395','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(222,'H000000184310','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(223,'H000000184310','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(400,'H000000183441','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(401,'H000000183441','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(402,'H000000182718','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(403,'H000000182718','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(404,'H000000182718','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(405,'H000000184310','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(406,'H000000184310','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(468,'H000000183633','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(470,'94783','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(471,'H000000182718','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(472,'H000000183441','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(473,'H000000182845','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(474,'H000000182716','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(475,'93653','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(476,'94829','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(477,'93584','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(478,'H000000182711','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(479,'H000000182712','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(480,'H000000182703','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(481,'H000000183613','3a45a5c2-c885-4f19-85a5-c2c8859f19a4'),(577,'93653','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(671,'H000000182845','fa5c8d30-78e7-49c3-9c8d-3078e739c318'),(672,'H000000182716','fa5c8d30-78e7-49c3-9c8d-3078e739c318');
/*!40000 ALTER TABLE `heart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (674);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL,
  `topic_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'아동|청소년'),(2,'어르신'),(3,'장애인'),(4,'어려운이웃'),(5,'다문화'),(6,'지구촌'),(7,'가족|여성'),(8,'우리사회'),(9,'동물'),(10,'환경');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `birth` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) DEFAULT NULL,
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profileImgUrl` varchar(255) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('3a45a5c2-c885-4f19-85a5-c2c8859f19a4','2000-03-31','2022-05-10 06:28:48','hyejin@naver.com','2022-05-29 13:23:50','hyejin','{bcrypt}$2a$10$t3XiH47H8bUhPCCiL9Cy2ebqVu.vsUAtZsz3K5o30SOxJkKsktdsW','https://storage.googleapis.com/mamomo-profile-storage/hyejin@naver.com/hyejin@naver.com','F'),('46b6bf8f-4a3a-4061-b6bf-8f4a3ac0617f','2000-01-01','2022-05-09 16:39:48','yuseon11@email.com','2022-05-09 16:39:48','hihihi11','{bcrypt}$2a$10$iX23VEAtY7ga3fcrBEGiB.VFXBp1qikwfPIKluC3moUkqAfGHimD.','https://storage.googleapis.com/mamomo-profile-storage/default.png','M'),('550e8400-e29b-41d4-a716-446655440000','1999-01-01','2022-05-09 12:28:40','test@email.com','2022-05-12 03:15:44','hey','{bcrypt}$2a$10$GXbyN.DHQXq1gWKKsVu7DeQ6Gc4kE8QeFb..RpOHHYw00sRQRkNha','https://storage.googleapis.com/mamomo-profile-storage/test@email.com/test@email.com','F'),('6a79273a-6c30-4615-b927-3a6c30d6150c','2000-01-01','2022-05-10 02:22:15','bannerTest@email.com','2022-05-10 02:22:15','banner','{bcrypt}$2a$10$AG627toDUyz1DGng0Dlb6em5wYkL6fOEtuqVBvEWtAi8a.mgcn.62','https://storage.googleapis.com/mamomo-profile-storage/default.png','M'),('826b284c-c7c2-49cf-ab28-4cc7c259cf01','2009-02-02','2022-05-09 14:01:39','hi@email.com','2022-05-09 14:01:39','hi','{bcrypt}$2a$10$ROWIt.LzuY4PCcSjUSuI7.MfzVF8.Nage5731haCafiKMU/TZ16p2',NULL,'F'),('9645911f-253b-46b2-8591-1f253bb6b245','2000-01-01','2022-05-09 15:34:10','yuseon@email.com','2022-05-09 15:34:10','hihihi','{bcrypt}$2a$10$lpl3AivSVljwWSNX6o9ty..4yUWWyelyj0tsyFzn2qNOOV8WfxltK','https://storage.googleapis.com/mamomo-profile-storage/default.png','M'),('bd0c891b-4c1b-4191-8c89-1b4c1be1918c','2013-06-10','2022-05-19 04:48:58','as1234@gmail.com','2022-05-19 06:12:30','확인','{bcrypt}$2a$10$coOMHkrqWcXFrXBbTq1oR.qVup9HRnfImZuyXDJ6JZvjfD1qgv6Za','https://storage.googleapis.com/mamomo-profile-storage/as1234@gmail.com/as1234@gmail.com','M'),('fa5c8d30-78e7-49c3-9c8d-3078e739c318','2000-04-21','2022-05-09 13:44:33','as123@gmail.com','2022-05-09 13:44:33','우왁굳','{bcrypt}$2a$10$BW9JCUNog.EEBeAgQ71WxOvXuabOjx/s7Qt/nT5SRlJt0fhCWqR32',NULL,'M');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authority`
--

DROP TABLE IF EXISTS `user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authority` (
  `user_id` varchar(255) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `FK6ktglpl5mjosa283rvken2py5` (`authority_name`),
  CONSTRAINT `FK6ktglpl5mjosa283rvken2py5` FOREIGN KEY (`authority_name`) REFERENCES `authority` (`authority_name`),
  CONSTRAINT `FKpqlsjpkybgos9w2svcri7j8xy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authority`
--

LOCK TABLES `user_authority` WRITE;
/*!40000 ALTER TABLE `user_authority` DISABLE KEYS */;
INSERT INTO `user_authority` VALUES ('3a45a5c2-c885-4f19-85a5-c2c8859f19a4','ROLE_USER'),('46b6bf8f-4a3a-4061-b6bf-8f4a3ac0617f','ROLE_USER'),('550e8400-e29b-41d4-a716-446655440000','ROLE_USER'),('6a79273a-6c30-4615-b927-3a6c30d6150c','ROLE_USER'),('826b284c-c7c2-49cf-ab28-4cc7c259cf01','ROLE_USER'),('9645911f-253b-46b2-8591-1f253bb6b245','ROLE_USER'),('bd0c891b-4c1b-4191-8c89-1b4c1be1918c','ROLE_USER'),('fa5c8d30-78e7-49c3-9c8d-3078e739c318','ROLE_USER');
/*!40000 ALTER TABLE `user_authority` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31 22:43:48
