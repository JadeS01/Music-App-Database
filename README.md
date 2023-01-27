# Music App Database

### This is a database based on popular music streaming apps and is built with SQLite.
It follows the ER (Entity Relationship) Diagram shown below.
![image](https://user-images.githubusercontent.com/78764175/215190997-70ca4e1b-a012-4357-ad3d-9ed58328cc5b.png)

* Users can create many playlists, a playlist can be created by only one user.
* Users can follow many songs, a song can be followed by many users.
* Users can follow many artists, an artist can be followed by many users.
* Songs are created by at least one artist, an artist creates at least one song.
* Playlists have at least one song, a song could belong to many playlists.

