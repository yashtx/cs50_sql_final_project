# Design Document: Music Database

By Yash Tiwari

Video overview:

## Scope
The Music Database is designed to manage information related to artists, albums, songs, playlists, and user interactions with the music system. It aims to provide a comprehensive platform for organizing, accessing, and sharing music content.

### Artists Table
- Store information about artists, including their name, country, and genre.
- **Primary Key:** artist_id

### Albums Table
- Store details about albums, such as title, release year, genre, and the associated artist.
- **Primary Key:** album_id
- **Foreign Key:** artist_id references artists(artist_id)

### Songs Table
- Store information about individual songs, including title, duration, track number, lyrics, and the associated album.
- **Primary Key:** song_id
- **Foreign Key:** album_id references albums(album_id)

### Playlists Table
- Store details about playlists, including name and creation timestamp.
- **Primary Key:** playlist_id

### Playlist_Songs Table
- Represent a many-to-many relationship between songs and playlists.
- **Primary Key:** (playlist_id, song_id)
- **Foreign Keys:** playlist_id references playlists(playlist_id), song_id references songs(song_id)

### Users Table
- Store user information, including username, email, and registration date.
- **Primary Key:** user_id

### User_Playlists Table
- Represent a many-to-many relationship between users and playlists.
- **Primary Key:** (user_id, playlist_id)
- **Foreign Keys:** user_id references users(user_id), playlist_id references playlists(playlist_id)

## Relationships among Entities

1. **Artists and Albums:**
   - **Relationship Type:** One-to-Many
   - **Description:** An artist can have multiple albums, but each album is associated with only one artist. This relationship is established through the `artist_id` foreign key in the `albums` table, referencing the `artists` table.

2. **Albums and Songs:**
   - **Relationship Type:** One-to-Many
   - **Description:** An album can contain multiple songs, but each song is associated with only one album. This relationship is established through the `album_id` foreign key in the `songs` table, referencing the `albums` table.

3. **Songs and Playlists:**
   - **Relationship Type:** Many-to-Many
   - **Description:** A song can belong to multiple playlists, and a playlist can contain multiple songs. This many-to-many relationship is represented by the `playlist_songs` table, which acts as an associative entity between the `songs` and `playlists` tables. The primary key of `playlist_songs` is a composite key consisting of `playlist_id` and `song_id`.

4. **Users and Playlists:**
   - **Relationship Type:** Many-to-Many
   - **Description:** A user can have multiple playlists, and a playlist can be associated with multiple users. This many-to-many relationship is represented by the `user_playlists` table, which acts as an associative entity between the `users` and `playlists` tables. The primary key of `user_playlists` is a composite key consisting of `user_id` and `playlist_id`.

5. **Artists and Playlists (Indirect):**
   - **Relationship Type:** Indirect
   - **Description:** While there is no direct relationship between artists and playlists, the connection can be established through the relationships between artists, albums, songs, and playlists. Users can create playlists containing songs by specific artists.


## Optimization
- Indexing should be considered on columns frequently used in search conditions, joins, or where clauses to optimize query performance.
- Regular database maintenance to manage indexes, update statistics, and optimize queries for better responsiveness.

## Limitations
- The design assumes a simple user playlist management system and may require enhancements for a more sophisticated user experience.
- The database design does not address security measures, such as user authentication and authorization, which should be implemented separately.
- This design does not consider internationalization or localization features, which may be important for a global audience.

This design document provides an overview of the scope, functional requirements, table representations, optimization strategies, and limitations of the Music Database. Further refinement and implementation details can be addressed during the actual development process.
