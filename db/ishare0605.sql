/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.11 : Database - ishare2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ishare2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ishare2`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `collection` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Config object collection.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Config object name.',
  `data` longblob COMMENT 'A serialized configuration object data.',
  PRIMARY KEY (`collection`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The base table for configuration data.';

/*Data for the table `config` */

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the target entity.',
  `filename` varchar(255) DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `filemime` varchar(255) DEFAULT NULL,
  `filesize` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `file_field__uid__target_id` (`nid`),
  KEY `file_field__status` (`status`),
  KEY `file_field__changed` (`updated_at`),
  KEY `file_field_tid` (`nid`),
  KEY `file_field__uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='The base table for file entities.';

/*Data for the table `file` */

insert  into `file`(`fid`,`nid`,`filename`,`uri`,`filemime`,`filesize`,`status`,`created_at`,`updated_at`) values (1,91,NULL,'123','image/png',61478,0,1433227986,1433227986),(3,93,NULL,'','image/png',61478,0,1433228917,1433228917),(4,102,'1111.png','uploads/1111.png','image/png',61478,0,1433231091,1433231091),(7,109,'1111.png','uploads/1111.png','image/png',61478,0,1433471722,1433471722),(8,110,'1111.png','uploads/1111.png','image/png',61478,1,1433471969,1433471969);

/*Table structure for table `key_value` */

DROP TABLE IF EXISTS `key_value`;

CREATE TABLE `key_value` (
  `collection` varchar(128) NOT NULL DEFAULT '' COMMENT 'A named collection of key and value pairs.',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The key of the key-value pair. As KEY is a SQL reserved keyword, name was chosen instead.',
  `value` longblob NOT NULL COMMENT 'The value.',
  PRIMARY KEY (`collection`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic key-value storage table. See the state system for…';

/*Data for the table `key_value` */

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values ('m000000_000000_base',1432880264),('m130524_201442_init',1432880268);

/*Table structure for table `node` */

DROP TABLE IF EXISTS `node`;

CREATE TABLE `node` (
  `nid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:disable 1:active',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Data for the table `node` */

insert  into `node`(`nid`,`title`,`status`,`created_at`,`updated_at`) values (99,'12312',1,1433230753,1433230753),(100,'12312',1,1433231032,1433231032),(101,'12312',1,1433231046,1433231046),(102,'12312',1,1433231091,1433231091),(103,'asdf',1,1433471429,1433471429),(104,'asdf',1,1433471492,1433471492),(105,'asdf',1,1433471502,1433471502),(106,'12312',1,1433471523,1433471523),(107,'1231231',1,1433471569,1433471569),(108,'1231231',1,1433471628,1433471628),(109,'1231231',1,1433471721,1433471721),(110,'123123',1,1433471968,1433471968);

/*Table structure for table `node_field_body` */

DROP TABLE IF EXISTS `node_field_body`;

CREATE TABLE `node_field_body` (
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `nid` int(10) unsigned NOT NULL COMMENT 'The node this data is attached to',
  `delta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `value` longtext NOT NULL,
  PRIMARY KEY (`nid`,`deleted`,`delta`),
  KEY `bundle` (`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for node field body.';

/*Data for the table `node_field_body` */

insert  into `node_field_body`(`bundle`,`deleted`,`nid`,`delta`,`value`) values ('',0,35,0,''),('book',0,36,0,'123131'),('book',0,37,0,'123123'),('book',0,38,0,'adsfasdf'),('book',0,43,0,'123123'),('book',0,44,0,'asdfasdf'),('book',0,49,0,'12312'),('book',0,50,0,'3123123'),('book',0,51,0,'asdfasdf'),('book',0,52,0,'123123'),('book',0,53,0,'asdfas'),('book',0,54,0,'12123'),('book',0,55,0,'12123'),('book',0,56,0,'asdfasdf'),('book',0,58,0,'123123'),('book',0,59,0,'123123'),('book',0,60,0,'123123'),('book',0,61,0,'asdfasf'),('book',0,62,0,'123123'),('book',0,63,0,'asdf'),('book',0,64,0,'asdf'),('book',0,72,0,'asdf'),('book',0,73,0,'asdf'),('book',0,74,0,'asdf'),('book',0,75,0,'asdf'),('book',0,76,0,'asdf'),('book',0,77,0,'asdf'),('book',0,78,0,'asdf'),('book',0,79,0,'阿斯蒂芬'),('book',0,80,0,'阿斯蒂芬'),('book',0,81,0,'阿斯蒂芬'),('book',0,82,0,'阿斯蒂芬'),('book',0,83,0,'阿斯蒂芬'),('book',0,84,0,'阿斯蒂芬'),('book',0,85,0,'阿斯蒂芬'),('book',0,86,0,'阿斯蒂芬'),('book',0,87,0,'阿斯蒂芬'),('book',0,88,0,'阿斯蒂芬'),('book',0,89,0,'阿斯蒂芬'),('book',0,90,0,'阿斯蒂芬'),('book',0,91,0,'阿斯蒂芬'),('book',0,92,0,'123'),('book',0,93,0,'123'),('book',0,94,0,'sadf'),('book',0,95,0,'sadf'),('book',0,96,0,'123'),('book',0,97,0,'123123'),('book',0,98,0,'12312'),('book',0,99,0,'12312'),('book',0,100,0,'12312'),('book',0,101,0,'12312'),('book',0,102,0,'12312'),('book',0,103,0,'asdfaf'),('book',0,104,0,'asdfaf'),('book',0,105,0,'asdfaf'),('book',0,106,0,'12312'),('book',0,107,0,'123123'),('book',0,108,0,'123123'),('book',0,109,0,'123123'),('book',0,110,0,'1231');

/*Table structure for table `node_field_date` */

DROP TABLE IF EXISTS `node_field_date`;

CREATE TABLE `node_field_date` (
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `nid` int(10) unsigned NOT NULL COMMENT 'The node this data is attached to',
  `delta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`nid`,`deleted`,`delta`),
  KEY `bundle` (`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for node field body.';

/*Data for the table `node_field_date` */

insert  into `node_field_date`(`bundle`,`deleted`,`nid`,`delta`,`value`) values ('book',0,38,0,'adsfasdf'),('book',0,43,0,''),('book',0,44,0,''),('book',0,49,0,''),('book',0,50,0,''),('book',0,51,0,''),('book',0,52,0,''),('book',0,53,0,'231'),('book',0,55,0,'12123'),('book',0,62,0,'test'),('book',0,63,0,'asdf'),('book',0,64,0,'asdf'),('book',0,72,0,'asdf'),('book',0,73,0,'asdf'),('book',0,74,0,'asdf'),('book',0,75,0,'asdf'),('book',0,76,0,'asdf'),('book',0,77,0,'asdf'),('book',0,78,0,'asdf'),('book',0,79,0,'阿萨德'),('book',0,80,0,'阿萨德'),('book',0,81,0,'阿萨德'),('book',0,82,0,'阿萨德'),('book',0,83,0,'阿萨德'),('book',0,84,0,'阿萨德'),('book',0,85,0,'阿萨德'),('book',0,86,0,'阿萨德'),('book',0,87,0,'阿萨德'),('book',0,88,0,'阿萨德'),('book',0,89,0,'阿萨德'),('book',0,90,0,'阿萨德'),('book',0,91,0,'阿萨德'),('book',0,92,0,'123'),('book',0,93,0,'123'),('book',0,94,0,'asdf'),('book',0,95,0,'asdf'),('book',0,96,0,'12312'),('book',0,97,0,'1231'),('book',0,98,0,'12312'),('book',0,99,0,'12312'),('book',0,100,0,'12312'),('book',0,101,0,'12312'),('book',0,102,0,'12312'),('book',0,103,0,'assadf'),('book',0,104,0,'assadf'),('book',0,105,0,'assadf'),('book',0,106,0,'1231'),('book',0,107,0,'12312'),('book',0,108,0,'12312'),('book',0,109,0,'12312'),('book',0,110,0,'123123');

/*Table structure for table `node_field_image` */

DROP TABLE IF EXISTS `node_field_image`;

CREATE TABLE `node_field_image` (
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `nid` int(10) unsigned NOT NULL COMMENT 'The node this data is attached to',
  `delta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_target_id` int(10) unsigned NOT NULL COMMENT 'The ID of the file entity.',
  `field_image_alt` varchar(255) DEFAULT NULL COMMENT 'Alternative image text, for the image''s ''alt'' attribute.',
  `field_image_title` varchar(255) DEFAULT NULL COMMENT 'Image title text, for the image''s ''title'' attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`nid`,`deleted`,`delta`),
  KEY `bundle` (`bundle`),
  KEY `field_image_target_id` (`field_image_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for node field field_image.';

/*Data for the table `node_field_image` */

/*Table structure for table `node_field_phone` */

DROP TABLE IF EXISTS `node_field_phone`;

CREATE TABLE `node_field_phone` (
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `nid` int(10) unsigned NOT NULL COMMENT 'The node this data is attached to',
  `delta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`nid`,`deleted`,`delta`),
  KEY `bundle` (`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for node field body.';

/*Data for the table `node_field_phone` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
