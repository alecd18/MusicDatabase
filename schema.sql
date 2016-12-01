drop table artists_perform_songs;
drop table writers_write_songs;
drop table artists_performed_at_venues;
drop table users_favorite_songs;
drop table songs_on_albums;
drop table producers_produce_albums;

drop table music_videos;
drop table songs CASCADE;
drop table artists CASCADE;
drop table writers;
drop table venues CASCADE;
drop table users;
drop table albums;
drop table producers;


create table songs(
	sid int primary key,
	duration int,
	title varchar(128) not null,
	release_date date,
	genre varchar(128) 
);

create table music_videos(
	mvid int primary key,
	release_date varchar(128),
	record_label varchar(128),
	video_link varchar(256),
	sid int not null,
	foreign key(sid) references songs(sid)
);

create table artists(
	name varchar(128) primary key,
	country varchar(128)
);

create table writers(
	name varchar(128) primary key,
	country varchar(128)
);

create table venues(
	vid int primary key,
	name varchar(128) not null,
	location varchar(128) not null
);


create table users(
	username varchar(128) primary key,
	date_joined date not null
);

create table albums(
	aid int primary key,
	title varchar(128) not null,
	release_date date,
	number_of_songs int
);

create table producers(
	name varchar(128) primary key,
	country varchar(128)
);


create table artists_perform_songs(
	artist_name varchar(128),
	song_id int,
	primary key(artist_name, song_id),
	foreign key(artist_name) references artists(name),
	foreign key(song_id) references songs(sid)
);

create table writers_write_songs(
	writer_name varchar(128),
	song_id int,
	primary key(writer_name, song_id),
	foreign key(writer_name) references writers(name),
	foreign key(song_id) references songs(sid)
);

create table artists_performed_at_venues(
	artist varchar(128),
	venue_id int,
	concert_date date,
	primary key(artist, venue_id, concert_date),
	foreign key(artist) references artists(name),
	foreign key(venue_id) references venues(vid)
);


create table users_favorite_songs(
	username varchar(128),
	song_id int,
	primary key(username, song_id),
	foreign key(username) references users(username),
	foreign key(song_id) references songs(sid)
);

create table songs_on_albums(
	song_id int,
	album_id int,
	primary key(song_id, album_id),
	foreign key(song_id) references songs(sid),
	foreign key(album_id) references albums(aid)
);

create table producers_produce_albums(
	producer_name varchar(128),
	album_id int,
	primary key(producer_name, album_id),
	foreign key(producer_name) references producers(name),
	foreign key(album_id) references albums(aid)
);

-- Artists Table
INSERT INTO artists (name, country) VALUES ('Coldplay', 'England');
INSERT INTO artists (name, country) VALUES ('Drake', 'Canada');
INSERT INTO artists (name, country) VALUES ('Justin Bieber', 'Canada');
INSERT INTO artists (name, country) VALUES ('Rihanna', 'Barbados');
INSERT INTO artists (name, country) VALUES ('Adele', 'England');
INSERT INTO artists (name, country) VALUES ('Maroon 5', 'United States');
INSERT INTO artists (name, country) VALUES ('Panic! at the Disco', 'United States');
INSERT INTO artists (name, country) VALUES ('Luke Bryan', 'United States');
INSERT INTO artists (name, country) VALUES ('Weezer', 'United States');
INSERT INTO artists (name, country) VALUES ('Beyonce', 'United States');

-- Songs Table
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (1, 263, 'Adventure of a LifeTime', to_date('2015-11-06' ,'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (2, 289, 'Speed of Sound', to_date('2005-04-18', 'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (3, 241, 'Viva la Vida', to_date('2008-05-25', 'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (4, 205, 'Jumpman', to_date('2015-11-10', 'YYYY-MM-DD'), 'Hip Hop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (5, 259, 'Best I Ever Had', to_date('2009-06-19', 'YYYY-MM-DD'), 'Hip Hop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (6, 267, 'Hotline Bling', to_date('2015-07-31', 'YYYY-MM-DD'), 'Hip Hop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (7, 206, 'What Do You Mean?', to_date('2015-08-25', 'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (8, 201, 'Sorry', to_date('2015-10-23', 'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (9, 250, 'Where Are U Now', to_date('2015-02-27', 'YYYY-MM-DD'), 'EDM');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (10, 219, 'Work', to_date('2016-01-27', 'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (11, 276, 'Umbrella', to_date('2007-03-29', 'YYYY-MM-DD'), 'R&B');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (12, 239, 'S.O.S.', to_date('2006-02-14', 'YYYY-MM-DD'), 'Dance');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (13, 242, 'Set Fire to the Rain', to_date('2011-07-04', 'YYYY-MM-DD'), 'Soul');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (14, 287, 'Skyfall', to_date('2012-10-05', 'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (15, 295, 'Hello', to_date('2015-10-23', 'YYYY-MM-DD'), 'Soul');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (16, 207, 'This Love', to_date('2004-01-27', 'YYYY-MM-DD'), 'Pop Rock');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (17, 235, 'Sugar', to_date('2015-01-13', 'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (18, 244, 'Sunday Morning', to_date('2004-12-02', 'YYYY-MM-DD'), 'Jazz');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (19, 203, 'Death of a Bachelor', to_date('2016-01-15', 'YYYY-MM-DD'), 'Pop Rock');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (20, 186, 'I Write Sins Not Tragedies', to_date('2006-02-27', 'YYYY-MM-DD'),'Punk Rock');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (21, 192, 'Miss Jackson', to_date('2013-07-15', 'YYYY-MM-DD'), 'Punk Rock');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (22, 225, 'Country Girl (Shake It for Me)', to_date('2011-03-14', 'YYYY-MM-DD'), 'Country');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (23, 193, 'Kick the Dust Up', to_date('2015-05-19', 'YYYY-MM-DD'), 'Country');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (24, 213, 'Drunk On You', to_date('2012-02-13', 'YYYY-MM-DD'), 'Country');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (25, 200, 'Island in the Sun', to_date('2001-08-28', 'YYYY-MM-DD'), 'Alternative');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (26, 189, 'Pork and Beans', to_date('2008-06-16', 'YYYY-MM-DD'), 'Alternative');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (27, 159, 'Buddy Holly', to_date('1994-09-07', 'YYYY-MM-DD'), 'Alternative');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (28, 227, 'Irreplaceable', to_date('2006-10-23', 'YYYY-MM-DD'), 'Pop');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (29, 323, 'Drunk In Love', to_date('2013-12-17', 'YYYY-MM-DD'), 'R&B');
INSERT INTO songs (sid, duration, title, release_date, genre) VALUES (30, 193, 'Single Ladies (Put a Ring on It)', to_date('2008-10-13', 'YYYY-MM-DD'), 'Pop');

-- Writers Table
INSERT INTO writers (name, country) VALUES ('Guy Berryman', 'Scotland');
INSERT INTO writers (name, country) VALUES ('Jonny Buckland', 'England');
INSERT INTO writers (name, country) VALUES ('Will Champion', 'England'); 
INSERT INTO writers (name, country) VALUES ('Chris Martin', 'England'); 
INSERT INTO writers (name, country) VALUES ('Aubrey Graham', 'Canada'); 
INSERT INTO writers (name, country) VALUES ('Leland Wayne', 'United States'); 
INSERT INTO writers (name, country) VALUES ('Dwayne Carter', 'United States');
INSERT INTO writers (name, country) VALUES ('Justin Bieber', 'Canada');
INSERT INTO writers (name, country) VALUES ('Jason Boyd', 'United States'); 
INSERT INTO writers (name, country) VALUES ('Justin Tranter', 'United States'); 
INSERT INTO writers (name, country) VALUES ('Jahron Braithwaite', 'Canada'); 
INSERT INTO writers (name, country) VALUES ('Christopher Stewart', 'United States'); 
INSERT INTO writers (name, country) VALUES ('J.R. Rotem', 'South Africa'); 
INSERT INTO writers (name, country) VALUES ('Adele Adkins', 'England'); 
INSERT INTO writers (name, country) VALUES ('Adam Levine', 'United States'); 
INSERT INTO writers (name, country) VALUES ('Jesse Carmichael', 'United States'); 
INSERT INTO writers (name, country) VALUES ('Brendon Urie', 'United States');
INSERT INTO writers (name, country) VALUES ('Luke Bryan', 'United States');
INSERT INTO writers (name, country) VALUES ('Rivers Cuomo', 'United States');
INSERT INTO writers (name, country) VALUES ('Beyonce Knowles', 'United States');
INSERT INTO writers (name, country) VALUES ('Shawn Carter', 'United States');

-- Venues Table
INSERT INTO venues (vid, name, location) VALUES (1, 'Lincoln Financial Field', 'Philadelphia, PA');
INSERT INTO venues (vid, name, location) VALUES (2, 'Metlife Stadium', 'New York, NY'); 
INSERT INTO venues (vid, name, location) VALUES (3, 'Madison Square Garden', 'New York, NY'); 
INSERT INTO venues (vid, name, location) VALUES (4, 'Wells Fargo Center', 'Philadelphia, PA'); 
INSERT INTO venues (vid, name, location) VALUES (5, 'TD Garden', 'Boston, MA'); 
INSERT INTO venues (vid, name, location) VALUES (6, 'Oracle Arena', 'Oakland, CA'); 
INSERT INTO venues (vid, name, location) VALUES (7, 'SAP Center', 'San Jose, CA'); 
INSERT INTO venues (vid, name, location) VALUES (8, 'Quicken Loans Arene', 'Cleveland, OH'); 
INSERT INTO venues (vid, name, location) VALUES (9, 'BB&T Pavillion', 'Camden, NJ'); 
INSERT INTO venues (vid, name, location) VALUES (10, 'NRG Stadium', 'Houston TX'); 

-- Albums Table
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (1, 'A Head Full of Dreams', to_date('2015-12-04', 'YYYY-MM-DD'), 11);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (2, 'X&Y', to_date('2005-06-06', 'YYYY-MM-DD'), 14);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (3, 'Viva la Vida or Death and All His Friends', to_date('2008-05-25', 'YYYY-MM-DD'), 2);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (4, 'What a Time to Be Alive', to_date('2015-09-20', 'YYYY-MM-DD'), 11);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (5, 'So Far Gone', to_date('2009-09-15', 'YYYY-MM-DD'), 7);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (6, 'Purpose', to_date('2015-11-13', 'YYYY-MM-DD'), 13);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (7, 'Anti', to_date('2016-01-27', 'YYYY-MM-DD'), 13);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (8, 'Good Girl Gone Bad', to_date('2007-05-31', 'YYYY-MM-DD'), 12);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (9, 'A Girl Like Me', to_date('2006-04-10', 'YYYY-MM-DD'), 13);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (10, '21', to_date('2011-01-24', 'YYYY-MM-DD'), 11);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (11, '25', to_date('2015-11-20', 'YYYY-MM-DD'), 11);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (12, 'Songs About Jane', to_date('2002-06-25', 'YYYY-MM-DD'), 12);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (13, 'V', to_date('2014-09-29', 'YYYY-MM-DD'), 11);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (14, 'Death of a Bachelor', to_date('2016-01-15', 'YYYY-MM-DD'), 11);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (15, 'A Fever You Cant Sweat Out', to_date('2005-09-25', 'YYYY-MM-DD'), 13);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (16, 'Too Weird to Live, Too Rare to Die!', to_date('2013-10-08', 'YYYY-MM-DD'), 10);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (17, 'Tailgates & Tanlines', to_date('2011-08-09', 'YYYY-MM-DD'), 14);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (18, 'Kill the Lights', to_date('2015-09-05', 'YYYY-MM-DD'), 13);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (19, 'Weezer', to_date('2001-05-15', 'YYYY-MM-DD'), 10);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (20, 'Weezer', to_date('2008-06-03', 'YYYY-MM-DD'), 10);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (21, 'Weezer', to_date('1994-05-10', 'YYYY-MM-DD'), 10);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (22, 'B''day', to_date('2006-09-04', 'YYYY-MM-DD'), 10);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (23, 'Beyonce', to_date('2013-12-13', 'YYYY-MM-DD'), 14);
INSERT INTO albums (aid, title, release_date, number_of_songs) VALUES (24, 'I Am... Sasha Fierce', to_date('2008-11-15', 'YYYY-MM-DD'), 12);

-- Producers Table
INSERT INTO producers (name, country) VALUES ('Rik Simpson', 'England');
INSERT INTO producers (name, country) VALUES ('Allen Ritter', 'United States');
INSERT INTO producers (name, country) VALUES ('40', 'Canada'); 
INSERT INTO producers (name, country) VALUES ('Jason Boyd', 'United States'); 
INSERT INTO producers (name, country) VALUES ('Robyn Fenty', 'Barbados'); 
INSERT INTO producers (name, country) VALUES ('Jim Abbis', 'England'); 
INSERT INTO producers (name, country) VALUES ('Brian Burton', 'United States'); 
INSERT INTO producers (name, country) VALUES ('Matt Wallace', 'United States'); 
INSERT INTO producers (name, country) VALUES ('Joshua Coleman', 'United States'); 
INSERT INTO producers (name, country) VALUES ('Brendon Urie', 'United States'); 
INSERT INTO producers (name, country) VALUES ('Jeff Stevens', 'United States'); 
INSERT INTO producers (name, country) VALUES ('Jake Sinclair', 'United States'); 
INSERT INTO producers (name, country) VALUES ('Beyonce Knowles', 'United States'); 

-- Music Videos Table
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (1, to_date('2015-11-29', 'YYYY-MM-DD'), 'Atlantic Records', 'https://www.youtube.com/watch?v=QtXby3twMmI', 1);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (2, to_date('2005-05-23', 'YYYY-MM-DD'), 'Parlophone Records', 'https://www.youtube.com/watch?v=0k_1kvDh2UA', 2);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (3, to_date('2008-08-01', 'YYYY-MM-DD'), 'Capitol Records', 'https://www.youtube.com/watch?v=dvgZkm1xWPE', 3);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (5, to_date('2009-07-01', 'YYYY-MM-DD'), 'Cash Money Records', 'https://www.youtube.com/watch?v=fgdAj2_ZKSc', 5);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (6, to_date('2015-10-26', 'YYYY-MM-DD'), 'Universal Motown Records', 'https://www.youtube.com/watch?v=uxpDa-c-4Mc', 6);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (7, to_date('2015-08-30', 'YYYY-MM-DD'), 'Def Jam Recordings', 'https://www.youtube.com/watch?v=DK_0jXPuIr0', 7);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (8, to_date('2015-10-22', 'YYYY-MM-DD'), 'Def Jam Recordings', 'https://www.youtube.com/watch?v=fRh_vgS2dFE', 8);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (9, to_date('2015-06-27', 'YYYY-MM-DD'), 'Def Jam Recordings', 'https://www.youtube.com/watch?v=nntGTK2Fhb0', 9);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (10, to_date('2016-02-22', 'YYYY-MM-DD'), 'Def Jam Recordings', 'https://www.youtube.com/watch?v=HL1UzIK-flA', 10);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (11, to_date('2007-05-01', 'YYYY-MM-DD'), 'Def Jam Recordings', 'https://www.youtube.com/watch?v=CvBfHwUxHIk', 11);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (12, to_date('2006-10-06', 'YYYY-MM-DD'), 'Def Jam Recordings', 'https://www.youtube.com/watch?v=IXmF4GbA86E', 12);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (14, to_date('2012-10-08', 'YYYY-MM-DD'), 'Columbia Records', 'https://www.youtube.com/watch?v=DeumyOzKqgI', 14);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (15, to_date('2015-10-22', 'YYYY-MM-DD'), 'XL Recordings', 'https://www.youtube.com/watch?v=YQHsXMglC9A', 15);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (16, to_date('2002-06-16', 'YYYY-MM-DD'), 'Columbia Records', 'https://www.youtube.com/watch?v=XPpTgCho5ZA', 16);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (17, to_date('2015-01-14', 'YYYY-MM-DD'), 'Interscope Records', 'https://www.youtube.com/watch?v=09R8_2nJtjg', 17);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (18, to_date('2002-07-23', 'YYYY-MM-DD'), 'Columbia Records', 'https://www.youtube.com/watch?v=S2Cti12XBw4', 18);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (19, to_date('2015-12-24', 'YYYY-MM-DD'), 'DCD2 Records', 'https://www.youtube.com/watch?v=R03cqGg40GU', 19);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (20, to_date('2006-07-18', 'YYYY-MM-DD'), 'Atlantic Records', 'https://www.youtube.com/watch?v=vc6vs-l5dkc', 20);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (21, to_date('2013-07-15', 'YYYY-MM-DD'), 'Atlantic Records', 'https://www.youtube.com/watch?v=LUc_jXBD9DU', 21);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (22, to_date('2011-06-23', 'YYYY-MM-DD'), 'Capitol Records', 'https://www.youtube.com/watch?v=7HX4SfnVlP4', 22);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (24, to_date('2012-03-24', 'YYYY-MM-DD'), 'Capitol Records', 'https://www.youtube.com/watch?v=HpFaI0dKAHc', 24);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (26, to_date('2009-12-09', 'YYYY-MM-DD'), 'Interscope Records', 'https://www.youtube.com/watch?v=PQHPYelqr0E', 26);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (27, to_date('1994-09-20', 'YYYY-MM-DD'), 'Republic Records', 'https://www.youtube.com/watch?v=kemivUKb4f4', 27);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (28, to_date('2009-10-02', 'YYYY-MM-DD'), 'Columbia Records', 'https://www.youtube.com/watch?v=2EwViQxSJJQ', 28);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (29, to_date('2013-12-16', 'YYYY-MM-DD'), 'Columbia Records', 'https://www.youtube.com/watch?v=p1JPKLa-Ofc', 29);
INSERT INTO music_videos (mvid, release_date, record_label, video_link, sid) VALUES (30, to_date('2009-10-02', 'YYYY-MM-DD'), 'Columbia Records', 'https://www.youtube.com/watch?v=4m1EFMoRFvY', 30);

-- Artists Perform Songs Table
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Coldplay', 1);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Coldplay', 2);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Coldplay', 3);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Drake', 4);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Drake', 5);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Drake', 6);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Justin Bieber', 7);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Justin Bieber', 8);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Justin Bieber', 9);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Rihanna', 10);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Rihanna', 11);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Rihanna', 12);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Adele', 13);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Adele', 14);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Adele', 15);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Maroon 5', 16);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Maroon 5', 17);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Maroon 5', 18);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Panic! at the Disco', 19);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Panic! at the Disco', 20);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Panic! at the Disco', 21);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Luke Bryan', 22);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Luke Bryan', 23);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Luke Bryan', 24);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Weezer', 25);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Weezer', 26);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Weezer', 27);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Beyonce', 28);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Beyonce', 29);
INSERT INTO artists_perform_songs (artist_name, song_id) VALUES ('Beyonce', 30);

-- Writers Write Songs Table
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Guy Berryman', 1);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Jonny Buckland', 1);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Will Champion', 1);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Chris Martin', 1);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Guy Berryman', 2);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Jonny Buckland', 2);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Will Champion', 2);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Chris Martin', 2);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Guy Berryman', 3);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Jonny Buckland', 3);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Will Champion', 3);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Chris Martin', 3);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Aubrey Graham', 4);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Leland Wayne', 4);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Aubrey Graham', 5);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Dwayne Carter', 5);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Aubrey Graham', 6);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Justin Bieber', 7);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Justin Bieber', 8);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Justin Bieber', 9);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Jason Boyd', 9);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Justin Tranter', 10);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Jahron Braithwaite', 10);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Christopher Stewart', 11);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('J.R. Rotem', 12);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Adele Adkins', 13);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Adele Adkins', 14);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Adele Adkins', 15);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Adam Levine', 16);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Jesse Carmichael', 16);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Adam Levine', 17);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Jesse Carmichael', 17);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Adam Levine', 18);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Jesse Carmichael', 18);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Brendon Urie', 19);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Brendon Urie', 20);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Brendon Urie', 21);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Luke Bryan', 22);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Luke Bryan', 23);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Luke Bryan', 24);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Rivers Cuomo', 25);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Rivers Cuomo', 26);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Rivers Cuomo', 27);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Beyonce Knowles', 28);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Beyonce Knowles', 29);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Shawn Carter', 29);
INSERT INTO writers_write_songs (writer_name, song_id) VALUES ('Beyonce Knowles', 30);

-- Artists Performed at Venues Table
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Coldplay', 1, to_date('2016-08-06', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Beyonce', 1, to_date('2016-06-05', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Coldplay', 2, to_date('2016-07-17', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Drake', 3, to_date('2016-08-04', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Adele', 3, to_date('2016-09-20', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Drake', 4, to_date('2016-08-21', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Adele', 4, to_date('2016-09-09', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Justin Bieber', 4, to_date('2016-05-07', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Justin Bieber', 5, to_date('2016-05-10', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Rihanna', 6, to_date('2016-05-07', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Maroon 5', 6, to_date('2016-10-16', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Rihanna', 7, to_date('2016-05-06', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Adele', 7, to_date('2016-07-30', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Maroon 5', 8, to_date('2016-09-28', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Justin Bieber', 8, to_date('2016-04-26', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Panic! at the Disco', 9, to_date('2016-07-05', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Luke Bryan', 9, to_date('2016-07-29', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Weezer', 9, to_date('2016-07-05', 'YYYY-MM-DD'));
INSERT INTO artists_performed_at_venues (artist, venue_id, concert_date) VALUES ('Beyonce', 10, to_date('2016-05-07', 'YYYY-MM-DD'));

-- Songs On Albums Table
INSERT INTO songs_on_albums (song_id, album_id) VALUES (1, 1);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (2, 2);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (3, 3);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (4, 4);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (5, 5);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (6, 4);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (7, 6);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (8, 6);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (9, 6);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (10, 7);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (11, 8);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (12, 9);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (13, 10);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (14, 10);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (15, 11);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (16, 12);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (17, 13);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (18, 12);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (19, 14);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (20, 15);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (21, 16);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (22, 17);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (23, 18);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (24, 17);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (25, 19);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (26, 20);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (27, 21);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (28, 22);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (29, 23);
INSERT INTO songs_on_albums (song_id, album_id) VALUES (30, 24);

-- Producers Producs Albums Table
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Rik Simpson', 1);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Rik Simpson', 2);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Rik Simpson', 3);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Allen Ritter', 4);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('40', 5);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Jason Boyd', 6);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Robyn Fenty', 7);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Robyn Fenty', 8);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Robyn Fenty', 9);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Jim Abbis', 10);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Brian Burton', 11);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Matt Wallace', 12);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Joshua Coleman', 13);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Brendon Urie', 14);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Brendon Urie', 15);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Brendon Urie', 16);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Jeff Stevens', 17);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Jeff Stevens', 18);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Jake Sinclair', 19);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Jake Sinclair', 20);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Jake Sinclair', 21);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Beyonce Knowles', 22);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Beyonce Knowles', 23);
INSERT INTO producers_produce_albums (producer_name, album_id) VALUES ('Beyonce Knowles', 24);

