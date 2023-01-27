-- TABLES:

CREATE TABLE Users(
	uid INTEGER PRIMARY KEY,
	uname CHAR(20),
    udate DATE,
    uemail CHAR(30),
    uage INTEGER
);

CREATE TABLE Playlists(
	pid INTEGER PRIMARY KEY,
	pname CHAR(30),
	pfollowers INTEGER
);

CREATE TABLE Artists(
	aid INTEGER PRIMARY KEY,
	aname CHAR(20),
	adate DATE,
	afollowers INTEGER
);

CREATE TABLE Songs(
	sid INTEGER PRIMARY KEY,
	sname CHAR(30)
);

CREATE TABLE SongCreates(
	sid INTEGER,
	aid INTEGER,
	sday DATE,
	PRIMARY KEY (sid, aid),
	FOREIGN KEY (sid) REFERENCES Songs(sid),
    FOREIGN KEY (aid) REFERENCES Artists(aid)
);

CREATE TABLE PlayCreates(
	pid INTEGER,
	uid INTEGER,
	pday DATE,
	PRIMARY KEY (pid),
	FOREIGN KEY (pid) REFERENCES Playlists(pid),
    FOREIGN KEY (uid) REFERENCES Users(uid)
);

CREATE TABLE SongFav(
	sid INTEGER,
	uid INTEGER,
	PRIMARY KEY (sid, uid),
	FOREIGN KEY (sid) REFERENCES Songs(sid),
    FOREIGN KEY (uid) REFERENCES Users(uid)
);

CREATE TABLE ArtistFav(
	uid INTEGER,
	aid INTEGER,
	PRIMARY KEY (uid, aid),
	FOREIGN KEY (uid) REFERENCES Users(uid),
    FOREIGN KEY (aid) REFERENCES Artists(aid)
);

CREATE TABLE Contains(
	sid INTEGER,
	pid INTEGER,
	PRIMARY KEY (sid, pid),
	FOREIGN KEY (sid) REFERENCES Songs(sid),
    FOREIGN KEY (pid) REFERENCES Playlists(pid)
);

-- INDEX TABLE:

-- VIEW TABLE:

-- CREATE VIEW [User id and age] AS
-- SELECT uid, uage
-- FROM Users;

-- SELECT * FROM [User id and age];


-- SELECT:

-- Get each age and the number of people of each age who are 22 or older:
SELECT u.uage, count(*) 
FROM Users u 
WHERE u.uage >= 22 GROUP BY u.uage;

-- Get the name of playlists and its number of songs for playlists that have more than 1 songs
SELECT p.pname, count(s.sid) 
FROM Playlists p, Contains c, Songs s 
WHERE p.pid = c.pid AND c.sid = s.sid 
GROUP BY p.pid, p.pname 
HAVING count(s.sid) > 1;

-- Find the names of songs for which created by artist has more than 20000 followers
SELECT s.sname
FROM Songs s
WHERE s.sid IN (SELECT sc.sid 
                FROM SongCreates sc, Artists a
                WHERE sc.aid = a.aid AND a.afollowers > 20000);
 
-- find the names of artists created the maximum number of songs
SELECT a.aname
FROM Artists a
WHERE a.aid IN (SELECT sc.aid
				FROM SongCreates sc
				GROUP BY sc.aid
			    HAVING count(*) IN 
                (SELECT MAX(mycount) FROM 
				(SELECT count(*) AS mycount
				FROM SongCreates sc1
				GROUP BY sc1.aid))); 

-- find names of artists who made their debut before 2021
SELECT a.aname
FROM Artists a
WHERE EXISTS (SELECT *
			  FROM Artists a1 
			  WHERE a1.adate < '2021-01-01' AND a.aid = a1.aid);

-- find names of latest song
SELECT s.sname
FROM Songs s, SongCreates sc
WHERE s.sid = sc.sid 
AND sc.sday IN (SELECT MAX(sday)
                FROM SongCreates);