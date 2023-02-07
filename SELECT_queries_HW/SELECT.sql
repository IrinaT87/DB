SELECT name, year_of_issue FROM album 
WHERE year_of_issue = 2015;

SELECT name,duration_sek  FROM song
WHERE duration_sek=(SELECT max(duration_sek) FROM song);

SELECT name, duration_sek FROM song 
WHERE duration_sek >=210;

SELECT name, year_of_issue FROM collection 
WHERE year_of_issue BETWEEN 2018 AND 2020;

SELECT name FROM artist 
WHERE name NOT LIKE '% %';

SELECT name FROM song 
WHERE name ILIKE '%my%';

