_______________________________________________________________________________________________
-- SCHEMA BEGIN
_______________________________________________________________________________________________

DROP SCHEMA IF EXISTS testdb; -- Equivalent à : DROP SCHEMA [IF EXISTS] testdb;

-- Creation de la DB avec son encoding :
CREATE DATABASE IF NOT EXISTS tesdb 
	CHARACTER SET utf8mb4 
    DEFAULT COLLATE utf8mb4_0900_ai_ci; 

USE testdb;

-- -- Create table tasks:
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT ,
    title VARCHAR(255) NOT NULL,
    start_date DATETIME,
    end_date DATETIME,
    -- status TINYINT NOT NULL,
    -- priority TINYINT NOT NULL,
    description TEXT,
    PRIMARY KEY (task_id)
)  ENGINE=INNODB;


-- Create table employees:
CREATE TABLE employees (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Create table inventory:
CREATE TABLE inventory (
    material_no VARCHAR(18),
    warehouse_no VARCHAR(10),
    quantity DECIMAL(19 , 2 ) NOT NULL DEFAULT 0,
    base_unit VARCHAR(10) NOT NULL,
    PRIMARY KEY (material_no , warehouse_no)
);


-- Create table users:
CREATE TABLE users(
   user_id INT AUTO_INCREMENT PRIMARY KEY, -- la PK est déclaré au début
   username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);

-- Create table roles:
CREATE TABLE roles(
   role_id INT AUTO_INCREMENT,
   role_name VARCHAR(50),
   PRIMARY KEY(role_id) 	-- la PK est déclaré à la fin
);


-- Create tabel user_roles:
CREATE TABLE user_roles(
   user_id INT NOT NULL,
   role_id INT NOT NULL,
   PRIMARY KEY(user_id, role_id), 	-- PK composite
   FOREIGN KEY(user_id) REFERENCES users(user_id),
   FOREIGN KEY(role_id) REFERENCES roles(role_id)
);

-- Create table t1:
CREATE TABLE t1(
   id INT,
   title VARCHAR(255) NOT NULL
);


-- Create table categories:
CREATE TABLE categories(
   cat_id int not null auto_increment primary key,
   cat_name varchar(255) not null,
   cat_description text
) ENGINE=InnoDB;

-- Create table products:
CREATE TABLE products(
   prd_id int not null auto_increment primary key,
   prd_name varchar(355) not null,
   prd_price decimal,
   cat_id int not null,
   FOREIGN KEY fk_cat(cat_id)
   REFERENCES categories(cat_id)
   ON UPDATE CASCADE
   ON DELETE RESTRICT 	-- Rejet de tte suppression
)ENGINE=InnoDB;

-- Create table vendors:
CREATE TABLE vendors(
    vdr_id int not null auto_increment primary key,
    vdr_name varchar(255)
)ENGINE=InnoDB;

-- Another example of unicity:
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(12) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT uc_name_address UNIQUE (name , address)
);


-- Validate data with CHECK command:
-- Create table parts :
CREATE TABLE IF NOT EXISTS parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10 , 2 ) NOT NULL CHECK (cost > 0),
    price DECIMAL(10 , 2 ) NOT NULL CHECK (price > 0),
    CHECK (price >= cost) 	-- prix doit être sup ou égal au coût
);


_______________________________________________________________________________________________
SCHEMA END 
_______________________________________________________________________________________________