create database music_database;
use music_database;

-- Table for artists
create table artists (
    artist_id int primary key,
    artist_name varchar(50) not null,
    country varchar(30),
    genre varchar(30)
);

-- table for albums
create table albums (
    album_id int primary key,
    album_title varchar(30) not null,
    release_year int,
    artist_id int,
    genre varchar(30),
    foreign key (artist_id) references artists(artist_id)
);

-- table for songs
create table songs (
    song_id int primary key,
    song_title varchar(50) not null,
    duration_seconds int,
    album_id int,
    track_number int,
    lyrics text,
    foreign key (album_id) references albums(album_id)
);

-- table for playlists
create table playlists (
    playlist_id int primary key,
    playlist_name varchar(30) not null,
    created_at timestamp default current_timestamp
);

-- many-to-many relationship between songs and playlists
create table playlist_songs (
    playlist_id int,
    song_id int,
    primary key (playlist_id, song_id),
    foreign key (playlist_id) references playlists(playlist_id),
    foreign key (song_id) references songs(song_id)
);

-- table for user information
create table users (
    user_id int primary key,
    username varchar(50) not null,
    email text not null,
    registration_date timestamp default current_timestamp
);

-- many-to-many relationship between users and playlists
create table user_playlists (
    user_id int,
    playlist_id int,
    primary key (user_id, playlist_id),
    foreign key (user_id) references users(user_id),
    foreign key (playlist_id) references playlists(playlist_id)
);
