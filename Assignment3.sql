CREATE DATABASE Hogwarts ;

USE Hogwarts ;

CREATE TABLE House(
house_id INTEGER NOT NULL,
house_name VARCHAR(10),
head_of_house VARCHAR(50),
house_points INTEGER NOT NULL,
CONSTRAINT pk_house PRIMARY KEY (house_id)) ;

CREATE TABLE Staff(
last_name VARCHAR(50),
first_name VARCHAR(50),
job_title VARCHAR(50),
house_id INTEGER NOT NULL,
CONSTRAINT pk_staff PRIMARY KEY (last_name, first_name),
FOREIGN KEY (house_id) REFERENCES House(house_id)) ;

CREATE TABLE Gryffindor(
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
house_id INTEGER DEFAULT 1 NOT NULL,
CONSTRAINT pk_gpupil PRIMARY KEY (last_name, first_name),
FOREIGN KEY (house_id) REFERENCES House(house_id)) ;

CREATE TABLE Hufflepuff(
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
house_id INTEGER DEFAULT 2 NOT NULL,
CONSTRAINT pk_hpupil PRIMARY KEY (last_name, first_name),
FOREIGN KEY (house_id) REFERENCES House(house_id)) ;

CREATE TABLE Ravenclaw(
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
house_id INTEGER DEFAULT 3 NOT NULL,
CONSTRAINT pk_rpupil PRIMARY KEY (last_name, first_name),
FOREIGN KEY (house_id) REFERENCES House(house_id)) ;

CREATE TABLE Slytherin(
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
house_id INTEGER DEFAULT 4 NOT NULL,
CONSTRAINT pk_spupil PRIMARY KEY (last_name, first_name),
FOREIGN KEY (house_id) REFERENCES House(house_id)) ;

CREATE TABLE Quidditch(
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
position VARCHAR(20) NOT NULL,
house_id INTEGER NOT NULL,
CONSTRAINT pk_qpupil PRIMARY KEY (last_name, first_name),
FOREIGN KEY (house_id) REFERENCES House(house_id)) ;

INSERT INTO House
(house_id, house_name, head_of_house, house_points)
VALUES
(1, 'Gryffindor', 'Minerva McGonigal', 325),
(2, 'Hufflepuff', 'Pomona Sprout', 298),
(3, 'Ravenclaw', 'Filius Flitwick', 312),
(4, 'Slytherin', 'Severus Snape', 327) ;

INSERT INTO Staff
(last_name, first_name, job_title, house_id)
VALUES
('Dumbledore', 'Albus', 'Headmaster', 1),
('McGonigal', 'Minerva', 'Deputy Head and Transfiguration', 1),
('Flitwick', 'Filius', 'Charms', 3),
('Sprout', 'Pomona', 'Herbology', 2),
('Snape', 'Severus', 'Potions', 4),
('Binns', 'Cuthbert', 'History of Magic', 2),
('Hagrid', 'Rubeus', 'Caretaker and Care of Magical Creatures', 1),
('Trelawney', 'Sybill', 'Divination', 3) ;

INSERT INTO Gryffindor
(last_name, first_name, date_of_birth)
VALUES
('Potter', 'Harry', '1980-07-31'),
('Grainger', 'Harmione', '1979-09-19'),
('Weasley', 'Ronald', '1980-03-01'),
('Longbottom', 'Neville', '1980-07-30'),
('Finnigan', 'Seamus', '1980-07-14'),
('Thomas', 'Dean', '1980-05-20'),
('Brown', 'Lavender', '1979-10-05'),
('Patil', 'Parvati', '1979-12-20') ;

INSERT INTO Hufflepuff
(last_name, first_name, date_of_birth)
VALUES
('Smith', 'Zacharias', '1979-11-14'),
('Abbott', 'Hannah', '1980-06-06'),
('Bones', 'Susan', '1980-02-28'),
('Jones', 'Megan', '1979-10-15'),
('Finch_Fletchley', 'Justin', '1979-08-08'),
('Hopkins', 'Wayne', '1980-04-19'),
('Mcmillan', 'Ernie', '1979-09-08'),
('Diggory', 'Cedric', '1979-05-24') ;

INSERT INTO Ravenclaw
(last_name, first_name, date_of_birth)
VALUES
('Patel', 'Padma', '1979-12-20'),
('Goldstein', 'Anthony', '1980-04-28'),
('Boot', 'Terry', '1979-09-15'),
('Corner', 'Michael', '1979-10-06'),
('Li', 'Sue', '1980-06-27'),
('MacDougal', 'Morag', '1980-01-22'),
('Turpin', 'Lisa', '1979-08-04'),
('Brocklehurst', 'Mandy', '1980-05-30'),
('Entwhistle', 'Kevin', '1979-08-15'),
('Cornfoot', 'Stephen', '1980-03-16') ;

INSERT INTO Slytherin
(last_name, first_name, date_of_birth)
VALUES
('Malfoy', 'Draco', '1980-06-05'),
('Crabbe', 'Vincent', '1979-12-19'),
('Goyle', 'Gregory', '1979-11-02'),
('Zabini', 'Blaise', '1979-11-01'),
('Parkinson', 'Pansy', '1980-07-10'),
('Greengrass', 'Daphne', '1980-01-30'),
('Nott', 'Theodore', '1980-03-17'),
('Bulstrode', 'Milicent', '1979-10-25'),
('Davis', 'Tracey', '1979-08-13') ;

INSERT INTO Quidditch
(last_name, first_name, position, house_id)
VALUES
('Wood', 'Oliver', 'Keeper', 1),
('Johnson', 'Angelina', 'Chaser', 1),
('Bell', 'Katie', 'Chaser', 1),
('Spinnet', 'Alicia', 'Chaser', 1),
('Weasley', 'Fred', 'Beater', 1),
('Weasley', 'George', 'Beater', 1),
('Potter', 'Harry', 'Seeker', 1),
('Fleet', 'Herbert', 'Keeper', 2),
('Smith', 'Zacharias', 'Chaser', 2),
('Applebee', 'Tasmin', 'Chaser', 2), 
('Preece', 'Malcolm', 'Chaser', 2), 
('Rickett', 'Anthony', 'Beater', 2), 
('McManus', 'Michael', 'Beater', 2), 
('Diggory', 'Cedric', 'Seeker', 2),
('Page', 'Grant', 'Keeper', 3),
('Davies', 'Roger', 'Chaser', 3),
('Stretton', 'Jeremy', 'Chaser', 3), 
('Burrow', 'Randolph', 'Chaser', 3), 
('Inglebee', 'Duncan', 'Beater', 3), 
('Samuels', 'Jason', 'Beater', 3), 
('Chang', 'Cho', 'Seeker', 3),
('Bletchley', 'Miles', 'Keeper', 4),
('Flint', 'Marcus', 'Chaser', 4),
('Montague', 'Graham', 'Chaser', 4), 
('Pucey', 'Adrian', 'Chaser', 4), 
('Derrick', 'Peregrine', 'Beater', 4), 
('Bole', 'Lucian', 'Beater', 4), 
('Malfoy', 'Draco', 'Seeker', 4) ;

SELECT * FROM House ;
SELECT * FROM Staff ;
SELECT * FROM Gryffindor ;
SELECT * FROM Hufflepuff ;
SELECT * FROM Ravenclaw ;
SELECT * FROM Slytherin ;
SELECT * FROM Quidditch ;

USE Hogwarts ;

DELIMITER //
CREATE PROCEDURE InsertStudent (
 	IN last_name VARCHAR(50),
    IN first_name VARCHAR(50),
    IN date_of_birth DATE)
BEGIN

INSERT INTO Gryffindor(last_name, first_name, date_of_birth)
VALUES(last_name, first_name, date_of_birth) ;
END // DELIMITER ;

CALL InsertStudent('Creevey', 'Colin', '1980-06-30') ;

SELECT * FROM Gryffindor ;

SELECT 
	g.first_name FirstName, 
    g.last_name LastName,
    h.head_of_house HeadofHouse
FROM Gryffindor g
INNER JOIN
	House h
ON 
g.house_id = h.house_id
ORDER BY g.first_name ;

SELECT 
	s.first_name FirstName, 
    s.last_name LastName, 
    h.house_name House
FROM Staff s
JOIN 
	House h
ON 
s.house_id = h.house_id 
ORDER BY s.first_name ;

SELECT MIN(house_points) AS FourthPlace FROM House ;

SELECT 
 	house_name House, 
	house_points Points 
FROM House
WHERE 
house_points = (SELECT MAX(house_points) FROM House) ;

START TRANSACTION ;

SELECT house_points
FROM House ;

UPDATE House
SET 
house_points = house_points + 15 
WHERE 
house_name = 'Gryffindor' ;

UPDATE House
SET 
house_points = house_points - 5 
WHERE 
house_name = 'Ravenclaw' ;

SELECT house_name Name, house_points Points 
FROM House 
ORDER BY house_points DESC ; 

COMMIT ;

DElETE FROM Ravenclaw
WHERE
last_name = 'Goldstein' ;

SELECT * from Ravenclaw
ORDER BY date_of_birth ;

SELECT
	CONCAT(first_name, ' ', last_name) AS ravenclaw_chaser
FROM Quidditch
WHERE 
house_id = 3 AND position = 'chaser'
ORDER BY first_name ;

SELECT * FROM Quidditch
ORDER BY position DESC ;

SELECT DISTINCT s.first_name, s.last_name, q.house_id
FROM Quidditch q
INNER JOIN Slytherin s ON q.house_id = s.house_id
ORDER BY s.last_name ;
