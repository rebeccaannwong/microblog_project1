DROP TABLE if exists users CASCADE;
DROP TABLE if exists posts CASCADE;
DROP TABLE if exists tags CASCADE;
DROP TABLE if exists posts_tags CASCADE;

CREATE TABLE users(
	id serial primary key,
	name varchar(255) not null,
	avatar text,
	date_joined varchar(255),
	location varchar(255),
	bio varchar(1000),
	created_at TIMESTAMP
	);

CREATE TABLE posts(
	id serial primary key,
	title varchar(255) not null,
	content text,
	user_id integer references users,
	created_at TIMESTAMP
	);

CREATE TABLE tags(
	id serial primary key,
	name varchar (255) not null,
	created_at TIMESTAMP
	);

CREATE TABLE posts_tags(
	post_id integer references posts,
	tag_id integer references tags,
	created_at TIMESTAMP
	);