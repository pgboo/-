CREATE DATABASE IF NOT EXISTS `paotui` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `paotui`;

-- 管理员表
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `role` varchar(20) DEFAULT 'admin' COMMENT '角色',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- 用户表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` int(1) DEFAULT '1' COMMENT '状态 0禁用 1启用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 跑腿员表
DROP TABLE IF EXISTS `paotui`;
CREATE TABLE `paotui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` int(1) DEFAULT '1' COMMENT '状态 0禁用 1启用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='跑腿员表';

-- 商家表
DROP TABLE IF EXISTS `shangjia`;
CREATE TABLE `shangjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `status` int(1) DEFAULT '1' COMMENT '状态 0禁用 1启用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商家表';

-- 跑腿分类表
DROP TABLE IF EXISTS `paotuifenlei`;
CREATE TABLE `paotuifenlei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='跑腿分类表';

-- 跑腿项目表
DROP TABLE IF EXISTS `paotuixiangmu`;
CREATE TABLE `paotuixiangmu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `fenlei_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `content` text COMMENT '项目内容/需求',
  `require_time` datetime DEFAULT NULL COMMENT '要求时间',
  `fee` decimal(10,2) DEFAULT '0.00' COMMENT '跑腿费用',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `user_id` int(11) DEFAULT NULL COMMENT '发布用户ID',
  `shangjia_id` int(11) DEFAULT NULL COMMENT '发布商家ID',
  `status` int(1) DEFAULT '0' COMMENT '状态 0待接单 1已接单 2已完成',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_fenlei` (`fenlei_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_shangjia` (`shangjia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='跑腿项目表';

-- 接单信息表
DROP TABLE IF EXISTS `jiedanxinxi`;
CREATE TABLE `jiedanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `project_id` int(11) NOT NULL COMMENT '项目ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `paotui_id` int(11) NOT NULL COMMENT '跑腿员ID',
  `paotui_name` varchar(50) DEFAULT NULL COMMENT '跑腿员姓名',
  `paotui_phone` varchar(20) DEFAULT NULL COMMENT '跑腿员手机',
  `target_address` varchar(255) DEFAULT NULL COMMENT '目标地点',
  `fee` decimal(10,2) DEFAULT '0.00' COMMENT '跑腿费用',
  `status` int(1) DEFAULT '0' COMMENT '状态 0待处理 1已接受 2已拒绝 3已完成',
  `jiedan_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '接单时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `idx_project` (`project_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_paotui` (`paotui_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接单信息表';

-- 确认订单表
DROP TABLE IF EXISTS `querendingdan`;
CREATE TABLE `querendingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '用户手机',
  `paotui_id` int(11) DEFAULT NULL COMMENT '跑腿员ID',
  `paotui_name` varchar(50) DEFAULT NULL COMMENT '跑腿员姓名',
  `target_address` varchar(255) DEFAULT NULL COMMENT '目标地点',
  `fee` decimal(10,2) DEFAULT '0.00' COMMENT '跑腿费用',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `score` int(1) DEFAULT '5' COMMENT '评分 1-5',
  `is_pay` int(1) DEFAULT '0' COMMENT '是否支付 0未支付 1已支付',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `idx_user` (`user_id`),
  KEY `idx_paotui` (`paotui_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='确认订单表';

-- 动态分享表
DROP TABLE IF EXISTS `dongtaifenxiang`;
CREATE TABLE `dongtaifenxiang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `images` varchar(500) DEFAULT NULL COMMENT '图片，多个逗号分隔',
  `user_id` int(11) DEFAULT NULL COMMENT '发布用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '发布用户姓名',
  `view_count` int(11) DEFAULT '0' COMMENT '浏览次数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='动态分享表';

-- 交易反馈表
DROP TABLE IF EXISTS `jiaoyifankui`;
CREATE TABLE `jiaoyifankui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `content` text COMMENT '反馈内容',
  `paotui_id` int(11) DEFAULT NULL COMMENT '反馈人ID',
  `paotui_name` varchar(50) DEFAULT NULL COMMENT '反馈人姓名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_paotui` (`paotui_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交易反馈表';

-- 系统公告表
DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统公告表';

-- 提醒信息表
DROP TABLE IF EXISTS `tixingxinxi`;
CREATE TABLE `tixingxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shangjia_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `order_no` varchar(50) DEFAULT NULL COMMENT '关联订单编号',
  `title` varchar(200) DEFAULT NULL COMMENT '提醒标题',
  `content` text COMMENT '提醒内容',
  `status` int(1) DEFAULT '0' COMMENT '状态 0未读 1已读',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_shangjia` (`shangjia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提醒信息表';

-- 初始化数据
INSERT INTO `admin` (`username`, `password`, `name`, `role`) VALUES
('admin', '123456', '超级管理员', 'admin');

INSERT INTO `paotuifenlei` (`name`) VALUES
('快递代取'),
('外卖代送'),
('文件代办'),
('超市代购'),
('鲜花蛋糕'),
('其他跑腿');

INSERT INTO `gonggao` (`title`, `content`) VALUES
('校园跑腿系统正式上线', '欢迎使用校园跑腿业务管理系统，请大家遵守平台规则，诚信交易。'),
('关于跑腿费用说明', '跑腿费用根据距离和物品重量由发布者自行设置，请合理定价。');
