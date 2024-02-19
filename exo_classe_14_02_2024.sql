
USE library2;


DROP TABLE IF EXISTS jobs ;
CREATE TABLE IF NOT EXISTS jobs (
job_id tinyint NOT NULL PRIMARY KEY,
job_desc VARCHAR(100) UNIQUE NOT NULL,
min_lvl ENUM('STAGIAIRE','JUNIOR','INTERMEDIAIRE','SEINIOR'),
max_lvl ENUM('STAGIAIRE','JUNIOR','INTERMEDIAIRE','SEINIOR')
);

CREATE TABLE IF NOT EXISTS publishers (
pub_id tinyint NOT NULL PRIMARY KEY,
pub_name VARCHAR(100) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR(30) NULL,
country VARCHAR(30) NOT NULL,
email VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS employees (
emp_id tinyint NOT NULL PRIMARY KEY,
fname VARCHAR(100) NOT NULL,
lname VARCHAR(100) NOT NULL,
job_id INT(15) REFERENCES jobs (job_id),
job_lvl ENUM('STAGIAIRE','JUNIOR','INTERMEDIAIRE','SEINIOR')NOT NULL,
pub_id INT(11) REFERENCES publishers (pub_id),
hire_date VARCHAR(10) NOT NULL,
salary INT(5) NULL,
email VARCHAR(50) UNIQUE CHECK (email LIKE '%@%')
);

CREATE TABLE IF NOT EXISTS authors (
au_id tinyint NOT NULL PRIMARY KEY,
au_fname VARCHAR(100) NOT NULL,
au_lname VARCHAR(100) NOT NULL,
phone VARCHAR (20) NOT NULL,
address VARCHAR(50) NOT NULL,
city VARCHAR(30) REFERENCES employees (city),
state VARCHAR(30) REFERENCES employees (state),
country VARCHAR(50),
zip VARCHAR(15) NULL,
contact VARCHAR(30) NOT NULL,
email VARCHAR(50) UNIQUE CHECK (email LIKE '%@%')
);

CREATE TABLE IF NOT EXISTS sales (
stor_id tinyint NOT NULL,
ord_num INT(15) NOT NULL PRIMARY KEY,
title_id INT(15) NOT NULL,
ord_date VARCHAR(10) NOT NULL,
qty VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS stores (
stor_id tinyint PRIMARY KEY REFERENCES sales(stor_id),
stor_name VARCHAR(15) NOT NULL,
stor_address VARCHAR(20) NOT NULL,
city VARCHAR(15) NOT NULL,
state VARCHAR(15) NULL,
country VARCHAR(15) NULL
);

CREATE TABLE IF NOT EXISTS redactions (
au_id tinyint REFERENCES authors (au_id),
title_id tinyint REFERENCES titles (title_id),
au_ord tinyint,
royalty FLOAT
);

CREATE TABLE IF NOT EXISTS titles (
title_id tinyint PRIMARY KEY,
title VARCHAR(100),
tipe ENUM('ROMAN', 'POLITIQUE', 'SCIENCE', 'HISTOIRE'),
pub_id SMALLINT REFERENCES publishers,
price FLOAT,
advance FLOAT,
notes VARCHAR(50),
pub_date DATE
);
