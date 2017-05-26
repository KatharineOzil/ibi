-- MySQL dump 10.16  Distrib 10.1.14-MariaDB, for osx10.11 (x86_64)
--
-- Host: localhost    Database: ibi_new
-- ------------------------------------------------------
-- Server version	10.1.14-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 用户',7,'add_userprofile'),(20,'Can change 用户',7,'change_userprofile'),(21,'Can delete 用户',7,'delete_userprofile'),(22,'Can add 研究工具',8,'add_tools'),(23,'Can change 研究工具',8,'change_tools'),(24,'Can delete 研究工具',8,'delete_tools'),(25,'Can add 公告通知',9,'add_announcement'),(26,'Can change 公告通知',9,'change_announcement'),(27,'Can delete 公告通知',9,'delete_announcement'),(28,'Can add 动态',10,'add_news'),(29,'Can change 动态',10,'change_news'),(30,'Can delete 动态',10,'delete_news'),(31,'Can add 研究室',11,'add_lab'),(32,'Can change 研究室',11,'change_lab'),(33,'Can delete 研究室',11,'delete_lab');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$sgDy51P4CA8Q$dC3zE4ZyaZcNBmjMHnMzGrdPJEGsvnpIRin8Ifxk/+o=','2017-04-11 12:18:04.561941',1,'admin','','','xiezy@cqupt.edu.cn',1,1,'2017-04-11 12:09:20.994613');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_announcement`
--

DROP TABLE IF EXISTS `blog_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_announcement`
--

LOCK TABLES `blog_announcement` WRITE;
/*!40000 ALTER TABLE `blog_announcement` DISABLE KEYS */;
INSERT INTO `blog_announcement` VALUES (1,'2014年3月3日下午4点学院进行实验室安全检查，请各研究室进行安全隐患排查工作，迎接检查！','2017-04-11 12:21:00.000000');
/*!40000 ALTER TABLE `blog_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_lab`
--

DROP TABLE IF EXISTS `blog_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `direction` longtext NOT NULL,
  `direction_en` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_lab`
--

LOCK TABLES `blog_lab` WRITE;
/*!40000 ALTER TABLE `blog_lab` DISABLE KEYS */;
INSERT INTO `blog_lab` VALUES (1,'分子进化研究室','Molecular Evolution','功能基因组学与分子进化，三峡库区生物多样性','Functional genomics, molecular evolution, biodiversity in Three Gorges'),(2,'计算机辅助药物设计研究室','Computer-aided Drug Molecule Design','DNA光损伤与修复模拟','Simulation of light injury and repair of DNA'),(3,'生物医学数据挖掘与可视化研究室','Biomedicine Data Mining and Visualization','基因表达调控网络研究','Study of gene expression regulating network'),(4,'生物信息学算法研究室','Bioinformatics Algorithm','分子动力学模拟研究','Simulation of molecular dynamics');
/*!40000 ALTER TABLE `blog_lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_lab_user`
--

DROP TABLE IF EXISTS `blog_lab_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_lab_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_lab_user_lab_id_userprofile_id_90e62004_uniq` (`lab_id`,`userprofile_id`),
  KEY `blog_lab_user_userprofile_id_44083925_fk_blog_userprofile_id` (`userprofile_id`),
  CONSTRAINT `blog_lab_user_lab_id_fa9b8a8e_fk_blog_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `blog_lab` (`id`),
  CONSTRAINT `blog_lab_user_userprofile_id_44083925_fk_blog_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `blog_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_lab_user`
--

LOCK TABLES `blog_lab_user` WRITE;
/*!40000 ALTER TABLE `blog_lab_user` DISABLE KEYS */;
INSERT INTO `blog_lab_user` VALUES (2,1,2),(4,1,5),(1,1,8),(3,1,10),(7,2,6),(5,2,9),(6,2,12),(8,3,3),(9,3,7),(10,4,11),(11,4,13);
/*!40000 ALTER TABLE `blog_lab_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_news`
--

DROP TABLE IF EXISTS `blog_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `name` varchar(200) NOT NULL,
  `host` varchar(200) NOT NULL,
  `organizers` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `lec_time` datetime(6) NOT NULL,
  `presenter_detail` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_news`
--

LOCK TABLES `blog_news` WRITE;
/*!40000 ALTER TABLE `blog_news` DISABLE KEYS */;
INSERT INTO `blog_news` VALUES (1,'生物电阻抗人体成分分析方法','人体成分是影响人们健康的重要因素。可用于营养状况和相关疾病的研究；评价人体生长发育、成熟情况以及老化进程；在体育运动中安排合理训练，提高竞赛成绩；指导健美和减肥锻炼等。生物电阻抗分析（BIA）根据人体不同组成成分，如脂肪和非脂肪组织，的电阻抗特性差异，通过放置于体表的电极向人体施加微小的交流测量电流，提取人体阻抗信息，进行人体脂肪含量测定和体成分分析，是一种无创、安全，价廉、人们易于接受的人体成分分析方法。报告将在介绍BIA发展动态的基础上，重点讲述生物电阻抗技术用于人体成分分析的原理，技术现状，应用特点，产品开发和其诱人的发展前景。欢迎全校所有感兴趣的老师、同学们参加!','中国医学科学院任超世（博导）','蔡应繁副院长','生物学院','生物医学工程中心会议室','2009-04-29 08:00:00.000000','','2017-04-11 12:34:00.000000',''),(2,'名贵中药材鉴别研究 中药生物信息研究 等三场','1.名贵中药材鉴别研究\r\n2.全新鉴定体系--药用植物DNA条形码\r\n3.中药生物信息研究。','陈新滋（院士）陈士林 博士','','','第二国际会议厅','2009-05-31 06:30:00.000000','陈新滋 院士  现任香港理工大学副校长、有机化学家。 1975年毕业于日本东京国际基督教大学化学系。1979年获美国芝加哥大学博士学位。曾任美国Monsanto公司高级研究专家。2001年当选为中国科学院院士。  他主要从事手性催化配体和不对称合成研究领域的工作，在均相氢化不对称合成反应历程研究中发现了新的机理；研究开发了手性药物萘普森的不对称合成并达到工业化；在手性催化配体和催化剂的研究中发现了螺环氧膦配体、胺膦配体、联吡啶氧膦配体等高性能的配体和催化剂，取得多项中国和美国专利。\r\n陈士林 博士 中国医学科学院药用植物研究所所长、教授、博士生导师；WHO传统医学合作中心主任；曾在英国皇家植物园Kew接受专业培训;2000-2005年担任香港理工大学访问教授等。现兼任教育部“中药资源研究工程中心”主任；中国野生植物保护协会野生药用植物保育委员会主席等。 　　享受国务院政府特殊津贴奖励，担任《中草药》、《亚太传统医药》、《世界科学技术》、《现代中药》副主编或副主任委员，《中国中药杂志》、《Journal of Chinese Pharmaceutical Science》、《中国现代中药》、《中药材》等杂志编委，获得5项国家及省部级科技成果奖，“道地药材三维鉴定及产地适宜性研究”获的国家科技进步2等奖；主编《中药资源可持续利用导论》等3部书籍，国内外杂志发表研究论文120余篇。多次到意大利、美国、英国、秘鲁、巴基斯坦等国交流学习。','2017-04-11 12:38:00.000000',''),(3,'在国际期刊上发表研究成果','Research is an important component of high education. Publishing the results of your research, or reporting your research results to the community, is part of your research activity. In addition to have some good research results, writing a good manuscript is important for any publications of your results. In this seminar, I will focus on international journals and present the following content:     how to organize your research results for a publication in an international journal.   how to write a good manuscript in English to present your results to readers. In addition, I will also talk about how to select possible reviewers for your manuscript and how to write a response letter after your manuscript is reviewed.','豆育升 博士/教授','','科技处   网络与计算研究中心','2215','2009-06-03 08:00:00.000000','豆育升教授，英国牛津大学化学系博士，先后在美国宾夕法尼亚州立大学，德克萨斯A&M大学以及普林斯顿大学进行博士后研究，2004年成为美国Nicholls州立大学物理科学系助理教授，2006年受聘为重庆邮电大学教授。豆育升教授主要从事光化学反应的动力学和生物大分子激光解析的计算机模拟研究，已在国际著名期刊发表论文70余篇，其中一些论文被引用次数超过100次。豆育升教授是 “The open Surface Science Journal” 编委并经常为国际著名期刊，例如 “Journal of Physical Chemistry”, “Chemical Physics” 和“Journal of Organic Physics”审稿，也曾受邀为“Journa l of Physical Chemistry” 写稿。','2017-04-11 12:40:00.000000',''),(4,'生物医学问题中的信息技术','','电子科技大学尧德中教授','','','第二国际会议厅（信科大厦3楼）','2009-10-22 07:00:00.000000','尧德中教授：博士、教授、长江学者，国家杰出青年基金获得者，全国优秀教师，新世纪百千万人才工程国家级人选。现任电子科技大学生命科学与技术学院院长，神经信息教育部重点实验室主任；历任 Phys Med Biol, Int J Mag Reson Imag 等刊物编委, 国家自然科学基金委员会生命学部第十届专家组成员，中国生物医学工程学会常务理事等。尧德中教授一直致力于神经信息的分析方法与技术的研究，以及新方法技术在脑功能和脑疾病问题上的应用研究。已完成自然基金重点项目 1 项、 973课题1项、自然基金面上项目多项。目前承担有国家杰出青年基金、国家自然基金重点、863 课题等多项科研项目。通过这些课题，尧德中教授对脑电从源模型到成像的理论与算法进行了比较系统性的创新研究，发展了多种创新的方法技术，并在脑机交互、脑波音乐、癫痫定位和脑认知等方面进行探索性的研究。目前已在国外重要刊物上发表SCI检索的论文 80 余篇，他引近 300 次。','2017-04-11 12:42:00.000000',''),(5,'运动系统脑功能网络研究','','电子科技大学陈华富教授','','','第二国际会议厅（信科大厦3楼）','2009-10-22 08:30:00.000000','陈华富教授：博士、教授、博士生导师，教育部新世纪人才计划和霍英东青年基金获得者。 陈华富教授主要从事功能磁共振成像方法及应用研究，包括神经网络方法在功能磁共振数据处理中的应用；同步脑电和功能磁共振成像方法及在癫痫活动探测中的应用；功能磁共振成像在认知科学中的研究；功能磁共振数据处理方法在神经精神疾病中的应用研究。承担了4项国家自然科学基金项目、3项教育部霍英东青年基金项目、新世纪优秀人才支持计划和科学技术重点项目等10余项科研项目, 参与了国家973和863等科研项目。在功能磁共振成像数据处理方法及应用方面，进行了比较系统性的创新研究；同时结合MRI和脑电在癫痫活动探测等方面也进行了创新性的研究。已在国外重要刊物IEEE Trans Medical imaging , IEEE Trans Biomedical  Engineering, The American Journal of Psychiatry，NeuroImage,等上发表SCI检索的论文40篇，参编国外英文专著2部，获得四川省科技进步奖1次。','2017-04-11 12:42:00.000000',''),(6,'CI and Cro-Like Repressors Regulate Virulence Factors in Streptococcus mutans, a Cariogenic Dental Pathogen','','美国俄克拉荷马大学健康科学中心牛国清博士','','','2115','2009-11-03 08:00:00.000000','牛国清博士：美国俄克拉荷马大学健康科学中心，牙医学院口腔生物系，博士后。从事分子微生物研究，涉及口腔生物膜中变形链球菌的遗传和生化研究，链霉菌次生代谢的研究，以及抗菌肽的基因工程等多个领域。在Journal of Bacteriology，Molecular Microbiology，Current Microbiology，Metabolic Engineering等国际刊物发表SCI论文5篇。获得中国科学院地奥奖学金一等奖和中国科学院微生物研究所所长奖学金一等奖。','2017-04-11 12:45:00.000000',''),(7,'EIT实用化应用研究与关键技术','','任超世教授','','','一教生物医学工程研究中心','2009-11-06 08:00:00.000000','任超世教授：1965年毕业于四川大学。现为中国医学科学院生物医学工程研究所研究员，中国协和医科大学博士生导师，享受政府特殊津贴。主要从事生物医学信息检测与处理，医学电子工程等研究与产品开发工作。曾获国家发明四等奖。1993至1994年由国家教委公派，以高级访问学者身份在意大利罗马大学生物医学中心工作一年。担任全国医用电器标准化技术委员会委员；全国大型医用设备应用技术评审委员会委员；中国电子学会生命电子学分会常务理事；中国电子学会生物医学电子学分会委员；中国生物医学工程学会测量专业学会生物电阻抗学组副主任；四川大学人机系统及仿生工程重点实验室学术委员会副主任；《中华医学研究杂志》常务编委；《中国生物医学工程学报》编委；《国际生物医学工程杂志》编委；《世界华人消化杂志》编委；《中国医学装备》编委等职。','2017-04-11 12:47:00.000000',''),(8,'新型交叉学科专业下的学习-解读生物信息学院','','李章勇博士','','','2100','2009-11-20 11:00:00.000000','李章勇，男，1976年8月生，重庆潼南人，博士，副教授，硕士生导师。重庆邮电大学生物医学信息工程研究所所长，重庆邮电大学生物医学工程研究中心副主任，重庆邮电大学生物信息学院副院长，中国生物医学工程学会会员、重庆市生物医学工程学会常务理事，中国电子学会高级会员。1999年毕业于西安交通大学生物医学工程专业，2004年博士毕业于重庆医科大学生物医学工程专业，2005年12月至2007年11月于中国医学科学院、中国协和医科大学完成博士后研究。\r\n研究领域（带领的科研团队）：1、生物医学信息处理。主要从事心脏电生理信号源的分解与分离研究，生物阻抗胃动力信息(包括信号和阻抗断层重建信息处理)提取与功能评价研究，麻醉深度检测技术和评价新方法研究，生命信息检测新技术探索等。\r\n2、数字化医疗仪器设计。包括胃动力评价装置，手术动力新技术及其装置，多频人体成份分析装置，自主式体表胃起博装置。\r\n3、电磁辐射和环保评测。主要包括2G－3G基站辐射建模，辐射生物效应，空间辐射分布解决方案。\r\n4、数字化病房关键技术。包括医疗仪器总线技术，医疗设备短距离无线自组网技术，无线传感器及其传感器网，设备控制和组态控制技术。\r\n5、医疗仪器可靠性研究。包括数字医疗设备可靠性检测技术，医疗仪器可靠性基础理论和实验方法，可靠性标准研究，实验数据高速采集和实验自动化控制技术。\r\n连续主持多项国家、省部级重点科技项目。主持国家自然科学基金项目“基于生物阻抗技术测量胃动力信息和胃动力评价方法研究，编号：60471041”，主持国家自然科学基金项目“胃动力三维信息检测与电极耦合传导机制评价方法研究，编号：60901045”；主持重庆市科技攻关计划项目“阻抗胃动力检测设备，编号：CSTC2009AC5149”，重庆市重大科技攻关计划项目 “智能手术动力装置开发和产业化，编号：CSTC2007AA5011”以及重庆市经委“产学研”重大专项；另主持重庆市教委项目2项，重庆市卫生局项目2项。重庆市首批科技特派员资助计划获得者。近年来，主编出版国家“十一五”规划教材1部，获国家软件著作权1项，专利申报2件。主编专著一部，参编著作2部，发表论文60余篇，三大检索20余篇。作为项目申报人主持2009年中央与地方共建实验室“生物与生命信息实验室”建设；主持重庆市、学校多项教育教学改革课题。获国家教学成果二等奖1件。','2017-04-11 12:48:00.000000',''),(9,'蛋白组学信息学研究','','军事医学科学院朱云平博士','','','第二国际会议厅','2009-11-20 06:00:00.000000','朱云平博士：军事医学科学院放射与辐射医学研究所研究员、学委会委员，基因组学与蛋白质组学研究室主任，兼北京蛋白质组研究中心（蛋白质组学国家重点实验室）生物信息学研究室主任。中国生物化学与分子生物学学会蛋白质组学专业委员会委员，研究方向为蛋白质组生物信息学及系统生物学，已在Mol. Cell. Proteomics、EMBO、Cancer Research、Proteomics、BMC Bioinformatics等核心期刊发表论文二十余篇。近5年来承担了4项国家973、863课题及1项北京市重大基础研究课题，使得本课题组成为在蛋白质组生物信息学领域国内最重要的团队之一。在大规模蛋白质组数据质量控制、不同实验室来源数据整合和标准建立、蛋白质组数据库构建、蛋白质相互作用网络分析方法研究、大规模蛋白质组数据分析策略等方面已经形成了可应用的技术体系和软件平台，形成的技术平台体系、培养的人才队伍对蛋白质组学研究起到很好的基础支撑作用，为保证我国在国际人类肝脏蛋白质组计划的领导地位起到了重要作用。','2017-04-11 12:49:00.000000',''),(10,'拟南芥SPA1与光敏色素B互作的分子机理研究','主讲内容：主要介绍模式植物拟南芥光信号转导途径中SPA1与光敏色素B互作的分子机理研究。SPA1（Suppressor of photochrome A-105）编码一种与COP1结构很相似的蛋白，它在各种光线条件下对光信号起抑制作用。HFR1位于SPA1的下游，能与SPA1相互作用；在各种光线条件下的spa1突变体中，HFR1蛋白能积累较高的水平，而其转录水平仅在黑暗和远红光条件下有所增加。SPA1与光敏色素B互作的分子机理研究具有重要的意义。','中国农业科学院作物科学研究所杨建平教授','','','第二国际会议厅','2010-01-14 12:30:00.000000','杨建平教授，博士、研究员、博士生导师，目前主要从事植物发育生物学、作物光信号转导途径相关基因克隆及其在育种上的应用研究。2000年7月获浙江大学博士学位。在康奈尔大学Boyce Thompson植物研究所做博士后期间，发表有关拟南芥光信号转导的文章四篇，其中三篇为第一作者：一篇发表Plant cell上，两篇发表在Plant Journal上，还有一篇合作文章（第四作者）发表在Genes & Development上。2006年回国加入到中国农业科学院作物科学研究所，现为创新岗位人才，主持自然科学基金、科技部“863”、转基因重大专项和农业部“948”等项目。','2017-04-11 12:49:00.000000',''),(11,'植物抗逆分子机理研究','主讲内容：主要介绍利用组织特异性rna干扰等分子生物学技术对番茄及水稻抗紫外线相关基因hp1、hp2和ddb1、ddb2功能进行深入研究，探明番茄hp1、hp2基因对番茄果实色素积累的分子调控机制以及水稻抗紫外应答的机理；对水稻抗盐相关基因siege1选择性剪接的调控机制及生物学功能进行鉴定，阐明水稻抗逆应答反应与基因选择性剪接之间的关联；以四川地区优异的抗稻瘟病水稻种质资源谷梅2号及9914为材料构建分离群体，分离稻瘟病抗性基因，探明水稻抗稻瘟病的分子机理。','四川大学生命科学院刘永胜教授','','','第二国际会议厅','2010-01-14 11:30:00.000000','刘永胜：教授，博士生导师，国家杰出青年基金获得者、美国康乃尔大学留学、四川大学“西南资源环境与灾害防治”科技创新平台“生物资源与生态环境研究中心”副主任、四川省生化与分子生物学会理事、四川省生物技术协会理事、美国植物生理学会个人会员。主要致力于水稻复杂农艺性状基因分离和功能研究、番茄色素积累的分子调控机制及转基因生物安全等研究工作。在研项目有振兴计划“985”人才引进科研启动项目：复杂农艺性状基因分离及功能分析（0082204127106）；国家重点基础研究发展计划（973计划）“农业生物多样性控制病虫害和保护种质资源的原理和方法”（2006cb100205）子课题：水稻品种资源及其持久利用的分子遗传机理； 四川省招标项目：水稻特异基因资源发掘与突破性新材料创制； 四川省应用基础项目：水稻有色米色素调控基因的分离及应用研究（2006j13-080）； 教育部留学归国人员启动基金：t-dna插入导致番茄土豆型叶片基因的分离。','2017-04-11 12:50:00.000000',''),(12,'基因功能研究方法','主要结合自己11年在泌尿系肿瘤的基因功能研究方面的经验和目前基因功能研究方法的最新进展与老师和学生们进行交流，为今后校际合作，联合课题申报，联合培养研究生打下良好的基础。','北京大学泌尿外科研究所刘武江博士','','','第二国际会议厅','2010-01-14 12:51:00.000000','刘武江，男，1971 年生于四川广安，现年39 岁。1993年毕业于重庆医科大学，1993-1999工作于重庆邮电学院，1999年以优异成绩考入北京医科大学外科学（泌尿外科专业）攻读硕士研究生，2001年提前一年硕士毕业，直接攻读博士学位，师从著名泌尿外科学家郭应禄院士。2004年博士毕业取得博士学位后应美国爱荷华大学之邀，以高级访问学者身份在美国爱荷华大学泌尿外科实验室进行博士后研究。完成博士后训练后以专家身份受聘于加州大学旧金山分校泌尿外科肿瘤研究中心。2010年3月回国，以优秀人才引进入北京大学泌尿外科研究所任副研究员，副教授。目前主要研究领域是泌尿肿瘤的基因克隆及功能研究，小RNA活化基因表达的机理研究。以第一作者身份发表文章于J IMMUNOLOY, J ANTOINMUNITY (SCI>7), CII 等专业杂志，获得国际同行的认可，入选美国免疫学学会会员，美国泌尿协会会员，美国间质性膀胱炎协会会员。','2017-04-11 12:51:00.000000',''),(13,'Cardiac flow analysis based on phase contrast MRI','','澳大利亚皇家墨尔本理工大学 Kelvin Wong博士','','','一教生物医学工程研究中心会议室','2010-07-14 03:00:00.000000','Dr Wong currently supervises undergraduates and postgraduates on deciphering, visualization and analysis of cardiac flow activities. The projects mainly focus on simulation of cardiac flow through stenosed coronary arteries and carotid bifurcation at different geometrical configurations.\r\nDr Wong‘s broad and varied expertise with fluid mechanics and image processing in the biomedical engineering discipline have also been recognised internationally. He has given talks and presentations at other universities and research institutes and achieved successful collaborations with some of these organisations. \r\nHe currently serves as a co-editor of the Journal of Mechanics in Medicine and Biology (JMMB), and an academic editor of Public Library of Science (PLoS ONE) journal, the editor at International Journal of Mathematics and Statistics, and also as reviewer for the Open Journal of Cardiovascular Surgery, and Cardiovascular Engineering and Technology, respectively','2017-04-11 12:51:00.000000',''),(14,'基因引领未来','10月29日下午，应生物学院邀请，深圳华大基因研究院动植物基因组总监王军一应邀来校访问，做客“文峰论坛•60周年校庆系列学术讲座”，在逸夫科技楼学术报告厅为我校师生作了题为《基因引领未来》的学术报告。在校期间，校长陈流汀会见了王军一，双方就进一步加强合作的有关事宜进行了友好交流。深圳华大基因研究院先后承担并完成了国际人类基因组计划“中国部分”（1%）、水稻基因组计划、家蚕基因组计划等多项国际尖端科研项目，为中国和世界基因组科学的发展做出了突出贡献，奠定了中国在该领域研究的世界领先地位。王军一系博士，历任该院动植物基因组技术支持、大区经理、总监助理等职。他主要从事生物信息学研究，是“千种动植物基因组”计划第一期总负责人，具有深厚的生物信息分析能力和丰富的大基因组项目研究经验。报告会上，王军一以前瞻的视角、深厚的功底、风趣的语言，从研究意义、测序策略、组装历程和未来方向四个方面入手，深入分析了影响基因组组装的主要因素，详细展现了基因组序列图谱的重要应用，并对“千种动植物基因组”计划的科学意义、研究进度和未来发展等情况进行了全面介绍。整个报告紧跟前沿、信息量大、见解独到，使在座师生对基因组研究的历史、现状和未来有了全面了解，同时也激发了他们基因科学的浓厚兴趣，赢得了阵阵掌声。','深圳华大基因研究院王军一博士','','','逸夫科技楼学术报告厅','2010-10-29 07:00:00.000000','','2017-04-11 12:52:00.000000',''),(15,'美国大学的化学、生物专业教育介绍','介绍美国大学的化学、生物类专业的教育、教学特点，人才培养模式。','豆育升教授','','','一教学楼一楼生物医学工程会议室','2011-06-22 08:00:00.000000','豆育升教授，博士生导师，主要从事光化学反应的动力学模拟研究。1998年毕业于英国牛津大学化学系获博士学位，先后在美国宾夕法尼亚州立大学，德克萨斯A&M大学以及普林斯顿大学进行博士后研究，2004年起在美国Nicholls州立大学先后任助理教授和副教授，2006年受聘为重庆邮电大学教授。','2017-04-11 12:53:00.000000',''),(16,'The New Paradigm of Biology: Roles of Genomics and Bioinformatics','DNA sequencing technology is not only used for generate DNA and RNA sequences but also for probing chromosome structures, gene expressions, and DNA modifications. At the mean time, the beginning of the Personalized Genomics Era has been marked this year. Genomic data are being accumulated in an astronomical speed. What should we do to face all the challenges of data analysis and interpretations? Under what framework are we able to organize our thoughts and concepts.','于军博士','','','第二国际会议厅','2011-12-16 08:00:00.000000','于军，1978年考入吉林大学化学系生物化学专业，1983年考入中科院生物物理所攻读研究生，同期获CUSBEA奖学金资助于1984年赴美国纽约大学医学院攻读博士，1990年获得博士学位，并获全美泌尿科疾病基金博士奖。同年，获聘美国纽约大学医学院泌尿系研究助理教授。\\r\\n\\r\\n1993年，国际人类基因组计划兴起，于军博士转往美国华盛顿大学参与筹建基因组中心工作。与此同时，于军博士希望中国作为正式成员国参加国际人类基因组计划，并于1998年放弃了美国的工作回国，与几位志同道合的同事在非常艰苦的条件下创建了中国科学院遗传研究所人类基因组中心，开始培训技术骨干并争取到国际人类基因组计划百分之一的任务在中国展开。2007年，中国科学院正式建立北京基因组研究所，于军博士任研究员和副所长至今。于军博士先后参与并主持了国际人类基因组计划（中国部分），超级杂交水稻基因组计划，家蚕基因组计划等重大科学研究项目。迄今已在包括《Nature》、《Science》和《PLoS Biology》等主要国际杂志发表科学论文近二百篇，发表科学专著逾二十余本（章），其中包括《分子细胞学和分子医学大百科全书》和《中国特色的创新》等书的重要章节。于军博士还在十余个专业杂志担任主编或副主编。于军博士在中国孜孜教学，不仅所教课程成为精品课，而且迄今为止已经为中国科学院、浙江大学和中国农业大学等共培养博士和硕士研究生逾百人。于军博士自2006年起一直担任中国科技部国家重大科学研究计划（973）的首席科学家。2002年获得国家自然科学基金委“杰出青年奖”（B类），获得中国科学院“百人计划”支持，2002年获得香港求是科技基金会 “求是杰出科技成就集体奖”，被国际著名的《科学美国人》杂志评选为首届年度全球科研领袖，2003年获中国科学院杰出科技成就奖（集体奖）。','2017-04-11 12:54:00.000000',''),(17,'大规模蛋白质相互作用网络的知识挖掘','随着人类蛋白质组研究的顺利推进，有关蛋白质相互作用的数据越来越多。利用计算机工具，从这些复杂的数据中发现知识，研究整个基因组蛋白质之间的相互作用，将是未来蛋白质组学研究的重点方向。','军事医学科学院朱云平博士','','','4307','2011-12-30 08:00:00.000000','朱云平  重庆邮电大学特聘教授，男，1969年12月出生，军事医学科学院放射医学研究所研究员，基因组学与蛋白质组学研究室主任。1991年毕业于国防科技大学应用物理系，1994年于军事医学科学院获医学硕士学位。1994年至2000年8月在军事医学科学院放射医学研究所从事辐射防护研究工作，2000年9月起在基因组学与蛋白质组学研究室从事生物信息学工作，参与了多项863、973及自然科学基金课题的研究，建立、完善了基于本地和Web的生物信息学综合分析体系，构建了蛋白质组二维电泳数据库、SNP发掘流 程监控系统和SNP数据库，完成了军医科院科研创新启动基金课题“生物信息学计算环境的研究”。目前是973课题“蛋白质组的生物信息学研究与系列数据库 的建立”（课题编号：2001CB510209）负责人以及863课题“蛋白质组数据库的建立及生物信息学研究”（课题编号：2002- BA711A11）负责人。已发表论文二十余篇，获国家科技进步成果三等奖一项、军队科技进步成果二等奖一项。','2017-04-11 12:54:00.000000',''),(18,'蛋白质折叠问题---从Levinthal佯谬到蛋白质结构预测','生物信息学是现代生命科学与信息科学、计算机科学、数学、统计学、物理学、化学等学科相互渗透而高度交叉形成的一门新兴前沿学科。蛋白质折叠技术是生物工程的新“单元操作”，是生命科学领域的前沿课题之一。应用生物信息学技术研究蛋白质折叠问题，预测蛋白质结构与功能是后基因组时代的一项重要任务。本报告介绍蛋白质折叠问题研究的基本方法及进展，并对蛋白质预测技术的前景进行展望。','清华大学王志新院士','','','第三国际会议厅','2012-04-27 08:00:00.000000','王志新(1953年8月10日—)，出生于北京。生物信息学家、生物化学家、生物物理学家。1997年当选为中国科学院院士。1998年加入九三学社。他取得的重要研究成果有创造性地将统计力学应用于酶学研究，所有非解-聚合的别构酶模型给出了统一的理论框架；系统地研究了酶的抑制、激活作用机制及动力学等。\r\n学历：1973-1977: 清华大学化学与化学工程系，学生\r\n1982-1988: 中国科学院生物物理研究所，研究生（1988年获理学博士学位）\r\n工作经历：1977 -1981： 清华大学化学与化学工程系，助教\r\n1988 -1989： 中国科学院生物物理研究所，副研究员\r\n1989 -1991： 美国康乃尔大学化学系，博士后 \r\n1991 -1993： 美国北达哥他州立大学生物化学系，研究助理\r\n1993 -2003： 中国科学院生物物理研究所，研究员\r\n1995 -1999： 中国科学院生物物理研究所，副所长 \r\n1999 -2003： 中国科学院生物物理研究所，所长 \r\n1997 -2003： 北京生物大分子国家重点实验室，主任 \r\n2003 -至今 清华大学生命科学学院，教授  研究方向：生物信息学；分子酶学','2017-04-11 12:55:00.000000',''),(19,'AMPK别构调节的结构基础','在每个人的身体里都有这样一杆 “天秤”———它能帮助人体科学地均衡能量的摄入和消耗，运用自我调控远离肥胖、保持健康。蛋白激酶AMPK能够使这杆“天秤”保持平衡，它不仅能够调控大脑对摄食的指令，还能够调节器官对能量的消耗。在各种减肥方法和药物漫天飞舞的当今社会，研究保持“能量天秤”平衡的 AMPK显得尤其重要。吴嘉炜教授通过多年努力，提出了一个新的AMPK活力调控模型。此项研究成果对于糖尿病、肥胖症的治疗意义重大，受到学术界的广泛关注。本报告通过对AMPK 别构调节的结构基础的研究方法、进展介绍，并分享吴教授的成功经验、亲身经历和人生体悟。','清华大学吴嘉炜教授','','','第三国际会议厅','2012-04-27 09:00:00.000000','吴嘉炜，教授、博士生导师。现任清华大学生命科学学院，教授。国家杰青获得者，长江学者，第八届“中国青年女科学家奖”获得者。1994年毕业于南京大学基础学科教育强化部，1999年获中国科学院生物物理研究所理学博士学位，博士论文入选2001年全国百篇优秀博士学位论文，1999年～2003年在美国普林斯顿大学分子生物学系从事博士后研究 ，2003年回国后受聘于清华大学生命科学学院，组建结构生物化学实验室。长期从事生物大分子结构生物学研究，在蛋白质分子的微观结构基础上研究其调控机制，为药物研发提供坚实的理论基础，先后在Nature,Cell，MolCellProteomics，J.Biol.Chem.等重要国际学术期刊上发表文章40余篇。\r\n研究方向：生物大分子的结构生物化学研究： 糖尿病、肥胖症等疾病中关键蛋白的结构和功能研究；Wnt信号转导中骨架蛋白Axin及其相互作用蛋白的研究；  MAPK信号通路中激酶和磷酸酶活力调控的分子机制；TGF-b信号通路中Smad蛋白的泛素化降解机制。','2017-04-11 12:56:00.000000',''),(20,'生物医药研发的新进展：应用生物信息学与高通量免疫筛选相结合进行新型抗原标靶的选择','','陈平博士','','','逸夫楼学术报告厅','2013-04-16 06:00:00.000000','陈平，男，博士，美国华人生物医药科技协会（Chinese Biopharmaceutical Association-USA ，CBA）终身会员，董事会董事， 2012年当选为CBA侯任会长，世界领先的基因分子医药和遗传分子疫苗领域的专家。1983年在重庆工商大学（渝州大学）获生物学学位， 1987年在中科院发育生物学研究所获硕士学位，1994年在犹他大学获博士学位。1996年受聘为美国吉维克（Gen Vec）生物技术公司科学家（吉维克生物技术公司是全球领先的以腺病毒基因载体尖端技术平台为基础的生物技术公司），历任该公司的科学家，主研科学家，研发部经理，是腺病毒基因载体技术和生物遗传分子疫苗技术产品研发和项目管理专家。作为骨干科学家，陈平博士参与开发了新血清型腺病毒载体并正被用于由瑞士诺华药业公司 (Novartis) 投资2.14亿美金的治疗耳聋的分子医药的开发，参与并主持了与美国海军医学研究中心合作进行的总投入高达上千万美元的新型疟疾分子疫苗的研发项目，将多抗原疟疾分子疫苗推进到GMP生产以用于临床实验。目前，与美国海军医学研究中心合作，正在应用生物信息学和基因组学结合高通量分子载体技术进行原创型新抗原标靶的研发。陈平博士有着15年美国生物科技公司的管理及产品研发工作经验，致力于将创新型生物分子医药的研发转化为新型医药产业。2009年，陈平博士主导创办并兼任美国 NoeGen Inc 生物软件公司的执行总裁和首席科学家，主持开发了具有自主知识产权的配有数据库的高通量分子克隆软件，为研究新一代生物信息工程软件提供了重要指导。','2017-04-11 12:57:00.000000',''),(21,'Negative regulation of signaling and B cell-mediated autoimmunity','','Dr. Wenxia Song','','','逸夫楼学术报告厅','2013-04-16 06:00:00.000000','Dr. Wenxia Song is currently a tenured professor of cell biology and immunology in University of Maryland, College Park. She received her B.S. in Biochemistry from Julin University at Changchun, China, and her M.Sc. in cell biology from Institute of Biophysics, Chinese Academy of Sciences. She received Ph.D. from Kansas State University in 1991 and her Ph.D. research focused on the interaction of glycolipids nd signaling receptors. She obtained post-doctoral training at University of California, San Francisco and Northwestern University, working on antibody production and transport across the epithelium. She joined the faculty of Department of Cell Biology & Molecular Genetics at University of Maryland in 1996. Dr. Song’s research interests are the molecular and cellular mechanisms underlying the induction and regulation of B lymphocyte-mediate antibody responses and applications of the mechanistic knowledge for developing vaccines for infectious diseases and treatments for autoimmune diseases. She has authored and co-uthored more than 50 peer-reviewed publications and her research has been supported by US National Institute of Health, Food and Drug Administration, Department of Agriculture, American Heart Association, and Maryland Stem Cell Research Fund.','2017-04-11 12:57:00.000000','');
/*!40000 ALTER TABLE `blog_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tools`
--

DROP TABLE IF EXISTS `blog_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `text_en` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tools`
--

LOCK TABLES `blog_tools` WRITE;
/*!40000 ALTER TABLE `blog_tools` DISABLE KEYS */;
INSERT INTO `blog_tools` VALUES (1,'种子发育相关基因数据库','Seed-related Gene DataBase','http://ibi.cqupt.edu.cn/sgdb/','http://ibi.cqupt.edu.cn/sgdb/','2017-04-11 12:21:00.000000',''),(2,'点矩阵序列比对算法','Implementation of dot matrix alignment algorithm','Sequence alignment is an important field of bioinformatics research, which is mainly used to analyze the homology of DNA or protein sequences. This paper proposes a new alignment algorithm named ‘dot matrix alignment algorithm’, which is different to the traditional dynamic programming algorithm. This new algorithm is implemented in C language by path assembling to get the optimal alignment. This algorithm can find out the optimal sequence alignment in one cycle and gives the same result with dynamic programming algorithm, which needs backtracking process.','Sequence alignment is an important field of bioinformatics research, which is mainly used to analyze the homology of DNA or protein sequences. This paper proposes a new alignment algorithm named ‘dot matrix alignment algorithm’, which is different to the traditional dynamic programming algorithm. This new algorithm is implemented in C language by path assembling to get the optimal alignment. This algorithm can find out the optimal sequence alignment in one cycle and gives the same result with dynamic programming algorithm, which needs backtracking process.','2017-04-11 12:22:00.000000','');
/*!40000 ALTER TABLE `blog_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_userprofile`
--

DROP TABLE IF EXISTS `blog_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `username_pin` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `category` varchar(30) NOT NULL,
  `job_title` varchar(30) NOT NULL,
  `education` varchar(30) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `information` longtext NOT NULL,
  `project` longtext NOT NULL,
  `patent` longtext NOT NULL,
  `article` longtext NOT NULL,
  `works` longtext NOT NULL,
  `introduction_en` longtext NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_userprofile`
--

LOCK TABLES `blog_userprofile` WRITE;
/*!40000 ALTER TABLE `blog_userprofile` DISABLE KEYS */;
INSERT INTO `blog_userprofile` VALUES (1,'豆育升','YUSHENG DOU','pbkdf2_sha256$36000$rBWFRhWQ2NYH$fWWO6VdWdKgg+A73yS0lXpzFukIU/IxzING06jmNiBA=','douys@cqupt.edu.cn','博士生导师','教授','博士后','blog/static/photo/0_hT1tJ2w.jpg','生物信息学研究所主任。英国牛津大学化学系博士，先后在美国宾夕法尼亚州立大学，德克萨斯A&M大学以及普林斯顿大学进行博士后研究，2004年起在美国Nicholls大学先后任助理教授和副教授， 2006年受聘为重庆邮电大学教授。','主要从事光化学反应的量子动力学模拟研究，在过去10年间曾经参与量子动力学模拟光化学反应程序包的发展和应用。主持过美国化学会和中国国家自然科学基金关于光化学反应模拟的研究项目。','','已在国际权威期刊发表论文70余篇，其中某些论文被引用次数超过120次。','','',1,'否'),(2,'解增言','ZENGYAN XIE','pbkdf2_sha256$36000$LnoS7wR6BLrU$NFpY+UplueX987lVXP7sqk7KLTfUnTDFSFKadmgzjfQ=','xiezy@cqupt.edu.cn','硕士生导师','特聘教授','博士后','blog/static/photo/1_fsWngDB.jpg','生物信息学研究所副主任。男，汉族，1976年12月出生，山东临沂人。2007年获北京大学植物学博士学位，2007年7月至2009年7月在北京大学生物信息中心做博士后工作，2009年7月至今在重庆邮电大学生物信息学院工作。','参加和主持过的项目有：“L1L（LEAFY COTYLEDON1-LIKE）基因的分子进化及其对种子形成和发育的影响”（自然科学基金面上项目，编号30370092，主要研究人员）、“基于芯片数据的种子发育相关基因筛选及其演化研究”（博士后科学基金，编号20080430004，主持）、“种子特异表达基因调控区的生物信息学研究”（重庆邮电大学博士启动金，编号A2009-18，主持）。','','在Molecular Biology and Evolution（SCI，影响因子9.87）\r\n和New Phytologist（SCI，影响因子6.03）等刊物上发表论文多篇。','','',1,'否'),(3,'舒坤贤','KUNXIAN SHU','pbkdf2_sha256$36000$xTxAro6nxdjG$TkFeanDKC8pN0TeVK33oxZd20M5GNAnpAySIbMhccgw=','shukx@cqupt.edu.cn','硕士生导师','副教授','博士','blog/static/photo/2.jpg','生物信息学院副院长。男，土家族，1967年12月出生，重庆邮电大学生物信息学学术带头人，重庆市第二届学术技术带头人后备人选（生物信息学专业）。主要承担《生物化学》、《基因工程》、《生物信息学》及《生物信息学大实验》等课程理论与实践教学。','研究方向为肿瘤分子生物学及生物信息学。近年来主持和参与了国家自然科学基金项目“p53下游基因的克隆及其在胚胎发育过程中的作用研究(编号3000084）”、 “Si-1基因的克隆及其在细胞周期调控中的作用研究(编号39960030)”和“PAP1基因在缺氧/复氧情况下神经保护作用研究 (编号30770838)”等研究工作，先后承担各类科研项目10余项。','','发表科研论文40余篇，其中被SCI检索5篇。','','',1,'否'),(4,'朱云平','YUNPING ZHU','pbkdf2_sha256$36000$E2QShIwZ1aun$ij8sFWyqLg1r564wZmGdQXKxosiky8pBRbqS8lzg/TE=','zhuyunping@gmail.com','硕士生导师','兼职教授','硕士','blog/static/photo/3_iF4dJU9.jpg','男，1969年12月出生，军事医学科学院放射医学研究所研究员，基因组学与蛋白质组学研究室主任。 1991年毕业于国防科技大学应用物理系，1994年于军事医学科学院获医学硕士学位。获国家科技进步成果三等奖一项、军队科技进步成果二等奖一项。','1994年至2000年8月在军事医学科学院放射医学研究所从事辐射防护研究工作，2000年9月起在基因组学与蛋白质组学研究室从事生物信息学工作，参与了多项863、973及自然科学基金课题的研究，建立、完善了基于本地和Web的生物信息学综合分析体系，构建了蛋白质组二维电泳数据库、SNP发掘流程监控系统和SNP数据库，完成了军医科院科研创新启动基金课题“生物信息学计算环境的研究”。目前是973课题“蛋白质组的生物信息学研究与系列数据库的建立”（课题编号：2001CB510209）负责人以及863课题“蛋白质组数据库的建立及生物信息学研究”（课题编号：2002-BA711A11）负责人。','','已发表论文二十余篇','','',1,'否'),(5,'谭军','JUN TAN','pbkdf2_sha256$36000$2xiYLXeM0GZj$XxtA8n0P6q657+RfGg7N/zzWetri62TGpgJHkAy1yHg=','tanjun@cqupt.edu.cn','硕士生导师','教授','博士','blog/static/photo/4.jpg','男，1972年5月出生，中国课共产党党员。具备了独立处理和分析海量基因组数据的能力，被重庆邮电学院聘为生物信息学学科带头人。','曾参与国家“863”、国家自然科学基金、教育部、浙江省攻关、台湾农业重点发展计划等项目6项，获得省级科技进同济步二等奖2项。通过 01-02年在北京华大基因研究中心参加的杂交水稻父本9311基因组拼接注释工作和02-03年在台湾大学参加的文心兰功能基因组研究。','','在国内外重要刊物上共发表论文14课篇，其中SCI刊物论文4篇','','',1,'否'),(6,'袁帅','SHUAI YUAN','pbkdf2_sha256$36000$fe1HwkrJ5Pix$yTTW8cM4pnIXH/61CKtDooYGpptuvlphqT/f5caz1ow=','yuanshuai@cqupt.edu.cn','硕士生导师','副教授','博士','blog/static/photo/5.jpg','男，1976年6月出生，湖南永顺人，硕士,讲师。2002年6月毕业于云南大学化学系物理化学专业，获硕士学位，2002年7月任教于重庆邮电大 学生物信息学院，2006年9月至今在西北大学化学系无机化学专业攻读博士学位。','目前主要研究方向为激光诱导生物分子反应的动力学模拟。','','','','',1,'否'),(7,'曾垂省','CHUISHENG ZENG','pbkdf2_sha256$36000$H4k84lNhucXR$NBHmxezTB1icbZgGrFMEjx8/QnJKGEbPWfOQ9sQVRlk=','zengcs@cqupt.edu.cn','硕士生导师','副教授','硕士','blog/static/photo/6.jpg','男，汉族，1974年7月生，高级程序员（系统设计师）。2004年武汉理工大学生物医学工程专业硕士，生物医学工程学会会员，《现代生物医学进展》杂志编委，《重庆邮电大学学报》（自然科学版）（中文核心）论文审稿专家，2009年度《中国组织工程与临床康复》（中文核心）杂志优秀执行编委，重庆邮电大学科技研究青年骨干。1999年到2000年在江苏河海科技集团从事生产管理工作，2000年到2001年从事机械设计工作，2002年以后从事生物医学材料和医学软件电子仪器等研究工作，在生物医学等领域有扎实的理论基础和动手能力，有丰富的实践经验和较强的分析和综合的能力。','具有从事国家“863”项目研究经验，参与过国家自然科学基金项目、重庆市科委的重点攻关项目，并作为项目负责人承担重庆邮电大学青年自然科学基金项目：心电数据智能分析与数据挖掘算法研究（A2007-32）。','申请国家发明专利多项','发表论文多篇','','',1,'否'),(8,'黄飞飞','FEIFEI HUANG','pbkdf2_sha256$36000$MgkLbeEyxFkx$jZp5lKiJLS6BsoT0HN7OS1ZRFBbiM8Yimers8sfaqQ8=','huangff@cqupt.edu.cn','硕士生导师','特聘副教授','博士','blog/static/photo/7.jpg','女，1980年12月生，山东青岛人。西南大学特种经济动物饲养专业，生化与分子生物学方向农学博士。2009年6月毕业于西南大学，获特种经济动物饲养专业农学博士学位。2009年7月起至今，工作于重庆邮电大学生物信息学院。','','','','','',1,'否'),(9,'张文英','WENYING ZHANG','pbkdf2_sha256$36000$LojkpHNXJzmQ$h7atb6pzB1i3g5lyegJ8Ui2BXAm+ZFeuOvpddi/UeXg=','zhangwenying@cqupt.edu.cn','硕士生导师','讲师','博士','blog/static/photo/8.jpg','女，汉族，1976年9月出生，云南个旧市人，2004年6月毕业于云南大学化学系分析化学专业，获硕士学位，2004年7月任教于重庆邮电大学生物信息学院，2007年7月就读于西北大学化学系材料化学专业。','目前主要研究方向为激光诱导生物分子反应的动力学模拟。','','','','',1,'否'),(10,'孙全','QUAN SUN','pbkdf2_sha256$36000$KP9dVmIuFT7Z$PE6/5z2BIWtxfqhsiml9pMn+RJDrZrXR+tBCKwJTpPM=','sunquan@cqupt.edu.cn','硕士生导师','讲师','在读博士','blog/static/photo/9.jpg','。男，1980年12月生，四川成都人。2003年6月获得西南农业大学蚕学专业农学学士学位；2006年6月于西南大学蚕学与系统生物学研究所特种经济动物饲养专业毕业，获农学硕士学位。','主要从事分子生物学、功能基因组学、生物信息学等方面研究。','','','','',1,'否'),(11,'白明泽','MINGZE BAI','pbkdf2_sha256$36000$GeBqiNu2mve7$48CKKGHnowzNGPBJuDIDOrfsgOPnNl9BEc8Y9W4bUS4=','baimz@cqupt.edu.cn','硕士生导师','副教授','博士','blog/static/photo/10.jpg','男，土家族，1982年5月出生，重庆酉阳人。重庆邮电大学生物信息学院生物信息学教学部教师。2007年在电子科技大学计算机科 学与工程学院攻读博士学位，2006年获重庆邮电大学工学硕士学位（研究方向为p53 下游基因预测算法研究），1999年获重庆邮电大学理学学士学位（专业：信息与计算科学）。','','','','','',1,'否'),(12,'李安阳','ANYANG LI','pbkdf2_sha256$36000$j1sTA1AHkN9K$yj6EN2h64xGM1q6LzAz67EUhZZDacVZ8N9p410z4V/k=','liay@cqupt.edu.cn','硕士生导师','讲师','博士','blog/static/photo/11.jpg','2006年6月毕业于西北大学化学系物理化学专业，获硕士学位；2006年7月任教于重庆邮电大学生物信息学院；2008年9月至今在南京大学化学化工学院理论与计算化学专业学习，攻读博士学位。','目前主要研究方向为电子结构理论和分子模拟方法的发展及其应用，研究兴趣包括：分子势能面与振动转动高激发态光谱，功能材料的量子超快反应动力学模拟等。作为主要研究人员参与包括863计划在内的多项国家级、省部级科研项目。','','已发表论文SCI检索论文10余篇','','',1,'否'),(13,'武巍峰','WEIFENG WU','pbkdf2_sha256$36000$KLfGZlYFlUgw$bMSzATaLeO5+NalikNvr0T42onMjuzpSrysfEB6zfL8=','wuwf@cqupt.edu.cn','硕士生导师','讲师','硕士','blog/static/photo/12.jpg','2007年6月毕业于重庆邮电大学计算机科学与技术学院计算机应用技术专业，获硕士学位；2007年7月任教于重庆邮电大学生物信息学院。','目前主要研究方向为激光诱导生物分子反应的动力学模拟，参与国家级、省部级科研项目5项','','发表论文SCI检索论文2篇','','',1,'否');
/*!40000 ALTER TABLE `blog_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-04-11 12:19:21.414818','1','分子进化研究室',1,'[{\"added\": {}}]',11,1),(2,'2017-04-11 12:19:57.455982','2','计算机辅助药物设计研究室',1,'[{\"added\": {}}]',11,1),(3,'2017-04-11 12:20:31.591035','3','生物医学数据挖掘与可视化研究室',1,'[{\"added\": {}}]',11,1),(4,'2017-04-11 12:20:58.220136','4','生物信息学算法研究室',1,'[{\"added\": {}}]',11,1),(5,'2017-04-11 12:21:40.153706','1','2014年3月3日下午4点学院进行实验室安全检查，请各研究室进行安全隐患排查工作，迎接检查！',1,'[{\"added\": {}}]',9,1),(6,'2017-04-11 12:22:47.131371','1','种子发育相关基因数据库',1,'[{\"added\": {}}]',8,1),(7,'2017-04-11 12:23:10.524937','2','点矩阵序列比对算法',1,'[{\"added\": {}}]',8,1),(8,'2017-04-11 12:38:54.370659','1','生物电阻抗人体成分分析方法',1,'[{\"added\": {}}]',10,1),(9,'2017-04-11 12:40:51.022297','2','名贵中药材鉴别研究 中药生物信息研究 等三场',1,'[{\"added\": {}}]',10,1),(10,'2017-04-11 12:42:05.888440','3','在国际期刊上发表研究成果',1,'[{\"added\": {}}]',10,1),(11,'2017-04-11 12:42:49.201020','4','生物医学问题中的信息技术',1,'[{\"added\": {}}]',10,1),(12,'2017-04-11 12:44:54.996538','5','运动系统脑功能网络研究',1,'[{\"added\": {}}]',10,1),(13,'2017-04-11 12:47:00.269214','6','CI and Cro-Like Repressors Regulate Virulence Factors in Streptococcus mutans, a Cariogenic Dental Pathogen',1,'[{\"added\": {}}]',10,1),(14,'2017-04-11 12:47:56.406025','7','EIT实用化应用研究与关键技术',1,'[{\"added\": {}}]',10,1),(15,'2017-04-11 12:49:02.580422','8','新型交叉学科专业下的学习-解读生物信息学院',1,'[{\"added\": {}}]',10,1),(16,'2017-04-11 12:49:41.119381','9','蛋白组学信息学研究',1,'[{\"added\": {}}]',10,1),(17,'2017-04-11 12:50:28.782108','10','拟南芥SPA1与光敏色素B互作的分子机理研究',1,'[{\"added\": {}}]',10,1),(18,'2017-04-11 12:51:11.499526','11','植物抗逆分子机理研究',1,'[{\"added\": {}}]',10,1),(19,'2017-04-11 12:51:50.073234','12','基因功能研究方法',1,'[{\"added\": {}}]',10,1),(20,'2017-04-11 12:52:30.491355','13','Cardiac flow analysis based on phase contrast MRI',1,'[{\"added\": {}}]',10,1),(21,'2017-04-11 12:53:25.174954','14','基因引领未来',1,'[{\"added\": {}}]',10,1),(22,'2017-04-11 12:54:05.484895','15','美国大学的化学、生物专业教育介绍',1,'[{\"added\": {}}]',10,1),(23,'2017-04-11 12:54:42.983546','16','The New Paradigm of Biology: Roles of Genomics and Bioinformatics',1,'[{\"added\": {}}]',10,1),(24,'2017-04-11 12:55:39.842576','17','大规模蛋白质相互作用网络的知识挖掘',1,'[{\"added\": {}}]',10,1),(25,'2017-04-11 12:56:24.011737','18','蛋白质折叠问题---从Levinthal佯谬到蛋白质结构预测',1,'[{\"added\": {}}]',10,1),(26,'2017-04-11 12:57:06.580092','19','AMPK别构调节的结构基础',1,'[{\"added\": {}}]',10,1),(27,'2017-04-11 12:57:42.119687','20','生物医药研发的新进展：应用生物信息学与高通量免疫筛选相结合进行新型抗原标靶的选择',1,'[{\"added\": {}}]',10,1),(28,'2017-04-11 12:58:14.906799','21','Negative regulation of signaling and B cell-mediated autoimmunity',1,'[{\"added\": {}}]',10,1),(29,'2017-04-11 13:01:54.503960','1','豆育升',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"article\"]}}]',7,1),(30,'2017-04-11 13:01:59.888173','1','豆育升',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',7,1),(31,'2017-04-11 13:05:28.116823','2','解增言',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"article\"]}}]',7,1),(32,'2017-04-11 13:05:33.347553','2','解增言',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',7,1),(33,'2017-04-11 13:06:45.583950','3','舒坤贤',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"article\", \"is_staff\"]}}]',7,1),(34,'2017-04-11 13:07:45.308519','4','朱云平',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"article\"]}}]',7,1),(35,'2017-04-11 13:07:50.852144','4','朱云平',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',7,1),(36,'2017-04-11 13:08:06.000164','2','解增言',2,'[{\"changed\": {\"fields\": [\"username_pin\"]}}]',7,1),(37,'2017-04-11 13:09:01.811654','5','谭军',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"article\", \"is_staff\"]}}]',7,1),(38,'2017-04-11 13:09:40.090162','6','袁帅',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\"]}}]',7,1),(39,'2017-04-11 13:09:46.001372','6','袁帅',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',7,1),(40,'2017-04-11 13:10:57.885935','7','曾垂省',2,'[{\"changed\": {\"fields\": [\"username_pin\", \"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"patent\", \"article\", \"is_staff\"]}}]',7,1),(41,'2017-04-11 13:11:24.584835','8','黄飞飞',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"is_staff\"]}}]',7,1),(42,'2017-04-11 13:11:52.339431','9','张文英',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"is_staff\"]}}]',7,1),(43,'2017-04-11 13:12:24.497620','10','孙全',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"is_staff\"]}}]',7,1),(44,'2017-04-11 13:12:49.831300','11','白明泽',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"is_staff\"]}}]',7,1),(45,'2017-04-11 13:13:30.436713','12','李安阳',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"article\", \"is_staff\"]}}]',7,1),(46,'2017-04-11 13:14:11.988314','13','武巍峰',2,'[{\"changed\": {\"fields\": [\"category\", \"job_title\", \"education\", \"photo\", \"information\", \"project\", \"article\", \"is_staff\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(9,'blog','announcement'),(11,'blog','lab'),(10,'blog','news'),(8,'blog','tools'),(7,'blog','userprofile'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-04-11 12:08:16.621939'),(2,'auth','0001_initial','2017-04-11 12:08:16.897248'),(3,'admin','0001_initial','2017-04-11 12:08:16.973346'),(4,'admin','0002_logentry_remove_auto_add','2017-04-11 12:08:16.991033'),(5,'contenttypes','0002_remove_content_type_name','2017-04-11 12:08:17.050907'),(6,'auth','0002_alter_permission_name_max_length','2017-04-11 12:08:17.093497'),(7,'auth','0003_alter_user_email_max_length','2017-04-11 12:08:17.163775'),(8,'auth','0004_alter_user_username_opts','2017-04-11 12:08:17.182012'),(9,'auth','0005_alter_user_last_login_null','2017-04-11 12:08:17.201310'),(10,'auth','0006_require_contenttypes_0002','2017-04-11 12:08:17.209898'),(11,'auth','0007_alter_validators_add_error_messages','2017-04-11 12:08:17.226605'),(12,'auth','0008_alter_user_username_max_length','2017-04-11 12:08:17.281728'),(13,'blog','0001_initial','2017-04-11 12:08:17.536610'),(14,'sessions','0001_initial','2017-04-11 12:08:17.559914');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lo04yiuixlx1ohjnfw0wf2m0hdfylijj','M2I5ZWExNzk4M2I4MjU3ODNlM2U2MmVhODRjZDU3MTc5YWJlNzc0MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZThiMzMwNDk5NDEyOGRhN2NkYmQzOGZhZWFmNWZjMTU1N2VkM2E0In0=','2017-04-25 13:19:06.210740');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-11 21:20:29
