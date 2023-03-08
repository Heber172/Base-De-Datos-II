create database hito2;

use hito2;


create table usuarios(
    id_usuario integer auto_increment primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad integer not null,
    email varchar(100) not null
);

insert into usuarios(nombre, apellido, edad, email)  values('nombre1', 'apellido1', 21, 'nombres1@gmail.com'),
                                                           ('nombre2', 'apellido2', 30, 'nombres2@gmail.com'),
                                                           ('nombre3', 'apellido3', 40, 'nombres3@gmail.com');


#crear vistas
CREATE view mayores_a_30 as
    select us.nombre, us.edad
    from usuarios as us
     where us.edad > 30;


select*
from mayores_a_30



#modificar
create view mayores_a_30 as
    select concat(us.nombre, ' ', us.apellido) as FULLNAME, us.edad AS EDAD_USUARIO, us.email AS EMAIL_USUARIO
    from usuarios as us
     where us.edad > 30;



SELECT MA.*
FROM mayores_a_30 AS MA
  where ma.FULLNAME LIKE '%3%';


#eliminar vistas
drop view mayores_a_30;


