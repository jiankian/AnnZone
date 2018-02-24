# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.38)
# Database: ann_zone_serve
# Generation Time: 2018-02-24 19:11:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ann_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_account`;

CREATE TABLE `ann_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `type_id` int(11) DEFAULT NULL COMMENT '记账类型ID',
  `remark` text COMMENT '备注 消费说明',
  `money` decimal(11,2) DEFAULT NULL COMMENT '金额',
  `type` int(11) DEFAULT NULL COMMENT '类型 0进账 1支出',
  `in_time` bigint(20) DEFAULT NULL COMMENT '事物产生的时间',
  `addess` varchar(255) DEFAULT NULL COMMENT '消费地址',
  `location` varchar(255) DEFAULT NULL COMMENT '经纬度格式化',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `images` text COMMENT '图片组',
  `files` text COMMENT '文件组',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='记账';



# Dump of table ann_account_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_account_meta`;

CREATE TABLE `ann_account_meta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL COMMENT '名称',
  `icon` int(11) DEFAULT NULL COMMENT '图标',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='记账类型预设';



# Dump of table ann_account_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_account_type`;

CREATE TABLE `ann_account_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `icon` int(11) DEFAULT NULL COMMENT '图标',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ann_album
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_album`;

CREATE TABLE `ann_album` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned DEFAULT '0' COMMENT '用户id',
  `folder_id` int(11) DEFAULT NULL COMMENT '所属相册ID',
  `name` varchar(255) DEFAULT '' COMMENT '文件名',
  `module` varchar(255) DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) DEFAULT '' COMMENT '文件mime类型',
  `ext` char(4) DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(64) DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned DEFAULT '0' COMMENT '下载次数',
  `origin` int(11) DEFAULT '0' COMMENT '来源 0未知 1 安卓 2 iOS 3WEB 4微信 5PC WEB 6桌面版Linux 7桌面macOS 8桌面Windows',
  `ua` tinytext COMMENT '用户UA',
  `version` varchar(16) DEFAULT NULL COMMENT '客户端版本',
  `http_info` text COMMENT 'HTTP传输信息',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='附件表';



# Dump of table ann_album_folder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_album_folder`;

CREATE TABLE `ann_album_folder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` tinytext COMMENT '描述',
  `status` int(11) DEFAULT '0' COMMENT '状态 0开 1关',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='相册表';



# Dump of table ann_attachment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_attachment`;

CREATE TABLE `ann_attachment` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) DEFAULT '' COMMENT '文件名',
  `module` varchar(255) DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图路径',
  `url` text COMMENT '文件链接',
  `ss_key` varchar(255) DEFAULT NULL COMMENT '文件key',
  `mime` varchar(128) DEFAULT '' COMMENT '文件mime类型',
  `ext` varchar(16) DEFAULT '' COMMENT '文件类型',
  `size` bigint(20) unsigned DEFAULT '0' COMMENT '文件大小',
  `md5` varchar(512) DEFAULT '' COMMENT '文件md5',
  `sha1` varchar(512) DEFAULT '' COMMENT 'sha1 散列值',
  `crc32` varchar(512) DEFAULT '' COMMENT 'CRC32码',
  `driver` varchar(64) DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned DEFAULT '0' COMMENT '下载次数',
  `origin` int(11) DEFAULT '0' COMMENT '来源 0未知 1 安卓 2 iOS 3WEB 4微信 5PC WEB 6桌面版Linux 7桌面macOS 8桌面Windows',
  `ua` tinytext COMMENT '用户UA',
  `ip` varchar(128) DEFAULT NULL COMMENT '用户IP',
  `version` varchar(16) DEFAULT NULL COMMENT '客户端版本',
  `http_info` text COMMENT 'HTTP传输信息',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='附件表 文件的md5值等一样的文件 返回附件ID  删除文件时候查找文件有没有被引用  没有则彻底删除 还有其它文件引用处则删除 一下该处引用 否则造成其它地方的引用失效问题';

LOCK TABLES `ann_attachment` WRITE;
/*!40000 ALTER TABLE `ann_attachment` DISABLE KEYS */;

INSERT INTO `ann_attachment` (`id`, `uid`, `name`, `module`, `path`, `thumb`, `url`, `ss_key`, `mime`, `ext`, `size`, `md5`, `sha1`, `crc32`, `driver`, `download`, `origin`, `ua`, `ip`, `version`, `http_info`, `sort`, `status`, `create_time`, `update_time`)
VALUES
	(16,1,'13572356_092811094000_2.jpg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/01/30/2CmLgY8l7.jpg','','/upload/2018/01/30/2CmLgY8l7.jpg','2018/01/30/2CmLgY8l7',NULL,'jpg',40039,'5128ee0b96c2a75438e036d988538022','0fd93a8296a2c67a48338f1e9cdf8a731a8d0238','436229227','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',NULL,'0.1.0',NULL,NULL,NULL,1517269451051,1517269451051),
	(17,1,NULL,'Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/01/30/2CmLgY8o7.jpg','','/upload/2018/01/30/2CmLgY8o7.jpg','2018/01/30/2CmLgY8o7',NULL,'jpg',45999,'aca9cba8e9415258bc4700bad42fd699','77e2638f374f82affece157caa9932f4ede65760','2407396541','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517269974187,1517269974187),
	(18,1,'2CmLgY8p7.jpg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/01/30/2CmLgY8p7.jpg','','/upload/2018/01/30/2CmLgY8p7.jpg','2018/01/30/2CmLgY8p7',NULL,'jpg',75062,'1e1c3b88b736edad849e0218b1cc4241','a5651c52ac87c33ec02da38b5c6144f980cdd240','3685111296','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517270099727,1517270099727),
	(19,1,'2CmLgY8z7.jpg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/01/30/2CmLgY8z7.jpg','','/upload/2018/01/30/2CmLgY8z7.jpg','2018/01/30/2CmLgY8z7',NULL,'jpg',4235846,'32acc68d062274d000aa0a05d8d7252d','ac99f416b7c102ebcc075368805325519f488f5b','1552868156','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517324660544,1517324660544),
	(20,1,'2CmLgY8J8','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY8J8','','/upload/2018/02/01/2CmLgY8J8','2018/02/01/2CmLgY8J8',NULL,'2CmLgY8J8',3,'1f8ec3882504f67c9fb8beb7021beb72','38e88fb142787a8e06a8a3fbeaa059a319b6de5b','1773895504','upload',NULL,0,'Paw/3.1.5 (Macintosh; OS X/10.13.4) GCDHTTPRequest','127.0.0.1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517426661865,1517426661865),
	(21,1,'2CmLgY977.jpg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY977.jpg','','/upload/2018/02/01/2CmLgY977.jpg','2018/02/01/2CmLgY977','image/jpeg','jpg',61879,'c4e7653d5968d21efc95b73b5e35759c','dad507430ebed0b39d197297ac27b4e378dc40ab','2337856081','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517451846475,1517451846475),
	(22,1,'2CmLgY97a.png','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY97a.png','','/upload/2018/02/01/2CmLgY97a.png','2018/02/01/2CmLgY97a','image/png','png',4939796,'88dac2287244be5191beeb74f12449dd','b85a7a83a65c9ab248bf76926b295ca9cdc68008','42826416','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517451860068,1517451860068),
	(23,1,'2CmLgY987.png','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY987.png','','/upload/2018/02/01/2CmLgY987.png','2018/02/01/2CmLgY987','image/png','png',3226966,'9c246d3481913e47400992e2d01721a3','804587cf22c4183570d6853fc82fb6d4dbe5865c','1579766284','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517451974391,1517451974391),
	(24,1,'2CmLgY98a.jpg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY98a.jpg','','/upload/2018/02/01/2CmLgY98a.jpg','2018/02/01/2CmLgY98a','image/jpeg','jpg',281414,'5aaec9b468ec12cba6d4c400eac5fe8a','ea97c859eba6c8685e7fd80464651fb5abe355ba','2946990445','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517489562770,1517489562770),
	(25,1,'2CmLgY98h.jpg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY98h.jpg','','/upload/2018/02/01/2CmLgY98h.jpg','2018/02/01/2CmLgY98h','image/jpeg','jpg',2112450,'08bf51e3a9bee6aa44fbd7f8cd5f870f','bac839cd1a11e5185f822fcf81707895da27ffa2','1390648367','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517490225681,1517490225681),
	(26,1,'2CmLgY98o.jpg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY98o.jpg','','/upload/2018/02/01/2CmLgY98o.jpg','2018/02/01/2CmLgY98o','image/jpeg','jpg',6115038,'09ae84387369c2c99c13015b771e7934','fa6f4a682c04cb522407093f42e94fecd2e4e975','3249612679','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517490528968,1517490528968),
	(27,1,'2CmLgY98r.jpeg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY98r.jpeg','','/upload/2018/02/01/2CmLgY98r.jpeg','2018/02/01/2CmLgY98r','image/jpeg','jpeg',168452,'8d2f24aa565e027fd1363a9190abb24e','b5bc34ce8b6b9a93da1fde52325cc40b88f0e472','2346167614','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517490689770,1517490689770),
	(28,1,'2CmLgY98u.jpg','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY98u.jpg','','/upload/2018/02/01/2CmLgY98u.jpg','2018/02/01/2CmLgY98u','image/jpeg','jpg',69643,'d0d70e6cb3bd4429de12d22061ae1ac6','28258b6a5fbf589a5208d56187c7ba67c4573012','1568420494','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517490846201,1517490846201),
	(29,1,'2CmLgY9c9.png','Blog','/Users/jiankian/Workspace/AnnZone/AnnZone-Serve/upload/2018/02/01/2CmLgY9c9.png','','/upload/2018/02/01/2CmLgY9c9.png','2018/02/01/2CmLgY9c9','image/png','png',24173,'c705a5a88b172f936bef955e3197acda','ba3e564ce7f828461644719df0e9e3ced9737410','560980157','upload',NULL,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','0:0:0:0:0:0:0:1','0.1.0','http://localhost:2222/api/console/v1/attachment/upload',NULL,NULL,1517491941197,1517491941197);

/*!40000 ALTER TABLE `ann_attachment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ann_backlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_backlist`;

CREATE TABLE `ann_backlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IP` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `remark` text COMMENT '备注',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='黑名单';



# Dump of table ann_blog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_blog`;

CREATE TABLE `ann_blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `title` varchar(50) DEFAULT '' COMMENT '文章标题',
  `cid` int(10) unsigned DEFAULT '0' COMMENT '文章分类id',
  `extra_cid` varchar(255) DEFAULT NULL COMMENT '扩展分类',
  `short_title` varchar(50) DEFAULT '' COMMENT '文章短标题',
  `source` varchar(50) DEFAULT '' COMMENT '文章来源',
  `url` varchar(255) DEFAULT '' COMMENT '文章来源链接',
  `author` varchar(50) DEFAULT '' COMMENT '文章作者',
  `summary` varchar(140) DEFAULT '' COMMENT '文章摘要',
  `content` longtext COMMENT '文章正文',
  `cover` text COMMENT '文章封面图片 附件ID',
  `keyword` varchar(255) DEFAULT '' COMMENT '文章关键字',
  `article_id_array` varchar(255) DEFAULT '' COMMENT '相关文章',
  `click` int(10) unsigned DEFAULT '0' COMMENT '文章点击量',
  `sort` tinyint(1) unsigned DEFAULT '0' COMMENT '文章排序0-255',
  `commend_flag` tinyint(1) unsigned DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `comment_flag` tinyint(1) unsigned DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `attachment_path` text COMMENT '文章附件路径',
  `tag` varchar(255) DEFAULT '' COMMENT '文章标签',
  `comment_count` int(10) unsigned DEFAULT NULL COMMENT '文章评论数',
  `share_count` int(10) unsigned DEFAULT '0' COMMENT '文章分享数',
  `publisher_name` varchar(50) DEFAULT '' COMMENT '发布者用户名 ',
  `last_comment_time` int(11) DEFAULT '0' COMMENT '最新评论时间',
  `public_time` int(11) DEFAULT '0' COMMENT '发布时间',
  `ip` varchar(128) DEFAULT NULL COMMENT 'IP',
  `ua` tinytext COMMENT 'UA',
  `http_info` tinytext COMMENT 'HTTP',
  `origin` int(11) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0发布 1草稿 2关闭',
  `create_time` bigint(20) DEFAULT '0' COMMENT '文章创建时间',
  `update_time` bigint(20) DEFAULT '0' COMMENT '文章修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=6553 COMMENT='博客文章表';

LOCK TABLES `ann_blog` WRITE;
/*!40000 ALTER TABLE `ann_blog` DISABLE KEYS */;

INSERT INTO `ann_blog` (`id`, `uid`, `title`, `cid`, `extra_cid`, `short_title`, `source`, `url`, `author`, `summary`, `content`, `cover`, `keyword`, `article_id_array`, `click`, `sort`, `commend_flag`, `comment_flag`, `attachment_path`, `tag`, `comment_count`, `share_count`, `publisher_name`, `last_comment_time`, `public_time`, `ip`, `ua`, `http_info`, `origin`, `status`, `create_time`, `update_time`)
VALUES
	(1,1,'第一篇博客文章',NULL,NULL,NULL,NULL,'http://www.asmm.cn',NULL,'第一篇的描述','<p>测试下，?</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1517279569103,1517279569103),
	(2,1,'第二篇',NULL,NULL,NULL,NULL,'http://www.asmm.cn/?aaaaa',NULL,'描述','<p>图片内容实在是太大了</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1517279946535,1517279946535),
	(3,1,'天亮就正式上班了',NULL,NULL,NULL,NULL,NULL,NULL,'2018正式开始迷茫啊','<p>密码俺妹妹</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519498208114,1519498208114),
	(4,1,'2018做什么骄傲',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>人生苦短，需要做什么呢</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519498248088,1519498248088),
	(5,1,'Laravel 5.6 版本正式发布',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<section class=\"featured-media\" style=\"margin-top: 30px; overflow: hidden; color: rgb(80, 80, 80); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px;\"><img src=\"http://www.golaravel.com/assets/images/laravel-5.6.png\" alt=\"Laravel 5.6 版本正式发布\" style=\"border: 0px; width: 680px;\"></section><section class=\"post-content\" style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 1.62; font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, sans-serif; color: rgb(68, 68, 67); margin-top: 30px; margin-bottom: 30px;\"><p style=\"margin-bottom: 1.46em;\">Laravel 5.6 是继 5.5 之后 Laravel 官方发布的最新版本。此版本包含众多新特性，接下来我们说一说几个重要的特性。如需查看完成的发布日志，请点击<a href=\"https://github.com/laravel/framework/blob/5.6/CHANGELOG-5.6.md\" style=\"color: rgb(244, 100, 95); text-decoration-color: rgba(0, 0, 0, 0.4); outline-style: initial; outline-width: 0px; word-wrap: break-word;\">这里</a>。</p><h2 id=\"-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">改进日志</h2><p style=\"margin-bottom: 1.46em;\">Laravel 5.6 版本中最重要的特性就是日志功能的改进。对于 Laravel 新手请注意，Laravel 5.6 的日志配置文件从&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">config/app.php</code>&nbsp;变更到了&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">config/logging.php</code>。</p><p style=\"margin-bottom: 1.46em;\">你可以通过配置&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">stack</code>&nbsp;从而将日志发送到不同的处理器中。例如，你可能需要将 debug 日志发送到 system log，而 error 日志发送到 slack。</p><p style=\"margin-bottom: 1.46em;\">关于配置和定制日志的更多信息请参考<a href=\"https://laravel.com/docs/5.6/logging\" style=\"color: rgb(244, 100, 95); text-decoration-color: rgba(0, 0, 0, 0.4); outline-style: initial; outline-width: 0px; word-wrap: break-word;\">日志相关的文档</a>。</p><h2 id=\"-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">单服务器任务调度</h2><p style=\"margin-bottom: 1.46em;\">如果你在多台服务器上都运行着任务调度器，那么你所发出的任务就会在每台服务器上执行。通过&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">onOneServer()</code>&nbsp;方法可以指定任务具体运行在哪一台服务器上。</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-php hljs\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; display: block; overflow-x: auto; border: none; word-wrap: break-word;\">$schedule-&gt;command(<span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'report:generate\'</span>)\n    -&gt;fridays()\n    -&gt;at(<span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'17:00\'</span>)\n    -&gt;onOneServer();\n</code></pre><p style=\"margin-bottom: 1.46em;\">注意：在 Laravel 5.6 版本中必须使用&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">memcached</code>&nbsp;或&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">redis</code>&nbsp;缓存驱动作为默认缓存驱动才能获得单服务器任务调度的优势。</p><h2 id=\"-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">动态限速</h2><p style=\"margin-bottom: 1.46em;\">Laravel 5.6 引入了动态限速功能，为你带来更多弹性的同时也让针对单个用户的限速更简单：</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-php hljs\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; display: block; overflow-x: auto; border: none; word-wrap: break-word;\">Route::middleware(<span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'auth:api\'</span>, <span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'throttle:rate_limit,1\'</span>)\n    -&gt;group(<span class=\"hljs-function\"><span class=\"hljs-keyword\" style=\"color: rgb(0, 0, 255);\">function</span> <span class=\"hljs-params\">()</span> </span>{\n        Route::get(<span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'/user\'</span>, <span class=\"hljs-function\"><span class=\"hljs-keyword\" style=\"color: rgb(0, 0, 255);\">function</span> <span class=\"hljs-params\">()</span> </span>{\n            <span class=\"hljs-comment\" style=\"color: rgb(0, 128, 0);\">//</span>\n        });\n    });\n</code></pre><p style=\"margin-bottom: 1.46em;\">上述实例中，<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">rate_limit</code>&nbsp;是&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">App\\User</code>&nbsp;模型（model）的一个属性（attribute），用于确定某时间段内允许的请求次数。</p><h2 id=\"-broadcast-channel-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">广播频道（Broadcast Channel） 类</h2><p style=\"margin-bottom: 1.46em;\">现在可以在&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">routes/channels.php</code>&nbsp;文件中使用 channel 类了。</p><p style=\"margin-bottom: 1.46em;\">Laravel 5.6 提供了一个新的&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">make:channel</code>&nbsp;命令用于辅助生成一个新的 channel 类：</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-bash hljs\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; display: block; overflow-x: auto; border: none; word-wrap: break-word;\">php artisan make:channel OrderChannel\n</code></pre><p style=\"margin-bottom: 1.46em;\">在&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">routes/channels.php</code>&nbsp;文件中注册 channel 类就像下面这样简单：</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-php hljs\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; display: block; overflow-x: auto; border: none; word-wrap: break-word;\"><span class=\"hljs-keyword\" style=\"color: rgb(0, 0, 255);\">use</span> <span class=\"hljs-title\" style=\"color: rgb(163, 21, 21);\">App</span>\\<span class=\"hljs-title\" style=\"color: rgb(163, 21, 21);\">Broadcasting</span>\\<span class=\"hljs-title\" style=\"color: rgb(163, 21, 21);\">OrderChannel</span>;\n\nBroadcast::channel(<span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'order.{order}\'</span>, OrderChannel::class);\n</code></pre><h2 id=\"-api-controller-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">生成 API 控制器（Controller）</h2><p style=\"margin-bottom: 1.46em;\">现在你可以为无需&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">create</code>&nbsp;和&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">edit</code>&nbsp;方法的 API 生成一个资源控制器，这一便利途径仅仅针对返回 HTML 的资源控制器。在命令行末尾添加&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">--api</code>&nbsp;参数即可生成资源控制器：</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-bash hljs\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; display: block; overflow-x: auto; border: none; word-wrap: break-word;\">php artisan make:controller API/PhotoController --api\n</code></pre><h2 id=\"eloquent-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">Eloquent 日期格式</h2><p style=\"margin-bottom: 1.46em;\">在 Laravel 5.6 中可以分别为 Eloquent date 和 datetime 指定格式了：</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-php hljs\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; display: block; overflow-x: auto; border: none; word-wrap: break-word;\"><span class=\"hljs-keyword\" style=\"color: rgb(0, 0, 255);\">protected</span> $casts = [\n    <span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'birthday\'</span> =&gt; <span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'date:Y-m-d\'</span>,\n    <span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'joined_at\'</span> =&gt; <span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'datetime:Y-m-d H:00\'</span>,\n];\n</code></pre><p style=\"margin-bottom: 1.46em;\">此格式用于将模型（model）序列化为数组或 JSON 数据。</p><h2 id=\"blade-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">Blade 组件别名</h2><p style=\"margin-bottom: 1.46em;\">在 Laravel 5.6 中你可以为 blade 组件创建别名以方便引用。例如，如果你在&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">resources/views/components/alert.blade.php</code>&nbsp;文件中保存了一个 blade 组件，你就可以利用&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">component()</code>&nbsp;方法为其创建一个更短的别名：</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-php hljs\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; display: block; overflow-x: auto; border: none; word-wrap: break-word;\">Blade::component(<span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'components.alert\'</span>, <span class=\"hljs-string\" style=\"color: rgb(163, 21, 21);\">\'alert\'</span>);\n</code></pre><p style=\"margin-bottom: 1.46em;\">然后你就可以通过别名引用此组件并输出了：</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-blade\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; border: none; word-wrap: break-word;\">@component(\'alert\')\n    &lt;p&gt;This is an alert component&lt;/p&gt;\n@endcomponent\n</code></pre><h2 id=\"argon2-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">Argon2 密码哈希</h2><p style=\"margin-bottom: 1.46em;\">Laravel 5.6 针对 PHP 7.2+ 支持新的散哈希法。你可以在&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">config/hashing.php</code>&nbsp;配置文件中指定默认使用的哈希算法。</p><h2 id=\"uuid-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">UUID 方法</h2><p style=\"margin-bottom: 1.46em;\"><code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">Illuminate\\Support\\Str</code>&nbsp;类中新增了两个方法用于生成 UUID（Universal Unique Identifiers）：</p><pre style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 7px 7px 7px 10px; margin-top: 1.64em; margin-bottom: 1.64em; line-height: 1.5; color: rgb(76, 76, 76); word-break: break-all; word-wrap: break-word; background: 0px 0px rgb(249, 249, 247); border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(218, 218, 218); border-image: initial; border-radius: 4px;\"><code class=\"lang-php hljs\" style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; color: rgb(76, 76, 76); background-position: 0px 0px; background-color: initial; border-radius: 3px; white-space: pre-wrap; display: block; overflow-x: auto; border: none; word-wrap: break-word;\"><span class=\"hljs-comment\" style=\"color: rgb(0, 128, 0);\">// The methods return a Ramsey\\Uuid\\Uuid object</span>\n\n<span class=\"hljs-keyword\" style=\"color: rgb(0, 0, 255);\">return</span> (string) Str::uuid();\n\n<span class=\"hljs-keyword\" style=\"color: rgb(0, 0, 255);\">return</span> (string) Str::orderedUuid();\n</code></pre><p style=\"margin-bottom: 1.46em;\">The&nbsp;<code style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.96em; padding: 1px 2px; color: grey; background-color: rgb(249, 249, 247); border-radius: 3px; border: 1px solid rgb(218, 218, 218); word-wrap: break-word;\">orderedUuid()</code>&nbsp;方法用于生成一个时间戳开头的 UUID 便于更有效的数据库索引。</p><h2 id=\"collision-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">Collision 美化错误报告</h2><p style=\"margin-bottom: 1.46em;\">我们最近开发了 Collision 包并将其作为 Laravel 5.6 的开发依赖（dev dependency）。Collision 能够提供美观的错误报告并输出到控制台。截图如下：</p><p style=\"margin-bottom: 1.46em;\"><img src=\"http://www.golaravel.com/assets/images/collision-example.png\" alt=\"\" style=\"border: 0px; max-width: 100%; height: auto; margin: 0.2em 0px;\"></p><h2 id=\"bootstrap-4\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">Bootstrap 4</h2><p style=\"margin-bottom: 1.46em;\">所有前端脚手架和 Vue 组件实例全部基于 Bootstrap 4 了。从 Bootstrap 4 beta 版本开始我们就已经跟进了，甚至创建了 Bootstrap 4 Laravel preset。现在，Laravel 5.6 默认搭配了&nbsp;<a href=\"https://v4.bootcss.com/\" style=\"color: rgb(244, 100, 95); text-decoration-color: rgba(0, 0, 0, 0.4); outline-style: initial; outline-width: 0px; word-wrap: break-word;\">Bootstrap 4 稳定版</a>。</p><h2 id=\"-laravel-5-6-\" style=\"font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, SimSun, sans-serif; line-height: 1.1; color: rgb(34, 34, 35); margin-top: 0.83em; margin-bottom: 0.83em; font-size: 1.5em;\">了解更多 Laravel 5.6 相关信息</h2><p style=\"margin-bottom: 1.46em;\">如需将你的项目升级到 Larvel v5.6 ，请参考<a href=\"https://laravel.com/docs/5.6/upgrade\" style=\"color: rgb(244, 100, 95); text-decoration-color: rgba(0, 0, 0, 0.4); outline-style: initial; outline-width: 0px; word-wrap: break-word;\">升级指南</a>。Laravel 一直努力降低主版本升级的复杂度。从 5.5 升级到 5.6 大约需要 10-30 分钟，当然也要看你的项目的复杂度了。</p><hr style=\"height: 1px; margin: 3.2em auto; border-right-style: none; border-bottom-style: none; border-left-style: none; border-top-color: rgb(222, 222, 220); width: 340px;\"><p style=\"margin-bottom: 1.46em;\">英文原文地址：<a href=\"https://laravel-news.com/laravel-5-6\" style=\"color: rgb(244, 100, 95); text-decoration-color: rgba(0, 0, 0, 0.4); outline-style: initial; outline-width: 0px; word-wrap: break-word;\">https://laravel-news.com/laravel-5-6</a></p></section>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519498292041,1519498292041),
	(6,1,'LESS与SASS的区别',NULL,NULL,NULL,NULL,'https://www.jianshu.com/p/e3f1fcbbccc3',NULL,NULL,'<div><div><div class=\"article\"><div data-note-content=\"\" class=\"show-content\"><div class=\"show-content-free\"><div class=\"image-package\"><img src=\"http://img0.imgtn.bdimg.com/it/u=861104756,4244471114&amp;fm=26&amp;gp=0.jpg\" data-original-src=\"http://img0.imgtn.bdimg.com/it/u=861104756,4244471114&amp;fm=26&amp;gp=0.jpg\" style=\"cursor: zoom-in;\"><div class=\"image-caption\"></div>\n</div>\n<h3>前言</h3>\n<p>首先sass和less都是css的预编译处理语言，他们引入了mixins，参数，嵌套规则，运算，颜色，名字空间，作用域，JavaScript赋值等 加快了css开发效率,当然这两者都可以配合gulp和grunt等前端构建工具使用</p>\n<p>sass和less主要区别:在于实现方式 less是基于JavaScript的在客户端处理 所以安装的时候用npm，sass是基于ruby所以在服务器处理。</p>\n<p>很多开发者不会选择LESS因为JavaScript引擎需要额外的时间来处理代码然后输出修改过的CSS到浏览器。关于这个有很多种方式，我选择的是只在开发环节使用LESS。一旦我完成了开发，我就复制然后粘贴LESS输出的到一个压缩器，然后到一个单独的CSS文件来替代LESS文件。另一个选择是使用LESS.app来编译和压缩你的LESS文件。两个选择都将最小化你的样式输出，从而避免由于用户的浏览器不支持JavaScript而可能引起的任何问题。尽管这不大可能，但终归是有可能的</p>\n<h4>LESS详细</h4>\n<p>首先扩展文件名的格式是 xxx.less</p>\n<p>在此推荐大家在练习环节可以用</p>\n<pre class=\"hljs xml\"><code class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">script</span> <span class=\"hljs-attr\">src</span>=<span class=\"hljs-string\">\"less.js\"</span><span class=\"hljs-attr\">...</span>&gt;</span><span class=\"undefined\"> 这种方式编译less\n</span></code></pre>\n<p>但在实际项目中 还是用命令行的 lessc xxx.less&gt;xxx.css 方式然后引入编译后的css文件 这样减少在运行时上面出现的问题</p>\n<pre class=\"hljs cpp\"><code class=\"cpp\"><span class=\"hljs-comment\">//安装less</span>\nnpm install -g less\n</code></pre>\n<h5>变量</h5>\n<pre class=\"hljs java\"><code class=\"java\">@变量名:值\n<span class=\"hljs-meta\">@width</span>：<span class=\"hljs-number\">100</span>px;\n.box{\n    width:<span class=\"hljs-meta\">@width</span>;\n}\n</code></pre>\n<h5>混合</h5>\n<pre class=\"hljs java\"><code class=\"java\">定义classa 然后可以将classa引入到classb中\n.classa(a){\n    width:<span class=\"hljs-meta\">@width</span>;\n}\n\n.classb{\n    .classa(a);\n}\n</code></pre>\n<h5>嵌套规则</h5>\n<pre class=\"hljs undefined\"><code>父级{\n    子集\n}\n</code></pre>\n<h5>函数和运算</h5>\n<pre class=\"hljs ruby\"><code class=\"ruby\">可以将值计算\n@the-<span class=\"hljs-symbol\">border:</span> <span class=\"hljs-number\">1</span>px;\n@base-<span class=\"hljs-symbol\">color:</span> <span class=\"hljs-comment\">#111;</span>\n@red:        <span class=\"hljs-comment\">#842210;</span>\n\n<span class=\"hljs-comment\">#header {</span>\n  <span class=\"hljs-symbol\">color:</span> @base-color * <span class=\"hljs-number\">3</span>;\n  border-<span class=\"hljs-symbol\">left:</span> @the-border;\n  border-<span class=\"hljs-symbol\">right:</span> @the-border * <span class=\"hljs-number\">2</span>;\n}\n<span class=\"hljs-comment\">#footer { </span>\n  <span class=\"hljs-symbol\">color:</span> @base-color + <span class=\"hljs-comment\">#003300;</span>\n  border-<span class=\"hljs-symbol\">color:</span> desaturate(@red, <span class=\"hljs-number\">10</span>%);\n}\n</code></pre>\n<h4>SASS详细</h4>\n<p>首件扩展文件名的格式是 xxx.scss 或者是 xxx.sass</p>\n<p>使用方法: sass xxx.scss xxx.css</p>\n<h5>编译风格：</h5>\n<pre class=\"hljs undefined\"><code>nested:嵌套缩进的css代码，默认\nexpanded:没有缩紧的,扩展的css代码\ncampact:简介格式的css代码\ncompressed:压缩后的css代码(生产环境)\n</code></pre>\n<p>使用的时候　sass --style compressed xxx.sass xxx.css</p>\n<h5>监听目录</h5>\n<pre class=\"hljs cpp\"><code class=\"cpp\">sass --watch xxx.scss:xxx.css <span class=\"hljs-comment\">//监听文件</span>\nsass --watch scsspath:csspath <span class=\"hljs-comment\">//监听文件夹</span>\n</code></pre>\n<h5>变量</h5>\n<pre class=\"hljs ruby\"><code class=\"ruby\">$变量名<span class=\"hljs-symbol\">:</span>值\n$width：<span class=\"hljs-number\">100</span>px;\n\n.box{\n    <span class=\"hljs-symbol\">width:</span>$width;\n}\n\n如果变量包含字符串则写在 <span class=\"hljs-comment\">#{}之中</span>\n$c<span class=\"hljs-symbol\">:color</span>;\n\n.box{\n    border-<span class=\"hljs-comment\">#{$c}:red;</span>\n}\n</code></pre>\n<h5>嵌套计算</h5>\n<p>less和sass嵌套相同，计算同理</p>\n<h5>继承</h5>\n<p>同less混合相同 定义classa 然后再classb可饮用classa值</p>\n<pre class=\"hljs java\"><code class=\"java\"><span class=\"hljs-comment\">//使用方法 定义classa </span>\n.classb{\n    <span class=\"hljs-meta\">@extend</span> .classa\n}\n</code></pre>\n<h5>Mixin</h5>\n<p>即重用代码块</p>\n<pre class=\"hljs cpp\"><code class=\"cpp\"><span class=\"hljs-comment\">//使用方法先用@mixin命令定义一个代码块</span>\n@<span class=\"hljs-function\">mixin <span class=\"hljs-title\">left</span><span class=\"hljs-params\">(参数<span class=\"hljs-number\">1</span>，参数<span class=\"hljs-number\">2</span>)</span></span>{\n    <span class=\"hljs-keyword\">float</span>:left;\n    margin-left:<span class=\"hljs-number\">10</span>px;\n}\n<span class=\"hljs-comment\">//使用@include调用刚刚定义的代码块</span>\n.box{\n    @<span class=\"hljs-function\">inclidu <span class=\"hljs-title\">left</span><span class=\"hljs-params\">(参数<span class=\"hljs-number\">1</span>，参数<span class=\"hljs-number\">2</span>)</span></span>;\n}\n</code></pre>\n<h5>颜色函数 lighten(颜色，百分比)</h5>\n<h5>插入文件</h5>\n<pre class=\"hljs cpp\"><code class=\"cpp\">@<span class=\"hljs-keyword\">import</span>命令插入外部文件 .scss和css都可\n</code></pre>\n<h5>条件语句</h5>\n<pre class=\"hljs bash\"><code class=\"bash\">//@<span class=\"hljs-keyword\">if</span> 可以用来判断 @<span class=\"hljs-keyword\">else</span> 则是配套\n\n.box{\n    @<span class=\"hljs-keyword\">if</span> 1+1&gt;1 {width:100px;}@<span class=\"hljs-keyword\">else</span> {\n        width:200px;\n    }\n}\n</code></pre>\n<h5>循环语句</h5>\n<pre class=\"hljs bash\"><code class=\"bash\">//@<span class=\"hljs-keyword\">for</span> @<span class=\"hljs-keyword\">while</span> @each\n\n@<span class=\"hljs-keyword\">for</span> <span class=\"hljs-variable\">$i</span> from 1 to 10{\n    border-<span class=\"hljs-comment\">#{$i}{</span>\n        border:<span class=\"hljs-comment\">#{$i}px solid red;</span>\n    }\n}\n\n//@<span class=\"hljs-keyword\">while</span>\n<span class=\"hljs-variable\">$i</span>:6;\n@<span class=\"hljs-keyword\">while</span> <span class=\"hljs-variable\">$i</span>&gt;0{\n    .item-<span class=\"hljs-comment\">#{$i}{</span>\n        width:2em*<span class=\"hljs-variable\">$i</span>;\n    }\n    <span class=\"hljs-variable\">$i</span>:<span class=\"hljs-variable\">$i</span>-2;\n}\n\n//@each\n    @each <span class=\"hljs-variable\">$member</span> <span class=\"hljs-keyword\">in</span> a, b, c, d {\n　　　　.<span class=\"hljs-comment\">#{$member} {</span>\n　　　　　　background-image: url(<span class=\"hljs-string\">\"/image/#{<span class=\"hljs-variable\">$member</span>}.jpg\"</span>);\n　　　　}\n　　}\n</code></pre>\n<h5>自定义函数</h5>\n<pre class=\"hljs css\"><code class=\"css\">@<span class=\"hljs-keyword\">function</span> name($n){\n    @<span class=\"hljs-keyword\">return</span> $n*<span class=\"hljs-number\">2</span>;\n}\n\n<span class=\"hljs-selector-class\">.box</span>{\n    <span class=\"hljs-attribute\">width</span>:<span class=\"hljs-built_in\">name</span>(value);\n}\n</code></pre>\n<h3>总结</h3>\n<p>总体来说sass和less都有各自的好处，这要根据每个开发者的习惯和爱好来使用，都可提高开发效率，当然还有stylus等工具，因为目前未使用过所以不做评判，个人比较倾向sass，至于比较，两者都有其优缺点，如果你开发环境中并没有ruby 并且你不想安装ruby 你就可以使用less，如果你觉得sass的语法你更倾向并且你安装了ruby 你就可以使用sass。总之工具不重要，码出一手好代码才是真理。</p>\n\n          </div>\n        </div>\n    </div>\n\n    <!-- 连载目录项 -->\n\n    <!-- 打赏文章、购买文章、购买连载 -->\n        <div id=\"free-reward-panel\" class=\"support-author\"><p></p></div></div><br><br>作者：dali_saymore<br>链接：https://www.jianshu.com/p/e3f1fcbbccc3<br>來源：简书<br>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</div>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519498510610,1519498510610),
	(7,1,'什么是Workerman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<h2 style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">workerman</h2><p class=\"f16\" style=\"margin-bottom: 10px; text-indent: 2em; font-size: 16px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">workerman是一个高性能的PHP socket 服务器框架，workerman基于PHP多进程以及libevent事件轮询库，PHP开发者只要实现一两个接口，便可以开发出自己的网络应用，例如Rpc服务、聊天室服务器、手机游戏服务器等。</p><p class=\"f16\" style=\"margin-bottom: 10px; text-indent: 2em; font-size: 16px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">workerman的目标是让PHP开发者更容易的开发出基于socket的高性能的应用服务，而不用去了解PHP socket以及PHP多进程细节。 workerman本身是一个PHP多进程服务器框架，具有PHP进程管理以及socket通信的模块，所以不依赖php-fpm、nginx或者apache等这些容器便可以独立运行。</p><div><br></div>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519498585363,1519498585363),
	(8,1,'Angular4中常用管道',NULL,NULL,NULL,NULL,'http://blog.csdn.net/haijing1995/article/details/71404350',NULL,NULL,'<h2 id=\"angular4中常用管道\" style=\"font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; margin-top: 8px; margin-bottom: 16px; font-weight: 700; color: rgb(79, 79, 79); font-size: 24px; line-height: 32px;\">Angular4中常用管道</h2><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">通常我们需要使用管道实现对数据的格式化，Angular4中的管道和之前有了一些变化，下面说一些常用的管道。</p><h3 id=\"一大小写转换管道\" style=\"font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; margin-top: 8px; margin-bottom: 16px; font-weight: 700; color: rgb(79, 79, 79); font-size: 22px; line-height: 30px;\"><a name=\"t1\" style=\"color: rgb(78, 161, 219); outline-style: initial; outline-width: 0px; margin: 0px; padding: 0px; font-weight: 400;\"></a>一、大小写转换管道</h3><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">uppercase将字符串转换为大写&nbsp;<br>lowercase将字符串转换为小写</p><pre class=\"prettyprint\" style=\"margin-bottom: 24px; padding: 8px 16px 4px 56px; position: relative; overflow-y: hidden; border: none; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; color: rgb(0, 0, 0); background-color: rgb(246, 248, 250);\"><code class=\"hljs handlebars has-numbering\" style=\"display: block; color: rgb(0, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; background-color: rgb(246, 248, 250); border-radius: 4px; overflow-x: auto; word-wrap: normal;\"><span class=\"xml\" style=\"margin: 0px; padding: 0px;\"><span class=\"hljs-tag\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">&lt;<span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">p</span>&gt;</span>将字符串转换为大写</span><span class=\"hljs-expression\" style=\"margin: 0px; padding: 0px;\">{{<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">str</span> | <span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">uppercase</span>}}</span><span class=\"xml\" style=\"margin: 0px; padding: 0px;\"><span class=\"hljs-tag\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">&lt;/<span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">p</span>&gt;</span></span></code><ul class=\"pre-numbering\" style=\"padding-top: 8px; padding-bottom: 8px; position: absolute; width: 48px; background-color: rgb(238, 240, 244); top: 0px; left: 0px; text-align: right;\"><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">1</li></ul></pre><pre class=\"prettyprint\" style=\"margin-bottom: 24px; padding: 8px 16px 4px 56px; position: relative; overflow-y: hidden; border: none; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; color: rgb(0, 0, 0); background-color: rgb(246, 248, 250);\"><code class=\"hljs cs has-numbering\" style=\"display: block; color: rgb(0, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; background-color: rgb(246, 248, 250); border-radius: 4px; overflow-x: auto; word-wrap: normal;\">str:<span class=\"hljs-keyword\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 136);\">string</span> = <span class=\"hljs-string\" style=\"margin: 0px; padding: 0px; color: rgb(0, 153, 0);\">\'hello\'</span></code><ul class=\"pre-numbering\" style=\"padding-top: 8px; padding-bottom: 8px; position: absolute; width: 48px; background-color: rgb(238, 240, 244); top: 0px; left: 0px; text-align: right;\"><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">1</li></ul></pre><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">页面上会显示&nbsp;<br>将字符串转换为大写HELLO</p><h3 id=\"二日期管道\" style=\"font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; margin-top: 8px; margin-bottom: 16px; font-weight: 700; color: rgb(79, 79, 79); font-size: 22px; line-height: 30px;\"><a name=\"t2\" style=\"color: rgb(78, 161, 219); outline-style: initial; outline-width: 0px; margin: 0px; padding: 0px; font-weight: 400;\"></a>二、日期管道</h3><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">date。日期管道符可以接受参数，用来规定输出日期的格式。</p><pre class=\"prettyprint\" style=\"margin-bottom: 24px; padding: 8px 16px 4px 56px; position: relative; overflow-y: hidden; border: none; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; color: rgb(0, 0, 0); background-color: rgb(246, 248, 250);\"><code class=\"hljs handlebars has-numbering\" style=\"display: block; color: rgb(0, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; background-color: rgb(246, 248, 250); border-radius: 4px; overflow-x: auto; word-wrap: normal;\"><span class=\"xml\" style=\"margin: 0px; padding: 0px;\"><span class=\"hljs-tag\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">&lt;<span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">p</span>&gt;</span>现在的时间是</span><span class=\"hljs-expression\" style=\"margin: 0px; padding: 0px;\">{{<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">today</span> | <span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">date</span>:\'<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">yyyy-MM-dd</span> <span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">HH</span>:<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">mm</span>:<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">ss</span>\'}}</span><span class=\"xml\" style=\"margin: 0px; padding: 0px;\"><span class=\"hljs-tag\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">&lt;/<span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">p</span>&gt;</span></span></code><ul class=\"pre-numbering\" style=\"padding-top: 8px; padding-bottom: 8px; position: absolute; width: 48px; background-color: rgb(238, 240, 244); top: 0px; left: 0px; text-align: right;\"><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">1</li></ul></pre><pre class=\"prettyprint\" style=\"margin-bottom: 24px; padding: 8px 16px 4px 56px; position: relative; overflow-y: hidden; border: none; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; color: rgb(0, 0, 0); background-color: rgb(246, 248, 250);\"><code class=\"hljs javascript has-numbering\" style=\"display: block; color: rgb(0, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; background-color: rgb(246, 248, 250); border-radius: 4px; overflow-x: auto; word-wrap: normal;\">today:<span class=\"hljs-built_in\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">Date</span> = <span class=\"hljs-keyword\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 136);\">new</span> <span class=\"hljs-built_in\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">Date</span>();</code><ul class=\"pre-numbering\" style=\"padding-top: 8px; padding-bottom: 8px; position: absolute; width: 48px; background-color: rgb(238, 240, 244); top: 0px; left: 0px; text-align: right;\"><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">1</li></ul></pre><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">页面上会显示现在的时间是2017年05月08日10时57分53秒</p><h3 id=\"三小数管道\" style=\"font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; margin-top: 8px; margin-bottom: 16px; font-weight: 700; color: rgb(79, 79, 79); font-size: 22px; line-height: 30px;\"><a name=\"t3\" style=\"color: rgb(78, 161, 219); outline-style: initial; outline-width: 0px; margin: 0px; padding: 0px; font-weight: 400;\"></a>三、小数管道</h3><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">number管道用来将数字处理为我们需要的小数格式&nbsp;<br>接收的参数格式为{最少整数位数}.{最少小数位数}-{最多小数位数}&nbsp;<br>其中最少整数位数默认为1&nbsp;<br>最少小数位数默认为0&nbsp;<br>最多小数位数默认为3&nbsp;<br>当小数位数少于规定的{最少小数位数}时，会自动补0&nbsp;<br>当小数位数多于规定的{最多小数位数}时，会四舍五入</p><pre class=\"prettyprint\" style=\"margin-bottom: 24px; padding: 8px 16px 4px 56px; position: relative; overflow-y: hidden; border: none; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; color: rgb(0, 0, 0); background-color: rgb(246, 248, 250);\"><code class=\"hljs handlebars has-numbering\" style=\"display: block; color: rgb(0, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; background-color: rgb(246, 248, 250); border-radius: 4px; overflow-x: auto; word-wrap: normal;\"><span class=\"xml\" style=\"margin: 0px; padding: 0px;\"><span class=\"hljs-tag\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">&lt;<span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">p</span>&gt;</span>圆周率是</span><span class=\"hljs-expression\" style=\"margin: 0px; padding: 0px;\">{{<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">pi</span> | <span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">number</span>:\'2<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">.</span>2<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">-</span>4\'}}</span><span class=\"xml\" style=\"margin: 0px; padding: 0px;\"><span class=\"hljs-tag\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">&lt;/<span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">p</span>&gt;</span></span></code><ul class=\"pre-numbering\" style=\"padding-top: 8px; padding-bottom: 8px; position: absolute; width: 48px; background-color: rgb(238, 240, 244); top: 0px; left: 0px; text-align: right;\"><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">1</li></ul></pre><pre class=\"prettyprint\" style=\"margin-bottom: 24px; padding: 8px 16px 4px 56px; position: relative; overflow-y: hidden; border: none; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; color: rgb(0, 0, 0); background-color: rgb(246, 248, 250);\"><code class=\"hljs applescript has-numbering\" style=\"display: block; color: rgb(0, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; background-color: rgb(246, 248, 250); border-radius: 4px; overflow-x: auto; word-wrap: normal;\"><span class=\"hljs-constant\" style=\"margin: 0px; padding: 0px; color: rgb(0, 153, 0);\">pi</span>:<span class=\"hljs-type\" style=\"margin: 0px; padding: 0px;\">number</span> = <span class=\"hljs-number\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">3.14159</span>;</code><ul class=\"pre-numbering\" style=\"padding-top: 8px; padding-bottom: 8px; position: absolute; width: 48px; background-color: rgb(238, 240, 244); top: 0px; left: 0px; text-align: right;\"><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">1</li></ul></pre><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">页面上会显示&nbsp;<br>圆周率是03.1416</p><h3 id=\"四货币管道\" style=\"font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; margin-top: 8px; margin-bottom: 16px; font-weight: 700; color: rgb(79, 79, 79); font-size: 22px; line-height: 30px;\"><a name=\"t4\" style=\"color: rgb(78, 161, 219); outline-style: initial; outline-width: 0px; margin: 0px; padding: 0px; font-weight: 400;\"></a>四、货币管道</h3><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">currency管道用来将数字转换为货币格式</p><pre class=\"prettyprint\" style=\"margin-bottom: 24px; padding: 8px 16px 4px 56px; position: relative; overflow-y: hidden; border: none; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; color: rgb(0, 0, 0); background-color: rgb(246, 248, 250);\"><code class=\"hljs handlebars has-numbering\" style=\"display: block; color: rgb(0, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; background-color: rgb(246, 248, 250); border-radius: 4px; overflow-x: auto; word-wrap: normal;\"><span class=\"xml\" style=\"margin: 0px; padding: 0px;\">&lt;p&gt;</span><span class=\"hljs-expression\" style=\"margin: 0px; padding: 0px;\">{{<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">a</span> | <span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">currency</span>:\'<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">USD</span>\':<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">false</span>}}</span><span class=\"xml\" style=\"margin: 0px; padding: 0px;\">&lt;/p&gt;\n&lt;p&gt;</span><span class=\"hljs-expression\" style=\"margin: 0px; padding: 0px;\">{{<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">b</span> | <span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">currency</span>:\'<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">USD</span>\':<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">true</span>:\'4<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">.</span>2<span class=\"hljs-variable\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">-</span>2\'}}</span><span class=\"xml\" style=\"margin: 0px; padding: 0px;\">&lt;/p&gt;</span></code><ul class=\"pre-numbering\" style=\"padding-top: 8px; padding-bottom: 8px; position: absolute; width: 48px; background-color: rgb(238, 240, 244); top: 0px; left: 0px; text-align: right;\"><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">1</li><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">2</li></ul></pre><pre class=\"prettyprint\" style=\"margin-bottom: 24px; padding: 8px 16px 4px 56px; position: relative; overflow-y: hidden; border: none; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; color: rgb(0, 0, 0); background-color: rgb(246, 248, 250);\"><code class=\"hljs livecodeserver has-numbering\" style=\"display: block; color: rgb(0, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; line-height: 22px; background-color: rgb(246, 248, 250); border-radius: 4px; overflow-x: auto; word-wrap: normal;\"><span class=\"hljs-operator\" style=\"margin: 0px; padding: 0px;\">a</span>:<span class=\"hljs-built_in\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">number</span> = <span class=\"hljs-number\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">8.2515</span>\nb:<span class=\"hljs-built_in\" style=\"margin: 0px; padding: 0px; color: rgb(79, 79, 79);\">number</span> = <span class=\"hljs-number\" style=\"margin: 0px; padding: 0px; color: rgb(0, 102, 102);\">156.548</span></code><ul class=\"pre-numbering\" style=\"padding-top: 8px; padding-bottom: 8px; position: absolute; width: 48px; background-color: rgb(238, 240, 244); top: 0px; left: 0px; text-align: right;\"><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">1</li><li style=\"padding-right: 8px; padding-left: 8px; list-style: none; color: rgb(153, 153, 153);\">2</li></ul></pre><p style=\"margin-bottom: 16px; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;\">页面上将显示&nbsp;<br>USD8.25&nbsp;<br><span class=\"MathJax_Preview\" style=\"margin: 0px; padding: 0px;\"></span><span class=\"MathJax\" id=\"MathJax-Element-36-Frame\" role=\"textbox\" aria-readonly=\"true\" style=\"margin: 0px; padding: 0px; outline: 0px;\"><nobr><span class=\"math\" id=\"MathJax-Span-2836\" style=\"margin: 0px; padding: 0px; width: 37.229em; display: inline-block;\"><span style=\"margin: 0px; padding: 0px; display: inline-block; position: relative; width: 29.763em; height: 0px; font-size: 20px;\"><span style=\"margin: 0px; padding: 0px; position: absolute; clip: rect(1.656em, 1000em, 3.096em, -0.424em); top: -2.717em; left: 0.003em; border-color: transparent !important;\"><span class=\"mrow\" id=\"MathJax-Span-2837\" style=\"margin: 0px; padding: 0px;\"><span class=\"mn\" id=\"MathJax-Span-2838\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Main;\">0156.55</span><span class=\"texatom\" id=\"MathJax-Span-2839\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2840\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2841\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">这</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2842\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2843\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2844\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">里</span></span></span></span><span class=\"msup\" id=\"MathJax-Span-2845\" style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; display: inline-block; position: relative; width: 1.069em; height: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; position: absolute; clip: rect(1.389em, 1000em, 2.723em, -0.477em); top: -2.344em; left: 0.003em;\"><span class=\"texatom\" id=\"MathJax-Span-2846\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2847\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2848\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">的</span></span></span></span><span style=\"margin: 0px; padding: 0px; display: inline-block; width: 0px; height: 2.349em; border-color: transparent !important;\"></span></span><span style=\"margin: 0px; padding: 0px; position: absolute; top: -3.037em; left: 0.803em; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2849\" style=\"margin: 0px; padding: 0px; font-size: 14.14px; font-family: MathJax_Main;\">′</span><span style=\"margin: 0px; padding: 0px; display: inline-block; width: 0px; height: 2.509em; border-color: transparent !important;\"></span></span></span></span><span class=\"mi\" id=\"MathJax-Span-2850\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">U<span style=\"margin: 0px; padding: 0px; display: inline-block; overflow: hidden; height: 1px; width: 0.109em; border-color: transparent !important;\"></span></span><span class=\"mi\" id=\"MathJax-Span-2851\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">S<span style=\"margin: 0px; padding: 0px; display: inline-block; overflow: hidden; height: 1px; width: 0.056em; border-color: transparent !important;\"></span></span><span class=\"msup\" id=\"MathJax-Span-2852\" style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; display: inline-block; position: relative; width: 1.123em; height: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; position: absolute; clip: rect(1.709em, 1000em, 2.723em, -0.424em); top: -2.557em; left: 0.003em;\"><span class=\"mi\" id=\"MathJax-Span-2853\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">D</span><span style=\"margin: 0px; padding: 0px; display: inline-block; width: 0px; height: 2.563em; border-color: transparent !important;\"></span></span><span style=\"margin: 0px; padding: 0px; position: absolute; top: -2.931em; left: 0.856em; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2854\" style=\"margin: 0px; padding: 0px; font-size: 14.14px; font-family: MathJax_Main;\">′</span><span style=\"margin: 0px; padding: 0px; display: inline-block; width: 0px; height: 2.509em; border-color: transparent !important;\"></span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2855\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2856\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2857\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">是</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2858\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2859\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2860\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">美</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2861\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2862\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2863\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">元</span></span></span></span><span class=\"mi\" id=\"MathJax-Span-2864\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">U<span style=\"margin: 0px; padding: 0px; display: inline-block; overflow: hidden; height: 1px; width: 0.109em; border-color: transparent !important;\"></span></span><span class=\"mi\" id=\"MathJax-Span-2865\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">n</span><span class=\"mi\" id=\"MathJax-Span-2866\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">i</span><span class=\"mi\" id=\"MathJax-Span-2867\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">t</span><span class=\"mi\" id=\"MathJax-Span-2868\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">e</span><span class=\"mi\" id=\"MathJax-Span-2869\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">d<span style=\"margin: 0px; padding: 0px; display: inline-block; overflow: hidden; height: 1px; width: 0.003em; border-color: transparent !important;\"></span></span><span class=\"mi\" id=\"MathJax-Span-2870\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">S<span style=\"margin: 0px; padding: 0px; display: inline-block; overflow: hidden; height: 1px; width: 0.056em; border-color: transparent !important;\"></span></span><span class=\"mi\" id=\"MathJax-Span-2871\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">t</span><span class=\"mi\" id=\"MathJax-Span-2872\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">a</span><span class=\"mi\" id=\"MathJax-Span-2873\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">t</span><span class=\"mi\" id=\"MathJax-Span-2874\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">e</span><span class=\"mi\" id=\"MathJax-Span-2875\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">s</span><span class=\"mi\" id=\"MathJax-Span-2876\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">d<span style=\"margin: 0px; padding: 0px; display: inline-block; overflow: hidden; height: 1px; width: 0.003em; border-color: transparent !important;\"></span></span><span class=\"mi\" id=\"MathJax-Span-2877\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">o</span><span class=\"mi\" id=\"MathJax-Span-2878\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">l</span><span class=\"mi\" id=\"MathJax-Span-2879\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">l</span><span class=\"mi\" id=\"MathJax-Span-2880\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">a</span><span class=\"mi\" id=\"MathJax-Span-2881\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">r</span><span class=\"texatom\" id=\"MathJax-Span-2882\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2883\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2884\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">的</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2885\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2886\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2887\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">缩</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2888\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2889\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2890\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">写</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2891\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2892\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2893\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">，</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2894\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2895\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2896\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">当</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2897\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2898\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2899\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">为</span></span></span></span><span class=\"mi\" id=\"MathJax-Span-2900\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">f<span style=\"margin: 0px; padding: 0px; display: inline-block; overflow: hidden; height: 1px; width: 0.056em; border-color: transparent !important;\"></span></span><span class=\"mi\" id=\"MathJax-Span-2901\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">a</span><span class=\"mi\" id=\"MathJax-Span-2902\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">l</span><span class=\"mi\" id=\"MathJax-Span-2903\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">s</span><span class=\"mi\" id=\"MathJax-Span-2904\" style=\"margin: 0px; padding: 0px; font-family: MathJax_Math-italic;\">e</span><span class=\"texatom\" id=\"MathJax-Span-2905\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2906\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2907\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">时</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2908\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2909\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2910\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">不</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2911\" style=\"margin: 0px; padding: 0px;\"><span class=\"mrow\" id=\"MathJax-Span-2912\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2913\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">显</span></span></span></span><span class=\"texatom\" id=\"MathJax-Span-2914\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mrow\" id=\"MathJax-Span-2915\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span class=\"mo\" id=\"MathJax-Span-2916\" style=\"margin: 0px; padding: 0px; border-color: transparent !important;\"><span style=\"margin: 0px; padding: 0px; font-family: STIXGeneral, &quot;Arial Unicode MS&quot;, serif; font-size: 16px; border-color: transparent !important;\">示</span></span></span></span></span><span style=\"margin: 0px; padding: 0px; display: inline-block; width: 0px; height: 2.723em; border-color: transparent !important;\"></span></span></span><span style=\"margin: 0px; padding: 0px; border-left: 0.003em solid; display: inline-block; overflow: hidden; width: 0px; height: 1.537em; vertical-align: -0.33em; color: rgb(255, 255, 255); border-top-color: transparent !important; border-right-color: transparent !important; border-bottom-color: transparent !important;\"></span></span></nobr></span>符，当为true时，则显示$符。后面的规定小数位数的参数和上面介绍的一样。</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519498832901,1519498832901),
	(9,1,'云南安浪科技有限公司',NULL,NULL,NULL,NULL,'http://www.qixin.com/company/d9127ff3-a95f-413f-8637-81b370cfde53?token=fa6e4d9a65ca9eec9de07691a0a83865&from=bkdt',NULL,NULL,'<div class=\"tab-content\" id=\"icinfo\" style=\"color: rgb(67, 70, 79); font-family: &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif; font-size: 14px;\"><h4 class=\"section-title margin-t-2x\" style=\"line-height: 1.1; color: inherit; margin-bottom: 10px; font-size: 18px; border-left: 6px solid rgb(15, 187, 233); padding-left: 8px; margin-top: 30px !important;\"><span style=\"font-weight: 700;\">工商信息</span></h4><table class=\"table table1 table-bordered margin-t-1x\" style=\"border-spacing: 0px; width: 847px; margin-bottom: 0px; border-color: rgb(221, 221, 221); margin-right: 0px; margin-left: 0px; margin-top: 15px !important;\"><tbody><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">统一社会信用代码</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">91532300MA6K7XLAXG</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">组织机构代码</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">MA6K7XLAX</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">注册号</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">91532300MA6K7XLAXG</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">经营状态</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">存续（在营、开业、在册）</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">所属行业</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">零售业</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">成立日期</td><td class=\"qxb-num\" style=\"padding: 8px; transform: translate(0px); text-rendering: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.42857; font-size: inherit; font-weight: inherit; -webkit-font-smoothing: antialiased; border-color: rgb(221, 221, 221); font-family: FontAwesomeQxb, &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif !important;\">4051年50月56日</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">公司类型</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">有限责任公司</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">营业期限</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">2016年10月18日 - -</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">法定代表人</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\"><a href=\"http://www.qixin.com/search/?key=%E7%BD%97%E6%AD%A3%E5%AE%89&amp;scope=3\" data-event-name=\"工商信息-点击法人名字\" target=\"_blank\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all;\">罗正安</a><a href=\"http://www.qixin.com/order/create/d9127ff3-a95f-413f-8637-81b370cfde53/?reportId=562b47719ecb94ee5941790c\" class=\"btn4 btn-xs margin-l-0-6x\" target=\"_blank\" data-event-name=\"增值版企业信用报告\" data-event-props=\"{&quot;触发页面&quot;:&quot;法人对外投资&quot;}\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all; display: inline-block; margin-bottom: 0px; text-align: center; vertical-align: middle; background-image: none; border: 1px solid rgb(15, 187, 233); white-space: nowrap; padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 0px; user-select: none; outline-style: initial !important; outline-width: 0px !important; margin-left: 10px !important;\"><span class=\"icon icon-duiwaitouzixiazai\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; margin-right: 5px; font-family: qixin !important;\"></span>法人对外投资</a></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">发照日期</td><td class=\"qxb-num\" style=\"padding: 8px; transform: translate(0px); text-rendering: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.42857; font-size: inherit; font-weight: inherit; -webkit-font-smoothing: antialiased; border-color: rgb(221, 221, 221); font-family: FontAwesomeQxb, &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif !important;\">4051年50月56日</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">注册资本</td><td class=\"qxb-num\" style=\"padding: 8px; transform: translate(0px); text-rendering: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.42857; font-size: inherit; font-weight: inherit; -webkit-font-smoothing: antialiased; border-color: rgb(221, 221, 221); font-family: FontAwesomeQxb, &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif !important;\">540万元人民币</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">登记机关</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">楚雄州工商行政管理局</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">企业地址</td><td colspan=\"3\" style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">云南省楚雄开发区三期私营城第三批48-49号地</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">经营范围</td><td colspan=\"3\" style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">网站建设、维护；计算机软、硬件开发、代理、销售；计算机网络技术研究、技术开发、技术咨询服务；教育信息、农业信息、商务信息咨询服务；市场营销策划；企业形象设计；安防设备销售、安装、维护服务；电子产品设计、销售、维护服务；计算机系统集成及综合布线；农产品销售；广告设计、制作、代理、发布；图文设计、制作；广告设备出租；摄影服务。（依法须经批准的项目，经相关部门批准后方可开展经营活动）</td></tr></tbody></table></div><div class=\"tab-content\" id=\"partners\" style=\"color: rgb(67, 70, 79); font-family: &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif; font-size: 14px;\"><h4 class=\"section-title margin-t-2x\" style=\"line-height: 1.1; color: inherit; margin-bottom: 10px; font-size: 18px; border-left: 6px solid rgb(15, 187, 233); padding-left: 8px; margin-top: 30px !important;\"><span style=\"font-weight: 700;\">股东信息</span><span class=\"badge  margin-l-0-3x\" style=\"min-width: 10px; padding: 3px 7px; font-size: 12px; font-weight: 400; color: rgb(255, 255, 255); vertical-align: middle; background-color: rgb(166, 172, 188); border-radius: 10px; margin-left: 5px !important;\">2</span></h4><table class=\"table table2 table-bordered margin-t-1x\" style=\"border-spacing: 0px; width: 847px; margin-bottom: 0px; border-color: rgb(221, 221, 221); margin-right: 0px; margin-left: 0px; margin-top: 15px !important;\"><thead><tr><th style=\"padding: 8px; text-align: left; line-height: 1.42857; border-top: 0px; border-bottom: none; border-right-color: rgb(221, 221, 221); border-left-color: rgb(221, 221, 221); background-color: rgb(252, 252, 252); color: rgb(166, 172, 188); word-break: keep-all; white-space: nowrap;\">股东类型</th><th style=\"padding: 8px; text-align: left; line-height: 1.42857; border-top: 0px; border-bottom: none; border-right-color: rgb(221, 221, 221); border-left-color: rgb(221, 221, 221); background-color: rgb(252, 252, 252); color: rgb(166, 172, 188); word-break: keep-all; white-space: nowrap;\">股东</th><th style=\"padding: 8px; text-align: left; line-height: 1.42857; border-top: 0px; border-bottom: none; border-right-color: rgb(221, 221, 221); border-left-color: rgb(221, 221, 221); background-color: rgb(252, 252, 252); color: rgb(166, 172, 188); word-break: keep-all; white-space: nowrap;\">认缴出资（金额/时间）</th><th style=\"padding: 8px; text-align: left; line-height: 1.42857; border-top: 0px; border-bottom: none; border-right-color: rgb(221, 221, 221); border-left-color: rgb(221, 221, 221); background-color: rgb(252, 252, 252); color: rgb(166, 172, 188); word-break: keep-all; white-space: nowrap;\">实缴出资（金额/时间）</th></tr></thead><tbody><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px;\">自然人股东</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\"><a href=\"http://www.qixin.com/search/?key=%E6%9D%8E%E7%87%95&amp;scope=2\" data-event-name=\"股东信息-点击名字\" target=\"_blank\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all;\">李燕</a><button class=\"btn4 btn-xs pull-right\" data-marko=\"{&quot;onclick&quot;:&quot;showDialog s0-9-20-16 李燕&quot;}\" style=\"color: rgb(15, 187, 233); font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 12px; line-height: 1.5; cursor: pointer; vertical-align: middle; background-image: none; border-color: rgb(15, 187, 233); white-space: nowrap; padding: 1px 5px; user-select: none; outline: 0px !important;\"><span class=\"icon icon-duiwaitouzixiazai\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; margin-right: 5px; font-family: qixin !important;\"></span>对外投资及任职</button></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">108万人民币<a class=\"pull-right icon icon-chuzi\" data-marko=\"{&quot;onclick&quot;:&quot;showDetail s0-9-20 0&quot;}\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all; speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; font-size: 20px; font-family: qixin !important;\"></a></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">-<a class=\"pull-right icon icon-chuzi\" data-marko=\"{&quot;onclick&quot;:&quot;showDetail s0-9-20 0&quot;}\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all; speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; font-size: 20px; font-family: qixin !important;\"></a></td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px;\">自然人股东</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\"><a href=\"http://www.qixin.com/search/?key=%E7%BD%97%E6%AD%A3%E5%AE%89&amp;scope=2\" data-event-name=\"股东信息-点击名字\" target=\"_blank\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all;\">罗正安</a><button class=\"btn4 btn-xs pull-right\" data-marko=\"{&quot;onclick&quot;:&quot;showDialog s0-9-20-16_1 罗正安&quot;}\" style=\"color: rgb(15, 187, 233); font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 12px; line-height: 1.5; cursor: pointer; vertical-align: middle; background-image: none; border-color: rgb(15, 187, 233); white-space: nowrap; padding: 1px 5px; user-select: none; outline: 0px !important;\"><span class=\"icon icon-duiwaitouzixiazai\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; margin-right: 5px; font-family: qixin !important;\"></span>对外投资及任职</button></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">12万人民币<a class=\"pull-right icon icon-chuzi\" data-marko=\"{&quot;onclick&quot;:&quot;showDetail s0-9-20 1&quot;}\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all; speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; font-size: 20px; font-family: qixin !important;\"></a></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\">-<a class=\"pull-right icon icon-chuzi\" data-marko=\"{&quot;onclick&quot;:&quot;showDetail s0-9-20 1&quot;}\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all; speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; font-size: 20px; font-family: qixin !important;\"></a></td></tr></tbody></table><div class=\"clearfix margin-t-1x\" style=\"margin-top: 15px !important;\"></div></div><div class=\"tab-content\" id=\"employees\" style=\"color: rgb(67, 70, 79); font-family: &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif; font-size: 14px;\"><h4 class=\"section-title margin-t-2x\" style=\"line-height: 1.1; color: inherit; margin-bottom: 10px; font-size: 18px; border-left: 6px solid rgb(15, 187, 233); padding-left: 8px; margin-top: 30px !important;\"><span style=\"font-weight: 700;\">主要人员</span><span class=\"badge margin-l-0-3x\" style=\"min-width: 10px; padding: 3px 7px; font-size: 12px; font-weight: 400; color: rgb(255, 255, 255); vertical-align: middle; background-color: rgb(166, 172, 188); border-radius: 10px; margin-left: 5px !important;\">3</span></h4><table class=\"table table1 table-bordered margin-t-1x\" style=\"border-spacing: 0px; width: 847px; margin-bottom: 0px; border-color: rgb(221, 221, 221); margin-right: 0px; margin-left: 0px; margin-top: 15px !important;\"><tbody><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">监事</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\"><a href=\"http://www.qixin.com/search/?key=%E6%9D%8E%E5%B0%91%E5%AE%BE&amp;scope=4\" data-event-name=\"主要人员-点击名字\" target=\"_blank\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all;\">李少宾</a><button class=\"btn4 btn-xs pull-right\" data-marko=\"{&quot;onclick&quot;:&quot;showDialog s0-9-21-10 李少宾&quot;}\" style=\"color: rgb(15, 187, 233); font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 12px; line-height: 1.5; cursor: pointer; vertical-align: middle; background-image: none; border-color: rgb(15, 187, 233); white-space: nowrap; padding: 1px 5px; user-select: none; outline: 0px !important;\"><span class=\"icon icon-duiwaitouzixiazai\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; margin-right: 5px; font-family: qixin !important;\"></span>对外投资及任职</button></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">经理</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\"><a href=\"http://www.qixin.com/search/?key=%E7%BD%97%E6%AD%A3%E5%AE%89&amp;scope=4\" data-event-name=\"主要人员-点击名字\" target=\"_blank\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all;\">罗正安</a><button class=\"btn4 btn-xs pull-right\" data-marko=\"{&quot;onclick&quot;:&quot;showDialog s0-9-21-14 罗正安&quot;}\" style=\"color: rgb(15, 187, 233); font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 12px; line-height: 1.5; cursor: pointer; vertical-align: middle; background-image: none; border-color: rgb(15, 187, 233); white-space: nowrap; padding: 1px 5px; user-select: none; outline: 0px !important;\"><span class=\"icon icon-duiwaitouzixiazai\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; margin-right: 5px; font-family: qixin !important;\"></span>对外投资及任职</button></td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\">执行董事</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\"><a href=\"http://www.qixin.com/search/?key=%E7%BD%97%E6%AD%A3%E5%AE%89&amp;scope=4\" data-event-name=\"主要人员-点击名字\" target=\"_blank\" style=\"color: rgb(15, 187, 233); transition-timing-function: initial; transition-property: all;\">罗正安</a><button class=\"btn4 btn-xs pull-right\" data-marko=\"{&quot;onclick&quot;:&quot;showDialog s0-9-21-10_1 罗正安&quot;}\" style=\"color: rgb(15, 187, 233); font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 12px; line-height: 1.5; cursor: pointer; vertical-align: middle; background-image: none; border-color: rgb(15, 187, 233); white-space: nowrap; padding: 1px 5px; user-select: none; outline: 0px !important;\"><span class=\"icon icon-duiwaitouzixiazai\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-stretch: normal; text-rendering: auto; margin-right: 5px; font-family: qixin !important;\"></span>对外投资及任职</button></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); width: 130px; background-color: rgb(252, 252, 252); color: rgb(166, 172, 188);\"></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221);\"></td></tr></tbody></table><div class=\"clearfix margin-t-1x\" style=\"margin-top: 15px !important;\"></div></div><div class=\"tab-content\" id=\"changeInfo\" style=\"color: rgb(67, 70, 79); font-family: &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif; font-size: 14px;\"><h4 class=\"section-title margin-t-2x\" style=\"line-height: 1.1; color: inherit; margin-bottom: 10px; font-size: 18px; border-left: 6px solid rgb(15, 187, 233); padding-left: 8px; margin-top: 30px !important;\"><span style=\"font-weight: 700;\">工商变更</span><span class=\"badge margin-l-0-3x\" style=\"min-width: 10px; padding: 3px 7px; font-size: 12px; font-weight: 400; color: rgb(255, 255, 255); vertical-align: middle; background-color: rgb(166, 172, 188); border-radius: 10px; margin-left: 5px !important;\">0</span></h4><div class=\"font-f2\" style=\"color: rgb(122, 128, 143);\">暂无信息</div></div><div class=\"tab-content\" id=\"branches\" style=\"color: rgb(67, 70, 79); font-family: &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif; font-size: 14px;\"><h4 class=\"section-title margin-t-2x\" style=\"line-height: 1.1; color: inherit; margin-bottom: 10px; font-size: 18px; border-left: 6px solid rgb(15, 187, 233); padding-left: 8px; margin-top: 30px !important;\"><span style=\"font-weight: 700;\">分支机构</span><span class=\"badge margin-l-0-3x\" style=\"min-width: 10px; padding: 3px 7px; font-size: 12px; font-weight: 400; color: rgb(255, 255, 255); vertical-align: middle; background-color: rgb(166, 172, 188); border-radius: 10px; margin-left: 5px !important;\">0</span></h4><div class=\"font-f2\" style=\"color: rgb(122, 128, 143);\">暂无信息</div></div><div style=\"color: rgb(67, 70, 79); font-family: &quot;Microsoft Yahei&quot;, &quot;Open Sans&quot;, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif; font-size: 14px; margin-top: 20px;\">想了解云南安浪科技有限公司工商注册信息？启信宝为您提供云南安浪科技有限公司的联系方式、云南安浪科技有限公司企业简介、云南安浪科技有限公司信用报告、云南安浪科技有限公司 股东法人、公司地址等详细工商信息。</div>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519498899131,1519498899131),
	(10,1,'再来一篇啊',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>满足分页机制。。。。。啊哈哈</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519499058581,1519499058581),
	(11,1,'还要一篇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>去去去</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36','http://localhost:2222/api/console/v1/blog/publish',NULL,NULL,1519499077720,1519499077720);

/*!40000 ALTER TABLE `ann_blog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ann_blog_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_blog_category`;

CREATE TABLE `ann_blog_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `uid` int(11) DEFAULT NULL COMMENT '所属用户ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `level` int(11) DEFAULT '0' COMMENT '分级 0顶级 1一级 2二级 3三级 4...',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `summary` tinytext COMMENT '摘要',
  `image` int(11) DEFAULT NULL COMMENT '分类图片 附件资源ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0开 1关',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=1170 COMMENT='博客文章分类';

LOCK TABLES `ann_blog_category` WRITE;
/*!40000 ALTER TABLE `ann_blog_category` DISABLE KEYS */;

INSERT INTO `ann_blog_category` (`id`, `uid`, `pid`, `level`, `name`, `summary`, `image`, `sort`, `status`, `create_time`, `update_time`)
VALUES
	(1,1,0,0,'Android','安卓开发博客',NULL,NULL,0,NULL,NULL),
	(2,1,1,1,'Kotlin','Kotlin开发Android',NULL,NULL,0,NULL,NULL),
	(3,1,0,0,'iOS','苹果APP开发',NULL,NULL,0,NULL,NULL);

/*!40000 ALTER TABLE `ann_blog_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ann_blog_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_blog_comment`;

CREATE TABLE `ann_blog_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `tid` int(11) DEFAULT NULL COMMENT '评论的主题ID',
  `content` text COMMENT '评论内容',
  `type` int(11) DEFAULT '0' COMMENT '回复还是评论 0评论 1回复',
  `rid` int(11) DEFAULT NULL COMMENT '被回复的评论ID',
  `status` int(11) DEFAULT '0' COMMENT '状态 0审核中 1成功 2关',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='博客评论表';



# Dump of table ann_blog_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_blog_tag`;

CREATE TABLE `ann_blog_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `bid` int(11) DEFAULT NULL COMMENT '博客文章id',
  `name` varchar(64) DEFAULT NULL COMMENT '标签名称',
  `count` int(11) DEFAULT NULL COMMENT '统计数据',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ann_feedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_feedback`;

CREATE TABLE `ann_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(64) DEFAULT NULL COMMENT '称呼 姓名',
  `email` varchar(128) DEFAULT NULL COMMENT '电子邮箱',
  `tel` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `type` varchar(32) DEFAULT NULL COMMENT '反馈类型',
  `content` text COMMENT '内容',
  `origin` varchar(64) DEFAULT NULL COMMENT '来源 0未知 1 安卓 2 iOS 3WEB 4微信 5PC WEB 6桌面版Linux 7桌面macOS 8桌面Windows',
  `version` varchar(32) DEFAULT NULL COMMENT '版本',
  `ua` tinytext COMMENT 'UA',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读 0未读 1已读',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='反馈表';



# Dump of table ann_health
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_health`;

CREATE TABLE `ann_health` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(11) DEFAULT NULL COMMENT '项目名称',
  `in_time` date DEFAULT NULL COMMENT '日期',
  `type_id` int(11) DEFAULT NULL COMMENT 'ID  属性ID attr',
  `value_num` double DEFAULT NULL COMMENT '数值',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ann_health_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_health_type`;

CREATE TABLE `ann_health_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `attr` text COMMENT '自定义标签 a,b,c类似存储',
  `attr_values` text COMMENT '标签的属性值',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='健康项目';



# Dump of table ann_im
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_im`;

CREATE TABLE `ann_im` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '发送的用户ID',
  `r_uid` int(11) DEFAULT NULL COMMENT '接收的用户ID',
  `uid_nickname` varchar(128) DEFAULT '匿名用户' COMMENT '发送者的用户昵称 方便聊天对话列表显示 不需要通过id异步查询昵称信息',
  `rid_nickname` varchar(128) DEFAULT '匿名用户' COMMENT '接受者用户昵称',
  `status` tinyint(1) DEFAULT '0' COMMENT '发送状态 0发送并记录到本表数据库 1已读',
  `content` longtext COMMENT '消息内容',
  `type` int(11) DEFAULT '0' COMMENT '消息类型 暂时支持文本消息 0文本 2图片 3语音 4视频 5文件',
  `file` int(11) DEFAULT NULL COMMENT '文件 入附件库 存储ID',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间 发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Websocket即时聊天功能 聊天记录';



# Dump of table ann_microblog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_microblog`;

CREATE TABLE `ann_microblog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户',
  `content` tinytext COMMENT '正文',
  `location` varchar(128) DEFAULT NULL COMMENT '地址经纬度格式化',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `address` text COMMENT '地址名称',
  `poi` varchar(255) DEFAULT NULL COMMENT '地址POI信息',
  `origin` int(11) DEFAULT NULL COMMENT '来源 0 网页版 1安卓 2苹果 3其它 等',
  `http_info` text COMMENT 'HTTP传输信息 收集用户客户端信息',
  `ip` varchar(255) DEFAULT NULL COMMENT '用户IP',
  `images` varchar(255) DEFAULT NULL COMMENT '图片 数组',
  `videos` varchar(255) DEFAULT NULL COMMENT '视频 数组',
  `status` int(11) DEFAULT NULL COMMENT '状态 0开 1关',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_top` int(11) DEFAULT NULL COMMENT '置顶 0否 1是',
  `is_open` int(11) DEFAULT NULL COMMENT '是否公开 0否 1是',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微博';

LOCK TABLES `ann_microblog` WRITE;
/*!40000 ALTER TABLE `ann_microblog` DISABLE KEYS */;

INSERT INTO `ann_microblog` (`id`, `uid`, `content`, `location`, `lon`, `lat`, `address`, `poi`, `origin`, `http_info`, `ip`, `images`, `videos`, `status`, `sort`, `is_top`, `is_open`, `create_time`, `update_time`)
VALUES
	(1,1,'罚不进去啊',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'192.168.1.104',NULL,NULL,0,NULL,NULL,NULL,1517105609793,1517105609793),
	(2,1,'罚不进去啊',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'192.168.1.104',NULL,NULL,0,NULL,NULL,NULL,1517133296334,1517133296334),
	(3,1,'sd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,0,NULL,NULL,NULL,1517139793381,1517139793381),
	(4,1,'sd',NULL,NULL,NULL,'asdas',NULL,NULL,NULL,'127.0.0.1',NULL,NULL,0,NULL,NULL,NULL,1517139824483,1517139824483),
	(5,1,'发个提示看看',NULL,NULL,NULL,'?',NULL,NULL,NULL,'127.0.0.1',NULL,NULL,0,NULL,NULL,NULL,1517140440203,1517140440203),
	(6,1,'发个提示看看',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,0,NULL,NULL,NULL,1517140448039,1517140448039),
	(8,1,'还不错哦哦',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,0,NULL,NULL,NULL,1517143785437,1517143785437),
	(9,1,'希望这次别再错了！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,0,NULL,NULL,NULL,1517143824268,1517143824268),
	(10,1,'我在这黑暗的屋子里不见天日的或者，是你给我的浮夸给我了遇见外面光明世界的希望！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1517170028647,1517170028647),
	(12,1,'?，emoji测试',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1517177376165,1517177376165),
	(13,1,'再发个emoji?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1517177572293,1517177572293),
	(14,1,'不错，有几个人关注了，?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1517229812959,1517229812959),
	(15,1,'再来一条吧，?。?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1517229877218,1517229877218),
	(16,1,'抓一手',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1517237558593,1517237558593),
	(17,1,'测试下阿里的库',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1517241015241,1517241015241),
	(18,1,'过年啦：朝如青丝暮成雪',NULL,NULL,NULL,'阿咪期苴村',NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1518791483812,1518791483812),
	(19,1,'明天收假咯！！！！',NULL,NULL,NULL,'云南楚雄.云南安浪科技有限公司',NULL,NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,0,NULL,NULL,NULL,1519469934871,1519469934871);

/*!40000 ALTER TABLE `ann_microblog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ann_microblog_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_microblog_comment`;

CREATE TABLE `ann_microblog_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `tid` int(11) DEFAULT NULL COMMENT '评论的主题ID',
  `content` text COMMENT '评论内容',
  `type` int(11) DEFAULT '0' COMMENT '回复还是评论 0评论 1回复',
  `rid` int(11) DEFAULT NULL COMMENT '被回复的评论ID',
  `status` int(11) DEFAULT '0' COMMENT '状态 0审核中 1成功 2关',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微博评论表';



# Dump of table ann_note
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_note`;

CREATE TABLE `ann_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户',
  `content` longtext COMMENT '笔记内容',
  `tags` text COMMENT '标签',
  `location` varchar(128) DEFAULT NULL COMMENT '地址经纬度格式化',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `address` varchar(128) DEFAULT NULL COMMENT '地址名称',
  `poi` varchar(255) DEFAULT NULL COMMENT '地址POI信息',
  `origin` int(11) DEFAULT NULL COMMENT '来源 0 网页版 1安卓 2苹果 3其它 等',
  `http_info` text COMMENT 'HTTP传输信息 收集用户客户端信息',
  `ip` varchar(32) DEFAULT NULL COMMENT '用户IP',
  `images` varchar(255) DEFAULT NULL COMMENT '图片 数组',
  `videos` varchar(255) DEFAULT NULL COMMENT '视频 数组',
  `files` text COMMENT '文件 内容',
  `urls` text COMMENT '相关URL 链接收藏',
  `status` int(11) DEFAULT '0' COMMENT '状态 0开 1关',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_top` int(11) DEFAULT '0' COMMENT '置顶 0否 1是',
  `is_open` int(11) DEFAULT '0' COMMENT '是否公开 0否 1是',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='个人笔记';



# Dump of table ann_note_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_note_category`;

CREATE TABLE `ann_note_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `pid` int(11) DEFAULT NULL COMMENT '父级ID',
  `level` int(11) DEFAULT '0' COMMENT '分类级别 0顶级 1一级 2二级 3三级 4...',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` text COMMENT '描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0开 1关',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ann_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_project`;

CREATE TABLE `ann_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `teams` text COMMENT '团队',
  `description` tinytext COMMENT '描述',
  `content` longtext COMMENT '内容',
  `start_time` bigint(20) DEFAULT NULL COMMENT '开始时间',
  `end_time` bigint(20) DEFAULT NULL COMMENT '结束时间',
  `progress` bigint(20) DEFAULT NULL COMMENT '进度状态 0计划 1开始 2进行 3结束 4成功 5失败',
  `progress_times` text COMMENT '时间日志 对应进度状态 根据状态 时间数组进度',
  `out_url` text COMMENT '项目展示外链 外界访问地址',
  `git_url` text COMMENT 'git地址',
  `files` text COMMENT '附件ID',
  `status` int(11) DEFAULT NULL COMMENT '状态 0开 1关闭',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='项目表';

LOCK TABLES `ann_project` WRITE;
/*!40000 ALTER TABLE `ann_project` DISABLE KEYS */;

INSERT INTO `ann_project` (`id`, `uid`, `name`, `cover`, `teams`, `description`, `content`, `start_time`, `end_time`, `progress`, `progress_times`, `out_url`, `git_url`, `files`, `status`, `create_time`, `update_time`)
VALUES
	(1,1,'百米帐房V2项目','121','安浪团队','百米帐房是一款随时随地找财务的手机APP','暂时没有什么描述',111111,11111,2,'正在琢磨','http://www.100tax.cn','http://gitee.com/jiankian/BMZF-Serve','122',0,1111111,11231312);

/*!40000 ALTER TABLE `ann_project` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ann_space
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_space`;

CREATE TABLE `ann_space` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned DEFAULT '0' COMMENT '用户id',
  `folder_id` int(11) DEFAULT NULL COMMENT '所属文件夹',
  `attachment_id` int(11) DEFAULT NULL COMMENT '附件ID',
  `name` varchar(255) DEFAULT '' COMMENT '文件名',
  `module` varchar(255) DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) DEFAULT '' COMMENT '文件mime类型',
  `ext` char(4) DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(64) DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned DEFAULT '0' COMMENT '下载次数',
  `origin` int(11) DEFAULT '0' COMMENT '来源 0未知 1 安卓 2 iOS 3WEB 4微信 5PC WEB 6桌面版Linux 7桌面macOS 8桌面Windows',
  `ua` tinytext COMMENT '用户UA',
  `version` varchar(16) DEFAULT NULL COMMENT '客户端版本',
  `http_info` text COMMENT 'HTTP传输信息',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='附件表';



# Dump of table ann_space_folder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_space_folder`;

CREATE TABLE `ann_space_folder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '所属用户ID',
  `name` int(11) DEFAULT NULL COMMENT '文件夹名称',
  `description` int(11) DEFAULT NULL COMMENT '描述',
  `mask` int(11) DEFAULT NULL COMMENT '标注的类型 文件夹图标',
  `status` int(11) DEFAULT '0' COMMENT '开关 0开 1关',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='个人网盘文件空间文件夹';



# Dump of table ann_system_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_system_config`;

CREATE TABLE `ann_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ann_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_task`;

CREATE TABLE `ann_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '发布用户ID',
  `name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `description` varchar(1000) DEFAULT '' COMMENT '描述',
  `content` text COMMENT '任务内容',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签',
  `type` int(11) DEFAULT '0' COMMENT '任务类型',
  `status` int(11) DEFAULT '0' COMMENT '任务状态',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务表';



# Dump of table ann_task_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_task_tag`;

CREATE TABLE `ann_task_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(32) DEFAULT NULL COMMENT '标签名',
  `tid` int(11) DEFAULT NULL COMMENT '任务ID',
  `status` int(11) DEFAULT '0' COMMENT '状态 0开 1关',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务标签';



# Dump of table ann_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_user`;

CREATE TABLE `ann_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '权限ID',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像 存附件ID',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `occupation` varchar(64) DEFAULT NULL COMMENT '职位',
  `company` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `mobile` varchar(22) DEFAULT NULL COMMENT '手机号',
  `province` varchar(128) DEFAULT NULL COMMENT '省',
  `city` varchar(128) DEFAULT NULL COMMENT '市',
  `district` varchar(128) DEFAULT NULL COMMENT '区县',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `qq` varchar(64) DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(64) DEFAULT NULL COMMENT '微信号',
  `github` varchar(255) DEFAULT NULL COMMENT 'Github',
  `weibo` varchar(255) DEFAULT NULL COMMENT '微博',
  `email` varchar(128) DEFAULT NULL COMMENT '电子邮箱',
  `gender` tinyint(1) DEFAULT '0' COMMENT '性别 1男 2女 0保密',
  `profile` varchar(512) DEFAULT NULL COMMENT '签名',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

LOCK TABLES `ann_user` WRITE;
/*!40000 ALTER TABLE `ann_user` DISABLE KEYS */;

INSERT INTO `ann_user` (`id`, `role_id`, `username`, `password`, `avatar`, `nickname`, `occupation`, `company`, `mobile`, `province`, `city`, `district`, `address`, `qq`, `wechat`, `github`, `weibo`, `email`, `gender`, `profile`, `status`, `create_time`, `update_time`)
VALUES
	(1,0,'jiankian','advkaZ6UHK4tv885pC26wg==','29','绿血贵族@安浪科技','创始人','云南安浪科技有限公司','13529513104','云南','楚雄','楚雄市','楚雄州楚雄市开发区三期私营城49号','51412708','jiankian','http://gitee.com/jiankian','http://weibo.com/jiankian','luozhengan@vip.qq.com',1,NULL,0,NULL,1517492606837),
	(2,0,'admin','f+9hcUaegNMsBVn4izdyRQ==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL),
	(3,NULL,'admin003','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技三号33333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'an003@asmm.cn',NULL,NULL,NULL,NULL,1516989243175),
	(4,NULL,'admin2','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'i2@asmm.cn',NULL,NULL,0,NULL,NULL),
	(5,NULL,'admin11','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'i1@asmm.cn',NULL,NULL,0,NULL,NULL),
	(8,NULL,'admin3','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'i3@asmm.cn',NULL,NULL,NULL,NULL,NULL),
	(10,NULL,'admin4','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'i4@asmm.cn',NULL,NULL,0,NULL,NULL),
	(11,NULL,'anline','u9hl4peLEd/GfTBg/hAJ4w==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'i@anline.cn',NULL,NULL,0,1517421545206,1517421545207),
	(12,NULL,'angular','u9hl4peLEd/GfTBg/hAJ4w==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'angular@asmm.cn',NULL,NULL,0,1517421673185,1517421673185);

/*!40000 ALTER TABLE `ann_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ann_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_user_role`;

CREATE TABLE `ann_user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父级ID',
  `name` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `description` tinytext COMMENT '描述',
  `auth_menu` longtext,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ann_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_video`;

CREATE TABLE `ann_video` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned DEFAULT '0' COMMENT '用户id',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '是否对外开放',
  `name` varchar(255) DEFAULT '' COMMENT '文件名',
  `module` varchar(255) DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) DEFAULT '' COMMENT '文件路径',
  `link` varchar(1000) DEFAULT NULL COMMENT '视频链接',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) DEFAULT '' COMMENT '文件mime类型',
  `ext` char(4) DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(64) DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned DEFAULT '0' COMMENT '下载次数',
  `from` int(11) DEFAULT '0' COMMENT '来源 0未知 1 安卓 2 iOS 3WEB 4微信 5PC WEB 6桌面版Linux 7桌面macOS 8桌面Windows',
  `ua` tinytext COMMENT '用户UA',
  `version` varchar(16) DEFAULT NULL COMMENT '客户端版本',
  `http_info` text COMMENT 'HTTP传输信息',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='附件表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
