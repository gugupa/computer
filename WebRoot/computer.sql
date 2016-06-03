/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.23 : Database - computer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`computer` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `computer`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `article_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键/自动递增',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `author` varchar(20) DEFAULT NULL COMMENT '文章作者',
  `acontent` varchar(2000) NOT NULL COMMENT '文章内容',
  `uptime` datetime DEFAULT NULL COMMENT '文章上传前最后一次操作时间',
  `state` int(2) DEFAULT NULL COMMENT '文章状态/0草稿1已发布',
  `credit` int(50) DEFAULT NULL COMMENT '文章点赞数',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`article_id`,`title`,`author`,`acontent`,`uptime`,`state`,`credit`) values (13,'HTML <a> 标签的 target 属性','123','定义和用法 <a> 标签的 target 属性规定在何处打开链接文档。 如果在一个 <a> 标签内包',NULL,1,NULL),(15,'mysql中文乱码','','MySQL 4.1的字符集支持(Character Set Support)有两个方面：字符集(Character set)和排序方式(Collation)。对于字符集的支持细化到四个层次: 服务器(server)，数据库(database)，数据表(table)和连接(connection)。下面将分两部分，分别设置服务器编码和数据库、数据表与连接部分的编码，从而杜绝中文乱码的出现。\r\n\r\n　　一 服务器编码设置\r\n\r\n　　服务器编码设置方法有二：\r\n\r\n　　一是安装mysql时，其中会有一个步骤选择编码方式，此时选择gbk即可。如果不选择，默认的编码是latin1；\r\n\r\n　　二是在安装玩mysql之后，手动修改其配置文件，如下：\r\n\r\n　　(1)修改 MySql安装目录下面的my.ini(MySQL Server Instance Configuration 文件)。 设置\r\n        default-character-set=gbk(注意，有2处) \r\n　　(2)修改data目录中相应数据库目录下的db.opt配置文件\r\n        default-character-set=gbk\r\n        default-collation=gbk_chinese_ci\r\n \r\n　　重启数据库，关闭控制台窗口重新登录数据库即可。\r\n \r\n　　二 数据库、数据表和连接部分的编码设置\r\n　　2.1 设置数据库和数据表编码\r\n　　要解决乱码问题，首先必须弄清楚数据库和数据表用什么编码。如果没有指明，将是默认的latin1。\r\n用得最多的应该是这3种字符集 gb2312，gbk，utf8。\r\n　　如何去指定数据库和数据表的字符集呢？下面也gbk为例：\r\n　　【在MySQL Command Line Client创建数据库 】\r\n　　mysql> CREATE TABLE `mysqlcode` (\r\n　　-> `id` TINYINT( 255 ) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,\r\n　　-> `content` VARCHAR( 255 ) NOT NULL\r\n　　-> ) TYPE = MYISAM CHARACTER SET gbk COLLATE gbk_chinese_ci;\r\n　　Query OK, 0 rows affected, 1 warning (0.03 sec)\r\n　　其中后面的TYPE = MYISAM CHARACTER SET gbk COLLATE gbk_chinese_ci;\r\n就是指定数据库的字符集，COLLATE (校勘)，让mysql同时支持多种编码的数据库。\r\n　　当然也可以通过如下指令修改数据库数据表的字符集：\r\n　　　　alter database mysqlcode default character set \'gbk\'.\r\n　　前面已经设置了服务器、数据库和数据表的编码，那么数据库中的编码便都是gbk，中文可以存储进去。\r\n但是如果你要通过执行insert或select等操作时，仍然会出现中文乱码问题，这是因为还没设置\r\n“连接(connection)”部分的编码，而insert、select等数据库操作都包含与数据库的连接动作。如果不信\r\n，你现在可以执行下面的sql文试一试：\r\n　　mysql> insert into mysqlcode values(null,\'java爱好者\');\r\n　　按回车，结果如下：\r\n　　ERROR 1406 (22001): Data too long for column \'content\' at row 1\r\n　　\r\n　　2.2 设置连接编码\r\n　　设置了服务器、数据库和数据表部分的编码，必须设置连接编码。连接编码设置如下：\r\n　　mysql> SET character_set_client=\'gbk\';\r\n　　mysql> SET character_set_connection=\'gbk\'\r\n　　mysql> SET character_set_results=\'gbk\'\r\n　　设置好连接编码，下面便可以成功插入中文了：\r\n　　mysql> insert into mysqlcode values(null,\'java爱好者\');\r\n　　Query OK, 0 rows affected (0.02 sec)\r\n　　\r\n　　其实，上面设置连接编码的三条命令可以简化为一条：\r\n　　mysql> set names \'gbk\';\r\n　　',NULL,1,NULL),(16,'text-overflow: ellipsis;','','这里的重点样式是  text-overflow: ellipsis;\r\n\r\n不过话说text-ellipsis是一个特殊的样式，有关解释是这样的：text-overflow属性仅是注解，当文本溢出时是否显示省略标记。并不具备其它的样式属性定义。要实现溢出时产生省略号的效果还须定义：强制文本在一行内显示（white-space:nowrap）及溢出内容为隐藏（overflow:hidden），只有这样才能实现溢出文本显示省略号的效果。\r\n\r\n这里面需要限定宽度、文字显示在一行中（white-space:nowrap;）和使用隐藏属性overflow。\r\n\r\n网上给支持低版本的opera一个办法，就是-o-text-overflow：ellipsis；',NULL,1,NULL),(17,'编程',NULL,'33',NULL,1,NULL),(18,'编程语',NULL,'35',NULL,1,NULL),(19,'三九四的慢腾腾宫','11','今天的任务\r\n1、icon\r\n<link rel=\"shortcut icon\" href=\"<%=bathPath%>images/logo.png\">\r\n2、跳转\r\n<meta http-equiv=\"Refresh\" content=\"0;url=food/food_showFood\">\r\n这也是个办法，但我用了框架实现首页内容的实现\r\n<iframe id=\"mainframe\" src=\"Article_browseValidArticles\" name=\"mainframe\"></iframe>  \r\n3、改拦截器\r\n我之前没有对页面实施拦截，所以我这里也不需要改拦截。但建议是把某些方法加上拦截器，比如：\r\n发表文章前\r\n4、显示图片\r\n数据库里添加varchar字段，存储图片地址。\r\n\r\n8、加管理员那一项',NULL,1,NULL),(20,'Retina （一种新型高分辨率的显示技术）','11','所谓“Retina”是一种显示技术，可以将把更多的像素点压缩至一块屏幕里，从而达到更高的分辨率并提高屏幕显示的细腻程度。由摩托罗拉公司研发。最初该技术是用于Moto Aura上。这种分辨率在正常观看距离下足以使人肉眼无法分辨其中的单独像素。也被称为视网膜显示屏。\r\n外文名 Retina 性    质 显示技术 系    统 iOS 应    用 苹果系列手机\r\n目录\r\n',NULL,1,NULL),(21,'编程语言测试1','11','jjj',NULL,1,NULL);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `infor_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键/自增',
  `article_id` int(255) DEFAULT NULL COMMENT '评论文章的id',
  `receiver_id` int(11) DEFAULT NULL COMMENT '被接受评论者的id',
  `sender_id` int(11) DEFAULT NULL COMMENT '发布评论者的id',
  `comment_content` varchar(50) DEFAULT NULL COMMENT '评论的内容文本',
  `comment_time` datetime DEFAULT NULL COMMENT '评论发布的时间',
  PRIMARY KEY (`infor_id`),
  KEY `aticle_id` (`article_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`infor_id`,`article_id`,`receiver_id`,`sender_id`,`comment_content`,`comment_time`) values (1,13,NULL,32,NULL,NULL),(2,15,NULL,32,NULL,NULL),(3,15,NULL,32,'在这里写下你的评论444',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键/自动递增',
  `username` varchar(11) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `laber` varchar(50) DEFAULT NULL COMMENT '用户标签',
  `img` varchar(50) DEFAULT NULL COMMENT '头像',
  `integtal` varchar(50) DEFAULT NULL COMMENT '用户积分',
  `rdate` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`laber`,`img`,`integtal`,`rdate`) values (1,'','d41d8cd98f00b204','yf',NULL,'',NULL,NULL),(2,'','202cb962ac59075b','123',NULL,'','300',NULL),(3,'11','6512bd43d9caa6e0','11',NULL,'11',NULL,NULL),(4,'44','f7177163c833dff4','44',NULL,'44',NULL,NULL),(6,'','d41d8cd98f00b204','',NULL,'',NULL,NULL),(7,'1244','2c89109d42178de8','1244',NULL,'upload/NoImage.jpg',NULL,NULL),(8,'ee','08a4415e9d594ff9','ee',NULL,'upload/NoImage.jpg',NULL,NULL),(9,'1','c4ca4238a0b92382','1',NULL,'upload/NoImage.jpg',NULL,NULL),(10,'w','f1290186a5d0b1ce','w',NULL,'upload/NoImage.jpg',NULL,NULL),(11,NULL,'d41d8cd98f00b204',NULL,NULL,'upload/NoImage.jpg',NULL,NULL),(12,'r','4b43b0aee35624cd','r',NULL,'upload/NoImage.jpg',NULL,NULL),(13,'rr','4b43b0aee35624cd','rr',NULL,'upload/NoImage.jpg',NULL,NULL),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'ww','ad57484016654da8','ttt',NULL,'upload/NoImage.jpg',NULL,NULL),(17,'rr','514f1b439f404f86','rrr',NULL,'upload/NoImage.jpg',NULL,NULL),(18,'qq','099b3b0601548988','qq',NULL,'upload/NoImage.jpg',NULL,NULL),(19,'a','0cc175b9c0f1b6a8','a',NULL,'upload/NoImage.jpg',NULL,NULL),(20,'q','7694f4a66316e53c','q',NULL,'upload/NoImage.jpg',NULL,NULL),(21,'b','92eb5ffee6ae2fec','b',NULL,'upload/1923e10d-e110-44dc-92cd-385414c4e50f.jpg',NULL,NULL),(22,'5','e4da3b7fbbce2345','5',NULL,'upload/af08ca49-fb95-40f5-bbde-6e6f10a2a8f6.jpg',NULL,NULL),(23,'5','e4da3b7fbbce2345','5',NULL,'upload/f8afe146-2e19-45a4-8aee-5436c16e094d.jpg',NULL,NULL),(24,'h','2510c39011c5be70','h',NULL,'upload/25fb1cb9-9585-4936-bdf4-a9d6feb37742.jpg',NULL,NULL),(25,'','d41d8cd98f00b204','',NULL,'upload/NoImage.jpg',NULL,NULL),(26,'33','182be0c5cdcd5072','33',NULL,'upload/a817a92f-c33d-4e98-8d19-0ec3b47d0451.jpg',NULL,NULL),(27,'国图','3cdb0dd8faabc204','河豚',NULL,'upload/c5e61e2b-9133-492f-9328-8710a7c96626.jpg',NULL,NULL),(28,'TTT','94b8cea57c49a3007225a0c70c475450','yf.du@163.com',NULL,'upload/b815109f-4468-474b-ac7a-0fa7931afd05.jpg',NULL,NULL),(29,'TTT','0aa8fe62ddc7e62d39ba9856eb38e1ee','yf.du@163.com',NULL,'upload/d4f4d2e0-b29b-4c7e-9520-f646fc06b5d3.png',NULL,NULL),(30,'','cb42e130d1471239a27fca6228094f0e','nnnnnn@nnnnnnnnnnnn.nnnnn',NULL,'upload/NoImage.jpg',NULL,NULL),(31,'','b6d767d2f8ed5d21a44b0e5886680cb9','h@12.com',NULL,'upload/NoImage.jpg',NULL,NULL),(32,'11','6512bd43d9caa6e02c990b0a82652dca','11@163.com',NULL,'upload/5e327341-5b06-487c-8fdf-6ce6250eca4e.png',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
