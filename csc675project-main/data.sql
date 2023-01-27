-- Users:
INSERT INTO Users(uid, uname, udate, uemail, uage)
VALUES (1000, 'chris', '2000-10-03', 'chris@mail.com', 22),
        (1001, 'kenny', '2010-03-03', 'kenny@mail.com', 21),
        (1002, 'jade', '2014-02-10', 'jade@mail.com', 35),
        (1003, 'wenye', '2019-09-04', 'wenye@mail.com', 45),
        (1004, 'konnor', '2002-05-07', 'konnor@mail.com', 19);

-- Playlist:
INSERT INTO Playlists(pid, pname, pfollowers)
VALUES (1000, 'pop', 26),
        (1002, 'edm', 598),
        (1003, 'anime', 1234),
        (1001, 'kpop', 9876);

-- Artist:
INSERT INTO Artists(aid, aname, adate, afollowers)
VALUES (1100, 'keish', '2020-03-10', 10300),
        (1200, 'niki', '2021-03-15', 30222),
        (1300, 'bts', '2014-10-30', 300432),
        (1400, 'maroon5', '2004-09-01', 1111113);

-- Songs:
INSERT INTO Songs(sid, sname)
VALUES (1111, 'beside you'),
        (1112, 'spring day'),
        (1113, 'less of you'),
        (1114, 'daylight'),
        (1115, 'lowkey'),
        (1116, 'butter'),
        (1117, 'dynamite');

-- SongCreates:
INSERT INTO SongCreates(sid, aid, sday)
VALUES (1111, 1100, '2020-04-2'),
        (1112, 1300, '2021-12-09'),
        (1113, 1100, '2021-06-03'),
        (1114, 1400, '2022-01-09'),
        (1115, 1200, '2021-04-03'),
        (1116, 1300, '2021-03-06'),
        (1117, 1300, '2021-05-02');

-- PlayCreates:
INSERT INTO PlayCreates(pid, uid, pday)
VALUES (1000, 1004, '2020-07-25'),
        (1002, 1003, '2021-01-03'),
        (1003, 1002, '2021-03-13');

-- SongFav:
INSERT INTO SongFav(sid, uid)
VALUES (1111, 1001),
        (1111, 1002),
        (1113, 1003),
        (1115, 1004),
        (1117, 1003),
        (1117, 1000);

-- ArtistFav:
INSERT INTO ArtistFav(uid, aid)
VALUES (1000, 1100),
        (1003, 1200),
        (1001, 1300),
        (1002, 1400);

-- Contains:
INSERT INTO Contains(sid, pid)
VALUES (1112, 1000),
        (1111, 1003),
        (1115, 1001),
        (1117, 1002),
        (1112, 1000),
        (1115, 1001),
        (1113,1000),
        (1114, 1000),
        (1116, 1000),
        (1111, 1000);