# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.35)
# Database: ann_zone_serve
# Generation Time: 2018-01-26 17:36:01 +0000
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
  `in_time` int(11) DEFAULT NULL COMMENT '事物产生的时间',
  `addess` varchar(255) DEFAULT NULL COMMENT '消费地址',
  `location` varchar(255) DEFAULT NULL COMMENT '经纬度格式化',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `images` text COMMENT '图片组',
  `files` text COMMENT '文件组',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记账';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记账类型预设';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  `from` int(11) DEFAULT '0' COMMENT '来源 0未知 1 安卓 2 iOS 3WEB 4微信 5PC WEB 6桌面版Linux 7桌面macOS 8桌面Windows',
  `ua` tinytext COMMENT '用户UA',
  `version` varchar(16) DEFAULT NULL COMMENT '客户端版本',
  `http_info` text COMMENT 'HTTP传输信息',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册表';



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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='黑名单';



# Dump of table ann_blog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_blog`;

CREATE TABLE `ann_blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类id',
  `short_title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '文章来源',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源链接',
  `author` varchar(50) NOT NULL COMMENT '文章作者',
  `summary` varchar(140) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章正文',
  `image` int(11) NOT NULL COMMENT '文章封面图片 附件ID',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '文章关键字',
  `article_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '相关文章',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章排序0-255',
  `commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `attachment_path` text NOT NULL COMMENT '文章附件路径',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标签',
  `comment_count` int(10) unsigned NOT NULL COMMENT '文章评论数',
  `share_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分享数',
  `publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `last_comment_time` int(11) DEFAULT '0' COMMENT '最新评论时间',
  `public_time` int(11) DEFAULT '0' COMMENT '发布时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0发布 1草稿 2关闭',
  `create_time` bigint(20) DEFAULT '0' COMMENT '文章创建时间',
  `update_time` bigint(20) DEFAULT '0' COMMENT '文章修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=6553 COMMENT='博客文章表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='博客文章分类';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客评论表';



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
  `from` varchar(64) DEFAULT NULL COMMENT '来源 0未知 1 安卓 2 iOS 3WEB 4微信 5PC WEB 6桌面版Linux 7桌面macOS 8桌面Windows',
  `version` varchar(32) DEFAULT NULL COMMENT '版本',
  `ua` tinytext COMMENT 'UA',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读 0未读 1已读',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='反馈表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康项目';



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
  `address` varchar(128) DEFAULT NULL COMMENT '地址名称',
  `poi` varchar(255) DEFAULT NULL COMMENT '地址POI信息',
  `from` int(11) DEFAULT NULL COMMENT '来源 0 网页版 1安卓 2苹果 3其它 等',
  `http_info` text COMMENT 'HTTP传输信息 收集用户客户端信息',
  `ip` varchar(16) DEFAULT NULL COMMENT '用户IP',
  `images` varchar(255) DEFAULT NULL COMMENT '图片 数组',
  `videos` varchar(255) DEFAULT NULL COMMENT '视频 数组',
  `status` int(11) DEFAULT '0' COMMENT '状态 0开 1关',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_top` int(11) DEFAULT '0' COMMENT '置顶 0否 1是',
  `is_open` int(11) DEFAULT '0' COMMENT '是否公开 0否 1是',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微博';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微博评论表';



# Dump of table ann_note
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_note`;

CREATE TABLE `ann_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户',
  `content` tinytext COMMENT '笔记内容',
  `tags` text COMMENT '标签',
  `location` varchar(128) DEFAULT NULL COMMENT '地址经纬度格式化',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `address` varchar(128) DEFAULT NULL COMMENT '地址名称',
  `poi` varchar(255) DEFAULT NULL COMMENT '地址POI信息',
  `from` int(11) DEFAULT NULL COMMENT '来源 0 网页版 1安卓 2苹果 3其它 等',
  `http_info` text COMMENT 'HTTP传输信息 收集用户客户端信息',
  `ip` varchar(16) DEFAULT NULL COMMENT '用户IP',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人笔记';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `progress` int(11) DEFAULT NULL COMMENT '进度状态 0计划 1开始 2进行 3结束 4成功 5失败',
  `progress_times` text COMMENT '时间日志 对应进度状态 根据状态 时间数组进度',
  `out_url` text COMMENT '项目展示外链 外界访问地址',
  `git_url` text COMMENT 'git地址',
  `files` text COMMENT '附件ID',
  `status` int(11) DEFAULT NULL COMMENT '状态 0开 1关闭',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';



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
  `from` int(11) DEFAULT '0' COMMENT '来源 0未知 1 安卓 2 iOS 3WEB 4微信 5PC WEB 6桌面版Linux 7桌面macOS 8桌面Windows',
  `ua` tinytext COMMENT '用户UA',
  `version` varchar(16) DEFAULT NULL COMMENT '客户端版本',
  `http_info` text COMMENT 'HTTP传输信息',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人网盘文件空间文件夹';



# Dump of table ann_system_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_system_config`;

CREATE TABLE `ann_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务标签';



# Dump of table ann_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ann_user`;

CREATE TABLE `ann_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '权限ID',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '电子邮箱',
  `gender` tinyint(1) DEFAULT '0' COMMENT '性别',
  `profile` varchar(512) DEFAULT NULL COMMENT '签名',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `ann_user` WRITE;
/*!40000 ALTER TABLE `ann_user` DISABLE KEYS */;

INSERT INTO `ann_user` (`id`, `role_id`, `username`, `password`, `avatar`, `nickname`, `email`, `gender`, `profile`, `status`, `create_time`, `update_time`)
VALUES
	(1,0,'jiankian','Z9LEwDtdlgZ0euEASsPG9w==',NULL,'绿血贵族','luozhengan@vip.qq.com',0,NULL,0,NULL,NULL),
	(2,0,'admin','f+9hcUaegNMsBVn4izdyRQ==',NULL,NULL,NULL,0,NULL,0,NULL,NULL),
	(3,NULL,'admin003','admin888',NULL,'安浪科技三号','an003@asmm.cn',NULL,NULL,NULL,NULL,1516988093978),
	(5,NULL,'admin11','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技1','i1@asmm.cn',NULL,NULL,NULL,NULL,NULL),
	(8,NULL,'admin3','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技1','i3@asmm.cn',NULL,NULL,NULL,NULL,NULL),
	(9,NULL,'admin2','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技1','i2@asmm.cn',NULL,NULL,NULL,NULL,NULL),
	(10,NULL,'admin4','f+9hcUaegNMsBVn4izdyRQ==',NULL,'安浪科技1','i4@asmm.cn',NULL,NULL,0,NULL,NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
