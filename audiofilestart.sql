/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`audiofile` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `audiofile`;

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  
  PRIMARY KEY (`ID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `coverArt` BLOB NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `publishDate` DATE NOT NULL,
  `genreIds` int(11) NOT NULL,
  `songIds` int(11) NOT NULL,
  `groupIds` int(11) NOT NULL,
  
  PRIMARY KEY (`genreId`),
  
  FOREIGN KEY (`genreIds`)
      REFERENCES genre(`ID`)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (`songIds`)
      REFERENCES song(`songId`)
      ON UPDATE CASCADE ON DELETE CASCADE,
      
  FOREIGN KEY (`groupIds`)
      REFERENCES `group`(`groupId`)
      ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `group`;

CREATE TABLE `group` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `numberOfMembers` int(11) NOT NULL,
  `publishDate` DATE NOT NULL,
  `genreIds` int(11) NOT NULL,
  `albumIds` int(11) NOT NULL,
  `songIds` int(11) NOT NULL,
  
  
  PRIMARY KEY (`groupId`),
  
  FOREIGN KEY (`genreIds`)
      REFERENCES `genre`(`genreId`)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (`albumIds`)
      REFERENCES album(`albumId`)
      ON UPDATE CASCADE ON DELETE CASCADE,
  
  FOREIGN KEY (`songIds`)
      REFERENCES song(`songId`)
      ON UPDATE CASCADE ON DELETE CASCADE
      
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;