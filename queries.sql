use music_database;


-- Query 1: Get songs in a specific playlist
SELECT songs.song_title, songs.duration_seconds
FROM songs
JOIN playlist_songs ON songs.song_id = playlist_songs.song_id
WHERE playlist_songs.playlist_id = 1;

-- Query 2: Get users and their playlists
SELECT users.username, playlists.playlist_name
FROM users
JOIN user_playlists ON users.user_id = user_playlists.user_id
JOIN playlists ON user_playlists.playlist_id = playlists.playlist_id;

-- Query 3: Get details of a specific album and its songs
SELECT albums.album_title, songs.song_title, songs.duration_seconds
FROM albums
JOIN songs ON albums.album_id = songs.album_id
WHERE albums.album_id = 1;

-- Query 4: Get the total duration of a playlist
SELECT playlists.playlist_name, SUM(songs.duration_seconds) AS total_duration
FROM playlists
JOIN playlist_songs ON playlists.playlist_id = playlist_songs.playlist_id
JOIN songs ON playlist_songs.song_id = songs.song_id
WHERE playlists.playlist_id = 1
GROUP BY playlists.playlist_name;

-- Query 5: Get the top 5 longest songs and their albums
SELECT songs.song_title, songs.duration_seconds, albums.album_title
FROM songs
JOIN albums ON songs.album_id = albums.album_id
ORDER BY songs.duration_seconds DESC
LIMIT 5;

-- Query 6: artists who have released albums in more than one genre
SELECT artists.artist_name, COUNT(DISTINCT albums.genre) AS genre_count
FROM artists
JOIN albums ON artists.artist_id = albums.artist_id
GROUP BY artists.artist_name
HAVING genre_count > 1;

-- Query 7: Get the latest album for each artist
SELECT artists.artist_name, MAX(albums.release_year) AS latest_album_year
FROM artists
JOIN albums ON artists.artist_id = albums.artist_id
GROUP BY artists.artist_name;

-- Query 8: Get the total number of songs in each playlist and their total duration
SELECT playlists.playlist_name, COUNT(playlist_songs.song_id) AS song_count, SUM(songs.duration_seconds) AS total_duration
FROM playlists
JOIN playlist_songs ON playlists.playlist_id = playlist_songs.playlist_id
JOIN songs ON playlist_songs.song_id = songs.song_id
GROUP BY playlists.playlist_name;

-- Query 9: Find artists who have not released any albums
SELECT artists.artist_name
FROM artists
LEFT JOIN albums ON artists.artist_id = albums.artist_id
WHERE albums.album_id IS NULL;

-- Query 10: Get the most popular genre based on the total number of songs
SELECT albums.genre, COUNT(songs.song_id) AS total_songs
FROM albums
JOIN songs ON albums.album_id = songs.album_id
GROUP BY albums.genre
ORDER BY total_songs DESC
LIMIT 1;
