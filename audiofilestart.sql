/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`audiofile` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `audiofile`;

DROP TABLE IF EXISTS `Album`;

CREATE TABLE `Album` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cover art` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `publish date` varchar(50) NOT NULL,
  
  PRIMARY KEY (`ID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Album`(`ID`,`name`,`cover art`,`publisher`,`publish date`) values
(1,'Odyssey','odyssey.png','Electronic Gems','1-1-2018');

DROP TABLE IF EXISTS `Album-Group`;

CREATE TABLE `Album-Group` (
  `album ID` int(11) NOT NULL,
  `group ID` int(11) NOT NULL,
  
  FOREIGN KEY (`album ID`)
      REFERENCES `Album`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (`group ID`)
      REFERENCES `Group`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Album-Group`(`album ID`,`group ID`) values
(1,1);

DROP TABLE IF EXISTS `Album-Song`;

CREATE TABLE `Album-Song` (
  `album ID` int(11) NOT NULL,
  `song ID` int(11) NOT NULL,
  
  FOREIGN KEY (`album ID`)
      REFERENCES `Album`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (`song ID`)
      REFERENCES `Song`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Album-Song`(`album ID`,`song ID`) values
(1,1),
(1,2),
(1,3);

DROP TABLE IF EXISTS `Genre`;

CREATE TABLE `Genre` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  
  PRIMARY KEY (`ID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Genre`(`ID`,`name`) values
(1,'Electronic'),
(2,'Electronic Dance Music');

DROP TABLE IF EXISTS `Genre-Album`;

CREATE TABLE `Genre-Album` (
  `genre ID` int(11) NOT NULL,
  `album ID` int(11) NOT NULL,

  FOREIGN KEY (`genre ID`)
      REFERENCES `Genre`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE,
  
  FOREIGN KEY (`album ID`)
      REFERENCES `Album`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Genre-Album`(`genre ID`,`album ID`) values
(1,1);

DROP TABLE IF EXISTS `Genre-Group`;

CREATE TABLE `Genre-Group` (
  `genre ID` int(11) NOT NULL,
  `group ID` int(11) NOT NULL,

  FOREIGN KEY (`genre ID`)
      REFERENCES `Genre`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE,
  
  FOREIGN KEY (`group ID`)
      REFERENCES `Group`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Genre-Group`(`genre ID`,`group ID`) values
(1,1);

DROP TABLE IF EXISTS `Group`;

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `number members` int(11) NOT NULL,
  
  PRIMARY KEY (`ID`)
  
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Group`(`ID`,`name`,`number members`) values
(1,'Home',1);

DROP TABLE IF EXISTS `Group-Song`;

CREATE TABLE `Group-Song` (
  `group ID` int(11) NOT NULL,
  `song ID` int(11) NOT NULL,
  
  FOREIGN KEY (`group ID`)
      REFERENCES `Group`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (`song ID`)
      REFERENCES `Song`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Group-Song`(`group ID`,`song ID`) values
(1,1),
(1,2),
(1,3);

DROP TABLE IF EXISTS `Related Genres`;

CREATE TABLE `Related Genres` (
  `genre1` int(11) NOT NULL,
  `genre2` int(11) NOT NULL,
  
  FOREIGN KEY (`genre1`)
      REFERENCES `Genre`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (`genre2`)
      REFERENCES `Genre`(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `Related Genres`(`genre1`,`genre2`) values
(1,2);

DROP TABLE IF EXISTS `Song`;

CREATE TABLE `Song` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `explicit?` boolean,
  `length` int(11),
  `file` varchar(50),
  
  PRIMARY KEY (`ID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
insert  into `Song`(`ID`,`name`,`explicit?`,`length`,`file`) values
(1,'Resonance',false,213,'Resonance.mp3'),
(2,'Odyssey',false,370,'Oddyssey.mp3'),
(3,'Intro',false,189,'Intro.mp3');