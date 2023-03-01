SHOW DATABASES ;

Create database hito_2;

create database ejemplos;

drop database ejemplos;

use hito_2;

create table estudiante (
 id int primary key not null,
nombre varchar(23) not null,
apellido varchar(23)not null );

 select*from estudiante;

drop database if exists hito_2;

drop table if exists  estudiante;

# imsert delete update = dml
#
#
create database universidad;

use universidad;
create table estudiantes
(
    id_est INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    nombres VARCHAR(100) NOT NULL ,
    apellidos VARCHAR(100) NOT NULL ,
    edad INTEGER NOT NULL ,
    fono INTEGER NOT NULL ,
    email VARCHAR(50) NOT NULL
);
DESCRIBE  estudiantes;

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email)
VALUES ('nombre1','apellido1',10,11111,'user1gmail.com'),
('nombre2','apellido2',20,11111,'user2gmail.com'),
('nombre3','apellido3',10,11111,'user2gmail.com');

alter table estudiantes
    add column direccion varchar(200) default 'El Alto';

alter table estudiantes
drop column direccion;

drop table estudiantes;


select *
from estudiantes;

describe estudiantes;



#agreegar nuevas columnas
alter table estudiantes
add column fax varchar(10),
    add column  genero varchar(10);


#elimina una columna de una tabla
alter table estudiantes
drop column fax;



#MOSTRAR ESTUDIANTES CON EL NOMBRE3
select *
from estudiantes as est
where est.nombres = 'nombre3';



#mostrar nombre, apellido, edad donde la edad sea mayor a 18
select est.nombres, est.apellidos, est.edad
from estudiantes as est
where est.edad > 18;

#id par
select *
from estudiantes as est
where est.id_est mod 2 = 0;



create table estudiantes
(
    id_est INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    nombres VARCHAR(100) NOT NULL ,
    apellidos VARCHAR(100) NOT NULL ,
    edad INTEGER NOT NULL ,
    fono INTEGER NOT NULL ,
    email VARCHAR(100) NOT NULL
);

create table materias(
     id_mat INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL ,
     nombre_mat varchar(100) not null,
     cod_mat varchar(100) not null
);


create table inscripcion(
  id_ins INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_est INTEGER not null,
   id_mat INTEGER not null,
  foreign key(id_est) references estudiantes(id_est),
   foreign key(id_mat) references materias(id_mat)
);


select *
from estudiantes as est
where est.id_est mod 2 = 0;