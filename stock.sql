-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2021 at 02:56 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add stock history', 8, 'add_stockhistory'),
(30, 'Can change stock history', 8, 'change_stockhistory'),
(31, 'Can delete stock history', 8, 'delete_stockhistory'),
(32, 'Can view stock history', 8, 'view_stockhistory'),
(33, 'Can add stock', 9, 'add_stock'),
(34, 'Can change stock', 9, 'change_stock'),
(35, 'Can delete stock', 9, 'delete_stock'),
(36, 'Can view stock', 9, 'view_stock');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$ZIUc2MACKXCtNUX1chSZk0$o5Ei2IlikKh+hlrqMbRsdTTRhOr3cI/NYbCg13CXdXU=', '2021-08-20 12:39:52.769531', 1, 'Mehedi', '', '', 'mehedicse96@gmail.com', 1, 1, '2021-08-20 12:37:33.581522');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-08-20 12:40:05.425022', '1', 'Computer', 1, '[{\"added\": {}}]', 7, 1),
(2, '2021-08-20 12:40:09.532106', '2', 'Computer Accessories', 1, '[{\"added\": {}}]', 7, 1),
(3, '2021-08-20 12:40:13.983877', '3', 'Phone', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'StockApp', 'category'),
(9, 'StockApp', 'stock'),
(8, 'StockApp', 'stockhistory');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'StockApp', '0001_initial', '2021-08-20 12:34:48.643930'),
(2, 'StockApp', '0002_remove_stockhistory_created', '2021-08-20 12:34:49.078706'),
(3, 'StockApp', '0003_remove_stockhistory_export_to_csv', '2021-08-20 12:34:49.639319'),
(4, 'StockApp', '0004_alter_stock_export_to_csv', '2021-08-20 12:34:52.345600'),
(5, 'StockApp', '0005_auto_20210820_1202', '2021-08-20 12:34:52.901462'),
(6, 'StockApp', '0006_remove_stock_csv', '2021-08-20 12:34:53.173400'),
(7, 'contenttypes', '0001_initial', '2021-08-20 12:34:54.948941'),
(8, 'auth', '0001_initial', '2021-08-20 12:35:27.778218'),
(9, 'admin', '0001_initial', '2021-08-20 12:35:37.926594'),
(10, 'admin', '0002_logentry_remove_auto_add', '2021-08-20 12:35:38.119477'),
(11, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-20 12:35:38.392309'),
(12, 'contenttypes', '0002_remove_content_type_name', '2021-08-20 12:35:40.926571'),
(13, 'auth', '0002_alter_permission_name_max_length', '2021-08-20 12:35:44.354497'),
(14, 'auth', '0003_alter_user_email_max_length', '2021-08-20 12:35:44.738021'),
(15, 'auth', '0004_alter_user_username_opts', '2021-08-20 12:35:44.898654'),
(16, 'auth', '0005_alter_user_last_login_null', '2021-08-20 12:35:47.816054'),
(17, 'auth', '0006_require_contenttypes_0002', '2021-08-20 12:35:48.145436'),
(18, 'auth', '0007_alter_validators_add_error_messages', '2021-08-20 12:35:48.381489'),
(19, 'auth', '0008_alter_user_username_max_length', '2021-08-20 12:35:48.893412'),
(20, 'auth', '0009_alter_user_last_name_max_length', '2021-08-20 12:35:49.346058'),
(21, 'auth', '0010_alter_group_name_max_length', '2021-08-20 12:35:49.777260'),
(22, 'auth', '0011_update_proxy_permissions', '2021-08-20 12:35:49.950725'),
(23, 'auth', '0012_alter_user_first_name_max_length', '2021-08-20 12:35:50.333065'),
(24, 'sessions', '0001_initial', '2021-08-20 12:35:52.207282');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ymifoqj7qsgu19rijv69ji42ibxhrsev', '.eJxVjEEOwiAQRe_C2hCgTAdcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqty0CW2fmSXAQ0WBjY5KyNdjwCKXSADvVAGqPXfnTGZFAKLViVwHjx_gDhGzbI:1mH3oP:PvjZoxTKXTaVO6CoAJptYPznCBqSrPFdfwR1Ga1MdqQ', '2021-09-03 12:39:53.035347');

-- --------------------------------------------------------

--
-- Table structure for table `stockapp_category`
--

CREATE TABLE `stockapp_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stockapp_category`
--

INSERT INTO `stockapp_category` (`id`, `name`) VALUES
(1, 'Computer'),
(2, 'Computer Accessories'),
(3, 'Phone');

-- --------------------------------------------------------

--
-- Table structure for table `stockapp_stock`
--

CREATE TABLE `stockapp_stock` (
  `id` bigint(20) NOT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `receive_quantity` int(11) DEFAULT NULL,
  `receive_by` varchar(50) DEFAULT NULL,
  `issue_quantity` int(11) DEFAULT NULL,
  `issue_by` varchar(50) DEFAULT NULL,
  `issue_to` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stockapp_stock`
--

INSERT INTO `stockapp_stock` (`id`, `item_name`, `quantity`, `receive_quantity`, `receive_by`, `issue_quantity`, `issue_by`, `issue_to`, `phone_number`, `created_by`, `reorder_level`, `created`, `last_updated`, `category_id`) VALUES
(1, 'Laptop', 100, 50, 'Mehedi', 0, 'Mehedi', NULL, NULL, NULL, 100, '2021-08-20 12:40:28.636551', '2021-08-20 12:54:15.137120', 1),
(2, 'Keyboard', 500, 0, NULL, 0, NULL, NULL, NULL, NULL, 1000, '2021-08-20 12:53:17.441356', '2021-08-20 12:54:21.000410', 2),
(3, 'Mouse', 300, 0, NULL, 0, NULL, NULL, NULL, NULL, 500, '2021-08-20 12:53:27.538914', '2021-08-20 12:54:28.451492', 2),
(4, 'RAM', 400, 0, NULL, 0, NULL, NULL, NULL, NULL, 300, '2021-08-20 12:53:38.006033', '2021-08-20 12:54:44.641534', 2),
(5, 'Samsung', 200, 0, NULL, 0, NULL, NULL, NULL, NULL, 600, '2021-08-20 12:53:53.168159', '2021-08-20 12:54:34.863444', 3),
(6, 'SSD', 1000, 0, NULL, 0, NULL, NULL, NULL, NULL, 1200, '2021-08-20 12:54:04.012649', '2021-08-20 12:54:51.744081', 2);

--
-- Triggers `stockapp_stock`
--
DELIMITER $$
CREATE TRIGGER `same` AFTER UPDATE ON `stockapp_stock` FOR EACH ROW IF new.issue_quantity = 0 
		THEN INSERT INTO stockapp_stockhistory(
			id, 
			last_updated, 
			category_id, 
			item_name, 
            issue_quantity,
			quantity, 
			receive_quantity, 
			receive_by) 
		VALUES(
			new.id, 
			new.last_updated, 
			new.category_id, 
			new.item_name, 
            new.issue_quantity,
            new.quantity, 
			new.receive_quantity, 
			new.receive_by);

	ELSEIF new.receive_quantity = 0 
		THEN INSERT INTO stockapp_stockhistory(
			id, 
			last_updated, 
			category_id, 
			item_name, 
            receive_quantity,
			issue_quantity, 
			issue_to, 
			issue_by, 
			quantity) 
		VALUES(
			new.id, 
			new.last_updated, 
			new.category_id, 
			new.item_name, 
            new.receive_quantity,
			new.issue_quantity, 
			new.issue_to, 
			new.issue_by, 
			new.quantity);
	END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stockapp_stockhistory`
--

CREATE TABLE `stockapp_stockhistory` (
  `id` bigint(20) NOT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `receive_quantity` int(11) DEFAULT NULL,
  `receive_by` varchar(50) DEFAULT NULL,
  `issue_quantity` int(11) DEFAULT NULL,
  `issue_by` varchar(50) DEFAULT NULL,
  `issue_to` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stockapp_stockhistory`
--

INSERT INTO `stockapp_stockhistory` (`id`, `item_name`, `quantity`, `receive_quantity`, `receive_by`, `issue_quantity`, `issue_by`, `issue_to`, `phone_number`, `created_by`, `reorder_level`, `last_updated`, `category_id`) VALUES
(1, 'Laptop', 90, 0, NULL, 20, 'Mehedi', NULL, NULL, NULL, NULL, '2021-08-20 12:40:38.338945', 1),
(1, 'Laptop', 50, 0, NULL, 40, 'Mehedi', NULL, NULL, NULL, NULL, '2021-08-20 12:52:15.822849', 1),
(1, 'Laptop', 100, 50, 'Mehedi', 0, NULL, NULL, NULL, NULL, NULL, '2021-08-20 12:52:39.285239', 1),
(1, 'Laptop', 100, 50, 'Mehedi', 0, NULL, NULL, NULL, NULL, NULL, '2021-08-20 12:54:15.137120', 1),
(2, 'Keyboard', 500, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-08-20 12:54:21.000410', 2),
(3, 'Mouse', 300, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-08-20 12:54:28.451492', 2),
(5, 'Samsung', 200, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-08-20 12:54:34.863444', 3),
(4, 'RAM', 400, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-08-20 12:54:44.641534', 2),
(6, 'SSD', 1000, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-08-20 12:54:51.744081', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `stockapp_category`
--
ALTER TABLE `stockapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockapp_stock`
--
ALTER TABLE `stockapp_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StockApp_stock_category_id_74794414_fk_StockApp_category_id` (`category_id`);

--
-- Indexes for table `stockapp_stockhistory`
--
ALTER TABLE `stockapp_stockhistory`
  ADD KEY `StockApp_stockhistor_category_id_5ec50d69_fk_StockApp_` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `stockapp_category`
--
ALTER TABLE `stockapp_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stockapp_stock`
--
ALTER TABLE `stockapp_stock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `stockapp_stock`
--
ALTER TABLE `stockapp_stock`
  ADD CONSTRAINT `StockApp_stock_category_id_74794414_fk_StockApp_category_id` FOREIGN KEY (`category_id`) REFERENCES `stockapp_category` (`id`);

--
-- Constraints for table `stockapp_stockhistory`
--
ALTER TABLE `stockapp_stockhistory`
  ADD CONSTRAINT `StockApp_stockhistor_category_id_5ec50d69_fk_StockApp_` FOREIGN KEY (`category_id`) REFERENCES `stockapp_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
