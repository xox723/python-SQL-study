CREATE TABLE IF NOT EXISTS student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20) 
);
DROP TABLE student;

CREATE TABLE IF NOT EXISTS artists( /*創建 artists 這個 table /IF NOT EXISTS這個語法不重複創建*/
ArtistId SERIAL PRIMARY KEY, /*SERIAL PRIMARY KEY 連續創建專屬的KEY ID*/
	Name VARCHAR /*VARCHAR字元需求,VARCHAR(80)給他80個字元*/
);

DROP TABLE artists; /* 刪除artists 這個TABLE */

SELECT *FROM artists; /* 顯示artists 這個table*/

CREATE TABLE IF NOT EXISTS  city(
id  SERIAL,
name VARCHAR(50),
Population INT,
PRIMARY KEY(id)
);

DROP TABLE city;
SELECT *FROM city;


CREATE TABLE IF NOT EXISTS invoices(
id SERIAL PRIMARY KEY,
customerId INT,
date DATE,
address VARCHAR(100),
city VARCHAR(40),
state VARCHAR(20),
country VARCHAR(20),
postalcode VARCHAR(20),
total REAL
);

DROP TABLE invoices;
SELECT *FROM invoices;
