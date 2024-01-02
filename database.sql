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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_collect`
--

LOCK TABLES `bms_collect` WRITE;
/*!40000 ALTER TABLE `bms_collect` DISABLE KEYS */;
INSERT INTO `bms_collect` VALUES (2,'1741693016078385154','1741690748339847170'),(5,'1741693016078385154','1741695911695843329'),(8,'1741693016078385154','1741852804053512193'),(9,'1741876776505749506','1741876633144438785'),(10,'1741872872246259714','1742012669703008257');
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
INSERT INTO `bms_comment` VALUES ('1741696035884990466','讲得好','1741693016078385154','1741692720275095554','2024-01-01 13:41:09',NULL),('1741696091988000769','不错不错','1741693016078385154','1741690748339847170','2024-01-01 13:41:22',NULL),('1741701858631647233','不错不错','1741693016078385154','1741695911695843329','2024-01-01 14:04:17',NULL),('1741855228499636225','很有收获','1741693016078385154','1741852804053512193','2024-01-02 00:13:43',NULL),('1741856999959736322','讲得好','1741693016078385154','1741691288088051713','2024-01-02 00:20:46',NULL),('1742012956484349953','讲得好','1741872872246259714','1742006994302185474','2024-01-02 10:40:29',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_follow`
--

LOCK TABLES `bms_follow` WRITE;
/*!40000 ALTER TABLE `bms_follow` DISABLE KEYS */;
INSERT INTO `bms_follow` VALUES (2,'1741690336719241218','1741693016078385154'),(3,'1741873337587511297','1741876776505749506'),(4,'1741994508131807234','1741872872246259714');
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
INSERT INTO `bms_post` VALUES ('1741994766085697537','2023 年超全前端代码评审清单','在项目开发过程中，编写符合团队编码规范的代码是尤为重要，否则阅读和维护代码需要花费很多的时间。在前端发展的前期阶段一般是团队统一制定规范约定代码格式，然后输出成文档，但团队成员无法在日常开发中去熟悉这些约定，无法真正的落地。后续出现了 `eslint` 和 `prettier`, 我们一般结合两者去实现团队的代码规范。一般代码规范由代码格式和代码质量组成\n\n','1741994508131807234',0,0,2,_binary '\0',_binary '\0',0,'2024-01-02 09:28:12',NULL),('1741999163314319362','2023年前端面试真题之Vue篇','## Vue.js 与其他前端框架（如React和Angular）相比有什么优势和区别？\n\n1. 简单性和易用性：\n\nVue.js 是一款轻量级框架，容易学习和上手。它提供了直观的API和清晰的文档，使开发者可以迅速构建应用程序。\nReact 和 Angular 在某些方面更复杂，需要更多的学习成本。\n\n2. 渐进式框架：\n\nVue.js 被称为渐进式框架，允许你逐步采用它的特性。这意味着你可以在现有项目中集成Vue.js，而不必一次性重写整个应用。\nReact 和 Angular 在集成到现有项目时可能需要更多的工作。\n\n3. 双向数据绑定：\n\nVue.js 提供了直接的双向数据绑定，使数据在视图和模型之间保持同步。这使得开发人员更容易管理应用程序的状态。\nReact 和 Angular 也支持数据绑定，但它们的实现方式略有不同。\n\n4. 组件化开发：\n\nVue.js、React 和 Angular 都鼓励组件化开发，但Vue.js在这方面表现出色。Vue组件的定义非常简单，易于复用和维护。\nReact 使用JSX来创建组件，Angular使用模板。这些框架的组件系统也很强大，但可能需要更多的配置。\n\n5. 生态系统和社区：\n\nReact 和 Angular 有庞大的生态系统和活跃的社区支持，有丰富的第三方库和插件。\nVue.js 的生态系统也在不断壮大，虽然相对较小，但社区也非常积极。\n\n6. 性能：\n\nVue.js 在性能方面表现良好，具有虚拟DOM机制，可以高效地更新视图。\nReact 也使用虚拟DOM，性能也很出色。Angular 在某些情况下可能需要更多的性能优化工作。\n\n7. 工具和生态系统：\n\nVue.js 提供了一些强大的工具，如Vue CLI，用于快速搭建项目，并与Vue Router和Vuex等官方库集成。\nReact 和 Angular 也有类似的工具和库，但Vue的工具生态系统在某些方面更加直观和易用。\n\n8. 使用案例：\n\nVue.js 适用于中小型应用程序和单页面应用程序（SPA），以及需要快速原型开发的项目。\nReact 和 Angular 适用于各种规模的应用，包括大型企业级应用。总之，选择使用哪个前端框架取决于项目的需求和团队的偏好。Vue.js在简单性、易用性和渐进式开发方面具有优势，适合许多项目，但React和Angular在大型应用和企业级项目中也有其优势。\n\n## Vue实例与组件之间的区别是什么？它们如何进行通信？\n\nVue.js 中的 Vue 实例（Vue Instance）和组件（Components）是两个不同的概念，它们之间有一些重要的区别，同时也有不同的方式来进行通信。\n\n**1. Vue 实例（Vue Instance）：**\n\n* Vue 实例是 Vue.js 的核心概念之一。它是一个独立的 Vue 对象，用来管理应用的状态、行为和生命周期。\n* 通常，一个 Vue 应用的根实例会被创建，它管理整个应用的数据和方法。你可以使用`new Vue()` 来创建一个 Vue 实例。\n\n**2. 组件（Components）：**\n\n* 组件是 Vue.js 中的可复用的代码块，用于构建用户界面。每个组件都有自己的状态、行为和模板。\n* 组件可以像标签一样在模板中使用，允许你构建复杂的用户界面，将界面分解成可维护的部分。\n* 通过`Vue.component` 或使用单文件组件 (`.vue` 文件) 的方式定义组件。\n\n**通信方式：**\n\n在 Vue.js 中，Vue 实例和组件之间可以通过以下方式进行通信：\n\n**1. Props（属性）：**\n\n* 父组件可以通过 props 向子组件传递数据。子组件通过 props 接收数据并在自己的模板中使用。\n* 这是一种单向数据流的方式，父组件向子组件传递数据。\n\n**2. 自定义事件：**\n\n* 子组件可以通过触发自定义事件来向父组件通知事件发生。父组件可以监听这些事件并执行相应的操作。\n* 这是一种从子组件到父组件的通信方式。\n\n**3. 状态管理（如Vuex）：**\n\n* 对于大型应用程序，可以使用状态管理库如 Vuex 来管理应用的状态。它提供了一个集中的状态存储，所有组件都可以访问和修改其中的数据。\n* 这是一种跨组件通信的高级方式。\n\n**4. 依赖注入：**\n\n* Vue.js 提供了依赖注入机制，允许你在祖先组件中注册一些数据，然后在后代组件中访问这些数据，而不需要通过 props 一层层传递。\n* 依赖注入通常用于一些全局配置或主题样式的传递。\n\n**总结：**\nVue 实例是整个应用的根对象，而组件是应用中的可复用模块。它们之间的通信主要通过 props 和自定义事件来实现，但对于更复杂的状态管理，可以使用 Vuex 或其他状态管理库。\n\n## Vue中的声明周期钩子函数是什么？它们的执行顺序是怎样的？\n\nVue.js 中的生命周期钩子函数是一组特定的函数，它们允许你在组件的不同生命周期阶段执行代码。这些钩子函数可以用于执行初始化、数据加载、DOM 操作等任务。Vue 组件的生命周期钩子函数按照以下顺序执行：\n\n1. **beforeCreate（创建前）：**\n   * 在组件实例被创建之前立即调用。\n   * 此时组件的数据和事件还未初始化。\n2. **created（创建后）：**\n   * 在组件实例被创建后立即调用。\n   * 组件的数据已经初始化，但此时还未挂载到 DOM。\n3. **beforeMount（挂载前）：**\n   * 在组件挂载到 DOM 之前立即调用。\n   * 此时模板编译完成，但尚未将组件渲染到页面上。\n4. **mounted（挂载后）：**\n   * 在组件挂载到 DOM 后立即调用。\n   * 此时组件已经渲染到页面上，可以进行 DOM 操作。\n5. **beforeUpdate（更新前）：**\n   * 在组件数据更新之前立即调用。\n   * 在此钩子函数内，你可以访问之前的状态，但此时尚未应用最新的数据。\n6. **updated（更新后）：**\n   * 在组件数据更新后立即调用。\n   * 此时组件已经重新渲染，可以进行 DOM 操作。\n7. **beforeDestroy（销毁前）：**\n   * 在组件销毁之前立即调用。\n   * 此时组件仍然可用，你可以执行一些清理工作。\n8. **destroyed（销毁后）：**\n   * 在组件销毁后立即调用。\n   * 此时组件已经被完全销毁，不再可用。\n\n这些生命周期钩子函数允许你在不同的阶段执行代码，以满足应用程序的需求。例如，在 `created` 钩子中可以进行数据初始化，而在 `mounted` 钩子中可以进行 DOM 操作。请注意，不同的生命周期钩子适合不同的用途，应根据需要选择合适的钩子函数来执行相应的任务。\n\n## Vue的双向数据绑定是如何实现的？请举例说明。\n\nVue.js 的双向数据绑定是通过其特有的响应式系统来实现的。这个系统使用了ES6的Proxy对象或者Object.defineProperty()方法，以便在数据变化时通知视图进行更新。这意味着当你修改数据模型时，与之相关联的视图会自动更新，反之亦然。\n\n=\n\n','1741995739025813506',0,0,3,_binary '\0',_binary '\0',0,'2024-01-02 09:45:40',NULL),('1741692720275095554','2023年总结 寻找到源于内心深处的无穷力量','今天是跨年夜，将前段时间的思考记录于下。今年的关键词是 \"改变\" 与 \"求索\"，最值得分享的事情是寻找到源于内心深处的无穷力量。\n\n## 从一个有局限的观点出发 - \"人是万物的尺度\"\n\n> 人是万物的尺度 -- 普罗泰戈拉\n\n*这一观点曾受到苏格拉底、柏拉图和亚里士多德的批评，并且在很长时间内受到质疑。黑格尔从认识史发展的角度，肯定这个命题体现了思维的能动性。*\n\n*这个命题集中代表了普罗泰戈拉的**相对主义** 和**怀疑主义** 的**错误观点** ，有**主观唯心主义** 的因素，但是它触及到主观与客观的关系问题，表明了人类认识的进步。*\n\n谈及此命题，并非想和读者诸君讨论哲学，只是想表达以下观点：\n\n> **即便是身处21世纪，大部分人仍会因尚未客观认清事物，而陷入主观唯心主义。在大部分的事项与活动中人的主观性远大于客观**\n\n在事项与活动中，总会不自觉的以人为中心，无论是理解事项、传递信息、互相协作，评价...\n\n## 为何寻找这种力量\n\n人生无法保持风平浪静，工作和生活中会遇到各种问题，即便能力再强，也难免会囿于困境。\n\n前段时间读了不少他人的年终总结，同时回顾了自己近10年的历程，\n\n在学校，因交叉学科，有医学专业课和计算机方向专业课，在学习之余帮老师打杂并自己段炼编程\n在第一家公司，适应学校和职场的差别，从带领同学一同完成项目转变到主导完成安卓软件开发项目\n在第二家公司，运用Practical Problem Solving的理念整治充满异味的代码，尝试作为scrum master并探索技术领导力\n在第三家公司，完成更具挑战的技术调研和项目开发，并转变至医疗器材类项目管理\n\n一路走来，山高路远，道阻且长，凡心所向，行之将至，应叹人生多幸，未曾行差踏错，然此去蓬莱路远，万丈迷津难渡，须有一点星火，燃起万丈燎原。\n\n所幸者，这种力量点燃了意志，让我敢于直面困难，直至挣断枷锁打破樊笼\n\n我在 [突如其来的秋季反思](https://juejin.cn/post/7285373518837383223 \"https://juejin.cn/post/7285373518837383223\") 中曾提到，要让个人目标与工作目标相契合，在完成工作的同时实现自我提升。\n\n而实际上，当实现了工作目标后，再使用一定的时间进行关联性延伸，会更容易获得质变。\n\n这种力量帮助我打破了樊笼，并促使我进行关联性延伸方面摸鱼，提升了个人能力并反映为业务能力的提升，进一步获得更多摸鱼时间。\n\n## 这种力量是什么\n\n虽然我能感受到那一点星火，但仍难以具体描述它，仅在追寻的过程中，摸到蛛丝马迹。\n\n* 在陷于迷惘中时，它是 \"从书中学，向高人问，在事上练\"；\n* 在闭上双眼冥想坐于暗室时，它是 \"不自欺，要践行仁义礼智信，温良恭俭让\"；\n* 在止不不前时，它是 \"道虽弥，不行不至\"；\n* 在事情难以入手时 ，它是 \"天下难事，必成于易，天下大事，必作于细\"\n* ...\n\n大体可以描述为 \"心志\"，但这种描述是虚无缥缈的。\n\n提到心志，大多会想到《孟子》：\n\n> 天将降大任于斯人也，必先苦其心志，劳其筋骨，饿其体肤，空乏其身，行拂乱其所为，所以动心忍性，增益其所不能\n\n这句话要倒着理解：人生来是白纸，当熬炼过心志，打磨好筋骨，能够忍受身体饥饿、穷困潦倒、事不遂意，这样都无法击溃他时，他会心性成熟能力提升，才有可能接住大任。\n\n## 将这种力量作用于人的改变\n\n将这种力量作用于自身，终究会引起自身的改变。\n\n如前文所言，人习惯将自我作为万物的尺度，在事项与活动中，无论其他参与者自身是否发生改变，这种力量的辐射会逐步改变参与者对你的看法。\n\n这种改变如烈阳照于雪山，可卸下偏见的枷锁，推倒困住你的樊笼。\n\n## 结尾-明年的规划\n\n* 重塑阅读 - \"阅读\"事物、阅读人心、阅读书籍\n* 重塑表达 - 和不同的人，有不同的表达方式，系统性的反思\n* 将节约出的时间用于保持对技术的热情\n* 给家人更多的陪伴\n\n\n','1741690336719241218',0,0,19,_binary '\0',_binary '\0',0,'2024-01-01 13:27:58',NULL),('1742006994302185474','2024 ：最新前端技术趋势','上一次的时候聊了那么些已经落后的前端开发技术,但是光知道什么技术落后了是不够的，咱们还得知道 **前端最新的技术趋势是什么** 。所以，今天这篇文章，咱们就来聊一聊，**2023 最新前端技术趋势** 。\n\n大家先不要着急骂我，大家先想一想：“JS 的免于强类型是否为你带来了便利，TS 的强类型是否为你带来了不便”。\n\n在很多中小厂的日常项目开发之中，你真的有必要使用 TypeScript 吗？它所谓的严谨性，真的能避免了屎山代码的出现吗？\n\n应该是不能的吧。同时恰恰相反，当团队的平均技术能力不足时， TS 反而会带来更多的不便，让原先没有那么屎山的代码，变得彻底屎山了。\n\n我们要知道：任何的一个技术都将会是一把双刃剑，它带来了改进的同时，也会带来新的不便。 这个在 TS 和 JS 的对比中，尤其明显。\n\n所以，今年陆陆续续有开发者开始 反 TypeScript。比如：Svelte、Turbo 等等等等。后面可能会有越来越多的开发者加入反 TypeScript 的阵营。\n\n![ed12443d4455f298506a7c73287d9456](https://picdm.sunbangyan.cn/2024/01/02/87be7bb170179c221434147eef1b43cc.jpeg)\n\n[那么些已经落后的前端开发技术](https://www.bilibili.com/video/BV1ue411R7wc/) 。\n\n','1741872872246259714',0,0,20,_binary '\0',_binary '\0',0,'2024-01-02 10:16:47','2024-01-02 10:22:26'),('1741852804053512193','Python实现圣诞树','### 如何使用python实现圣诞树\n\n欢迎大家一起讨论\n\n```\nimport turtle as t  # as就是取个别名，后续调用的t都是turtle\nfrom turtle import *\nimport random as r\n\n\nn = 100.0\n\nspeed(20)  # 定义速度\npensize(5)  # 画笔宽度\nscreensize(800, 800, bg=\'black\')  # 定义背景颜色，可以自己换颜色\nleft(90)\nforward(250)              # 开始的高度\ncolor(\"orange\", \"yellow\")  # 定义最上端星星的颜色，外圈是orange，内部是yellow\nbegin_fill()\nleft(126)\n\nfor i in range(5):  # 画五角星\n    forward(n / 5)\n    right(144)  # 五角星的角度\n    forward(n / 5)\n    left(72)  # 继续换角度\nend_fill()\nright(126)\n\n\ndef drawlight():  # 定义画彩灯的方法\n    if r.randint(0, 50) == 0:  # 如果觉得彩灯太多，可以把取值范围加大一些，对应的灯就会少一些\n        color(\'tomato\')  # 定义第一种颜色\n        circle(3)  # 定义彩灯大小\n    elif r.randint(0, 30) == 1:\n        color(\'orange\')  # 定义第二种颜色\n        circle(4)  # 定义彩灯大小\n    elif r.randint(0, 50) == 2:\n        color(\'blue\')  # 定义第三种颜色\n        circle(2)  # 定义彩灯大小\n    elif r.randint(0, 30) == 3:\n        color(\'white\')  # 定义第四种颜色\n        circle(4)  # 定义彩灯大小\n    else:\n        color(\'dark green\')  # 其余的随机数情况下画空的树枝\n\n\ncolor(\"dark green\")  # 定义树枝的颜色\nbackward(n * 4.8)\n\n\ndef tree(d, s):  # 开始画树\n    if d <= 0: return\n    forward(s)\n    tree(d - 1, s * .8)\n    right(120)\n    tree(d - 3, s * .5)\n    drawlight()  # 同时调用小彩灯的方法\n    right(120)\n    tree(d - 3, s * .5)\n    right(120)\n    backward(s)\n\n\ntree(15, 100)\nbackward(50)\n\nfor i in range(200):  # 循环画最底端的小装饰\n    a = 200 - 400 * r.random()\n    b = 10 - 20 * r.random()\n    up()\n    forward(b)\n    left(90)\n    forward(a)\n    down()\n    if r.randint(0, 1) == 0:\n        color(\'tomato\')\n    else:\n        color(\'wheat\')\n    circle(2)\n    up()\n    backward(a)\n    right(90)\n    backward(b)\n\n\n\ndef drawsnowman(n,m,a,b):  # 画雪人 (n,m)是头和身子交点的坐标，a是头的大小，m是身体的大小\n    t.goto(n, m)\n    t.pencolor(\"white\")\n    t.pensize(2)\n    t.fillcolor(\"white\")\n    t.seth(0)\n    t.begin_fill()\n    t.circle(a)\n    t.end_fill()\n    t.seth(180)\n    t.begin_fill()\n    t.circle(b)\n    t.end_fill()\n    t.pencolor(\"black\")\n    t.fillcolor(\"black\")\n    t.penup()    # 右眼睛\n    t.goto(n-a/4, m+a)\n    t.seth(0)\n    t.pendown()\n    t.begin_fill()\n    t.circle(2)\n    t.end_fill()\n    t.penup()    # 左眼睛\n    t.goto(n+a/4, m+a)\n    t.seth(0)\n    t.pendown()\n    t.begin_fill()\n    t.circle(2)\n    t.end_fill()\n    t.penup()  # 画嘴巴\n    t.goto(n, m+a/2)\n    t.seth(0)\n    t.pendown()\n    t.fd(5)\n    t.penup()       # 画扣子\n    t.pencolor(\"red\")\n    t.fillcolor(\"red\")\n    t.goto(n, m-b/4)\n    t.pendown()\n    t.begin_fill()\n    t.circle(2)\n    t.end_fill()\n    t.penup()\n    t.pencolor(\"yellow\")\n    t.fillcolor(\"yellow\")\n    t.goto(n, m-b/2)\n    t.pendown()\n    t.begin_fill()\n    t.circle(2)\n    t.end_fill()\n    t.penup()\n    t.pencolor(\"orange\")\n    t.fillcolor(\"orange\")\n    t.goto(n, m-(3*b)/4)\n    t.pendown()\n    t.begin_fill()\n    t.circle(2)\n    t.end_fill()\n\ndrawsnowman(-200, -200, 20, 30)\ndrawsnowman(-250, -200, 30, 40)\n\nt.up()\nt.goto(100, 200)\nt.down()\nt.color(\"dark orange\", \"orange\")  # 定义字体颜色\nt.penup()\nt.write(\"小黄同学’s Christmas Tree\", font=(\"Comic Sans MS\", 26, \"bold\"))  # 定义文字、位置、字体、大小\nt.end_fill()\n\ndef drawsnow():  # 画雪花\n    t.ht()  # 隐藏笔头，ht=hideturtle\n    t.pensize(2)  # 定义笔头大小\n    for i in range(200):  # 画多少雪花\n        t.pencolor(\"white\")  # 定义画笔颜色为白色，其实就是雪花为白色\n        t.pu()  # 提笔，pu=penup\n        t.setx(r.randint(-350, 350))  # 定义x坐标，随机从-350到350之间选择\n        t.sety(r.randint(-100, 350))  # 定义y坐标，注意雪花一般在地上不会落下，所以不会从太小的纵座轴开始\n        t.pd()  # 落笔，pd=pendown\n        dens = 6  # 雪花瓣数设为6\n        snowsize = r.randint(1, 10)  # 定义雪花大小\n        for j in range(dens):  # 就是6，那就是画5次，也就是一个雪花五角星\n            # t.forward(int(snowsize))  #int（）取整数\n            t.fd(int(snowsize))\n            t.backward(int(snowsize))\n            # t.bd(int(snowsize))  #注意没有bd=backward，但有fd=forward，小bug\n            t.right(int(360 / dens))  # 转动角度\n\ndrawsnow()  # 调用画雪花的方法\nt.done()  # 完成,否则会直接关闭\n```\n\n','1741693016078385154',0,0,54,_binary '\0',_binary '\0',0,'2024-01-02 00:04:05','2024-01-02 00:19:37'),('1741695911695843329','vue3优雅的使用useDialog','在日常开发时，弹窗是一个经常使用的功能，而且重复性极高，你可能会遇到下面这些问题:\n\n1、一个页面内多个弹窗, 要维护多套弹窗状态,看的眼花缭乱\n\n2、弹窗内容比较简单，声明变量 + 模板语法的方式写起来比较麻烦\n\n关于这些问题, 我首先想到的是应该弄一个即用即走的`Dialog`，不用去单独维护它的状态，使用`Dialog({ xxx })`这种形式去调用它，例如下面这种配置的方式：\n\n```\nDialog({\n    title: \'xxx\',\n    render: () => xxx\n})\n```\n\n其中`render`可以是一个`html`字符串，也可以是`jsx`(需要配置对jsx的支持)，这样可以对内容区域实现自定义。\n\n## 通过配置项调用\n\n各大主流的ui库基本都实现了这种调用方式\n\n## vueuse的createTemplatePromise\n\n如果你不想使用`jsx`，而是想使用模板，`vue`的`hooks`工具库`vueuse`中提供了  这个函数用来创建对话框、模态框、Toast 等，并且完全使用的是`template`的方式，因此自定义程度更高，并且没有任何额外成本(不需要jsx)。\n\n下面是一个`createTemplatePromise`结合`el-dialog`的例子(当然也可以结合其它的`dialog`或者自定义`dialog`)：\n#### Promise化Dialog的优点\n\n这样有小伙伴可能会说, 这看起来和原来用`dialog`也没有很大区别啊, 也要写模版 + 函数方法. 那么让`dialog`变成这样有什么好处呢?\n\n1、最大的好处是弹窗变得可编程了, 通过函数调用的方式来控制`UI`. 不用再单独声明变量控制显隐, 也不用单独再去控制按钮的`禁用`、`loading`等状态. 例如以上的例子中, 我们可以轻松的处理`button`的`loading`状态(不用再额外声明变量), 用`Promise`让`Dialog`的`UI`和状态实现了內聚.\n\n2、相比第一种方式, 对UI的可自定义程度更高.\n\n作者：隔壁老王z\n链接：https://juejin.cn/post/7293173815181738022\n来源：稀土掘金\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n\n','1741693016078385154',0,0,27,_binary '\0',_binary '\0',0,'2024-01-01 13:40:39',NULL),('1741876404592619522','vue3后台管理系统教程3（登录、菜单权限）','开始搭建后台系统的核心就是权限，不同的权限对应不同的侧边导航。一般的逻辑是：登录后获取得到token，再通过token获取用户信息（用户名、账号、角色、权限等），从接口获取到菜单后，计算出路由，并动态添加路由和按钮。接下来详细介绍一下登录和权限。\n\n## 一、登录\n\n### 登录流程\n\n验证用户名和密码后，调用登录接口登录成功后，将返回的token存到store中，如果参数中含有redirect，则跳转到该路由。\n\n```\nonst handleSubmitForm = (formEle: FormInstance | undefined | null) => {\n  if (!formEle) {\n    return\n  }\n  formEle.validate(async (valid) => {\n    if (valid) {\n      try {\n        loading.value = true\n        let { data } = await login(loginForm)\n        userStore.setToken(data)\n        router.replace({ path: (route.query.redirect as string) || HOME_URL })\n      } catch (error) {\n        loading.value = false\n      }\n    }\n  })\n}\n```\n\n','1741693016078385154',0,0,1,_binary '\0',_binary '\0',0,'2024-01-02 01:37:52',NULL),('1741877385430609922','vue保姆级毫无废话的进阶到实战教程','作为一个 React、Vue双修选手，在Vue 3逐渐稳定下来之后，是时候摸摸 Vue 3 了。Vue3 的变化不可谓不大 ，所以，本系列主要通过对 Vue3 中的一些`Big Changes` 做详细的介绍，然后封装一个比较通用的业务脚手架，里面会增加很多非常有用的小技巧，让你在 Vue 3 的世界里纵享丝滑 ~\n有。商业转载请联系作者获得授权，非商业转载请注明出处。\n这个命令会做两件事:\n\n1. 使用 `tree` 命令输出目录树结构，同时排除 `node_modules`、`.vscode` 和 `cypress` 文件夹\n   * `tree` 命令可以输出目录的树形结构\n   * `-I` 参数用于排除某些文件夹不显示\n   * 在排除参数中用`|` 分隔多个要排除的文件夹名\n2. 使用 `\'>\'` 符号将标准输出重定向到 `tree.txt` 文件（没有就会自动生成一个）\n\n这样 `tree` 命令的输出就会被写入到 `tree.txt` 文件中，而不是打印到终端屏幕上。在项目中执行，然后你就会在项目根目录中看到一个 `tree.txt` 文件:\n\n\n','1741876776505749506',0,0,1,_binary '\0',_binary '\0',0,'2024-01-02 01:41:46',NULL),('1741874553721761793','Vue后台项目适配各种分辨率以及网页缩放','最近一直有人问我关于Vue的适配问题如何解决，今天就来给大家分享一下我项目的适配方案（可直接cv）\n\n### 1. 各屏幕分辨率下适配展示\n\n#### 首先给大家展示一下我的屏幕分辨率兼容效果，方便大家来判断我的适配方案是否可行\n\n\n','1741873337587511297',0,0,1,_binary '\0',_binary '\0',0,'2024-01-02 01:30:31',NULL),('1742000487942631425','web前端发展历程','## 前言\n\n目前在IT公司中前端的岗位越来越成为不可或缺的，前端的地位也愈见明显，很多学校已经体系的传授前端课程，众多培训机构也将前端知识作为了主流课程，也有越来越多的同学加入到前端学习的行列中，作为前端工程师或者前端的学习者我们有必要去了解前端的发展史。那么首先让我们来了解一下浏览器的发展历程。\n\n## 发展\n\n在中享思途的行业资讯中看到了他对浏览器的发展史总结如下：\n1、1991年，WorldWideWeb浏览器发布，这款可以说是祖父级别的，它是全球用户最早注册的WEB浏览器，WorldWideWeb开发始于20世纪80年代末，之后10年间经过MTV的宣传以及Commodore 64的完善，终于在1991年这个有跨时代意义的Web浏览器发布了。WorldWideWeb原理很简单，可以显示基本的样式表。\n\n2、1992年，Erwise发布，他被称为世界上第一个图形网页浏览器，它是由赫尔辛基科技大学的4个芬兰学生开发，主要是针对在Unix上运行 XWindows的需要。ViolaWWW，它是最高老的浏览器之一，在1992年5月份发布，它的开发者是美国加州大学的学生Pei-Yuan Wei，他的目的和Erwise一样是针对在Unix上运行 X Windows的需要。MidasWWW也是1992年发表的，它是由托尼约翰逊在斯坦福线型加速器中心研发的。Lynx首发也是在1992年，它提供了一个语音转换接口为视觉和听觉障碍的人群提供了很好的功能。\n\n3、1993年，Mosaic1.0发布，Mosaic可以说在一定程度上升华了Erwise的图形化，并且将图形化浏览器推向了万维网的主流。Arena浏览器是第一个支持背景图片，表格、文字绕流图片和内嵌数学表达式的浏览器，支持背景图片，表格等。\n\n4、1994年，Cello发布，他支持的就比较多了，WorldWideWeb、Gopher、FTP、CSO/ph/qi、Usenet News retrieval以及其他的一些协议，他当时成为了Windows平台上第一款浏览器。IBM WebExplorer也在同年发布，IBM推出自己的操作系统，WebExplorer也是强行捆绑在了他的系统系统上。Netscape Navigator它是一款独立的浏览器，而其在当时他的市场份额远远超过了微软的Internet Explorer。\n\n5、1995年，IE发布，浏览器之战也就此爆发。微软的Internet Explorer在此年首次推出，为了打造最好的浏览器，微软的源代码从Mosaic上获益匪浅，学习并迅速开始调整自己的浏览器，IE早期并没有捆绑在Window95上，而是作为Window95插件包的一部分进行捆绑，当时他只有1M大小。IE2在同年晚些时间发布，微软当时声称这是一个跨平台的浏览器，支持Window和Mac，IE2也加入了支持JavaScript的潮流中，它支持安全套接字层（SSL），Cookie和包括英语在内的12种语言。IE3正式捆绑在了Windows 95OSR2中，它是第一个支持CSS的主流浏览器，IE3摆脱了Spyglass源代码的局限，开始支持ActiveX控件，Java小程序，和Internet邮件。\n\n6、1996年，Opera发布，Telenor是挪威最大的通讯公司，他们推出了Opera，并在两年后进军移动市场，推出了Opera的移动版。\n\n7、1997年，IE4伴随着Windows 98操作系统一起发布。在发布Window Xp之前发布了IE6，并且新系统中包括了浏览器的最新升级补丁。随后IE逐渐占据了市场绝大部分份额。其他浏览器败下阵来。\n\n8、1998年，Netscape浏览器走向开源，和IE之争最后以失败告终。\n\n9、2003年，苹果Safari浏览器发布，苹果进入浏览器市场推出了自己的Webkit引擎，该引擎非常优秀，后来被Google，Nokia之类的厂商用于手机浏览器。\n\n10、2004年，Firefox引发了第二场浏览器之争。\n\n11、2006年，IE7发布，IE6发布的第六年，迫于Firefox的压力，微软匆匆推出IE7应战，吸取了Firefox的一些设计思想。\n\n','1741872872246259714',0,0,1,_binary '\0',_binary '\0',0,'2024-01-02 09:50:56',NULL),('1741691288088051713','一文搞懂Go GC演进史，讲的太细致了！','最近在和 Go就业训练营的朋友讨论Go GC的问题，发现了刘丹冰老师总结的内容，写的太好了，和大家分享一下。\n\n我们的讨论和思考也整理到这篇文章中了，希望对你有启发。\n\n垃圾回收(Garbage Collection，简称GC)是编程语言中提供的自动的内存管理机制，自动释放不需要的内存对象，让出存储器资源。GC过程中无需程序员手动执行。GC机制在现代很多编程语言都支持，GC能力的性能与优劣也是不同语言之间对比度指标之一。\n\nGolang在GC的演进过程中也经历了很多次变革，Go V1.3之前的标记-清除(mark and sweep)算法。Go V1.3之前的标记-清扫(mark and sweep)的缺点。\n\n大家可以重点关注以下版本的变化：\n\n* Go V1.5的三色并发标记法\n* Go V1.5的三色标记为什么需要STW\n* Go V1.5的三色标记为什么需要屏障机制(“强-弱” 三色不变式、插入屏障、删除屏障 )\n* Go V1.8混合写屏障机制\n* Go V1.8混合写屏障机制的全场景分析\n\n### 一、Go V1.3之前的标记-清除(mark and sweep)算法\n\n接下来我们来看一下在Golang1.3之前的时候主要用的普通的标记-清除算法，此算法主要有两个主要的步骤：\n\n* 标记(Mark phase)\n* 清除(Sweep phase)\n\n#### 1 标记清除算法的具体步骤\n\n**第一步** ，暂停程序业务逻辑, 分类出可达和不可达的对象，然后做上标记。\n**第二步** , 开始标记，程序找出它所有可达的对象，并做上标记。\n操作非常简单，但是有一点需要额外注意：mark and sweep算法在执行的时候，需要程序暂停！即 `STW(stop the world)`，STW的过程中，CPU不执行用户代码，全部用于垃圾回收，这个过程的影响很大，所以STW也是一些回收机制最大的难题和希望优化的点。所以在执行第三步的这段时间，程序会暂定停止任何工作，卡在那等待回收执行完毕。\n**第三步** ,  标记完了之后，然后开始清除未标记的对象\n\n**第四步** , 停止暂停，让程序继续跑。然后循环重复这个过程，直到process程序生命周期结束。\n\n以上便是标记-清除（mark and sweep）回收的算法。\n\n\n','1741690336719241218',0,0,14,_binary '\0',_binary '\0',0,'2024-01-01 13:22:17','2024-01-01 13:23:24'),('1741691857485791234','多次崩了之后，阿里云终于改了','今年是阿里云的多事之秋，几个月内接连出现三次重大事故。\n\n先是10月23日，阿里旗下语雀接近8个小时的宕机，然后是11月12日，阿里云底层授权模块接近3个小时的服务不可用，最近一次是11月27日，接近2个小时的数据库管控故障。相关的程序员们估计也是心里苦的不行。\n​眼看2023年马上要结束了，应该不会再出什么篓子了吧。\n\n出了这么多的问题，已经不能用偶然来形容了，肯定是管理上存在问题。阿里云的大佬们自然也是明白的。看最近两天的消息，阿里云专门成立了一个部门：产品架构与稳定性部，负责解决系统稳定性问题。这个部门由阿里云 CTO 周靖人领导，核心工作就是提高阿里云产品的稳定性和可靠性。说实话这个操作还是比较及时的，就看实际效果如何了。\n\n然后这个调整其实只是本次大规模调整的一部分。本次调整后，阿里云将形成3个并行的事业部：公共云事业部、混合云事业部和国际事业部。\n\n这次调整的最大变化是整合形成了新的“公共云事业部”和“混合云事业部”，更强调和明确了公共云与混合云的区别和不同打法。\n\n公共云就是大家常说的公有云，这是阿里云的重点和根基，是自己的优势，未来的打法还是规模扩张，不惜降价，最近我也入手了99元一年的云主机，确实香；而且资本市场也认这个，你规模大，增长快，现在不挣钱没关系，未来有个美好的期望就行，估值就能上去。然后混合云其实很多时候都是费时费力的，必须把钱挣到手，否则就是赔本赚吆喝。我估计混合云如果搞不好，未来还可能会被进一步边缘化。\n\n阿里云还是应该专注自己的云服务，或者做产品去做标准的私有化部署也行，不要从市场、到研发、到实施一竿子插到底，啥都干可能啥都搞不好，还是应该专注自己的强项，也给参与者留点活路。\n然后阿里云还将裁撤IoT业务线，只保留与公共云和AI更相关的部分，阿里云将投入更多力量支持AI生态。\n\n最近阿里开源了720亿参数的通义大模型，成为中国大型科技公司里唯一开源自研大模型的公司，不得不赞一个。阿里开源的想法也很简单，那就是模型都白送你们了，你得在机器上跑吧，得有高端显卡吧，阿里云里边我给你准备好了，大家都来算起来吧。我在这波AI大浪里边做好云计算就够吃了。\n\n\n','1741690336719241218',0,0,2,_binary '\0',_binary '\0',0,'2024-01-01 13:24:33',NULL),('1741690748339847170','浅析RobotFramework工具的使用','### 1 简介\n\n最近几年越来越多的公司都开始进行自动化测试的设计和布局了，自动化，顾名思义就是把以人为驱动的测试行为转化为机器执行的一种过程，并经常用于回归测试中，市面上也存在很多开源的自动化测试的工具和理论知识，今天我要说的是RobotFramework这个工具；\n\n我也是在偶然的机会中接触到了RobotFramework这个工具，并且觉得形式很新颖，一下就被吸引了，RobotFramework是一款python编写的功能自动化测试框架。具备良好的可扩展性，支持关键字驱动，可以同时测试多种类型的客户端或者接口，可以进行分布式测试执行，下面我们就进入正题吧！\n\n### 2 工具分析\n\n1.当我们把工具安装完成后，会在我们的桌面看到一个小图标，我们以后编写用例，就依赖他了（有感兴趣的小伙伴可以私聊我要安装过程，在此就不赘述了）：\n\n* 项目编辑区会展示我们已经创建的项目、用例和已经创建的关键字资源；这里的关键字可以为我们以后的用例带来很多方便，适用于写通用的逻辑，方便我们在用例编写时遇到相同的逻辑去调用；\n* 编写用例可以通过脚本编辑区与表格编辑区；\n* * 当鼠标定位到某条case时，会展示表格编辑区：和脚本编辑区一样只是一种是通过编写脚本的方式实现，一种是通过excel表格的方式来实现用例的编写；\n\n','1741690336719241218',0,0,5,_binary '\0',_binary '\0',0,'2024-01-01 13:20:08',NULL),('1741876633144438785','表格hooks封装和使用(Vue3)','表格是中后台频繁使用的组件，vue3提供了hooks写法能够大大减少代码量和提高复用性，以下是一个基于arco design vue组件库封装的表格hooks：**`useTable`**\n\n这个hooks相比于其他表格hooks的优点：\n\n* `api` 与`api 参数` 不分离，不会破坏原有的接口api\n* `api参数` 能够在外面进行过滤\n* 分页参数`pagin: { page, size }` 能够按需使用\n\n\n','1741873337587511297',0,0,5,_binary '\0',_binary '\0',0,'2024-01-02 01:38:47',NULL),('1741692173023281154','逻辑编程：上古人工智能语言Prolog','今天给大家介绍一种有趣的编程语言。\n\n它能够让计算机像侦探一样推理，像哲学家一样思考，这就是逻辑编程。\n\n逻辑编程就好比我们给计算机一个逻辑谜题，然后他通过一系列的推理，找到答案。\n\n## 1 逻辑编程是什么？\n\n### 1.1 逻辑编程的定义与特点\n\n想象一下，如果我们可以让计算机像人类一样思考和解决问题，那会是怎样的情景？逻辑编程就是这样一种尝试，它利用逻辑学的原理，使计算机能够进行推理和解决问题。\n\n我们只需要告诉计算机：“这是规则，这是事实，现在你告诉我答案。” 就像玩一个连环推理的游戏，每个线索都逐渐揭开谜题的一部分，最终揭示出整个故事。\n\n逻辑编程的特点是高度抽象，不关注如何操作，而是关注“什么是真的”。\n\n### 1.2 代表语言：Prolog\n\nProlog，即Programming in Logic，是逻辑编程的一种代表性语言。它的核心是事实和规则。让我们来看一下Prolog的基本语法：\n\n* 事实：在Prolog中，我们可以定义一些基本的事实。例如，philosopher(socrates). 表示“苏格拉底是哲学家”。\n* 规则：规则用于定义事实之间的关系。例如，mortal(X) :- philosopher(X). 表示“如果某人是哲学家，那么他必然是凡人”。X表示参数，大写的是变量，小写的是常量。符号 :- 表示推理关系，如果右边的表达式成立，左边的表达式也成立。\n* 查询：查询是向Prolog程序提出的问题。例如，?- mortal(socrates). 将询问“苏格拉底是凡人吗？”。?-是命令提示符，我们在后边输入要执行的命令，回车后执行并返回结果。\n\n注意所有语句的最后都用一个点（.）表示结束。\n\nProlog的魅力在于它的简洁和强大。我们不需要告诉计算机如何一步步解决问题，只需告诉它规则和事实，它就能自动进行逻辑推理，最终给我们答案。\n\n## 2 逻辑编程的应用领域\n\n### 2.1 专家系统\n\n专家系统是逻辑编程的一大应用，就像是拥有了一个专家顾问团队。它们可以帮助医生诊断疾病，或者帮助工程师设计复杂的机械结构。以医疗诊断为例，在Prolog中，我们可以定义一系列的症状和疾病之间的关系。例如：\n\n\n这条规则告诉计算机：“如果一个人有发烧和咳嗽的症状，那么他可能得了流感。”通过这样的规则，专家系统可以帮助医生诊断疾病。\n\n### 2.2 自然语言理解\n\n自然语言理解让计算机能够理解人类的语言。就像是给计算机装上了一副懂得人类语言的眼镜，它可以读懂你的邮件，理解你的指令。例如，我们可以用Prolog来解析句子的结构：\n\n\n这条规则可以帮助计算机理解“主语 + 谓语 + 宾语”的句子结构。通过这种方式，计算机可以更好地理解用户的输入。\n\n### 2.3 智能知识库\n\n智能知识库就像是一个巨大的电子大脑，存储着海量的信息。逻辑编程让这个大脑可以自己思考和推理，帮助我们从中找到需要的知识。例如，一个关于历史人物的知识库可能包含如下规则：\n\n\n通过这样的事实和规则，用户可以查询李小龙的出生地和参演过哪些电影。\n\n## 3 逻辑编程如何解决问题？\n\n### 3.1 建立模型\n\n解决问题的第一步是建立一个模型。就像是搭建一座桥梁，我们需要定义桥梁的结构和支撑点。在逻辑编程中，我们定义规则或限制条件，比如：“哲学家是凡人。”\n\n\n### 3.2 定义规则与事实\n\n接下来，我们在模型上添加规则和事实。如果说模型是桥梁的结构，那么规则和事实就像是桥梁上行驶的车辆。例如，我们声明：“苏格拉底、柏拉图、亚里士多德是哲学家。”\n\n\n### 3.3 推导与求解\n\n最后，我们提出问题，比如：“谁是凡人？”逻辑编程像是一个聪明的小侦探，它会自动推导逻辑，找出所有可能的答案，比如输出：“苏格拉底、柏拉图、亚里士多德。”\n\nProlog 有很多实现，本文以目前比较活跃的 SWI-Prolog 为例运行这个程序。\n\n需要先把规则和事实保存到一个文件中 mortal.pl，然后使用命令 consult 加载规则，最后执行 mortal(X). 获取结果，有多个答案时，我们输入分号（;)，Prolog会继续搜索直到所有可能的答案都被找到。\n\n\n','1741690336719241218',0,0,7,_binary '\0',_binary '\0',0,'2024-01-01 13:25:48',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='话题-标签 中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_post_tag`
--

LOCK TABLES `bms_post_tag` WRITE;
/*!40000 ALTER TABLE `bms_post_tag` DISABLE KEYS */;
INSERT INTO `bms_post_tag` VALUES (1,'1741690748406956033','1741690748339847170'),(2,'1741690748406956034','1741690748339847170'),(3,'1741691288155160578','1741691288088051713'),(4,'1741691857548705794','1741691857485791234'),(5,'1741691857548705795','1741691857485791234'),(6,'1741692173086195714','1741692173023281154'),(7,'1741692173086195715','1741692173023281154'),(8,'1741692720275095555','1741692720275095554'),(9,'1741692720275095556','1741692720275095554'),(10,'1741692720275095557','1741692720275095554'),(11,'1741695911695843330','1741695911695843329'),(12,'1741692720275095555','1741695911695843329'),(13,'1741852804053512194','1741852804053512193'),(14,'1741692720275095556','1741852804053512193'),(15,'1741692720275095555','1741874553721761793'),(16,'1741874553721761794','1741874553721761793'),(17,'1741692720275095555','1741876404592619522'),(18,'1741874553721761794','1741876404592619522'),(19,'1741695911695843330','1741876404592619522'),(20,'1741874553721761794','1741876633144438785'),(21,'1741692720275095555','1741876633144438785'),(22,'1741874553721761794','1741877385430609922'),(23,'1741877385430609923','1741877385430609922'),(24,'1741692720275095555','1741877385430609922'),(25,'1741877385430609923','1741994766085697537'),(26,'1741692720275095555','1741994766085697537'),(27,'1741999163377233921','1741999163314319362'),(28,'1741874553721761794','1741999163314319362'),(29,'1741695911695843330','1741999163314319362'),(30,'1741692720275095555','1742000487942631425'),(31,'1742000488009740289','1742000487942631425'),(32,'1741692720275095555','1742006994302185474'),(33,'1742012669703008258','1742012669703008257'),(34,'1742012669703008259','1742012669703008257'),(35,'1742012669703008260','1742012669703008257');
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
INSERT INTO `bms_tag` VALUES ('1741690748406956033','测试',1),('1741690748406956034','robotFramework',1),('1741691288155160578','Go GC',1),('1741691857548705794','云计算',1),('1741691857548705795','阿里巴巴',1),('1741692173086195714','Prolog',1),('1741692173086195715','语言',1),('1741692720275095555','前端',9),('1741692720275095556','后端',2),('1741692720275095557','Android',1),('1741695911695843330','vue.js',3),('1741852804053512194','python',1),('1741874553721761794','vue',5),('1741877385430609923','react',2),('1741999163377233921','面试',1),('1742000488009740289','it',1),('1742012669703008258','课程',1),('1742012669703008259','213',1),('1742012669703008260','23',1);
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
INSERT INTO `ums_user` VALUES ('1741690336719241218','admin','admin','e10adc3949ba59abbe56e057f20f883e','https://cdn.pixabay.com/photo/2021/11/12/03/04/woman-6787784_1280.png','2041733900@qq.com',NULL,5,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-01 13:18:30',NULL),('1741693016078385154','123456','123456','e10adc3949ba59abbe56e057f20f883e','https://picst.sunbangyan.cn/2023/12/26/96323189b21baf1e67ecfe6517f03f30.jpeg','2041733900@qq.com',NULL,3,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-01 13:29:09',NULL),('1741872872246259714','5757','5757','e10adc3949ba59abbe56e057f20f883e','https://pic1.zhimg.com/80/v2-008e7986913233b64728f52ab9b6a992_1440w.webp','2041733901@qq.com',NULL,3,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-02 01:23:50',NULL),('1741873337587511297','1234567','1234567','e10adc3949ba59abbe56e057f20f883e','https://picx.zhimg.com/80/v2-11821be103205aebc48a539e920d32f2_1440w.webp?source=1def8aca','2041733902@qq.com',NULL,2,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-02 01:25:41',NULL),('1741876776505749506','1234568','1234568','e10adc3949ba59abbe56e057f20f883e','https://picx.zhimg.com/80/v2-990ec007999b94f8203939de6d4dc6fd_1440w.webp?source=1def8aca','2041733903@qq.com',NULL,1,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-02 01:39:21',NULL),('1741994508131807234','1234569','1234569','e10adc3949ba59abbe56e057f20f883e','https://pic3.zhimg.com/80/v2-ea520574c676bf6d51772ac2d836dd2a_1440w.webp','2041733904@qq.com',NULL,1,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-02 09:27:10',NULL),('1741995739025813506','1234560','1234560','e10adc3949ba59abbe56e057f20f883e','https://pic4.zhimg.com/80/v2-bbc9e14ef36f3fbba52c0fa2050c19bf_1440w.webp','2041733990@qq.com',NULL,1,'','这个人很懒，什么都没有留下',_binary '',_binary '',NULL,'2024-01-02 09:32:04',NULL);
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

-- Dump completed on 2024-01-02 12:02:12
