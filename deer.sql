# Host: localhost  (Version: 5.5.53)
# Date: 2019-09-12 17:24:44
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "order"
#

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_uid` int(11) DEFAULT NULL COMMENT '订单所属的userid',
  `order_contact` varchar(255) DEFAULT NULL,
  `order_ctname` varchar(255) DEFAULT NULL COMMENT '联系人',
  `order_type` varchar(255) DEFAULT NULL COMMENT '订单类型  【货到付款。。】',
  `order_address` varchar(255) DEFAULT NULL,
  `order_content` varchar(255) DEFAULT NULL,
  `order_gids` varchar(255) DEFAULT NULL COMMENT '商品id '''',''''分割',
  `order_price` double(2,0) DEFAULT NULL,
  `order_time` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL COMMENT '订单状态 0-已完成 1-进行中 2-已取消',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "order"
#

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (2,NULL,'18537155064','吕好然','货到付款','郑州市中原区中原万达','无','1,2,3',20,NULL,NULL),(3,1,'18537155064','吕好然','货到付款','郑州市中原区中原万达','无','1,2,3',20,'2019.09.12 17:10',1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

#
# Structure for table "store"
#

DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) DEFAULT NULL,
  `store_area` varchar(255) DEFAULT NULL,
  `store_address` varchar(255) DEFAULT NULL,
  `store_uid` int(11) DEFAULT NULL COMMENT '创建店铺的userid',
  `check` int(11) DEFAULT '0' COMMENT '1-审核失败 2-审核中 0-审核成功',
  `store_owner_name` varchar(255) DEFAULT NULL,
  `store_owner_phone` varchar(255) DEFAULT NULL,
  `store_owner_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "store"
#

/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (6,'物流','物流','郑州市金水区',1,0,'lvvvv','18537155064','/uploads/20190912\\2957eeb9b3609973fff240198ad2ff30.jpg'),(7,'物流','物流','郑州市金水区',2,0,'lvvvv','18537155064','/uploads/20190912\\a615c5e40228c53add8e8e2d05c1b256.jpg');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(13) DEFAULT NULL,
  `user_pwd` varchar(20) DEFAULT NULL COMMENT '用户密码',
  `user_nickname` varchar(15) DEFAULT NULL COMMENT '用户昵称',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'18537775464','123456',NULL,1568268546,1568268546),(2,'18537155064','665544',NULL,1568268628,1568268628),(3,'18537155065','123456',NULL,1568268796,1568268796),(4,'18537155066','qq123456',NULL,1568268832,1568268832);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
