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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_collect`
--

LOCK TABLES `bms_collect` WRITE;
/*!40000 ALTER TABLE `bms_collect` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_follow`
--

LOCK TABLES `bms_follow` WRITE;
/*!40000 ALTER TABLE `bms_follow` DISABLE KEYS */;
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
INSERT INTO `bms_post` VALUES ('1741692720275095554','2023年总结 寻找到源于内心深处的无穷力量','今天是跨年夜，将前段时间的思考记录于下。今年的关键词是 \"改变\" 与 \"求索\"，最值得分享的事情是寻找到源于内心深处的无穷力量。\n\n## 从一个有局限的观点出发 - \"人是万物的尺度\"\n\n> 人是万物的尺度 -- 普罗泰戈拉\n\n*这一观点曾受到苏格拉底、柏拉图和亚里士多德的批评，并且在很长时间内受到质疑。黑格尔从认识史发展的角度，肯定这个命题体现了思维的能动性。*\n\n*这个命题集中代表了普罗泰戈拉的**相对主义** 和**怀疑主义** 的**错误观点** ，有**主观唯心主义** 的因素，但是它触及到主观与客观的关系问题，表明了人类认识的进步。*\n\n谈及此命题，并非想和读者诸君讨论哲学，只是想表达以下观点：\n\n> **即便是身处21世纪，大部分人仍会因尚未客观认清事物，而陷入主观唯心主义。在大部分的事项与活动中人的主观性远大于客观**\n\n在事项与活动中，总会不自觉的以人为中心，无论是理解事项、传递信息、互相协作，评价...\n\n## 为何寻找这种力量\n\n人生无法保持风平浪静，工作和生活中会遇到各种问题，即便能力再强，也难免会囿于困境。\n\n前段时间读了不少他人的年终总结，同时回顾了自己近10年的历程，\n\n在学校，因交叉学科，有医学专业课和计算机方向专业课，在学习之余帮老师打杂并自己段炼编程\n在第一家公司，适应学校和职场的差别，从带领同学一同完成项目转变到主导完成安卓软件开发项目\n在第二家公司，运用Practical Problem Solving的理念整治充满异味的代码，尝试作为scrum master并探索技术领导力\n在第三家公司，完成更具挑战的技术调研和项目开发，并转变至医疗器材类项目管理\n\n一路走来，山高路远，道阻且长，凡心所向，行之将至，应叹人生多幸，未曾行差踏错，然此去蓬莱路远，万丈迷津难渡，须有一点星火，燃起万丈燎原。\n\n所幸者，这种力量点燃了意志，让我敢于直面困难，直至挣断枷锁打破樊笼\n\n我在 [突如其来的秋季反思](https://juejin.cn/post/7285373518837383223 \"https://juejin.cn/post/7285373518837383223\") 中曾提到，要让个人目标与工作目标相契合，在完成工作的同时实现自我提升。\n\n而实际上，当实现了工作目标后，再使用一定的时间进行关联性延伸，会更容易获得质变。\n\n这种力量帮助我打破了樊笼，并促使我进行关联性延伸方面摸鱼，提升了个人能力并反映为业务能力的提升，进一步获得更多摸鱼时间。\n\n## 这种力量是什么\n\n虽然我能感受到那一点星火，但仍难以具体描述它，仅在追寻的过程中，摸到蛛丝马迹。\n\n* 在陷于迷惘中时，它是 \"从书中学，向高人问，在事上练\"；\n* 在闭上双眼冥想坐于暗室时，它是 \"不自欺，要践行仁义礼智信，温良恭俭让\"；\n* 在止不不前时，它是 \"道虽弥，不行不至\"；\n* 在事情难以入手时 ，它是 \"天下难事，必成于易，天下大事，必作于细\"\n* ...\n\n大体可以描述为 \"心志\"，但这种描述是虚无缥缈的。\n\n提到心志，大多会想到《孟子》：\n\n> 天将降大任于斯人也，必先苦其心志，劳其筋骨，饿其体肤，空乏其身，行拂乱其所为，所以动心忍性，增益其所不能\n\n这句话要倒着理解：人生来是白纸，当熬炼过心志，打磨好筋骨，能够忍受身体饥饿、穷困潦倒、事不遂意，这样都无法击溃他时，他会心性成熟能力提升，才有可能接住大任。\n\n## 将这种力量作用于人的改变\n\n将这种力量作用于自身，终究会引起自身的改变。\n\n如前文所言，人习惯将自我作为万物的尺度，在事项与活动中，无论其他参与者自身是否发生改变，这种力量的辐射会逐步改变参与者对你的看法。\n\n这种改变如烈阳照于雪山，可卸下偏见的枷锁，推倒困住你的樊笼。\n\n## 结尾-明年的规划\n\n* 重塑阅读 - \"阅读\"事物、阅读人心、阅读书籍\n* 重塑表达 - 和不同的人，有不同的表达方式，系统性的反思\n* 将节约出的时间用于保持对技术的热情\n* 给家人更多的陪伴\n\n\n','1741690336719241218',0,0,1,_binary '\0',_binary '\0',0,'2024-01-01 13:27:58',NULL),('1741691288088051713','一文搞懂Go GC演进史，讲的太细致了！','最近在和 Go就业训练营的朋友讨论Go GC的问题，发现了刘丹冰老师总结的内容，写的太好了，和大家分享一下。\n\n我们的讨论和思考也整理到这篇文章中了，希望对你有启发。\n\n垃圾回收(Garbage Collection，简称GC)是编程语言中提供的自动的内存管理机制，自动释放不需要的内存对象，让出存储器资源。GC过程中无需程序员手动执行。GC机制在现代很多编程语言都支持，GC能力的性能与优劣也是不同语言之间对比度指标之一。\n\nGolang在GC的演进过程中也经历了很多次变革，Go V1.3之前的标记-清除(mark and sweep)算法。Go V1.3之前的标记-清扫(mark and sweep)的缺点。\n\n大家可以重点关注以下版本的变化：\n\n* Go V1.5的三色并发标记法\n* Go V1.5的三色标记为什么需要STW\n* Go V1.5的三色标记为什么需要屏障机制(“强-弱” 三色不变式、插入屏障、删除屏障 )\n* Go V1.8混合写屏障机制\n* Go V1.8混合写屏障机制的全场景分析\n\n### 一、Go V1.3之前的标记-清除(mark and sweep)算法\n\n接下来我们来看一下在Golang1.3之前的时候主要用的普通的标记-清除算法，此算法主要有两个主要的步骤：\n\n* 标记(Mark phase)\n* 清除(Sweep phase)\n\n#### 1 标记清除算法的具体步骤\n\n**第一步** ，暂停程序业务逻辑, 分类出可达和不可达的对象，然后做上标记。\n**第二步** , 开始标记，程序找出它所有可达的对象，并做上标记。\n操作非常简单，但是有一点需要额外注意：mark and sweep算法在执行的时候，需要程序暂停！即 `STW(stop the world)`，STW的过程中，CPU不执行用户代码，全部用于垃圾回收，这个过程的影响很大，所以STW也是一些回收机制最大的难题和希望优化的点。所以在执行第三步的这段时间，程序会暂定停止任何工作，卡在那等待回收执行完毕。\n**第三步** ,  标记完了之后，然后开始清除未标记的对象\n\n**第四步** , 停止暂停，让程序继续跑。然后循环重复这个过程，直到process程序生命周期结束。\n\n以上便是标记-清除（mark and sweep）回收的算法。\n\n\n','1741690336719241218',0,0,7,_binary '\0',_binary '\0',0,'2024-01-01 13:22:17','2024-01-01 13:23:24'),('1741691857485791234','多次崩了之后，阿里云终于改了','今年是阿里云的多事之秋，几个月内接连出现三次重大事故。\n\n先是10月23日，阿里旗下语雀接近8个小时的宕机，然后是11月12日，阿里云底层授权模块接近3个小时的服务不可用，最近一次是11月27日，接近2个小时的数据库管控故障。相关的程序员们估计也是心里苦的不行。\n​眼看2023年马上要结束了，应该不会再出什么篓子了吧。\n\n出了这么多的问题，已经不能用偶然来形容了，肯定是管理上存在问题。阿里云的大佬们自然也是明白的。看最近两天的消息，阿里云专门成立了一个部门：产品架构与稳定性部，负责解决系统稳定性问题。这个部门由阿里云 CTO 周靖人领导，核心工作就是提高阿里云产品的稳定性和可靠性。说实话这个操作还是比较及时的，就看实际效果如何了。\n\n然后这个调整其实只是本次大规模调整的一部分。本次调整后，阿里云将形成3个并行的事业部：公共云事业部、混合云事业部和国际事业部。\n\n这次调整的最大变化是整合形成了新的“公共云事业部”和“混合云事业部”，更强调和明确了公共云与混合云的区别和不同打法。\n\n公共云就是大家常说的公有云，这是阿里云的重点和根基，是自己的优势，未来的打法还是规模扩张，不惜降价，最近我也入手了99元一年的云主机，确实香；而且资本市场也认这个，你规模大，增长快，现在不挣钱没关系，未来有个美好的期望就行，估值就能上去。然后混合云其实很多时候都是费时费力的，必须把钱挣到手，否则就是赔本赚吆喝。我估计混合云如果搞不好，未来还可能会被进一步边缘化。\n\n阿里云还是应该专注自己的云服务，或者做产品去做标准的私有化部署也行，不要从市场、到研发、到实施一竿子插到底，啥都干可能啥都搞不好，还是应该专注自己的强项，也给参与者留点活路。\n然后阿里云还将裁撤IoT业务线，只保留与公共云和AI更相关的部分，阿里云将投入更多力量支持AI生态。\n\n最近阿里开源了720亿参数的通义大模型，成为中国大型科技公司里唯一开源自研大模型的公司，不得不赞一个。阿里开源的想法也很简单，那就是模型都白送你们了，你得在机器上跑吧，得有高端显卡吧，阿里云里边我给你准备好了，大家都来算起来吧。我在这波AI大浪里边做好云计算就够吃了。\n\n\n','1741690336719241218',0,0,1,_binary '\0',_binary '\0',0,'2024-01-01 13:24:33',NULL),('1741690748339847170','浅析RobotFramework工具的使用','### 1 简介\n\n最近几年越来越多的公司都开始进行自动化测试的设计和布局了，自动化，顾名思义就是把以人为驱动的测试行为转化为机器执行的一种过程，并经常用于回归测试中，市面上也存在很多开源的自动化测试的工具和理论知识，今天我要说的是RobotFramework这个工具；\n\n我也是在偶然的机会中接触到了RobotFramework这个工具，并且觉得形式很新颖，一下就被吸引了，RobotFramework是一款python编写的功能自动化测试框架。具备良好的可扩展性，支持关键字驱动，可以同时测试多种类型的客户端或者接口，可以进行分布式测试执行，下面我们就进入正题吧！\n\n### 2 工具分析\n\n1.当我们把工具安装完成后，会在我们的桌面看到一个小图标，我们以后编写用例，就依赖他了（有感兴趣的小伙伴可以私聊我要安装过程，在此就不赘述了）：\n\n* 项目编辑区会展示我们已经创建的项目、用例和已经创建的关键字资源；这里的关键字可以为我们以后的用例带来很多方便，适用于写通用的逻辑，方便我们在用例编写时遇到相同的逻辑去调用；\n* 编写用例可以通过脚本编辑区与表格编辑区；\n* * 当鼠标定位到某条case时，会展示表格编辑区：和脚本编辑区一样只是一种是通过编写脚本的方式实现，一种是通过excel表格的方式来实现用例的编写；\n\n','1741690336719241218',0,0,1,_binary '\0',_binary '\0',0,'2024-01-01 13:20:08',NULL),('1741692173023281154','逻辑编程：上古人工智能语言Prolog','今天给大家介绍一种有趣的编程语言。\n\n它能够让计算机像侦探一样推理，像哲学家一样思考，这就是逻辑编程。\n\n逻辑编程就好比我们给计算机一个逻辑谜题，然后他通过一系列的推理，找到答案。\n\n## 1 逻辑编程是什么？\n\n### 1.1 逻辑编程的定义与特点\n\n想象一下，如果我们可以让计算机像人类一样思考和解决问题，那会是怎样的情景？逻辑编程就是这样一种尝试，它利用逻辑学的原理，使计算机能够进行推理和解决问题。\n\n我们只需要告诉计算机：“这是规则，这是事实，现在你告诉我答案。” 就像玩一个连环推理的游戏，每个线索都逐渐揭开谜题的一部分，最终揭示出整个故事。\n\n逻辑编程的特点是高度抽象，不关注如何操作，而是关注“什么是真的”。\n\n### 1.2 代表语言：Prolog\n\nProlog，即Programming in Logic，是逻辑编程的一种代表性语言。它的核心是事实和规则。让我们来看一下Prolog的基本语法：\n\n* 事实：在Prolog中，我们可以定义一些基本的事实。例如，philosopher(socrates). 表示“苏格拉底是哲学家”。\n* 规则：规则用于定义事实之间的关系。例如，mortal(X) :- philosopher(X). 表示“如果某人是哲学家，那么他必然是凡人”。X表示参数，大写的是变量，小写的是常量。符号 :- 表示推理关系，如果右边的表达式成立，左边的表达式也成立。\n* 查询：查询是向Prolog程序提出的问题。例如，?- mortal(socrates). 将询问“苏格拉底是凡人吗？”。?-是命令提示符，我们在后边输入要执行的命令，回车后执行并返回结果。\n\n注意所有语句的最后都用一个点（.）表示结束。\n\nProlog的魅力在于它的简洁和强大。我们不需要告诉计算机如何一步步解决问题，只需告诉它规则和事实，它就能自动进行逻辑推理，最终给我们答案。\n\n## 2 逻辑编程的应用领域\n\n### 2.1 专家系统\n\n专家系统是逻辑编程的一大应用，就像是拥有了一个专家顾问团队。它们可以帮助医生诊断疾病，或者帮助工程师设计复杂的机械结构。以医疗诊断为例，在Prolog中，我们可以定义一系列的症状和疾病之间的关系。例如：\n\n\n这条规则告诉计算机：“如果一个人有发烧和咳嗽的症状，那么他可能得了流感。”通过这样的规则，专家系统可以帮助医生诊断疾病。\n\n### 2.2 自然语言理解\n\n自然语言理解让计算机能够理解人类的语言。就像是给计算机装上了一副懂得人类语言的眼镜，它可以读懂你的邮件，理解你的指令。例如，我们可以用Prolog来解析句子的结构：\n\n\n这条规则可以帮助计算机理解“主语 + 谓语 + 宾语”的句子结构。通过这种方式，计算机可以更好地理解用户的输入。\n\n### 2.3 智能知识库\n\n智能知识库就像是一个巨大的电子大脑，存储着海量的信息。逻辑编程让这个大脑可以自己思考和推理，帮助我们从中找到需要的知识。例如，一个关于历史人物的知识库可能包含如下规则：\n\n\n通过这样的事实和规则，用户可以查询李小龙的出生地和参演过哪些电影。\n\n## 3 逻辑编程如何解决问题？\n\n### 3.1 建立模型\n\n解决问题的第一步是建立一个模型。就像是搭建一座桥梁，我们需要定义桥梁的结构和支撑点。在逻辑编程中，我们定义规则或限制条件，比如：“哲学家是凡人。”\n\n\n### 3.2 定义规则与事实\n\n接下来，我们在模型上添加规则和事实。如果说模型是桥梁的结构，那么规则和事实就像是桥梁上行驶的车辆。例如，我们声明：“苏格拉底、柏拉图、亚里士多德是哲学家。”\n\n\n### 3.3 推导与求解\n\n最后，我们提出问题，比如：“谁是凡人？”逻辑编程像是一个聪明的小侦探，它会自动推导逻辑，找出所有可能的答案，比如输出：“苏格拉底、柏拉图、亚里士多德。”\n\nProlog 有很多实现，本文以目前比较活跃的 SWI-Prolog 为例运行这个程序。\n\n需要先把规则和事实保存到一个文件中 mortal.pl，然后使用命令 consult 加载规则，最后执行 mortal(X). 获取结果，有多个答案时，我们输入分号（;)，Prolog会继续搜索直到所有可能的答案都被找到。\n\n\n','1741690336719241218',0,0,1,_binary '\0',_binary '\0',0,'2024-01-01 13:25:48',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='话题-标签 中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_post_tag`
--

LOCK TABLES `bms_post_tag` WRITE;
/*!40000 ALTER TABLE `bms_post_tag` DISABLE KEYS */;
INSERT INTO `bms_post_tag` VALUES (1,'1741690748406956033','1741690748339847170'),(2,'1741690748406956034','1741690748339847170'),(3,'1741691288155160578','1741691288088051713'),(4,'1741691857548705794','1741691857485791234'),(5,'1741691857548705795','1741691857485791234'),(6,'1741692173086195714','1741692173023281154'),(7,'1741692173086195715','1741692173023281154'),(8,'1741692720275095555','1741692720275095554'),(9,'1741692720275095556','1741692720275095554'),(10,'1741692720275095557','1741692720275095554');
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
INSERT INTO `bms_tag` VALUES ('1741690748406956033','测试',1),('1741690748406956034','robotFramework',1),('1741691288155160578','Go GC',1),('1741691857548705794','云计算',1),('1741691857548705795','阿里巴巴',1),('1741692173086195714','Prolog',1),('1741692173086195715','语言',1),('1741692720275095555','前端',1),('1741692720275095556','后端',1),('1741692720275095557','Android',1);
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
INSERT INTO `ums_user` VALUES ('1741690336719241218','admin','admin','e10adc3949ba59abbe56e057f20f883e','https://cdn.pixabay.com/photo/2021/11/12/03/04/woman-6787784_1280.png','2041733900@qq.com',NULL,5,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-01 13:18:30',NULL),('1741693016078385154','123456','123456','e10adc3949ba59abbe56e057f20f883e','https://picst.sunbangyan.cn/2023/12/26/96323189b21baf1e67ecfe6517f03f30.jpeg','2041733901@qq.com',NULL,0,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-01 13:29:09',NULL);
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

-- Dump completed on 2024-01-01 13:33:17
