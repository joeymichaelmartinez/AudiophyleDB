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
(1,'Odyssey','odyssey.png','Electronic Gems','1-1-2018');

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
(1,1);

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
(1,3);

DROP TABLE IF EXISTS Genre;

CREATE TABLE Genre (
  id int(11) NOT NULL AUTO_INCREMENT,
  genre_name varchar(50) NOT NULL,
  
  PRIMARY KEY (id)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into Genre(id, genre_name) values
(1,'Electronic'),
(2,'Electronic Dance Music');

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
(1,1);

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
(1,1);

DROP TABLE IF EXISTS band;

CREATE TABLE band (
  id int(11) NOT NULL AUTO_INCREMENT,
  band_name varchar(50) NOT NULL,
  number_members int(11) NOT NULL,
  
  PRIMARY KEY (id)
  
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into band(id, band_name, number_members) values
(1,'Home',1);

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
(1,3);

DROP TABLE IF EXISTS related_genres;

CREATE TABLE related_genres (
  genre1 int(11) NOT NULL,
  genre2 int(11) NOT NULL,
  
  FOREIGN KEY (genre1)
      REFERENCES Genre(id)
      ON UPDATE CASCADE ON DELETE CASCADE,

  FOREIGN KEY (genre2)
      REFERENCES Genre(id)
      ON UPDATE CASCADE ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into related_genres(genre1, genre2) values
(1,2);

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
(1,'Resonance',false,213,'Resonance.mp3'),
(2,'Odyssey',false,370,'Oddyssey.mp3'),
(3,'Intro',false,189,'Intro.mp3');