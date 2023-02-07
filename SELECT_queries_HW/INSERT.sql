INSERT INTO Genre (name)
VALUES ('Ambient'), ('Rock music'), ('Techno music'), ('Alternative Rock'), ('Jazz'), ('Heavy metal'), ('Pop music' ),
		('Cantri'), ('Hard Rock'), ('Nu metal');

INSERT INTO Artist(name)
VALUES ('Enigma'), ('Linkin park'), ('30 Seconds To Mars'), ('Guns N Roses'), ('The Anix'), ('Papa Roach'), 
		('Aerosmith'), ('Red');
		
INSERT INTO genreartist (genre_id, artist_id)
VALUES (1,1), (2,2), (3,5),(4,5),(4,2), (10,2),(4,3),(6,4),(9,4),(10,5),(2,5),(4,5), (10,6),(9,6),(4,6),(9,7),(2,8),(4,8);

INSERT INTO album (year_of_issue, name)
VALUES ('1993', 'The Cross of Changes'), ('2008', 'Seven Lives, Many Faces'), ('2003','Voyager'),('2003', 'Meteora'),
		('2007','Minutes to Midnight'), ('2000', 'Hybrid Theory'), ('2009', 'This is War'), ('2005','Beautiful Lie'),
		('1991','Use Your Illusion II'), ('1991', 'Use Your Illusion I'), ('2020', 'GRAPHITE'), ('2019', 'Hologram'), 
		('2011', 'Sleepwalker'),('2015','F.E.A.R.'), ('2010','...To Be Loved:The Best of Papa Roach'),
		('2013','Rock for the Rising Sun' ),('2013', 'Release the Panic'),('2011','Until We Have Faces');
		
INSERT INTO artistalbum (artist_id,album_id)
VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(3,7),(3,8),(4,9),(4,10),(5,11),(5,12),(5,13),(6,14),(6,15),(7,16),(8,17),(8,18);

INSERT INTO song(album_id,name,duration_sek)
VALUES (1,'Return to Innocence','255');

INSERT INTO song(album_id,name,duration_sek)
VALUES (2,'Seven Lives','265'),(3,'Voyageur','276'),(3,'Incognito','263'),(3,'Boom-Boom','269'),(4,'Easier to Run','204'),
		(4,'Lying From You','181'),(5,'Valentines Day','197'),(6,'My<Dsmbr','258'),(6,'Rnw@Y','193'),(7,'Hurricane','372'),
		(7,'This Is War','327'),(7,'Night of the Hunter','341'),(7,'Alibi','360'),(8,'R-Evolve','239'),(8,'The Kill','231'),
		(8,'A Beautiful Lie','245'),(8,'From Yesterday','248'),(9,'Knockin on Heavens Door','336'),(9,'Dont Cry','284'),
		(10,'Dont Cry','284'),(11,'Die With You','243'),(11,'Nothing Matters','266'),(12,'Renegade','229'),(12,'Chrome','276'),
		(12,'Everlasting Love','308'),(13,'In The Dark','151'),(14,'Hope For The Hopeless','179'),(14,'Falling Apart','189'),
		(14,'Gravity','245'),(15,'Broken Home','222'),(15,'Last Resort','200'),(15,'Scars(radio edit)','208'),
		(16,'Walk this Way','388'),(17,'Hold Me Now','241'),(17,'If We Only','226'),(18,'Hymn for the Missing','338'),
		(18,'Let It Burn','298');
	
INSERT INTO collection(name,year_of_issue)
VALUES ('Rock of 2000','2009'),('Linkin Park-Greatest Hit','2020'),('Best','2018'), ('New Age','2009'),('Alternative Collection','2019'),
		('Collection 1','2023'),('Collection Val.2','2021'),('All of them','2022'),('Thyrty Seconds to Mars','2010');
	
UPDATE collection 
SET name='Thirty Seconds to Mars'
WHERE id=9;

INSERT INTO collectionsong (song_id,collection_id)
VALUES (6,1),(9,1),(11,1),(12,1),(15,1),(6,2),(7,2),(8,2),(9,2),(10,2),(9,3),(19,3),(20,3),(33,3),(1,4),(2,4),(3,4),(4,4),
		(5,4),(7,5),(13,5),(15,5),(29,5),(26,5),(21,5),(18,5),(17,5),(33,6),(28,6),(9,6),(11,6),(14,6),(19,6),(22,6),
		(20,7),(37,7),(35,7),(30,7),(27,7),(23,7),(11,8),(12,8),(13,8),(14,8),(15,8),(16,8),(17,8),(18,8);
		
