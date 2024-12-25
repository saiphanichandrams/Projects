-- Database: shanmuk

-- DROP DATABASE IF EXISTS shanmuk;

create table Catalog(
Catalog_id int not null primary key,
CName varchar(30),
Llocation varchar(20)-- is location of material within library
);

create table Genre(
Genre_id int not null primary key,
GName varchar(30),-- Genre of the material
Description varchar(200)
);

create table Author(
Author_id int not null primary key,
AName varchar(20),--AName= Name of the author
Birthdate date,
Nationality varchar(20)
);

create table Member(
Member_id int not null primary key,
MName varchar(20), -- name of the member
MContact_info varchar(30), -- email address
Join_date date
);

create table Staff(
Staff_id int not null primary key,
SName varchar(20),-- staff name
SContact_info varchar(30),
Job_title varchar(50),
Hire_date date
);

create  table Material(
Material_id int not null primary key,
Title varchar(60),
Publication_date date,
Catalog_id int,
Genre_id int,
foreign key(Catalog_id) references Catalog(Catalog_id),
foreign key(Genre_id) references Genre(Genre_id)
);

create table Borrow(
Borrow_id int not null primary key,
BMaterial_id int,
BMember_id int,
Bstaff_id int,
Borrow_date date,
Due_date date,
Return_date date,
foreign key(BMaterial_id) references Material(Material_id),
foreign key(Bmember_id) references Member(Member_id),
foreign key (Bstaff_id) references Staff(Staff_id)
);

create table Authorship(
Authorship_id int not null primary key,
AAuthor_id int,
AMaterial_id int,
foreign key(AAuthor_id) references Author(Author_id),
foreign key(AMaterial_id) references Material(Material_id)
);



insert into Catalog(Catalog_ID, CName, Llocation)
values (1,'Books','A1.1'),
(2,'Magazines','B2.1'),
(3,'E-Books','C3.1'),
(4,'Audiobooks','D4.1'),
(5,'Journals','E5.1'),
(6,'Newspaper','F6.1'),
(7,'Maps','G7.1'),
(8,'Novels','H8.1'),
(9,'SheetMusic','I9.1'),
(10,'Educational','J10.1');



insert into Genre(Genre_id,GName,Description)
values (1,'General Fiction','Literary works with a focus on character and plot development, exploring various themes and human experiences.'),
(2,'Mystery & Thriller','Suspenseful stories centered around crime, investigation, or espionage with an emphasis on tension and excitement.'),
(3,'Science Fiction & Fantasy','Imaginative works that explore alternate realities, futuristic concepts, and magical or supernatural elements.'),
(4,'Horror & Suspense','Stories designed to evoke fear, unease, or dread, often featuring supernatural or psychological elements.'),
(5,'Dystopian & Apocalyptic','Depictions of societies in decline or collapse, often exploring themes of political and social oppression or environmental disaster.'),
(6,'Classics','Enduring works of literature that have stood the test of time, often featuring rich language and complex themes.'),
(7,'Historical Fiction','Fictional stories set in the past, often based on real historical events or figures, and exploring the customs and experiences of that time.'),
(8,'Epic Poetry & Mythology','Ancient or traditional stories and poems, often featuring heroes, gods, and mythical creatures, and exploring cultural values and beliefs');



insert into Author (Author_id,AName,Birthdate,Nationality)
values(1,'Jane Austen','1775-12-16','British'),
(2,'Ernest Hemingway','1899-07-21','American'),
(3,'George Orwell','1903-06-25','British'),
(4,'Scott Fitzgerald','1896-09-24','American'),
(5,'J.K. Rowling','1965-07-31','British'),
(6,'Mark Twain','1835-11-30','American'),
(7,'Leo Tolstoy','1828-09-09','Russian'),
(8,'Virginia Woolf','1882-01-25','British'),
(9,'Gabriel Márquez','1927-03-06','Colombian'),
(10,'Charles Dickens','1812-02-07','British'),
(11,'Harper Lee','1926-04-28','American'),
(12,'Oscar Wilde','1854-10-16','Irish'),
(13,'William Shakespeare','1564-04-26','British'),
(14,'Franz Kafka','1883-07-03','Czech'),
(15,'James Joyce','1882-02-02','Irish'),
(16,'J.R.R. Tolkien','1892-01-03','British'),
(17,'Emily Brontë','1818-07-30','British'),
(18,'Toni Morrison','1931-02-18','American'),
(19,'Fyodor Dostoevsky','1821-11-11','Russian'),
(20,'Lucas Piki','1847-10-16','British');



insert into Member(Member_id,MName,MContact_info,Join_Date)
values (1,'Alice Johnson','alice.johnson@email.com','2018-01-10'),
(2,'Bob Smith','bob.smith@email.com','2018-03-15'),
(3,'Carol Brown','carol.brown@email.com','2018-06-20'),
(4,'David Williams','david.williams@email.com', '2018-09-18'),
(5,'Emily Miller','emily.miller@email.com','2019-02-12'),
(6,'Frank Davis','frank.davis@email.com','2019-05-25'),
(7,'Grace Wilson','grace.wilson@email.com','2019-08-15'),
(8,'Harry Garcia','harry.garcia@email.com','2019-11-27'),
(9,'Isla Thomas','isla.thomas@email.com','2020-03-04'),
(10,'Jack Martinez','jack.martinez@email.com','2020-07-01'),
(11,'Kate Anderson','kate.anderson@email.com','2020-09-30'),
(12,'Luke Jackson','luke.jackson@email.com','2021-01-18'),
(13,'Mia White','mia.white@email.com','2021-04-27'),
(14,'Noah Harris','noah.harris@email.com','2021-07-13'),
(15,'Olivia Clark','olivia.clark@email.com','2021-10-05'),
(16,'Peter Lewis','peter.lewis@email.com','2021-12-01'),
(17,'Quinn Hall','quinn.hall@email.com','2022-02-28'),
(18,'Rachel Young','rachel.young@email.com','2022-06-17'),
(19,'Sam Walker','sam.walker@email.com','2022-09-25'),
(20,'Tiffany Allen','tiffany.allen@email.com','2022-12-10');




insert into Staff(Staff_id,SName,SContact_info,Job_title,Hire_date)
values(1,'Amy Green','amy.green@email.com','Librarian','2017-06-01'),
(2,'Brian Taylor','brian.taylor@email.com','Library Assistant','2018-11-15'),
(3,'Christine King','chris.king@email.com','Library Assistant','2019-05-20'),
(4,'Daniel Wright','dan.wright@email.com','Library Technician','2020-02-01');



alter table Material
alter column Title type varchar(100);
insert into Material(Material_id,Title,Publication_date,Catalog_id,Genre_iD)
values(1,'The Catcher in the Rye','1951-07-16',1,1),
(2,'To Kill a Mockingbird','1960-07-11',2,1),
(3,'The Da Vinci Code','2003-04-01',3,2),
(4,'The Hobbit','1937-09-21',4,3),
(5,'The Shining','1977-01-28',5,4),
(6,'Pride and Prejudice','1813-01-28',1,1),
(7,'The Great Gatsby','1925-04-10',2,1),
(8,'Moby Dick','1851-10-18',3,1),
(9,'Crime and Punishment','1866-01-01',4,1),
(10,'The Hitchhikers Guide to the Galaxy','1979-10-12',5,3),
(11,'1984','1949-06-08',1,5),
(12,'Animal Farm','1945-08-17',2,5),
(13,'The Haunting of Hill House','1959-10-17',3,4),
(14,'Brave New World','1932-08-01',4,5),
(15,'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe','1950-10-16',5,3),
(16,'The Adventures of Huckleberry Finn','1884-12-10',6,1),
(17,'The Catch-22','1961-10-11',7,1),
(18,'The Picture of Dorian Gray','1890-07-01',8,1),
(19,'The Call of Cthulhu','1928-02-01',9,4),
(20,'Harry Potter and the Philosophers Stone','1997-06-26',10,3),
(21,'Frankenstein','1818-01-01',6,4),
(22,'A Tale of Two Cities','1859-04-30',7,1),
(23,'The Iliad','1750-01-01',8,6),
(24,'The Odyssey','1725-01-01',9,6),
(25,'The Brothers Karamazov','1880-01-01',10,1),
(26,'The Divine Comedy','1320-01-01',6,6),
(27,'The Grapes of Wrath','1939-04-14',7,1),
(28,'The Old Man and the Sea','1952-09-01',8,1),
(29,'The Count of Monte Cristo','1844-01-01',9,1),
(30,'A Midsummer Nights Dream','1596-01-01',10,7),
(31,'The Tricky Book','1888-01-01',10,7);




insert into Borrow(Borrow_id,BMaterial_id,BMember_id,BStaff_id,Borrow_date,Due_date,Return_date)
values(1,1,1,1,'2018-09-12','2018-10-03','2018-09-30'),
(2,2,2,1,'2018-10-15','2018-11-05','2018-10-29'),
(3,3,3,1,'2018-12-20','2019-01-10','2019-01-08'),
(4,4,4,1,'2019-03-11','2019-04-01','2019-03-27'),
(5,5,5,1,'2019-04-20','2019-05-11','2019-05-05'),
(6,6,6,1,'2019-07-05','2019-07-26','2019-07-21'),
(7,7,7,1,'2019-09-10','2019-10-01','2019-09-25'),
(8,8,8,1,'2019-11-08','2019-11-29','2019-11-20'),
(9,9,9,1,'2020-01-15','2020-02-05','2020-02-03'),
(10,10,10,1,'2020-03-12','2020-04-02','2020-03-28'),
(11,1,11,2,'2020-05-14','2020-06-04','2020-05-28'),
(12,2,12,2,'2020-07-21','2020-08-11','2020-08-02'),
(13,3,13,2,'2020-09-25','2020-10-16','2020-10-15'),
(14,4,1,2,'2020-11-08','2020-11-29','2020-11-24'),
(15,5,2,2,'2021-01-03','2021-01-24','2021-01-19'),
(16,6,3,2,'2021-02-18','2021-03-11','2021-03-12'),
(17,17,4,2,'2021-04-27','2021-05-18','2021-05-20'),
(18,18,5,2,'2021-06-13','2021-07-04','2021-06-28'),
(19,19,6,2,'2021-08-15','2021-09-05','2021-09-03'),
(20,20,7,2,'2021-10-21','2021-11-11',NULL),
(21,21,1,3,'2021-11-29','2021-12-20',NULL),
(22,22,2,3,'2022-01-10','2022-01-31','2022-01-25'),
(23,23,3,3,'2022-02-07','2022-02-28','2022-02-23'),
(24,24,4,3,'2022-03-11','2022-04-01','2022-03-28'),
(25,25,5,3,'2022-04-28','2022-05-19','2022-05-18'),
(26,26,6,3,'2022-06-22','2022-07-13','2022-07-08'),
(27,27,7,3,'2022-08-04','2022-08-25','2022-08-23'),
(28,28,8,3,'2022-09-13','2022-10-04','2022-09-28'),
(29,29,9,3,'2022-10-16','2022-11-06','2022-11-05'),
(30,30,8,3,'2022-11-21','2022-12-12','2022-12-05'),
(31,1,9,4,'2022-12-28','2023-01-18',NULL),
(32,2,1,4,'2023-01-23','2023-02-13',NULL),
(33,3,10,4,'2023-02-02','2023-02-23','2023-02-17'),
(34,4,11,4,'2023-03-01','2023-03-22',NULL),
(35,5,12,4,'2023-03-10','2023-03-31',NULL),
(36,6,13,4,'2023-03-15','2023-04-05',NULL),
(37,7,17,4,'2023-03-25','2023-04-15',NULL),
(38,8,8,4,'2023-03-30','2023-04-20',NULL),
(39,9,9,4,'2023-03-26','2023-04-16',NULL),
(40,10,20,4,'2023-03-28','2023-04-18',NULL);




insert into Authorship(Authorship_id,AAuthor_id,AMaterial_id)
values (1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20),
(21,1,21),
(22,2,22),
(23,3,22),
(24,3,23),
(25,4,24),
(26,5,25),
(27,6,26),
(28,7,27),
(29,8,28),
(30,19,28),
(31,9,29),
(32,10,30),
(33,8,30),
(34,2,29);



select * from Staff
where sname='Christine King';



alter table Staff
add StaffEntry boolean;

select * from Staff;



insert into Staff(Staff_id,SName,SContact_info,Job_title,Hire_date)
values(5,'Shanmukha Rao','shan.rao@gmail.com','Library Technician','2020-03-02');
select * from Staff;



update Staff
set sname='Santhu Vuriti'
where staff_id=5;

select * from Staff
where staff_id=5;


--4.1
SELECT TITLE FROM MATERIAL
WHERE MATERIAL_ID IN(
SELECT BMATERIAL_ID FROM BORROW
WHERE RETURN_DATE is not NULL);


--4.2
SELECT M.TITLE, B.BORROW_DATE, B.DUE_DATE
FROM MATERIAL AS M, BORROW AS B
WHERE M.MATERIAL_ID = B.BMATERIAL_ID AND B.RETURN_DATE IS NULL AND 
B.DUE_DATE < '2023-04-01';

--4.3
SELECT M.TITLE, COUNT(*) AS BORROW_COUNT
FROM MATERIAL AS M
INNER JOIN BORROW AS B ON M.MATERIAL_ID = B.BMATERIAL_ID
GROUP BY M.TITLE
ORDER BY BORROW_COUNT DESC
LIMIT 10;

--4.4
SELECT ANAME,COUNT(M.Material_ID)
FROM Material AS M
JOIN Authorship ON M.Material_ID = Authorship.AMaterial_ID
JOIN Author ON Authorship.AAuthor_ID = Author.Author_ID
WHERE ANAME = 'Lucas Piki'
GROUP BY ANAME;

--4.5
SELECT COUNT(*) 
FROM (
 SELECT AMATERIAL_ID 
 FROM AUTHORSHIP 
 GROUP BY AMATERIAL_ID 
 HAVING COUNT(*) > 1
) AS MULTIPLEAUTHORS;

--4.6
SELECT G.GNAME, COUNT(*) AS BORROW_COUNT
FROM GENRE AS G, MATERIAL AS M
WHERE G.GENRE_ID=M.GENRE_ID
GROUP BY G.GNAME
ORDER BY BORROW_COUNT DESC;

--4.7
SELECT M.TITLE, COUNT(*)
FROM BORROW AS B
INNER JOIN MATERIAL AS M ON M.MATERIAL_ID= B.BMATERIAL_ID
WHERE B.BORROW_DATE BETWEEN '2020-09-01' AND '2020-10-31'
GROUP BY M.TITLE;

--4.8
UPDATE BORROW
SET RETURN_DATE = '2023-04-01'
WHERE BMATERIAL_ID = (SELECT MATERIAL_ID FROM MATERIAL WHERE TITLE = 
'Harry Potter and the Philosophers Stone');
SELECT M.MATERIAL_ID,M.TITLE, B.RETURN_DATE
FROM MATERIAL AS M
JOIN BORROW AS B ON M.MATERIAL_ID=B.BMATERIAL_ID
WHERE M.TITLE='Harry Potter and the Philosophers Stone';

--4.9
DELETE FROM BORROW WHERE BMEMBER_ID = (SELECT MEMBER_ID FROM MEMBER 
WHERE MNAME = 'Emily Miller');
DELETE FROM MEMBER WHERE MNAME = 'Emily Miller';

SELECT * FROM MEMBER
WHERE MNAME= 'Emily Miller';

--4.10
INSERT INTO MATERIAL (MATERIAL_ID,TITLE, PUBLICATION_DATE, CATALOG_ID, 
GENRE_ID)
VALUES (32,'New book', '2020-08-01', (SELECT CATALOG_ID FROM CATALOG WHERE 
CNAME = 'E-Books'), (SELECT GENRE_ID FROM GENRE WHERE GNAME = 'Mystery & Thriller'));

INSERT INTO AUTHORSHIP (AUTHORSHIP_ID,AAUTHOR_ID,AMATERIAL_ID)
VALUES (34,(SELECT AUTHOR_ID FROM AUTHOR WHERE ANAME = 'Lucas Luke'), (SELECT 
MATERIAL_ID FROM MATERIAL WHERE TITLE = 'New book'));
SELECT * FROM GENRE;
DELETE FROM MATERIAL WHERE MATERIAL_ID=32;
DELETE FROM AUTHORSHIP WHERE AUTHORSHIP_ID=34;
--SELECT * FROM AUTHOR;
SELECT * FROM MATERIAL;
SELECT * FROM AUTHORSHIP;
--Since there is no Author Named 'Lucas Luke', It is giving NULL value for the author_id in the Authorship table.


--4.2.1 EXTENDING DATABASE
ALTER TABLE BORROW
ADD OVERDUE INT;
UPDATE BORROW
SET OVERDUE= CURRENT_DATE-DUE_DATE
WHERE RETURN_DATE IS NULL;

SELECT 
M.MATERIAL_ID,B.BORROW_ID,MM.MEMBER_ID,MM.MNAME,MM.MCONTACT_INFO,M.TITLE,B.DUE_DATE,B.OVERDUE
FROM BORROW AS B
JOIN MATERIAL AS M ON M.MATERIAL_ID=B.BMATERIAL_ID
JOIN MEMBER AS MM ON B.BMEMBER_ID=MM.MEMBER_ID
WHERE B.RETURN_DATE IS NULL
ORDER BY OVERDUE DESC;

--4.2.2
ALTER TABLE BORROW 
ADD OVERDUE_OCCURRENCE INT DEFAULT 0
ADD MEMBERSHIP_STATUS VARCHAR(10) DEFAULT 'ACTIVE'
ADD NOTE VARCHAR(70)
CREATE TRIGGER CHECK_OVERDUE_OCCURRENCE
AFTER UPDATE ON RETURN_DATE
FOR EACH ROW
BEGIN
UPDATE BORROW
SET MEMBERSHIP_STATUS='INACTIVE', NOTES='MEMBERSHIP DEACTIVATED DUE TO OVERDUE MATERIALS'
WHERE OVERDUE_OCCURRENCES>=3
END;