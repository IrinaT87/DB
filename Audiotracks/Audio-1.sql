create table if not exists Genre (
	id SERIAL primary key,
	name VARCHAR(60) not null
);

create table if not exists Artist (
	id SERIAL primary key,
	name VARCHAR (60) not null
);

create table if not exists GenreArtist (
	id SERIAL primary key,
	genre_id INTEGER not null references Genre(id),
	artist_id INTEGER not null references Artist(id)
);

create table if not exists Album (
	id SERIAL primary key,
	year_of_issue INTEGER not null,
	name VARCHAR(120) not null
);

create table if not exists ArtistAlbum (
	id SERIAL primary key,
	artist_id INTEGER not null references Artist(id),
	album_id INTEGER not null references Album(id)
);

create table if not exists Song (
	id SERIAL primary key,
	album_id INTEGER not null references Album(id),
	name VARCHAR(80) not null,
	duration_sek INTEGER not null
);

create table if not exists Collection (
	id SERIAL primary key,
	name VARCHAR(80) not null,
	year_of_issue INTEGER not null
);

create table if not exists CollectionSong (
	id SERIAL primary key,
	song_id INTEGER not null references Song(id),
	collection_id INTEGER not null references Collection(id)
);
	