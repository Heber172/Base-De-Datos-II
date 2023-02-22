CREATE DATABASE hito_2;
USE hito_2


CREATE TABLE PERSONA(
    NOMBRE VARCHAR(20) NOT NULL,
    APELLIDO VARCHAR(20) NOT NULL,
    EDAD INTEGER NOT NULL,
    CI INTEGER PRIMARY KEY NOT NULL
);

INSERT INTO PERSONA(NOMBRE, APELLIDO, EDAD, CI) VALUES('JUAN', 'QUISPE', 20, 13506589);
INSERT INTO PERSONA(NOMBRE, APELLIDO, EDAD, CI) VALUES('KEVIN', 'MAMANI', 19, 452012);

SELECT*
FROM PERSONA;

DROP DATABASE IF EXISTS HITO22;
#DDL (DROP)

CREATE DATABASE UNIVERSIDAD;

USE UNIVERSIDAD;

CREATE TABLE estudiantes (
    id_est integer auto_increment primary key not null,
    nombres varchar(100)  not null,
    apellidos varchar(100) not null,
    edad integer  not null,
    fono integer not null,
    email varchar(50) not null
);
describe estudiantes; #

insert into estudiantes(nombres, apellidos, edad, fono, email) values('Nombre1', 'Apellido1', 10, 11111, 'user1@gmail.com'),
                                                                     ('Nombre2', 'Apellido2', 20, 11111, 'user2@gmail.com'),
                                                                     ('Nombre3', 'Apellido3', 10, 11111, 'user3@gmail.com');

select *
from estudiantes;

alter table estudiantes add column direccion varchar(200) default 'EL ALTO';