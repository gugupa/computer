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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`article_id`,`title`,`author`,`acontent`,`uptime`,`state`,`credit`) values (13,'HTML <a> 标签的 target 属性','123','定义和用法 <a> 标签的 target 属性规定在何处打开链接文档。 如果在一个 <a> 标签内包',NULL,1,NULL),(15,'mysql中文乱码','','MySQL 4.1的字符集支持(Character Set Support)有两个方面：字符集(Character set)和排序方式(Collation)。对于字符集的支持细化到四个层次: 服务器(server)，数据库(database)，数据表(table)和连接(connection)。下面将分两部分，分别设置服务器编码和数据库、数据表与连接部分的编码，从而杜绝中文乱码的出现。\r\n\r\n　　一 服务器编码设置\r\n\r\n　　服务器编码设置方法有二：\r\n\r\n　　一是安装mysql时，其中会有一个步骤选择编码方式，此时选择gbk即可。如果不选择，默认的编码是latin1；\r\n\r\n　　二是在安装玩mysql之后，手动修改其配置文件，如下：\r\n\r\n　　(1)修改 MySql安装目录下面的my.ini(MySQL Server Instance Configuration 文件)。 设置\r\n        default-character-set=gbk(注意，有2处) \r\n　　(2)修改data目录中相应数据库目录下的db.opt配置文件\r\n        default-character-set=gbk\r\n        default-collation=gbk_chinese_ci\r\n \r\n　　重启数据库，关闭控制台窗口重新登录数据库即可。\r\n \r\n　　二 数据库、数据表和连接部分的编码设置\r\n　　2.1 设置数据库和数据表编码\r\n　　要解决乱码问题，首先必须弄清楚数据库和数据表用什么编码。如果没有指明，将是默认的latin1。\r\n用得最多的应该是这3种字符集 gb2312，gbk，utf8。\r\n　　如何去指定数据库和数据表的字符集呢？下面也gbk为例：\r\n　　【在MySQL Command Line Client创建数据库 】\r\n　　mysql> CREATE TABLE `mysqlcode` (\r\n　　-> `id` TINYINT( 255 ) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,\r\n　　-> `content` VARCHAR( 255 ) NOT NULL\r\n　　-> ) TYPE = MYISAM CHARACTER SET gbk COLLATE gbk_chinese_ci;\r\n　　Query OK, 0 rows affected, 1 warning (0.03 sec)\r\n　　其中后面的TYPE = MYISAM CHARACTER SET gbk COLLATE gbk_chinese_ci;\r\n就是指定数据库的字符集，COLLATE (校勘)，让mysql同时支持多种编码的数据库。\r\n　　当然也可以通过如下指令修改数据库数据表的字符集：\r\n　　　　alter database mysqlcode default character set \'gbk\'.\r\n　　前面已经设置了服务器、数据库和数据表的编码，那么数据库中的编码便都是gbk，中文可以存储进去。\r\n但是如果你要通过执行insert或select等操作时，仍然会出现中文乱码问题，这是因为还没设置\r\n“连接(connection)”部分的编码，而insert、select等数据库操作都包含与数据库的连接动作。如果不信\r\n，你现在可以执行下面的sql文试一试：\r\n　　mysql> insert into mysqlcode values(null,\'java爱好者\');\r\n　　按回车，结果如下：\r\n　　ERROR 1406 (22001): Data too long for column \'content\' at row 1\r\n　　\r\n　　2.2 设置连接编码\r\n　　设置了服务器、数据库和数据表部分的编码，必须设置连接编码。连接编码设置如下：\r\n　　mysql> SET character_set_client=\'gbk\';\r\n　　mysql> SET character_set_connection=\'gbk\'\r\n　　mysql> SET character_set_results=\'gbk\'\r\n　　设置好连接编码，下面便可以成功插入中文了：\r\n　　mysql> insert into mysqlcode values(null,\'java爱好者\');\r\n　　Query OK, 0 rows affected (0.02 sec)\r\n　　\r\n　　其实，上面设置连接编码的三条命令可以简化为一条：\r\n　　mysql> set names \'gbk\';\r\n　　',NULL,1,NULL),(16,'text-overflow: ellipsis;','','这里的重点样式是  text-overflow: ellipsis;\r\n\r\n不过话说text-ellipsis是一个特殊的样式，有关解释是这样的：text-overflow属性仅是注解，当文本溢出时是否显示省略标记。并不具备其它的样式属性定义。要实现溢出时产生省略号的效果还须定义：强制文本在一行内显示（white-space:nowrap）及溢出内容为隐藏（overflow:hidden），只有这样才能实现溢出文本显示省略号的效果。\r\n\r\n这里面需要限定宽度、文字显示在一行中（white-space:nowrap;）和使用隐藏属性overflow。\r\n\r\n网上给支持低版本的opera一个办法，就是-o-text-overflow：ellipsis；',NULL,1,NULL),(17,'编程',NULL,'33',NULL,1,NULL),(18,'编程语',NULL,'35',NULL,1,NULL);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `infor_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键/自增',
  `aticle_id` int(255) DEFAULT NULL COMMENT '评论文章的id',
  `receiver_id` int(11) DEFAULT NULL COMMENT '被接受评论者的id',
  `sender_id` int(11) DEFAULT NULL COMMENT '发布评论者的id',
  `comment_content` varchar(50) DEFAULT NULL COMMENT '评论的内容文本',
  `conment_time` datetime DEFAULT NULL COMMENT '评论发布的时间',
  PRIMARY KEY (`infor_id`),
  KEY `aticle_id` (`aticle_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`aticle_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`laber`,`img`,`integtal`,`rdate`) values (1,'','d41d8cd98f00b204e9800998ecf8427e','yf',NULL,'',NULL,NULL),(2,'','202cb962ac59075b964b07152d234b70','123',NULL,'','300',NULL),(3,'11','6512bd43d9caa6e02c990b0a82652dca','11',NULL,'11',NULL,NULL),(4,'44','f7177163c833dff4b38fc8d2872f1ec6','44',NULL,'44',NULL,NULL),(6,'','d41d8cd98f00b204e9800998ecf8427e','',NULL,'',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
