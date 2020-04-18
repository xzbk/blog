/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2020-04-18 16:53:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `abouts`
-- ----------------------------
DROP TABLE IF EXISTS `abouts`;
CREATE TABLE `abouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `type` int(11) DEFAULT NULL COMMENT '标志是文章格式还是网页格式',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of abouts
-- ----------------------------
INSERT INTO `abouts` VALUES ('1', '1', '1', '<marquee>什么也学不会的。。。。。。</marquee>');

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '文章名称',
  `content` varchar(255) DEFAULT NULL COMMENT '文章内容',
  `time` datetime DEFAULT NULL COMMENT '文章创建时间',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', 'article', '<p><b>文章测试</b></p><p><b><img src=\"/blog/upload/1/20200327101217.jpg\" alt=\"图片名称\"></b></p><p>图片测试</p><p>文章正文内容</p><p><br></p>', '2020-03-21 21:16:22', '1', '65', '45');
INSERT INTO `articles` VALUES ('39', 'article1', '<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p><p><br></p>', '2020-03-30 11:37:14', '1', '65', '45');
INSERT INTO `articles` VALUES ('40', 'article2', '<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p><p><br></p>', '2020-03-30 11:37:22', '1', '65', '45');
INSERT INTO `articles` VALUES ('41', 'article3', '<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p><p><br></p>', '2020-03-30 11:37:26', '1', '65', '45');
INSERT INTO `articles` VALUES ('42', 'article4', '<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p><p><br></p>', '2020-03-30 11:37:34', '1', '65', '45');
INSERT INTO `articles` VALUES ('43', 'article5', '<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p><p><br></p>', '2020-03-30 11:37:39', '1', '65', '45');
INSERT INTO `articles` VALUES ('44', 'article6', '<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p><p><br></p>', '2020-03-30 11:37:57', '1', '65', '45');
INSERT INTO `articles` VALUES ('47', 'sss', '<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p><p><br></p>', '2020-04-16 14:21:54', '1', '65', '45');

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('25', '0', '8887777');
INSERT INTO `categories` VALUES ('26', '0', '963999999');
INSERT INTO `categories` VALUES ('45', '1', 'cate1');
INSERT INTO `categories` VALUES ('46', '1', 'cate2');
INSERT INTO `categories` VALUES ('47', '1', 'cate3');
INSERT INTO `categories` VALUES ('48', '1', 'cate4');
INSERT INTO `categories` VALUES ('49', '1', 'cate5');
INSERT INTO `categories` VALUES ('50', '1', 'cate6');

-- ----------------------------
-- Table structure for `links`
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户关于id',
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '连接名',
  `href` varchar(255) DEFAULT NULL COMMENT '连接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('8', '1', '百度', 'https://www.baidu.com');
INSERT INTO `links` VALUES ('9', '1', 'Spring官网', 'https://spring.io');

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('65', '1', 'tag1');
INSERT INTO `tags` VALUES ('66', '1', 'tag2');
INSERT INTO `tags` VALUES ('67', '1', 'tag3');
INSERT INTO `tags` VALUES ('72', '1', 'tag4');
INSERT INTO `tags` VALUES ('73', '1', 'tag5');
INSERT INTO `tags` VALUES ('74', '1', 'tag6');
INSERT INTO `tags` VALUES ('75', '1', 'tag7');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `signature` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `github` varchar(255) DEFAULT NULL COMMENT '用户github连接地址',
  `weibo` varchar(255) DEFAULT NULL COMMENT '用户微博连接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'XZBK', '1', '胸有惊雷而面如平湖者，可拜上将军', 'upload/1/header/20200416022120.jpg', 'https://github.io', 'www.baidu.com');
