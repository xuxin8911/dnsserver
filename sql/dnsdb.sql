/*
Navicat MySQL Data Transfer

Source Server         : 10.202.32.57(dnsserver)
Source Server Version : 50173
Source Host           : 10.202.32.57:3306
Source Database       : dnsdb

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-06-15 18:31:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add dns operate log', '7', 'add_dnsoperatelog');
INSERT INTO `auth_permission` VALUES ('20', 'Can change dns operate log', '7', 'change_dnsoperatelog');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete dns operate log', '7', 'delete_dnsoperatelog');
INSERT INTO `auth_permission` VALUES ('22', 'Can add dns record', '8', 'add_dnsrecord');
INSERT INTO `auth_permission` VALUES ('23', 'Can change dns record', '8', 'change_dnsrecord');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete dns record', '8', 'delete_dnsrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can add dns view', '9', 'add_dnsview');
INSERT INTO `auth_permission` VALUES ('26', 'Can change dns view', '9', 'change_dnsview');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete dns view', '9', 'delete_dnsview');
INSERT INTO `auth_permission` VALUES ('28', 'Can add dns zone', '10', 'add_dnszone');
INSERT INTO `auth_permission` VALUES ('29', 'Can change dns zone', '10', 'change_dnszone');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete dns zone', '10', 'delete_dnszone');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'dnsoperate', 'dnsoperatelog');
INSERT INTO `django_content_type` VALUES ('8', 'dnsoperate', 'dnsrecord');
INSERT INTO `django_content_type` VALUES ('9', 'dnsoperate', 'dnsview');
INSERT INTO `django_content_type` VALUES ('10', 'dnsoperate', 'dnszone');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('14', 'dnsoperate', '0001_initial', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2018-06-15 02:54:03');
INSERT INTO `django_migrations` VALUES ('16', 'dnsoperate', '0002_auto_20180615_1235', '2018-06-15 04:35:14');
INSERT INTO `django_migrations` VALUES ('17', 'dnsoperate', '0003_auto_20180615_1236', '2018-06-15 04:36:29');
INSERT INTO `django_migrations` VALUES ('18', 'dnsoperate', '0002_auto_20180615_1658', '2018-06-15 08:59:52');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `dnsoperate_dnsoperatelog`
-- ----------------------------
DROP TABLE IF EXISTS `dnsoperate_dnsoperatelog`;
CREATE TABLE `dnsoperate_dnsoperatelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_user` varchar(255) NOT NULL,
  `request_ip` char(39) NOT NULL,
  `operate_url` varchar(200) NOT NULL,
  `operate_type` varchar(8) NOT NULL,
  `params` longtext NOT NULL,
  `status` varchar(8) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `message` longtext NOT NULL,
  `result` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dnsoperate_dnsoperatelog
-- ----------------------------

-- ----------------------------
-- Table structure for `dnsoperate_dnsrecord`
-- ----------------------------
DROP TABLE IF EXISTS `dnsoperate_dnsrecord`;
CREATE TABLE `dnsoperate_dnsrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(255) NOT NULL,
  `record_type` varchar(32) NOT NULL,
  `ttl` int(11) NOT NULL,
  `record_value` longtext NOT NULL,
  `view_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `request_time` datetime DEFAULT NULL,
  `request_ip` char(39) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dnsoperate_dnsrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `dnsoperate_dnsview`
-- ----------------------------
DROP TABLE IF EXISTS `dnsoperate_dnsview`;
CREATE TABLE `dnsoperate_dnsview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `keyring` varchar(255) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dnsoperate_dnsview
-- ----------------------------
INSERT INTO `dnsoperate_dnsview` VALUES ('1', '10.202.32.57', 'CNSZ17', '{\"ddns-key.CNSZ17\": \"WQ6LiIN5HszU8hXIAF0U2g==\"}', '1', '2018-06-15 12:39:20', '2018-06-15 12:39:12', null, '0');
INSERT INTO `dnsoperate_dnsview` VALUES ('2', '10.202.32.57', 'CNSZ17', '{\"ddns-key.CNSZ17\": \"WQ6LiIN5HszU8hXIAF0U2g==\"}', '2', '2018-06-15 12:39:22', '2018-06-15 12:39:15', null, '0');
INSERT INTO `dnsoperate_dnsview` VALUES ('5', '10.202.32.57', 'CNSZ20', '{\"ddns-key.CNSZ20\":\"h6M07/fI63cJ6utHsUuw6A==\"}', '1', '2018-06-15 12:40:04', '2018-06-15 12:40:09', null, '0');
INSERT INTO `dnsoperate_dnsview` VALUES ('4', '10.202.32.57', 'CNSZ20', '{\"ddns-key.CNSZ20\":\"h6M07/fI63cJ6utHsUuw6A==\"}', '2', '2018-06-15 12:40:07', '2018-06-15 12:40:09', null, '0');
INSERT INTO `dnsoperate_dnsview` VALUES ('3', '10.202.32.57', 'CNSZ17', '{\"ddns-key.CNSZ17\": \"WQ6LiIN5HszU8hXIAF0U2g==\"}', '3', '2018-06-15 12:39:22', '2018-06-15 12:40:09', null, '0');
INSERT INTO `dnsoperate_dnsview` VALUES ('6', '10.202.32.57', 'CNSZ20', '{\"ddns-key.CNSZ20\":\"h6M07/fI63cJ6utHsUuw6A==\"}', '3', '2018-06-15 12:40:04', '2018-06-15 12:40:09', null, '0');

-- ----------------------------
-- Table structure for `dnsoperate_dnszone`
-- ----------------------------
DROP TABLE IF EXISTS `dnsoperate_dnszone`;
CREATE TABLE `dnsoperate_dnszone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) NOT NULL,
  `serial_num` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dnsoperate_dnszone
-- ----------------------------
INSERT INTO `dnsoperate_dnszone` VALUES ('1', 'intsit.sfdc.com.cn', null, '2018-06-15 12:36:40', '2018-06-15 12:36:40', null, '0');
INSERT INTO `dnsoperate_dnszone` VALUES ('2', 'dbsit.sfdc.com.cn', null, '2018-06-15 12:37:28', '2018-06-15 12:37:28', null, '0');
INSERT INTO `dnsoperate_dnszone` VALUES ('3', 'ossit.sfdc.com.cn', null, '2018-06-15 13:57:23', '2018-06-15 13:57:25', null, '0');
