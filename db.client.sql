DROP DATABASE IF EXISTS db_puntos;
CREATE DATABASE db_puntos;
USE db_puntos;
USE master;


-- RESTRICCIONES EN STATUS ( A - I ) Y TYPE_DOCUMENT EN LA CUAL SOLO SELECCIONE DNI CNE
-- RESTRICCIONES EN cellphone 
USE db_puntos;
CREATE TABLE customer(
    id INT IDENTITY(1,1) PRIMARY KEY,
	names VARCHAR(60),
	lastname VARCHAR(90),
	cellphone CHAR(9),
	email VARCHAR(80),
    type_document CHAR(3),
    number_document CHAR(9),
    status CHAR(1) DEFAULT 'A' CHECK (status IN ('A', 'I')),
	CONSTRAINT CHK_TypeDocument CHECK (type_document IN ('CNE', 'DNI')),
);

INSERT INTO customer (names, lastname, cellphone, email, type_document, number_document, status)
VALUES ('John', 'Doe', '123456789', 'john@example.com', 'DNI', '123456789', 'A');

INSERT INTO customer (names, lastname, cellphone, email, type_document, number_document, status)
VALUES ('Jane', 'Smith', '987654321', 'jane@example.com', 'CNE', '987654321', 'A');


SELECT*FROM customer;

