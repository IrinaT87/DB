--количество исполнителей в каждом жанре
SELECT name, count(artist_id)FROM genre 
JOIN genreartist ON genre.id=genreartist.genre_id
GROUP BY name;

--количество треков, вошедших в альбомы 2019-2020 годов
SELECT album.name, count(song.id) FROM album 
JOIN song ON album.id=song.album_id 
WHERE year_of_issue BETWEEN 2019 AND 2020
GROUP BY album.name;

--средняя продолжительность треков по каждому альбому
SELECT album.name, avg(duration_sek)FROM album 
JOIN song ON album.id=song.album_id 
GROUP BY album.name;

--все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT artist.name FROM artist 
JOIN artistalbum ON artist.id=artistalbum.artist_id 
JOIN album ON artistalbum.album_id =album.id 
WHERE artist.name NOT IN (SELECT artist.name FROM artist 
	JOIN artistalbum ON artist.id=artistalbum.artist_id 
	JOIN album ON artistalbum.album_id =album.id 
	WHERE year_of_issue =  '2020' );


--названия сборников, в которых присутствует исполнитель Enigma
SELECT DISTINCT collection.name FROM artist 
JOIN artistalbum a ON artist.id=a.artist_id 
JOIN song ON a.album_id=song.album_id 
JOIN collectionsong c ON song.id=c.song_id 
JOIN collection  ON c.collection_id =collection.id
WHERE artist.name LIKE 'Enigma';


--название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT album.name, count(genre_id) FROM album
JOIN artistalbum a ON album.id = a.album_id
JOIN artist ON a.artist_id = artist.id
JOIN genreartist g ON a.artist_id = g.artist_id 
GROUP BY album.name
HAVING count(g.genre_id) > 1
ORDER BY album.name;


-- наименование треков, которые не входят в сборники
SELECT song.name FROM song 
LEFT JOIN collectionsong c ON song.id=c.song_id
WHERE c.song_id IS NULL;


--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT artist.name, min(duration_sek)FROM artist 
JOIN artistalbum a ON artist.id=a.artist_id 
JOIN song ON a.album_id=song.album_id 
WHERE duration_sek <= (SELECT min(duration_sek) FROM song)
GROUP BY artist.name;
--В случае если убрать GROUP BY выходит ошибка:SQL Error [42803]: ОШИБКА: столбец "artist.name" должен фигурировать 
--в предложении GROUP BY или использоваться в агрегатной функции


--название альбомов, содержащих наименьшее количество треков
SELECT album.name, count(song.id) FROM album
JOIN song ON album.id=song.album_id
GROUP BY album.id
HAVING COUNT(song.name) = (SELECT COUNT(song.name) FROM album
	JOIN song ON album.id=song.album_id
	GROUP BY album.id
	ORDER BY COUNT(song.name) 
	LIMIT 1)
ORDER BY album.name;





