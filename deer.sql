# Host: localhost  (Version: 5.5.53)
# Date: 2019-09-13 22:05:47
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "cart"
#

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_oid` varchar(255) DEFAULT NULL,
  `cart_gid` varchar(255) DEFAULT NULL,
  `cart_count` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='订单购物车';

#
# Data for table "cart"
#

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'97331568364893','5','1'),(2,'97331568364893','4','10'),(3,'97331568364893','8','3'),(4,'26301568364992','5','1'),(5,'26301568364992','4','10'),(6,'26301568364992','8','3');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

#
# Structure for table "goods"
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_desc` varchar(255) DEFAULT NULL,
  `goods_price` double(3,2) DEFAULT NULL,
  `goods_stock` int(11) DEFAULT NULL COMMENT '商品剩余库存',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'方便面','康师傅方便面',5.00,500),(2,'安慕希','希腊风味酸奶',8.00,300),(3,'可口可乐','经典可口可乐',6.00,400),(4,'雪碧','劲爽一夏，雪碧',6.00,154),(5,'小米6','小米手机',9.99,504),(6,'农夫山泉','纯天然矿物质水',2.00,1000),(7,'小浣熊干脆面','小时候的味道',2.00,245),(8,'水溶c','柠檬味果汁',8.00,52),(9,'花花牛','花花牛纯牛奶',1.00,354);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

#
# Structure for table "order"
#

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` varchar(255) NOT NULL DEFAULT '0',
  `order_uid` int(11) DEFAULT NULL COMMENT '订单所属的userid',
  `order_contact` varchar(255) DEFAULT NULL,
  `order_ctname` varchar(255) DEFAULT NULL COMMENT '联系人',
  `order_type` varchar(255) DEFAULT NULL COMMENT '订单类型  【货到付款。。】',
  `order_address` varchar(255) DEFAULT NULL,
  `order_content` varchar(255) DEFAULT NULL,
  `order_price` double(2,0) DEFAULT NULL,
  `order_time` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL COMMENT '订单状态 2-待配送 3-待完成 4-已完成 5-已取消',
  `order_pay_type` int(11) DEFAULT NULL COMMENT '0-未收款 1-支付宝 2-微信 3-现金',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "order"
#

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('12115683587',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('15251568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('2',2,'18537155064','吕好然','货到付款','郑州市中原区中原万达','无',20,NULL,NULL,NULL),('20561568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('26301568364992',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 16:56',1,NULL),('27111568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('3',1,'18537155064','吕好然','货到付款','郑州市中原区中原万达','无',20,'2019.09.12 17:10',4,1),('30011568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:11',1,NULL),('30991568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('35961568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('4',NULL,'15544655466','lv','货到付款','郑州市中原区中原万达','无',20,'2019.09.12 17:10',NULL,NULL),('42281568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('45021568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('5',NULL,'15545688754','ll','到付','北京','配送',50,'2019.09.13 17:10',NULL,NULL),('50111568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('54671568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('56071568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('61611568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('69715683587',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:11',1,NULL),('75891568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL),('84461568358',NULL,'18537155064','mike','货到付款','郑州市中原区中原万达','无',99,'2019.09.13 15:12',1,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
