-- MySQL dump 10.13  Distrib 9.2.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: 2025-nodejs-reactjs-hebekery
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acl_model_has_permissions`
--

DROP TABLE IF EXISTS `acl_model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_model_has_permissions`
--

LOCK TABLES `acl_model_has_permissions` WRITE;
/*!40000 ALTER TABLE `acl_model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_model_has_roles`
--

DROP TABLE IF EXISTS `acl_model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_model_has_roles`
--

LOCK TABLES `acl_model_has_roles` WRITE;
/*!40000 ALTER TABLE `acl_model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_permissions`
--

DROP TABLE IF EXISTS `acl_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_permissions`
--

LOCK TABLES `acl_permissions` WRITE;
/*!40000 ALTER TABLE `acl_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_role_has_permissions`
--

DROP TABLE IF EXISTS `acl_role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_role_has_permissions`
--

LOCK TABLES `acl_role_has_permissions` WRITE;
/*!40000 ALTER TABLE `acl_role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_articles`
--

DROP TABLE IF EXISTS `bl_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bl_articles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `author_id` int DEFAULT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_articles`
--

LOCK TABLES `bl_articles` WRITE;
/*!40000 ALTER TABLE `bl_articles` DISABLE KEYS */;
INSERT INTO `bl_articles` VALUES (1,'Tại Sao Mẹ Cho Con Bú Nên Ăn Quả Óc Chó?','tai-sao-me-cho-con-bu-nen-an-qua-oc-cho','Quả óc chó, hay còn gọi là \"vua của các loại hạt\", không chỉ nổi tiếng với hương vị bùi béo mà còn được','<p class=\"ql-align-justify\">Đặc biệt, quả óc chó chứa hàm lượng cao các axit béo không bão hòa đa, bao gồm omega-3 và omega-6. Ngoài ra, các vitamin và khoáng chất thiết yếu như&nbsp;<strong>vitamin E</strong>,&nbsp;<strong>vitamin B6</strong>, và&nbsp;<strong>acid folic</strong>&nbsp;cũng góp phần vào giá trị dinh dưỡng vượt trội của quả óc chó.</p><h2 class=\"ql-align-justify\"><strong style=\"background-color: transparent;\">Lợi ích dinh dưỡng của quả óc chó đối với mẹ đang cho con bú</strong></h2><h3 class=\"ql-align-justify\"><strong>1. Tăng cường sức khỏe tim mạch và giảm cholesterol</strong></h3><p class=\"ql-align-justify\">Quả óc chó giàu&nbsp;<strong>omega-3</strong>&nbsp;và&nbsp;<strong>omega-6</strong>, hai loại axit béo quan trọng trong việc cải thiện sức khỏe tim mạch. Đặc biệt đối với mẹ bỉm sau sinh, hệ thống tuần hoàn cần được bảo vệ để duy trì khả năng cung cấp dinh dưỡng tốt nhất cho bé thông qua sữa mẹ. Các axit béo này còn giúp kiểm soát mức&nbsp;<strong>cholesterol</strong>, giảm nguy cơ bệnh tim và duy trì huyết áp ổn định.</p><h3 class=\"ql-align-justify\"><strong>2. Phát triển trí não cho trẻ</strong></h3><p class=\"ql-align-justify\">Omega-3 trong quả óc chó có khả năng hỗ trợ phát triển trí não cho trẻ sơ sinh. Trong thời gian cho con bú, việc bổ sung quả óc chó sẽ cung cấp lượng&nbsp;<strong>DHA</strong>&nbsp;và&nbsp;<strong>EPA</strong>&nbsp;– hai thành phần thiết yếu giúp bé phát triển toàn diện, từ trí tuệ đến hệ thần kinh. Điều này đặc biệt quan trọng trong những tháng đầu đời, khi não bộ của bé phát triển nhanh chóng.</p><p class=\"ql-align-justify\"><img src=\"https://bizweb.dktcdn.net/100/415/009/files/tai-sao-me-cho-con-bu-nen-an-qua-oc-cho.jpg?v=1728459974115\" alt=\"Phát triển trí não cho trẻ\"></p><h3 class=\"ql-align-justify\"><strong>3. Hỗ trợ sức khỏe xương và da</strong></h3><p class=\"ql-align-justify\">Quả óc chó chứa nhiều&nbsp;<strong>vitamin E</strong>&nbsp;và&nbsp;<strong>khoáng chất</strong>&nbsp;như canxi, magie và phospho, giúp cải thiện sức khỏe xương của mẹ sau sinh, đặc biệt khi cơ thể cần phục hồi từ quá trình sinh nở. Các dưỡng chất này không chỉ tốt cho mẹ mà còn được truyền qua sữa mẹ, giúp bé phát triển xương chắc khỏe. Ngoài ra, vitamin E trong quả óc chó còn có khả năng làm đẹp da, giảm tình trạng da khô nẻ và cải thiện độ đàn hồi của da.</p><h3 class=\"ql-align-justify\"><strong>4. Hỗ trợ hệ tiêu hóa</strong></h3><p class=\"ql-align-justify\">Với&nbsp;<strong>1,9 gram chất xơ</strong>&nbsp;trong mỗi 30 gram quả óc chó, loại hạt này hỗ trợ hệ tiêu hóa hoạt động trơn tru hơn. Sau sinh, nhiều mẹ thường gặp các vấn đề về tiêu hóa như táo bón, và việc bổ sung chất xơ từ quả óc chó sẽ giúp cải thiện tình trạng này. Đồng thời, nó còn giúp cân bằng hệ vi khuẩn đường ruột, tạo nền tảng cho sự khỏe mạnh lâu dài.</p><h3 class=\"ql-align-justify\"><strong>5. Giảm căng thẳng và cải thiện giấc ngủ</strong></h3><p class=\"ql-align-justify\">Một lợi ích khác của quả óc chó mà nhiều mẹ bỉm không thể bỏ qua là khả năng giúp giảm căng thẳng và hỗ trợ giấc ngủ.&nbsp;<strong>Melatonin</strong>&nbsp;có trong quả óc chó là một hormone tự nhiên giúp điều chỉnh chu kỳ giấc ngủ, giúp mẹ bỉm sau sinh dễ dàng có giấc ngủ sâu hơn, ngay cả khi phải thức giấc chăm sóc bé ban đêm.</p><p class=\"ql-align-justify\"><img src=\"https://bizweb.dktcdn.net/100/415/009/files/tai-sao-me-cho-con-bu-nen-an-qua-oc-cho-3.jpg?v=1728460552759\" alt=\"Giảm căng thẳng và cải thiện giấc ngủ\"></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: transparent;\">Những lưu ý khi ăn quả óc chó</strong></h2><p class=\"ql-align-justify\">Mặc dù quả óc chó mang lại nhiều lợi ích tuyệt vời cho sức khỏe, mẹ bỉm sau sinh cần lưu ý một số điều sau để sử dụng quả óc chó hiệu quả và an toàn:</p><h3 class=\"ql-align-justify\"><strong>1. Liều lượng ăn hợp lý</strong></h3><p class=\"ql-align-justify\">Mỗi ngày, mẹ bỉm nên ăn khoảng&nbsp;<strong>30-50g</strong>&nbsp;quả óc chó, tương đương với&nbsp;<strong>7-10 quả</strong>. Việc duy trì lượng ăn này sẽ đảm bảo cung cấp đủ dưỡng chất mà không gây tăng cân hay các tác dụng phụ không mong muốn. Nếu mẹ chưa từng ăn quả óc chó trước đây, nên bắt đầu với lượng nhỏ và từ từ tăng dần để cơ thể thích nghi.</p><h3 class=\"ql-align-justify\"><strong>2. Các trường hợp cần tránh ăn quả óc chó</strong></h3><p class=\"ql-align-justify\">Mặc dù quả óc chó rất bổ dưỡng, nhưng không phải ai cũng nên ăn. Những mẹ bỉm có tiền sử&nbsp;<strong>dị ứng với các loại hạt</strong>&nbsp;cần hết sức cẩn trọng, vì quả óc chó có thể gây dị ứng nghiêm trọng, bao gồm sưng da, phát ban, và hen suyễn. Ngoài ra, nếu mẹ đang gặp vấn đề về&nbsp;<strong>tiêu chảy</strong>&nbsp;hoặc&nbsp;<strong>hệ tiêu hóa yếu</strong>, việc ăn quá nhiều quả óc chó có thể làm tình trạng này nghiêm trọng hơn.</p><h3 class=\"ql-align-justify\"><strong>3. Cách chế biến quả óc chó</strong></h3><p class=\"ql-align-justify\">Quả óc chó có thể ăn sống hoặc chế biến thành các món ăn khác như&nbsp;<strong>salad</strong>,&nbsp;<strong>bánh nướng</strong>, hoặc làm&nbsp;<strong>sữa hạt</strong>. Để thay đổi khẩu vị, mẹ có thể rang nhẹ quả óc chó trên chảo không dầu, hoặc kết hợp chúng vào bữa sáng với yến mạch. Tuy nhiên, cần lưu ý không sử dụng quá nhiều gia vị như muối hoặc đường khi chế biến để giữ nguyên giá trị dinh dưỡng của quả óc chó.</p><p class=\"ql-align-justify\"><img src=\"https://bizweb.dktcdn.net/100/415/009/files/tai-sao-me-cho-con-bu-nen-an-qua-oc-cho-2.jpg?v=1728460207427\" alt=\"Cách chế biến quả óc chó\"></p><h3 class=\"ql-align-justify\"><strong>4. Bảo quản quả óc chó đúng cách</strong></h3><p class=\"ql-align-justify\">Sau khi mua quả óc chó, mẹ nên bảo quản chúng trong&nbsp;<strong>tủ lạnh</strong>&nbsp;hoặc nơi khô ráo, thoáng mát để tránh ẩm mốc. Tốt nhất là mẹ nên bảo quản trong hũ kín để giữ được hương vị và độ tươi ngon lâu nhất. Quả óc chó có thể bảo quản trong vòng&nbsp;<strong>1-2 tuần</strong>&nbsp;sau khi mở bao bì.</p><h3 class=\"ql-align-justify\"><strong style=\"background-color: transparent;\">Kết luận</strong></h3><p class=\"ql-align-justify\">Quả óc chó không chỉ là nguồn dinh dưỡng lý tưởng cho mẹ bỉm sau sinh mà còn mang lại nhiều lợi ích sức khỏe cho cả mẹ và bé. Tuy nhiên, để đảm bảo an toàn, mẹ cần lưu ý về liều lượng và cách sử dụng hợp lý. Hãy chủ động tham khảo ý kiến bác sĩ nếu có bất kỳ thắc mắc nào về chế độ dinh dưỡng sau sinh nhé!</p>','published',NULL,1,1,'http://localhost:3014/uploads/images/bbcb4e91-b41b-470e-ab9e-f347ed0debbf.webp',0,NULL,NULL);
/*!40000 ALTER TABLE `bl_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_articles_tags`
--

DROP TABLE IF EXISTS `bl_articles_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bl_articles_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_articles_tags`
--

LOCK TABLES `bl_articles_tags` WRITE;
/*!40000 ALTER TABLE `bl_articles_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `bl_articles_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_menus`
--

DROP TABLE IF EXISTS `bl_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bl_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_menus`
--

LOCK TABLES `bl_menus` WRITE;
/*!40000 ALTER TABLE `bl_menus` DISABLE KEYS */;
INSERT INTO `bl_menus` VALUES (1,'Kiến thức dinh dưỡng','kien-thuc-dinh-duong','Kiến thức dinh dưỡng','pending',1,NULL,NULL),(2,'Ăn uống','an-uong','Ăn uống','pending',1,NULL,NULL),(3,'Giảm cân lành mạnh','giam-can-lanh-manh','Giảm cân lành mạnh','pending',1,NULL,NULL);
/*!40000 ALTER TABLE `bl_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_tags`
--

DROP TABLE IF EXISTS `bl_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bl_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_tags`
--

LOCK TABLES `bl_tags` WRITE;
/*!40000 ALTER TABLE `bl_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `bl_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `title_seo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_seo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords_seo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index_seo` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Banh biscotti nguyên cám','banh-biscotti-nguyen-cam','http://localhost:3014/uploads/images/601dfbfb-6975-4588-a067-e6f05618474d.webp',NULL,'pending','Banh biscotti nguyên cám',0,NULL,NULL,NULL,1,NULL,NULL),(2,'Hạt ngũ cốc granola','hat-ngu-coc-granola','http://localhost:3014/uploads/images/603b1967-ead4-40f8-957e-e99e212bed74.webp',NULL,'pending','Hạt ngũ cốc granola',0,NULL,NULL,NULL,1,NULL,NULL),(3,'Banh ngói hạnh nhân','banh-ngoi-hanh-nhan','http://localhost:3014/uploads/images/b64ffd0c-db33-4511-b960-0f0514e5f552.webp',NULL,'pending','Banh ngói hạnh nhân',0,NULL,NULL,NULL,1,NULL,NULL),(4,'Hạt trái cây nhập khẩu','hat-trai-cay-nhap-khau','http://localhost:3014/uploads/images/15d5ab20-609e-4e28-8ae0-6414b223e831.webp',NULL,'pending','Hạt trái cây nhập khẩu',0,NULL,NULL,NULL,1,NULL,NULL),(5,'Đậu phộng','dau-phong','http://localhost:3014/uploads/images/5b646c98-c78a-4ddb-870d-e45977e34cb6.webp',NULL,'pending','Đậu phộng',0,NULL,NULL,NULL,1,NULL,NULL),(6,'Hạt dinh dưỡng','hat-dinh-duong','http://localhost:3014/uploads/images/9068428d-e595-44d6-8acc-25c0ce694538.png',NULL,'pending','Hạt dinh dưỡng',0,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_agencies`
--

DROP TABLE IF EXISTS `ec_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_agencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_agencies`
--

LOCK TABLES `ec_agencies` WRITE;
/*!40000 ALTER TABLE `ec_agencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_attribute_values`
--

DROP TABLE IF EXISTS `ec_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_attribute_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_attribute_values`
--

LOCK TABLES `ec_attribute_values` WRITE;
/*!40000 ALTER TABLE `ec_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_attributes`
--

DROP TABLE IF EXISTS `ec_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_use_in_product_listing` tinyint NOT NULL DEFAULT '0',
  `use_image_from_product_variation` tinyint NOT NULL DEFAULT '0',
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_attributes`
--

LOCK TABLES `ec_attributes` WRITE;
/*!40000 ALTER TABLE `ec_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_seo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_seo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords_seo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index_seo` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Nhà cung cấp A','nha-cung-cap-a',NULL,'pending','Nhà cung cấp A',NULL,NULL,NULL,1,'2025-05-29 06:31:14',NULL);
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `payment_method_id` bigint unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_shipping_fee` bigint NOT NULL DEFAULT '0',
  `payment_status` enum('pending','completed','refunding','refunded','fraud','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status` enum('pending','processing','completed','canceled','returned') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL COMMENT 'Tổng tiền hàng',
  `shipping_amount` decimal(16,2) NOT NULL COMMENT 'Tiền ship',
  `tax_amount` decimal(16,2) NOT NULL COMMENT 'tiền thuế',
  `discount_amount` decimal(16,2) NOT NULL COMMENT 'Tiền giảm giá',
  `sub_total` decimal(16,2) NOT NULL COMMENT 'Tổng tiền',
  `completed_at` datetime DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supplier_id` int DEFAULT '0',
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipper_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
INSERT INTO `ec_orders` VALUES (1,1,0,'ODDOCC1Slk',0,'completed','pending',NULL,2180000.00,0.00,0.00,0.00,2180000.00,NULL,NULL,'2025-05-29 15:45:16','2025-05-29 15:45:49',0,'{\"user_name\":\"Khách hàng\",\"user_email\":\"doantotnghiep@gmail.com\",\"user_phone\":\"0986420994\",\"user_address\":\"Thôn Thuận Yên, Thôn Thuận Yên - Xã Quỳnh Ngọc - Huyện Quỳnh Lưu\"}',0),(2,1,0,'ODXAaeb97z',0,'completed','pending',NULL,2490000.00,0.00,0.00,0.00,2490000.00,NULL,NULL,'2025-05-29 15:47:25','2025-05-29 15:47:51',0,'{\"user_name\":\"Khách hàng\",\"user_email\":\"doantotnghiep@gmail.com\",\"user_phone\":\"0986420994\",\"user_address\":\"Thôn thuận yên - Xã Quỳnh ngọc - Quỳnh Lưu - Nghệ An\"}',0);
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Sản phẩm mới','Sản phẩm mới','san-pham-moi',0,'pending',NULL,NULL),(2,'Sản phẩm nổi bật','Sản phẩm nổi bật','san-pham-noi-bat',0,'pending',NULL,NULL);
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_options`
--

DROP TABLE IF EXISTS `ec_product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_options`
--

LOCK TABLES `ec_product_options` WRITE;
/*!40000 ALTER TABLE `ec_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_options_values`
--

DROP TABLE IF EXISTS `ec_product_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_options_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_option_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_options_values`
--

LOCK TABLES `ec_product_options_values` WRITE;
/*!40000 ALTER TABLE `ec_product_options_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variants`
--

DROP TABLE IF EXISTS `ec_product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variants`
--

LOCK TABLES `ec_product_variants` WRITE;
/*!40000 ALTER TABLE `ec_product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `number` int NOT NULL DEFAULT '0',
  `price` int NOT NULL DEFAULT '0',
  `sale` int NOT NULL DEFAULT '0',
  `contents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `length` double(8,2) DEFAULT NULL,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_vote_count` int NOT NULL DEFAULT '0',
  `total_rating_score` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'[MUA 3 TẶNG 1] COMBO Trải Nghiệm 3 Hũ Biscotti Nguyên Cám Low Calories (150gr) 3 Vị - Tặng Vị Đặc Biệt Phô Mai Mặn (150gr)','mua-3-tang-1-combo-trai-nghiem-3-hu-biscotti-nguyen-cam-low-calories-150gr-3-vi-tang-vi-dac-biet-pho-mai-man-150gr','<p>[MUA 3 TẶNG 1] COMBO TRẢI NGHIỆM 4 VỊ BISCOTTI LOW CALORIES PHIÊN BẢN MỚI</p><p>&nbsp;</p><p>4 Hương Vị Siêu Cuốn mà chị em nhấ.t định phải thử qua:</p><p>🍒 FRUITY GRAINS - Ngũ Cốc Trái Cây</p><p>🍫 DARK CHOCO - Cacao Nguyên Chất</p><p>🍵 PURE MATCHA - Trà Xanh Nguyên Bản</p><p>🧀 SALTY CHEESE (Must Try) - Vị Phô Mai Mặn ĐỘ.C BẢN chỉ có tại nhà HeBekery!!</p><p>&nbsp;</p><p>Ngoài các vị ngọt - Chúng mình mang đến một sự kết hợp CHƯA TỪNG CÓ trong phiên bản Biscotti lần này mà chắc hẳn chị em đặc biệt sẽ rất thích - Vị Phô Mai Mặn 🧀</p><p>&nbsp;</p><p>🧀 Từ Phô Mai Cheddar</p><p>- Thuộc top 2 loại ngon nhấ.t trên thế giới</p><p>- Ưu tiên tuyển chọn từ Phô Mai đạt độ ủ Tối Thiếu 12 Tháng</p><p>&nbsp;</p><p>Biscotti nhà Hebe giúp quá trình chăm dáng của chị em thêm hiệu quả nhờ làm từ Bột Nguyên Cám chuẩn công thức từ Ý cùng 6 loại Hạt Dinh Dưỡng và Trái Cây Sấy Nhập Khẩu:</p><p>🌾 Bột Nguyên Cám: Giàu Chất Xơ, Khoáng Chất và ít Calo hơn so với bột mì thường, là tinh bột chuyển hoá chậm, giúp no lâu và làm giảm cảm giác thèm ăn.</p><p>🌰 Hạnh Nhân - Hạt Bí - Hạt Điều: Dồi dào Vitamin E, C giúp da hồng hào, sáng mịn và chắc khỏe ngay từ bên trong</p><p>🍇 Nho Vàng - Nam Việt Quất - Xoài - Chứa nhiều Chất Chố.ng Oxy Hóa cải thiện tình lão hóa lại tốt cho hệ tiêu hóa và giúp detox cơ thể nhờ lọc và thải bỏ độc tố</p><p>🥚 Trứng gà: Nguồn Protein dồi dào giúp thúc đẩy quá trình trao đổi chất - đố.t chá.y năng lượng nhanh hơn ngay cả khi nghỉ ngơi</p><p>&nbsp;</p><p>RẤT PHÙ HỢP:</p><p>Ăn Vặt / Snack Healthy giữ dáng</p><p>Eat Clean</p><p>Fitness</p><p>Mẹ bầu</p><p>&nbsp;</p><p>CÁCH SỬ DỤNG</p><p>- Chị em có thể dùng trực tiếp hoặc trải nghiệm độ ngon tăng gấp bội khi ăn cùng sữa chua và trái cây để bổ sung nhiều Vitamin và Khoáng Chất có lợi nhen!!!</p><p>&nbsp;</p><p>CÁCH BẢO QUẢN</p><p>- Bảo quản ở nơi thoáng mát để có bánh giòn lâu hơn.</p><p>- Đựng trong hũ kín được tặng của nhà Hebe để bảo quản nhé.</p><p>&nbsp;</p><p>HẠN SỬ DỤNG</p><p>- 4 tháng kể từ ngày sản xuất.</p><p>&nbsp;</p><p>CAM KẾT TỪ HEBEKERY</p><p>- Nguyên liệu có nguồn gốc, xuất xứ rõ ràng.</p><p>- Bánh luôn được nướng mới và ra lò mỗi ngày</p><p>- Đạt chứng nhận chuẩn quy trình sản xuất HACCP</p><p>- Đạt chứng nhận ATVSTP tiêu chuẩn ISO:22000</p><p>&nbsp;</p><p>Inbox ngay cho chúng mình để được tư vấn tất tần tật về chế độ dinh dưỡng và cách sử dụng nhé</p>','http://localhost:3014/uploads/images/d883a948-1e19-41b3-9045-dfe606002762.webp','pending',10,250000,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,0,0),(2,'[Hộp 300gr] Biscotti Nguyên Cám Low Calories 4 Vị - Bánh Ngũ Cốc Nướng Ăn Kiêng Lành Mạnh','hop-300gr-biscotti-nguyen-cam-low-calories-4-vi-banh-ngu-coc-nuong-an-kieng-lanh-manh','<p>4 Hương Vị Siêu Cuốn mà chị em nhấ.t định phải thử qua:</p><p>🍒 FRUITY GRAINS - Ngũ Cốc Trái Cây</p><p>🍫 DARK CHOCO - Cacao Nguyên Chất</p><p>🍵 PURE MATCHA - Trà Xanh Nguyên Bản</p><p>🧀 SALTY CHEESE (Must Try) - Vị Phô Mai Mặn ĐỘ.C BẢN chỉ có tại nhà HeBekery!!</p><p>&nbsp;</p><p>Ngoài các vị ngọt - Chúng mình mang đến một sự kết hợp CHƯA TỪNG CÓ trong phiên bản Biscotti lần này mà chắc hẳn chị em đặc biệt sẽ rất thích - Vị Phô Mai Mặn 🧀</p>','http://localhost:3014/uploads/images/067c0f6a-dc8b-4ed2-9bb9-d26715a54cdb.webp','pending',100,560000,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,0,0);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_labels`
--

DROP TABLE IF EXISTS `ec_products_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `product_label_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_labels`
--

LOCK TABLES `ec_products_labels` WRITE;
/*!40000 ALTER TABLE `ec_products_labels` DISABLE KEYS */;
INSERT INTO `ec_products_labels` VALUES (1,2,1,NULL,NULL);
/*!40000 ALTER TABLE `ec_products_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_stock_ins`
--

DROP TABLE IF EXISTS `ec_stock_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_stock_ins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `price` int DEFAULT '0',
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'final: Kho thành phẩm      ingredient: kho nguyên liệu   ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_stock_ins`
--

LOCK TABLES `ec_stock_ins` WRITE;
/*!40000 ALTER TABLE `ec_stock_ins` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_stock_ins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_stock_outs`
--

DROP TABLE IF EXISTS `ec_stock_outs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_stock_outs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `price` int DEFAULT '0',
  `user_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'final: Kho thành phẩm      ingredient: kho nguyên liệu   ',
  `order_id` int NOT NULL,
  `agency_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_stock_outs`
--

LOCK TABLES `ec_stock_outs` WRITE;
/*!40000 ALTER TABLE `ec_stock_outs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_stock_outs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_transactions`
--

DROP TABLE IF EXISTS `ec_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `price` bigint NOT NULL DEFAULT '0',
  `total_price` bigint NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_transactions`
--

LOCK TABLES `ec_transactions` WRITE;
/*!40000 ALTER TABLE `ec_transactions` DISABLE KEYS */;
INSERT INTO `ec_transactions` VALUES (1,1,2,3,560000,1680000,'pending',NULL,NULL),(2,1,1,2,250000,500000,'pending',NULL,NULL),(3,2,2,4,560000,2240000,'pending',NULL,NULL),(4,2,1,1,250000,250000,'pending',NULL,NULL);
/*!40000 ALTER TABLE `ec_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_variant_attributes`
--

DROP TABLE IF EXISTS `ec_variant_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_variant_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `variant_id` bigint unsigned NOT NULL,
  `attribute_value_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_variant_attributes`
--

LOCK TABLES `ec_variant_attributes` WRITE;
/*!40000 ALTER TABLE `ec_variant_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_variant_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_warehouses`
--

DROP TABLE IF EXISTS `ec_warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_warehouses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_warehouses`
--

LOCK TABLES `ec_warehouses` WRITE;
/*!40000 ALTER TABLE `ec_warehouses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_warehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home_service` tinyint(1) NOT NULL DEFAULT '0',
  `price` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_user`
--

DROP TABLE IF EXISTS `services_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `service_id` int NOT NULL,
  `action_id` int NOT NULL COMMENT 'nhân viên được giao',
  `price` int NOT NULL DEFAULT '0',
  `status` enum('pending','processing','completed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_home_service` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_user`
--

LOCK TABLES `services_user` WRITE;
/*!40000 ALTER TABLE `services_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_information`
--

DROP TABLE IF EXISTS `setting_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_information`
--

LOCK TABLES `setting_information` WRITE;
/*!40000 ALTER TABLE `setting_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slides` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint NOT NULL DEFAULT '1',
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (1,'Bánh biscotti ăn kiêng','Bánh biscotti ăn kiêng',1,'home','http://123code.net','http://localhost:3014/uploads/images/caca868a-2a97-49ca-9287-3f5d10ae9875.webp','pending',NULL,NULL),(2,'Bánh gói hạn nhân','Bánh gói hạn nhân',1,'home','http://123code.net','http://localhost:3014/uploads/images/c9451301-00f6-40c5-a71d-ffae1a2e56a7.webp','pending',NULL,NULL);
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('USER','ADMIN','STAFF','SHIPPER') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Khách hàng','doantotnghiep@gmail.com',NULL,'$2a$10$ZEKMHErMyfDf8yrsfRt9/Oj7ayvoS4cZR/tAR5wLIzIAvLb4BJKNW',NULL,NULL,NULL,2,'https://via.placeholder.com/150','USER','d885ee981f7da3e26dd7d60d01f47b8a69f5bd080628dad0ac8e14cf56762e47',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_bank_accounts`
--

DROP TABLE IF EXISTS `users_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_bank_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `bank_id` bigint unsigned NOT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_bank_accounts`
--

LOCK TABLES `users_bank_accounts` WRITE;
/*!40000 ALTER TABLE `users_bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_types`
--

DROP TABLE IF EXISTS `users_has_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_types`
--

LOCK TABLES `users_has_types` WRITE;
/*!40000 ALTER TABLE `users_has_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_has_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_types`
--

DROP TABLE IF EXISTS `users_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_types`
--

LOCK TABLES `users_types` WRITE;
/*!40000 ALTER TABLE `users_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_wallets`
--

DROP TABLE IF EXISTS `users_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_wallets`
--

LOCK TABLES `users_wallets` WRITE;
/*!40000 ALTER TABLE `users_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_wallets_transactions`
--

DROP TABLE IF EXISTS `users_wallets_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_wallets_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `type` enum('credit','debit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','paid','reject','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_wallets_transactions`
--

LOCK TABLES `users_wallets_transactions` WRITE;
/*!40000 ALTER TABLE `users_wallets_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_wallets_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` int NOT NULL DEFAULT '0',
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status` enum('published','draft','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `images` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_preferences`
--

DROP TABLE IF EXISTS `work_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_preferences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `shift_morning` tinyint(1) NOT NULL DEFAULT '0',
  `shift_afternoon` tinyint(1) NOT NULL DEFAULT '0',
  `shift_night` tinyint(1) NOT NULL DEFAULT '0',
  `full_week` tinyint(1) NOT NULL DEFAULT '0',
  `off_saturday` tinyint(1) NOT NULL DEFAULT '0',
  `off_sunday` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_preferences`
--

LOCK TABLES `work_preferences` WRITE;
/*!40000 ALTER TABLE `work_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_schedules`
--

DROP TABLE IF EXISTS `work_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `work_date` date NOT NULL,
  `shift` enum('morning','afternoon','night','full_day') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_schedules`
--

LOCK TABLES `work_schedules` WRITE;
/*!40000 ALTER TABLE `work_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database '2025-nodejs-reactjs-hebekery'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 22:53:21
