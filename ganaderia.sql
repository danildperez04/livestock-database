CREATE DATABASE IF NOT EXISTS ganaderia;
USE ganaderia;
-- Crear tabla
CREATE TABLE user(
    id_user INT(12) NOT NULL AUTO_INCREMENT,
    username VARCHAR(16) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    fullname VARCHAR(100) NOT NULL,
    password VARCHAR(60) NOT NULL,
    birth_date DATE NOT NULL,
    PRIMARY KEY (id_user)
);
CREATE TABLE breed(
    id_breed INT(12) NOT NULL AUTO_INCREMENT,
    breed_name VARCHAR(16) NOT NULL,
    PRIMARY KEY (id_breed)
);
CREATE TABLE cow(
    id_cow INT(12) NOT NULL AUTO_INCREMENT,
    id_breed INT(12),
    cow_desc TEXT,
    alive BOOLEAN,
    gender VARCHAR(10) DEFAULT 'Macho',
    CHECK (
        gender = 'Macho'
        OR gender = 'Hembra'
    ),
    PRIMARY KEY (id_cow),
    FOREIGN KEY (id_breed) REFERENCES breed(id_breed)
);
CREATE TABLE vaccine(
    id_vaccine INT(12) NOT NULL AUTO_INCREMENT,
    vaccine_name VARCHAR(16) NOT NULL,
    vaccine_desc TEXT,
    PRIMARY KEY (id_vaccine)
);
CREATE TABLE cow - vaccine(
    -- tipo de medicamento 
    -- crear tabla inventario
    id_cow INT(12) NOT NULL,
    id_vaccine INT(12) NOT NULL,
    vaccine_date DATE NOT NULL,
    grams DOUBLE(4, 4) NOT NULL,
    FOREIGN KEY (id_cow) REFERENCES cow(id_cow),
    FOREIGN KEY (id_vaccine) REFERENCES vaccine(id_vaccine)
);
CREATE TABLE cow - birth(
    id_cowbirth INT(12) NOT NULL,
    id_cow INT(12) NOT NULL,
    id_father INT(12) NOT NULL,
    id_mother INT(12) NOT NULL,
    birth_date DATE NOT NULL,
    weight DOUBLE(4, 4) NOT NULL,
    PRIMARY KEY (id_cowbirth),
    FOREIGN KEY (id_cow) REFERENCES cow(id_cow),
    FOREIGN KEY (id_father) REFERENCES cow(id_cow),
    FOREIGN KEY (id_mother) REFERENCES cow(id_cow)
);
CREATE TABLE inventory(
    id INT(12) NOT NULL,
    amount INT(8) DEFAULT 0,
    PRIMARY KEY (id)
);
/*
!pull request for Dani
CREATE TABLE foreign - cow(
    id_cow_foreign INT(12) NOT NULL AUTO_INCREMENT,
    id_seller INT(12),
    origin VARCHAR(60),
    PRIMARY KEY(id_cow_foreigns),
    FOREIGN KEY (id_seller) REFERENCES seller(id_seller)
);

CREATE TABLE seller(
    id_seller INT(12) NOT NULL AUTO_INCREMENT,
    name_seller VARCHAR(16),
    contact_seller VARCHAR(20),
    PRIMARY KEY (id_seller)
);
*/

