CREATE DATABASE /*!32312 IF NOT EXISTS*/audiofile /*!40100 DEFAULT CHARACTER SET latin1 */;

USE audiofile;

DROP TABLE IF EXISTS album;

CREATE TABLE album (
  id int(11) NOT NULL AUTO_INCREMENT,
  album_name varchar(50) NOT NULL,
  cover_art varchar(50) NOT NULL,
  publisher varchar(50) NOT NULL,
  publish_date varchar(50) NOT NULL,
  
  PRIMARY KEY (id)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into album(id, album_name, cover_art, publisher, publish_date) values
(1,'Odyssey','odyssey.png','Electronic Gems','1-1-2018'),
(2,'Crack the Skye', 'Crack_the_Skye.png', 'Reprise', '3-24-2009');

DROP TABLE IF EXISTS song;

CREATE TABLE song (
  id int(11) NOT NULL AUTO_INCREMENT,
  song_name varchar(50) NOT NULL,
  is_explicit boolean,
  length int(11),
  song_file varchar(50),
  
  PRIMARY KEY (id)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
insert  into song(id, song_name, is_explicit, length, song_file) values
(1,'Intro',false,189,'Intro.mp3'),
(2,'Native',false,242,'Native.mp3'),
(3,'Decay',false,251,'Decay.mp3'),
(4,'Oort Cloud',false,205,'Oort_Cloud.mp3'),
(5,'Tides',false,237,'Tides.mp3'),
(6,'Nights (I Wish I Could Be There)',false,185,'Nights.mp3'),
(7,'Odyssey',false,369,'Oddyssey.mp3'),
(8,'New Machines',false,177,'New_Machines.mp3'),
(9,'Resonance',false,212,'Resonance.mp3'),
(10,'Come Back Down',false,443,'Come_Back_Down.mp3'),
(11,'Half Moon',false,260,'Half_Moon.mp3'),
(12,'On The Way Out',false,241,'On_The_Way_Out.mp3'),
(13,'Oblivion',false,347,'Oblivion.mp3'),
(14,'Divinations',false,219,'Divinations.mp3'),
(15,'Quintessence',false,327,'Quintessence.mp3'),
(16,'The Czar: Usurper/Escape/Martyr/Spiral',false,654,'The Czar:_Usurper/Escape/Martyr/Spiral.mp3'),
(17,'Ghost of Karelia',false,325,'Ghost_of_Karelia.mp3'),
(18,'Crack the Skye',false,354,'Crack_the_Skye.mp3'),
(19,'The Last Baron',false,781,'The_Last_Baron.mp3');

DROP TABLE IF EXISTS Genre;

CREATE TABLE Genre (
  id int(11) NOT NULL AUTO_INCREMENT,
  genre_name varchar(50) NOT NULL,
  
  PRIMARY KEY (id)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into Genre(id, genre_name) values
(1,'Electronic'),
(2,'Electronic Dance Music'),
(3,'Progressive Metal');

DROP TABLE IF EXISTS band;

CREATE TABLE band (
  id int(11) NOT NULL AUTO_INCREMENT,
  band_name varchar(50) NOT NULL,
  number_members int(11) NOT NULL,
  
  PRIMARY KEY (id)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into band(id, band_name, number_members) values
(1,'Home',1),
(2,'Mastodon', 4);

DROP TABLE IF EXISTS album_band;

CREATE TABLE album_band (
  album_id int(11) NOT NULL,
  band_id int(11) NOT NULL,
  
  FOREIGN KEY (album_id)
      REFERENCES album(id)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (band_id)
      REFERENCES band(id)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into album_band(album_id,band_id) values
(1,1),
(2,2);

DROP TABLE IF EXISTS album_song;

CREATE TABLE album_song (
  album_id int(11) NOT NULL,
  song_id int(11) NOT NULL,
  
  FOREIGN KEY (album_id)
      REFERENCES Album(id)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (song_id)
      REFERENCES song(id)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into album_song(album_id,song_id) values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(2,13),
(2,14),
(2,15),
(2,16),
(2,17),
(2,18),
(2,19);

DROP TABLE IF EXISTS genre_album;

CREATE TABLE genre_album (
  genre_id int(11) NOT NULL,
  album_id int(11) NOT NULL,

  FOREIGN KEY (genre_id)
      REFERENCES Genre(id)
      ON UPDATE CASCADE ON DELETE CASCADE,
  
  FOREIGN KEY (album_id)
      REFERENCES Album(id)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into genre_album(genre_id,album_id) values
(1,1),
(3,2);

DROP TABLE IF EXISTS genre_band;

CREATE TABLE genre_band (
  genre_id int(11) NOT NULL,
  band_id int(11) NOT NULL,

  FOREIGN KEY (genre_id)
      REFERENCES Genre(id)
      ON UPDATE CASCADE ON DELETE CASCADE,
  
  FOREIGN KEY (band_id)
      REFERENCES band(id)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into genre_band(genre_id, band_id) values
(1,1),
(3,2);

DROP TABLE IF EXISTS band_song;

CREATE TABLE band_song (
  band_id int(11) NOT NULL,
  song_id int(11) NOT NULL,
  
  FOREIGN KEY (band_id)
      REFERENCES band(id)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (song_id)
      REFERENCES song(id)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into band_song(band_id, song_id) values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(2,13),
(2,14),
(2,15),
(2,16),
(2,17),
(2,18),
(2,19);

DROP TABLE IF EXISTS related_genres;

CREATE TABLE related_genres (
  genre1_id int(11) NOT NULL,
  genre2_id int(11) NOT NULL,
  
  FOREIGN KEY (genre1_id)
      REFERENCES Genre(id)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (genre2_id)
      REFERENCES Genre(id)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into related_genres(genre1_id, genre2_id) values
(1,2);

