/*What is the length of the song intro?*/
SELECT length FROM song where song_name = 'intro';

/*Is the song Odyssey explicit?*/
SELECT is_explicit FROM song WHERE song_name = 'Odyssey';

/*What is the publish date of the album with the title Odyssey*/
SELECT publish_date from album WHERE album_name = 'Odyssey';

/*What band wrote Resonance?*/
SELECT band_name FROM band, band_song, song WHERE song.song_name = 'Resonance' AND song.id = band_song.song_id AND band.id = band_song.band_id;

/*What band wrote the album Crack The Skye*/
SELECT band_name FROM band, album_band, album WHERE album.album_name = 'Crack The Skye' AND album.id = album_band.album_id AND band.id = album_band.band_id;

/*How many songs did the band home write?*/
SELECT count(band_id) FROM band_song, band where band.band_name = 'Home' AND band_song.band_id = band.id;

/*How many members does the band home have?*/
SELECT number_members FROM band where band.band_name = 'Home';

/*How many songs are written under the electronic genre?*/
SELECT count(song.id) FROM genre, genre_band, band, band_song, song WHERE genre.genre_name = 'Electronic' AND genre_band.genre_id = genre.id AND genre_band.band_id = band.id AND band.id = band_song.band_id AND band_song.song_id = song.id;
