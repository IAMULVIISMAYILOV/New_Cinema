CREATE DATABASE NewCinemaDb

USE NewCinemaDb

CREATE TABLE Movies(
	Id int PRIMARY KEY IDENTITY,
	MoviesName varchar(100) NOT NULL
)

INSERT INTO Movies (MoviesName)
VALUES ('American Pie'),
		('Changeling'),
		('Die Hard'),
		('Secrets of death')


CREATE TABLE Actor(
	Id int PRIMARY KEY IDENTITY,
	ActorFullName nvarchar(100) NOT NULL
)

INSERT INTO Actor (ActorFullName)
VALUES ('John Malkovich'),
		('Bruce Willis'),
		('Dmitri Polonsky'),
		('Jason Bigz')

CREATE TABLE Genre(
	Id int PRIMARY KEY IDENTITY,
	GenreName nvarchar(50) NOT NULL
)



INSERT INTO Genre (GenreName)
VALUES ('Drama'),
		('Comedy'),
		('Thriller'),
		('Scientific')

CREATE TABLE Halls(
	Id int PRIMARY KEY IDENTITY,
	HallsName varchar(50) NOT NULL
)

INSERT INTO Halls (HallsName)
VALUES ('Pluto'),
		('Mars'),
		('Jupiter'),
		('Venera')


CREATE TABLE MoviesSession(
	Id int PRIMARY KEY IDENTITY,
	MoviesSessionTime int NOT NULL
)

INSERT INTO MoviesSession (MoviesSessionTime)
VALUES (12),
		(13),
		(14),
		(15)

CREATE TABLE Customer(
	Id int PRIMARY KEY IDENTITY,
	CustomerFullName nvarchar(100) NOT NULL
)


INSERT INTO Customer (CustomerFullName)
VALUES ('Ali Aliyev'),
		('Faqan Eyvazov'),
		('Rail Jannatov'),
		('Eshqin Kazimov')

CREATE TABLE Ticket(
	Id int PRIMARY KEY IDENTITY,
	Price int,
	HallsId int REFERENCES Halls(Id),
	CustomerId int REFERENCES Customer(Id),
	MoviesSessionId int REFERENCES MoviesSession(Id),
	MoviesId int REFERENCES Movies(Id),
	GenreId int REFERENCES Genre(Id)
)

ALTER TABLE Ticket
ADD GenreId int REFERENCES Genre(Id)

INSERT INTO Ticket (Price)
VALUES (10),
		(12),
		(8),
		(6)


CREATE TABLE MovieActor(
	Id int PRIMARY KEY IDENTITY,
	ActorFullName datetime NOT NULL,
	MoviesId int REFERENCES Movies(Id),
	ActorId int REFERENCES Actor(Id)
)

CREATE TABLE MoviesGenre(
	Id int PRIMARY KEY IDENTITY,
	MoviesId int REFERENCES Movies(Id),
	GenreId int REFERENCES Genre(Id)
)

CREATE VIEW v_Cinema
AS 

SELECT CustomerFullName, MoviesSessionTime, HallsName, MoviesName, GenreName FROM Ticket t
JOIN Movies m ON m.Id = t.Id
JOIN Halls h ON h.Id = t.Id
JOIN Customer c ON c.Id = t.id
JOIN MoviesSession ms ON ms.Id = t.Id
JOIN Genre g ON g.Id = t.Id



