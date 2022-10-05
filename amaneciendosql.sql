/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.14-MariaDB : Database - amaneciendo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`amaneciendo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `amaneciendo`;

/*Table structure for table `carta` */

DROP TABLE IF EXISTS `carta`;

CREATE TABLE `carta` (
  `id_carta` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) DEFAULT NULL,
  `producto` varchar(20) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `volumen` varchar(20) DEFAULT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id_carta`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `carta_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `carta` */

insert  into `carta`(`id_carta`,`imagen`,`producto`,`id_tipo`,`volumen`,`valor`) values 
(1,'images/aguila.png','Aguila',1,'300 ml',3300),
(5,'images/poker.png','Poker',1,'300 ml',3300),
(8,'images/costeña.png','Costeña',1,'300 ml',3300);

/*Table structure for table `estanco` */

DROP TABLE IF EXISTS `estanco`;

CREATE TABLE `estanco` (
  `id_estanco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estanco` varchar(20) NOT NULL,
  `direccion_estanco` varchar(20) NOT NULL,
  `barrio` varchar(20) NOT NULL,
  `telefono_estanco` varchar(10) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `id_franquicia` int(11) NOT NULL,
  `imagen_estanco` varchar(255) NOT NULL,
  `logo_estanco` varchar(255) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `hora_estanco` varchar(20) NOT NULL,
  `horario_estanco` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estanco`),
  KEY `id_zona` (`id_zona`),
  KEY `id_franquicia` (`id_franquicia`),
  CONSTRAINT `estanco_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`),
  CONSTRAINT `estanco_ibfk_2` FOREIGN KEY (`id_franquicia`) REFERENCES `franquicia` (`id_franquicia`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `estanco` */

insert  into `estanco`(`id_estanco`,`nombre_estanco`,`direccion_estanco`,`barrio`,`telefono_estanco`,`id_zona`,`id_franquicia`,`imagen_estanco`,`logo_estanco`,`descripcion`,`hora_estanco`,`horario_estanco`,`longitud`,`latitud`) values 
(1,'CROBAR','CRA 5A #10-15','JARDIN','3103020553',3,2,'https://www.rdstation.com/blog/wp-content/uploads/sites/2/2017/09/thestocks.jpg','https://www.rdstation.com/blog/wp-content/uploads/sites/2/2017/09/thestocks.jpg','CLUB NOCTURNO','9:00 P.M - 5:00 A.M','JUEVES A DOMINGO','25528oo','5252o'),
(2,'OPIUM','CALLE 13B #32-31','LA ESPERANZA','3133989513',2,4,'https://www.rdstation.com/blog/wp-content/uploads/sites/2/2017/09/thestocks.jpg','https://www.rdstation.com/blog/wp-content/uploads/sites/2/2017/09/thestocks.jpg','CLUB NOCTURNO','9:00 P.M - 5:00 A.M','JUEVES A DOMINGO','-75.266694','2.936511'),
(3,'EL CAMINO','calle 75b #5-109 a 5','TIMANCO','3103020553',1,3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXAFdyWWUZrK2dG6oJBLkhcSZFl6tAE-qYBg&usqp=CAU','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXAFdyWWUZrK2dG6oJBLkhcSZFl6tAE-qYBg&usqp=CAU','CLUB NOCTURNO','9:00 P.M - 5:00 A.M','VIERNES A DOMINGO','-75.267940','2.939693'),
(6,'LOLA PEREZ','CRA 5A #10-15','GUADUALES','3173189499',1,4,'https://i0.wp.com/hipertextual.com/wp-content/uploads/2021/06/Google-Imagenes-Main-Site.jpg?fit=2000%2C1333&ssl=1','https://i0.wp.com/hipertextual.com/wp-content/uploads/2021/06/Google-Imagenes-Main-Site.jpg?fit=2000%2C1333&ssl=1','CLUB NOCTURNO','9:00 P.M - 5:00 A.M','JUEVES A DOMINGO','-75.271423','2.921005'),
(7,'COBE PUB','CRA 5B #43-21','CENTRO','3228428002',4,4,'https://blog.ida.cl/wp-content/uploads/sites/5/2020/04/tamano-redes-blog-655x470.png','https://blog.ida.cl/wp-content/uploads/sites/5/2020/04/tamano-redes-blog-655x470.png','CLUB NOCTURNO','9:00 P.M - 5:00 A.M','JUEVES A DOMINGO','-75.299927','2.945345'),
(8,'EL ESTANCO','CALLE 7 #02-52','PRADO ALTO','3173189499',4,2,'https://i0.wp.com/hipertextual.com/wp-content/uploads/2021/06/Google-Imagenes-Main-Site.jpg?fit=2000%2C1333&ssl=1','https://i0.wp.com/hipertextual.com/wp-content/uploads/2021/06/Google-Imagenes-Main-Site.jpg?fit=2000%2C1333&ssl=1','CLUB NOCTURNO','9:00 P.M - 5:00 A.M','VIERNES A DOMINGO',' -75.266669','2.930003'),
(9,'OLE','CALLE 13B #32-31','LA ESPERANZA','3133989513',2,2,'https://i0.wp.com/hipertextual.com/wp-content/uploads/2021/06/Google-Imagenes-Main-Site.jpg?fit=2000%2C1333&ssl=1','https://i0.wp.com/hipertextual.com/wp-content/uploads/2021/06/Google-Imagenes-Main-Site.jpg?fit=2000%2C1333&ssl=1','CLUB NOCTURNO','9:00 P.M - 5:00 A.M','JUEVES A DOMINGO',' -75.274711','2.905858');

/*Table structure for table `franquicia` */

DROP TABLE IF EXISTS `franquicia`;

CREATE TABLE `franquicia` (
  `id_franquicia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_franquicia` varchar(20) NOT NULL,
  PRIMARY KEY (`id_franquicia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `franquicia` */

insert  into `franquicia`(`id_franquicia`,`nombre_franquicia`) values 
(1,'OPIUM'),
(2,'CROBAR'),
(3,'EL CAMINO'),
(4,'SOLAR');

/*Table structure for table `persona` */

DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contrasena` varchar(10) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `nit_empresa` varchar(10) DEFAULT NULL,
  `nombre_estanco` varchar(10) DEFAULT NULL,
  `tipo_documento` enum('cc','ce','nit') DEFAULT NULL,
  `hora_i` varchar(12) DEFAULT NULL,
  `hora_f` varchar(12) DEFAULT NULL,
  `dia_atencion` set('lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo') DEFAULT NULL,
  `numero_documento_comprador` varchar(12) DEFAULT NULL,
  `RUT` varchar(12) DEFAULT NULL,
  `camara_comercio` varchar(12) DEFAULT NULL,
  `img_cc` varchar(12) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `U_email` (`email`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

/*Data for the table `persona` */

insert  into `persona`(`id`,`nombre`,`direccion`,`email`,`contrasena`,`telefono`,`nit_empresa`,`nombre_estanco`,`tipo_documento`,`hora_i`,`hora_f`,`dia_atencion`,`numero_documento_comprador`,`RUT`,`camara_comercio`,`img_cc`,`id_rol`) values 
(18,'David ','Km 8','Jekada00@gmail.com ','12345','3101029190',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),
(19,'Carlos','Cll13','Karitoko2020@hmail.com','1223','3178716781',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(21,'JULIAN','CALLE 42 #6A 45','JULLIAN2000LOL@GMAIL.COM','SAPO123','3108051414','4381991:91','Emoji','cc','5:00 PM','3:00 AM','lunes,Martes,Miercoles,Jueves,Viernes,Sabado,Domingo','10039021012',NULL,NULL,NULL,1),
(22,'Andres','CALLE 31 #6B 47','Andres2000LOL@GMAIL.COM','Tussy123','3108051344',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(25,'jhon','calle 12','jhon1100p@hotmail.com','1234','3100229101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),
(26,'alberto','calle 13','alberto@gamil.com','albert123','31893027192',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),
(28,'wini','calle 31','winipoh@gmail.com','123456','3182820271',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `roles` */

insert  into `roles`(`id_rol`,`rol`) values 
(1,'Empresario'),
(2,'Usuario');

/*Table structure for table `tipo` */

DROP TABLE IF EXISTS `tipo`;

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipo` */

insert  into `tipo`(`id_tipo`,`tipo`) values 
(1,'cerveza nacional'),
(2,'cerveza importada'),
(3,'licores nacionales'),
(4,'licores importados'),
(5,'energizantes'),
(6,'variados');

/*Table structure for table `zona` */

DROP TABLE IF EXISTS `zona`;

CREATE TABLE `zona` (
  `id_zona` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_zona` varchar(10) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `logitud` varchar(20) NOT NULL,
  `latitudelta` varchar(20) NOT NULL,
  `logintudelta` varchar(20) NOT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `zona` */

insert  into `zona`(`id_zona`,`tipo_zona`,`latitud`,`logitud`,`latitudelta`,`logintudelta`) values 
(1,'norte','','','',''),
(2,'sur','','','',''),
(3,'este','','','',''),
(4,'oeste','','','','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
