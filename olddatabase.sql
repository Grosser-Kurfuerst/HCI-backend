-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: hci
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `bms_billboard`
--

DROP TABLE IF EXISTS `bms_billboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_billboard` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告',
  `create_time` datetime DEFAULT NULL COMMENT '公告时间',
  `show` tinyint(1) DEFAULT NULL COMMENT '1：展示中，0：过期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='全站公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_billboard`
--

LOCK TABLES `bms_billboard` WRITE;
/*!40000 ALTER TABLE `bms_billboard` DISABLE KEYS */;
INSERT INTO `bms_billboard` VALUES (2,'R1.0 开始已实现护眼模式 ,妈妈再也不用担心我的眼睛了。','2020-11-19 17:16:19',0),(4,'系统已更新至最新版1.0.1',NULL,1);
/*!40000 ALTER TABLE `bms_billboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_collect`
--

DROP TABLE IF EXISTS `bms_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_collect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `topic_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_collect`
--

LOCK TABLES `bms_collect` WRITE;
/*!40000 ALTER TABLE `bms_collect` DISABLE KEYS */;
INSERT INTO `bms_collect` VALUES (7,'1737095302086729729','1349362401438392322'),(28,'1737095302086729729','1349631541260595202'),(45,'1737095302086729729','1739638061448355842'),(46,'1737095302086729729','1739635849728937986'),(47,'1737095302086729729','1333668258587750401');
/*!40000 ALTER TABLE `bms_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_comment`
--

DROP TABLE IF EXISTS `bms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_comment` (
  `id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键',
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `user_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '作者ID',
  `topic_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'topic_id',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_comment`
--

LOCK TABLES `bms_comment` WRITE;
/*!40000 ALTER TABLE `bms_comment` DISABLE KEYS */;
INSERT INTO `bms_comment` VALUES ('1738857437615644674','1111','1737095302086729729','1738857133239197698','2023-12-24 17:41:34',NULL),('1738857497917153281','xxn','1737095302086729729','1334481725322297346','2023-12-24 17:41:49',NULL),('1738857792197910529','111','1737095302086729729','1738857133239197698','2023-12-24 17:42:59',NULL),('1738860855881125890','1','1737095302086729729','1738860845235982337','2023-12-24 17:55:09',NULL),('1738860864080990210','123213','1737095302086729729','1738860845235982337','2023-12-24 17:55:11',NULL),('1738861353816330242','123','1737095302086729729','1738861330835738626','2023-12-24 17:57:08',NULL),('1738861360531410946','123123','1737095302086729729','1738861330835738626','2023-12-24 17:57:10',NULL),('1738861370362859521','213','1737095302086729729','1738861330835738626','2023-12-24 17:57:12',NULL),('1738863323809656833','2','1737095302086729729','1738863309821652994','2023-12-24 18:04:58',NULL),('1738863329153200130','22','1737095302086729729','1738863309821652994','2023-12-24 18:04:59',NULL),('1738863334085701634','222','1737095302086729729','1738863309821652994','2023-12-24 18:05:00',NULL),('1738869868412846082','1','1737095302086729729','1738869856278724609','2023-12-24 18:30:58',NULL),('1738869874351980546','123','1737095302086729729','1738869856278724609','2023-12-24 18:30:59',NULL),('1739282817363292161','测试','1737095302086729729','1739281833924833282','2023-12-25 21:51:53',NULL),('1739282839916064769','测试','1737095302086729729','1739281833924833282','2023-12-25 21:51:58',NULL),('1739554221413421057','231321','1739553857263947778','1739278236554178562','2023-12-26 15:50:20',NULL),('1739557787918192642','123','1737095302086729729','1739554283002580994','2023-12-26 16:04:31',NULL),('1739557875214241793','1123123','1737095302086729729','1739554283002580994','2023-12-26 16:04:52',NULL),('1741010111958130690','111','1737095302086729729','1739638114908954626','2023-12-30 16:15:32',NULL),('1741015911942365185','1','1737095302086729729','1739638114908954626','2023-12-30 16:38:35',NULL),('1741020227801489409','1231','1741019884229271554','1739638114908954626','2023-12-30 16:55:44',NULL),('1741020443904614402','11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111','1741019884229271554','1739638114908954626','2023-12-30 16:56:35',NULL),('1741046139997667330','123123','1737095302086729729','1739638061448355842','2023-12-30 18:38:42',NULL),('1741046240740655105','132131','1741019884229271554','1739638061448355842','2023-12-30 18:39:06',NULL),('1741067623117926402','123123123','1737095302086729729','1739637712847233025','2023-12-30 20:04:03',NULL);
/*!40000 ALTER TABLE `bms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_follow`
--

DROP TABLE IF EXISTS `bms_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_follow` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '被关注人ID',
  `follower_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关注人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_follow`
--

LOCK TABLES `bms_follow` WRITE;
/*!40000 ALTER TABLE `bms_follow` DISABLE KEYS */;
INSERT INTO `bms_follow` VALUES (65,'1329723594994229250','1317498859501797378'),(85,'1332912847614083073','1332636310897664002'),(129,'1349290158897311745','1349618748226658305'),(158,'1739553857263947778','1737095302086729729');
/*!40000 ALTER TABLE `bms_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_post`
--

DROP TABLE IF EXISTS `bms_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_post` (
  `id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'markdown内容',
  `user_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '作者ID',
  `comments` int NOT NULL DEFAULT '0' COMMENT '评论统计',
  `collects` int NOT NULL DEFAULT '0' COMMENT '收藏统计',
  `view` int NOT NULL DEFAULT '0' COMMENT '浏览统计',
  `top` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否置顶，1-是，0-否',
  `essence` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否加精，1-是，0-否',
  `section_id` int DEFAULT '0' COMMENT '专栏ID',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  UNIQUE KEY `title` (`title`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='话题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_post`
--

LOCK TABLES `bms_post` WRITE;
/*!40000 ALTER TABLE `bms_post` DISABLE KEYS */;
INSERT INTO `bms_post` VALUES ('1333447953558765569','1','12\n2\n\n','1349290158897311745',0,0,96,_binary '\0',_binary '\0',0,'2020-12-01 00:29:01','2020-12-03 23:56:51'),('1739554283002580994','12','123123\n','1739553857263947778',0,0,14,_binary '\0',_binary '\0',0,'2023-12-26 15:50:35',NULL),('1739571189969375234','123','123\n\n','1737095302086729729',0,0,6,_binary '\0',_binary '\0',0,'2023-12-26 16:57:46',NULL),('1739635849728937986','1231','13211111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111\n1321111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111113211111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111132111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111321111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111113211111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111\n\n','1737095302086729729',0,0,11,_binary '\0',_binary '\0',0,'2023-12-26 21:14:42','2023-12-29 15:34:20'),('1739638061448355842','12311','123123\n\n','1737095302086729729',0,0,73,_binary '\0',_binary '\0',0,'2023-12-26 21:23:29',NULL),('1739637712847233025','123141','1232132\n\n','1737095302086729729',0,0,6,_binary '\0',_binary '\0',0,'2023-12-26 21:22:06',NULL),('1349362401438392322','2021 健康，快乐','2021的`FLAG`\n\n1. 技能进步\n2. 没有烦恼\n3. 发财 :smile:\n\n','1349290158897311745',0,0,120,_binary '\0',_binary '\0',0,'2021-01-13 22:27:21','2021-01-14 17:30:13'),('1334481725322297346','hello，spring-security',':hibiscus: spring-security\n\n','1349290158897311745',0,0,143,_binary '\0',_binary '\0',0,'2020-12-03 20:56:51',NULL),('1332650453142827009','哈哈哈，helloworld','这是第一篇哦\n\n> hi :handshake: 你好\n\n`hello world`\n\n:+1: 很好\n','1349290158897311745',0,0,49,_binary '\0',_binary '\0',1,'2020-11-28 19:40:02','2020-11-28 19:46:39'),('1333432347031646209','哈哈哈，换了个dark主题','主题更换为Dark\n\n','1349290158897311745',0,0,25,_binary '\0',_binary '\0',0,'2020-11-30 23:27:00',NULL),('1333668258587750401','嘿嘿，测试一下啊','大家好\n`Hello everyone!`\n\n\n\n','1349290158897311745',0,0,32,_binary '\0',_binary '\0',0,'2020-12-01 15:04:26','2020-12-01 16:49:14'),('1332682473151635458','我要发财','2021 冲冲冲！！！\n\n','1349290158897311745',0,0,112,_binary '\0',_binary '\0',2,'2020-11-28 21:47:16','2020-11-30 19:40:22'),('1333695976536748034','最新版本介绍，同步更新！','<p align=center>一款基于SpringBoot构建的智慧社区系统</p>\n\n<p align=center>\n<a href=\"https://github.com/1020317774/rhapsody-admin/stargazers\"><img alt=\"GitHub release\" src=\"https://img.shields.io/github/release/1020317774/rhapsody-admin?style=flat-square\"></a>\n<a href=\"https://github.com/1020317774/rhapsody-admin/blob/main/LICENSE\"><img alt=\"GitHub license\" src=\"https://img.shields.io/github/license/1020317774/rhapsody-admin\"></a>\n</p>\n\n### Hi there :wave:\n\n<!--\n**1020317774/1020317774** is a :sparkles: _special_ :sparkles: repository because its `README.md` (this file) appears on your GitHub profile.\n\nHere are some ideas to get you started:\n\n- :telescope: I’m currently working on ...\n- :seedling: I’m currently learning ...\n- :dancers: I’m looking to collaborate on ...\n- :thinking: I’m looking for help with ...\n- :speech_balloon: Ask me about ...\n- :mailbox: How to reach me: ...\n- :smile: Pronouns: ...\n- :zap: Fun fact: ...\n-->\n\n[![1020317774\'s github stats](https://github-readme-stats.vercel.app/api?username=1020317774&show_icons=true&count_private=true)](https://github.com/1020317774)\n\n[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=1020317774&layout=compact)](https://github.com/1020317774)\n---------\n\n> 作者：王一晨\n> github：[https://github.com/1020317774](https://github.com/1020317774)\n\n## 技术栈\n\n- [x] SpringBoot 2.X\n- [x] Mysql 8.X\n- [x] Mybatis\n- [x] MybatisPlus\n- [x] Redis\n- [x] Jwt\n- [x] FastJson\n- [x] Hutool\n- [x] Lombok\n- [ ] ElasticSearch\n\n……\n\n## 安装指导\n\n- 克隆\n\n```java\ngit clone https://github.com/1020317774/rhapsody-admin.git\n```\n\n- 修改`application.properties`选择环境\n- 修改多环境配置中的redis参数和数据库\n- 启动`BootApplication`\n- 访问[`http://127.0.0.1:10000`](http://127.0.0.1:10000)\n\n','1349290158897311745',0,0,65,_binary '',_binary '',0,'2020-12-01 16:54:34','2020-12-01 17:05:00'),('1349631541260595202','权限部分 OK','1. 创建 ok\n2. 修改 ok\n3. 删除 ok\n\n','1349290158897311745',0,0,135,_binary '\0',_binary '\0',0,'2021-01-14 16:16:49','2021-01-14 16:18:53'),('1333676096156528641','测试','测试\n\n','1349290158897311745',0,0,138,_binary '\0',_binary '\0',0,'2020-12-01 15:35:34',NULL),('1332681213400817665','聚合查询并统计','* [x] SQL：\n\n```sql\nSELECT s.*,\nCOUNT(t.id) AS topics\nFROM section s\nLEFT JOIN topic t\nON s.id = t.section_id\nGROUP BY s.title\n```\n\n','1349290158897311745',0,0,74,_binary '\0',_binary '\0',1,'2020-11-28 21:42:16','2020-11-29 15:00:42'),('1335149981733449729','视频嵌入',':+1:\n\n[https://www.bilibili.com/video/BV1w64y1f7w3](https://www.bilibili.com/video/BV1w64y1f7w3)\n\n[1](https://www.bilibili.com/video/BV1tp4y1x72w)\n\n```\n.vditor-reset pre > code\n```\n\n```\npublic class HelloWorld {\n\npublic static void main(String[] args) {\n    System.out.println(\"Hello World!\");\n}\n}\n```\n\n','1349290158897311745',0,0,136,_binary '\0',_binary '\0',0,'2020-12-05 17:12:16','2021-01-14 13:06:16');
/*!40000 ALTER TABLE `bms_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_post_tag`
--

DROP TABLE IF EXISTS `bms_post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_post_tag` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标签ID',
  `topic_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '话题ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tag_id` (`tag_id`) USING BTREE,
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='话题-标签 中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_post_tag`
--

LOCK TABLES `bms_post_tag` WRITE;
/*!40000 ALTER TABLE `bms_post_tag` DISABLE KEYS */;
INSERT INTO `bms_post_tag` VALUES (36,'1332650453377708034','1332650453142827009'),(37,'1332681213568589825','1332681213400817665'),(38,'1332681213631504385','1332681213400817665'),(39,'1332682473218744321','1332682473151635458'),(40,'1332913064463794178','1332913064396685314'),(41,'1332913064530903041','1332913064396685314'),(42,'1333432347107143681','1333432347031646209'),(43,'1333432347107143682','1333432347031646209'),(44,'1333447953697177602','1333447953558765569'),(45,'1332913064463794178','1333668258587750401'),(46,'1333676096320106498','1333676096156528641'),(47,'1333695976742268930','1333695976536748034'),(48,'1334481725519429634','1334481725322297346'),(49,'1333447953697177602','1335149981733449729'),(50,'1349362401597775874','1349362401438392322'),(51,'1349631541306732545','1349631541260595202'),(52,'1738761510250950658','1738761510162870273'),(53,'1738761510313865217','1738761510162870273'),(54,'1738761510250950658','1738815324962234369'),(55,'1738815325004177410','1738815324962234369'),(56,'1738815325004177411','1738815324962234369'),(57,'1738815605414371331','1738815605414371330'),(58,'1738761510250950658','1738857133239197698'),(59,'1738860845294702593','1738860845235982337'),(60,'1738861330865098753','1738861330835738626'),(61,'1738863309892956161','1738863309821652994'),(62,'1738861330865098753','1738869856278724609'),(63,'1738861330865098753','1738870215302758402'),(64,'1739125533320491010','1739125533257576450'),(65,'1738861330865098753','1739131617020030978'),(66,'1738761510313865217','1739169731012800513'),(67,'1739251902343884801','1739251902146752513'),(68,'1739251902343884802','1739251902146752513'),(69,'1739277724068950019','1739277724068950018'),(70,'1332681213568589825','1739277724068950018'),(71,'1332681213568589825','1739278236554178562'),(72,'1739278360655245315','1739278360655245314'),(73,'1332681213568589825','1739281833924833282'),(74,'1739125533320491010','1739482562329432065'),(75,'1739554283002580995','1739554283002580994'),(76,'1739556820631998466','1739556820631998465'),(77,'1739554283002580995','1739556915813339137'),(78,'1739559589606641666','1739559589539532801'),(79,'1739559589606641667','1739559589539532801'),(80,'1739559589606641668','1739559589539532801'),(81,'1739571190032289793','1739571189969375234'),(82,'1739580955923894274','1739580955856785409'),(83,'1739580955923894274','1739635849728937986'),(84,'1739580955923894274','1739637712847233025'),(85,'1739580955923894274','1739638061448355842'),(86,'1739580955923894274','1739638114908954626');
/*!40000 ALTER TABLE `bms_post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_promotion`
--

DROP TABLE IF EXISTS `bms_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_promotion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '广告标题',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '广告链接',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='广告推广表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_promotion`
--

LOCK TABLES `bms_promotion` WRITE;
/*!40000 ALTER TABLE `bms_promotion` DISABLE KEYS */;
INSERT INTO `bms_promotion` VALUES (1,'开发者头条','https://juejin.cn/','开发者头条'),(2,'并发编程网','https://juejin.cn/','并发编程网'),(3,'掘金','https://juejin.cn/','掘金');
/*!40000 ALTER TABLE `bms_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_tag`
--

DROP TABLE IF EXISTS `bms_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_tag` (
  `id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标签ID',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `topic_count` int NOT NULL DEFAULT '0' COMMENT '关联话题',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_tag`
--

LOCK TABLES `bms_tag` WRITE;
/*!40000 ALTER TABLE `bms_tag` DISABLE KEYS */;
INSERT INTO `bms_tag` VALUES ('1332650453377708034','java',1),('1332681213568589825','css',4),('1332681213631504385','mongodb',1),('1332682473218744321','python',1),('1332913064463794178','vue',2),('1332913064530903041','react',1),('1333432347107143681','node',1),('1333432347107143682','mysql',1),('1333447953697177602','flask',2),('1333676096320106498','spring',1),('1333695976742268930','django',1),('1334481725519429634','security',1),('1349362401597775874','tensorflow',1),('1349631541306732545','pytorch',1),('1738761510250950658','111',3),('1738761510313865217','2',2),('1738815325004177410','11111',1),('1738815325004177411','1111111111',1),('1738815605414371331','发财',1),('1738860845294702593','11',1),('1738861330865098753','1',4),('1738863309892956161','3',1),('1739125533320491010','123',2),('1739251902343884801','发布违法和大家看法很快拉萨酱豆',1),('1739251902343884802','很快受到激发活力卡就是东方航空',1),('1739277724068950019','html',1),('1739278360655245315','后台',1),('1739554283002580995','1231',2),('1739556820631998466','1321',1),('1739559589606641666','123123222222222',1),('1739559589606641667','222222222222222',1),('1739559589606641668','1dfajsdhasgfdsh',1),('1739571190032289793','12',1),('1739580955923894274','132',5);
/*!40000 ALTER TABLE `bms_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_tip`
--

DROP TABLE IF EXISTS `bms_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_tip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '作者',
  `type` tinyint NOT NULL COMMENT '1：使用，0：过期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24864 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='每日赠言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_tip`
--

LOCK TABLES `bms_tip` WRITE;
/*!40000 ALTER TABLE `bms_tip` DISABLE KEYS */;
INSERT INTO `bms_tip` VALUES (1,'多锉出快锯，多做长知识。','佚名',1),(2,'未来总留着什么给对它抱有信心的人。','佚名',1),(3,'一个人的智慧不够用，两个人的智慧用不完。','谚语',1),(4,'十个指头按不住十个跳蚤','傣族',1),(5,'言不信者，行不果。','墨子',1),(6,'攀援而登，箕踞而遨，则几数州之土壤，皆在衽席之下。','柳宗元',1),(7,'美德大都包含在良好的习惯之内。','帕利克',1),(8,'人有不及，可以情恕。','《晋书》',1),(9,'明·吴惟顺','法不传六耳',1),(10,'真正的朋友应该说真话，不管那话多么尖锐。','奥斯特洛夫斯基',1),(11,'时间是一切财富中最宝贵的财富。','德奥弗拉斯多',1),(12,'看人下菜碟','民谚',1),(13,'如果不是怕别人反感，女人决不会保持完整的严肃。','拉罗什福科',1),(14,'爱是春暖花开时对你满满的笑意','佚名',1),(15,'希望是坚韧的拐杖，忍耐是旅行袋，携带它们，人可以登上永恒之旅。','罗素',1),(18,'天国般的幸福，存在于对真爱的希望。','佚名',1),(19,'我们现在必须完全保持党的纪律，否则一切都会陷入污泥中。','马克思',1),(20,'在科学上没有平坦的大道，只有不畏劳苦沿着陡峭山路攀登的人，才有希望达到光辉的顶点。','马克思',1),(21,'懒惰的马嫌路远','蒙古',1),(22,'别忘记热水是由冷水烧成的','非洲',1);
/*!40000 ALTER TABLE `bms_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_user`
--

DROP TABLE IF EXISTS `ums_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_user` (
  `id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `alias` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '密码',
  `avatar` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机',
  `score` int NOT NULL DEFAULT '0' COMMENT '积分',
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT 'token',
  `bio` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '个人简介',
  `active` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否激活，1：是，0：否',
  `status` bit(1) DEFAULT b'1' COMMENT '状态，1：使用，0：停用',
  `role_id` int DEFAULT NULL COMMENT '用户角色',
  `create_time` datetime NOT NULL COMMENT '加入时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_name` (`username`) USING BTREE,
  KEY `user_email` (`email`) USING BTREE,
  KEY `user_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_user`
--

LOCK TABLES `ums_user` WRITE;
/*!40000 ALTER TABLE `ums_user` DISABLE KEYS */;
INSERT INTO `ums_user` VALUES ('1349290158897311745','admin','admin','$2a$10$8qx711TBg/2hxfL7N.sxf.0ROMhR/iuPhQx33IFqGd7PLgt5nGJTO','https://s3.ax1x.com/2020/12/01/DfHNo4.jpg','23456@qq.com',NULL,2,'','自由职业者',_binary '',_binary '',NULL,'2021-01-13 17:40:17',NULL),('1349618748226658305','zhangsan','zhangsan','$2a$10$7K3yYv8sMV5Xsc2facXTcuyDo8JQ4FJHvjZ7qtWYcJdei3Q6Fvqdm','https://s3.ax1x.com/2020/12/01/DfHNo4.jpg','23456@qq.com',NULL,0,'','自由职业者',_binary '',_binary '',NULL,'2021-01-14 15:25:59',NULL),('1737095302086729729','123456','1231','e10adc3949ba59abbe56e057f20f883e','https://picst.sunbangyan.cn/2023/12/26/96323189b21baf1e67ecfe6517f03f30.jpeg','',NULL,27,'','23123',_binary '',_binary '',NULL,'2023-12-19 20:59:28',NULL),('1738763567439572994','1234567','1234567','fcea920f7412b5da7be0cf42b8c93759','https://picst.sunbangyan.cn/2023/12/26/96323189b21baf1e67ecfe6517f03f30.jpeg','20417339001@qq.com',NULL,0,'','自由职业者',_binary '',_binary '',NULL,'2023-12-24 11:28:34',NULL),('1738763626881249281','12345678','12345678','25d55ad283aa400af464c76d713c07ad','https://picst.sunbangyan.cn/2023/12/26/96323189b21baf1e67ecfe6517f03f30.jpeg','204173391@qq.com',NULL,0,'','自由职业者',_binary '',_binary '',NULL,'2023-12-24 11:28:48',NULL),('1738800699373846529','1234','1234','4297f44b13955235245b2497399d7a93','https://s3.ax1x.com/2020/12/01/DfHNo4.jpg','2041733@qq.com',NULL,0,'','自由职业者',_binary '',_binary '',NULL,'2023-12-24 13:56:07',NULL),('1738958425164996610','1234567890','1234567890','e10adc3949ba59abbe56e057f20f883e','https://s3.ax1x.com/2020/12/01/DfHNo4.jpg','2041711111@qq.com',NULL,0,'','自由职业者',_binary '',_binary '',NULL,'2023-12-25 00:22:51',NULL),('1739553857263947778','12341','12341','e10adc3949ba59abbe56e057f20f883e','https://picst.sunbangyan.cn/2023/12/26/96323189b21baf1e67ecfe6517f03f30.jpeg','20417332@qq.com',NULL,1,'','自由职业者',_binary '',_binary '',NULL,'2023-12-26 15:48:54',NULL),('1741019884229271554','12345','12345','e10adc3949ba59abbe56e057f20f883e','https://cdn.pixabay.com/photo/2021/11/12/03/04/woman-6787784_1280.png','2041733900@qq.co',NULL,0,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2023-12-30 16:54:22',NULL);
/*!40000 ALTER TABLE `ums_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hci'
--

--
-- Dumping routines for database 'hci'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-31  1:12:15
