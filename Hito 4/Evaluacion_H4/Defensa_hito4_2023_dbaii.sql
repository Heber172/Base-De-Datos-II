
create database defensa_hito4_2023;

use defensa_hito4_2023;


create table departamento(
    id_dep int  primary key not null ,
    nombre varchar(100) not null
);


create table proyecto(
    id_proy integer  primary key not null ,
    nombreProy varchar(100) not null ,
    tipoProy varchar(100) not null
);

create table provincia(
    id_prov integer  primary key  not null,
    nombre varchar(100) not null,
    id_dep int not null,

    foreign key (id_dep) references departamento(id_dep)
);

create table persona(
    id_per int  primary key not null ,
    nombre varchar(100) not null,
    apellido varchar(100) not null,
    fecha_nac date not null,
    edad int not null,
    email varchar(100) not null,
    genero char not null,
    id_dep int not null,
    id_prov int not null,

    foreign key (id_dep) references departamento(id_dep),
    foreign key (id_prov) references provincia(id_prov)
);

create table detalle_proyecto(
    id_detalle int  primary key not null,
    id_per integer not null ,
    id_proy int not null,

    foreign key(id_per) references persona(id_per),
    foreign key (id_proy) references proyecto(id_proy)
);

INSERT INTO departamento (id_dep, nombre) VALUES
(1,'La Paz'),
(2,'Oruro'),
(3,'Cochabamba ');


INSERT INTO proyecto (id_proy, nombreProy, tipoProy) VALUES
(1, 'Proyecto DBA', 'Desarrollo'),
(2, 'Proyecto EDD', 'Investigación'),
(3, 'Proyecto PROG.', 'Implementación');


INSERT INTO provincia (id_prov, nombre, id_dep) VALUES
(1,'Los Andes', 1),
(2,'CARANGAS', 2),
(3,'CERCADO', 3);


INSERT INTO persona (id_per,nombre, apellido, fecha_nac, edad, email, id_dep, id_prov, genero) VALUES
(1,'Juan', 'Pérez', '2000-01-01', 30, 'juan@gmail.com', 1, 1, 'M'),
(2,'María', 'López', '2005-02-02', 26, 'maria@gmail.com', 2, 2, 'F'),
(3,'Pedro', 'Gómez', '2004-03-03', 36, 'pedro@gmail.com', 3, 3, 'M');


INSERT INTO detalle_proyecto (id_detalle,id_per, id_proy) VALUES
(1,1, 1),
(2,2, 2),
(3,3, 3);

select *from departamento;

create table audit_proyectos(
    id_audi_proy integer auto_increment primary key  not null,
    nombre_proy_anterior varchar(100) not null,
    nombre_proy_posterior varchar(100) not null,
    tipo_proy_anterior varchar(100) not null,
    tipo_proy_posterior varchar(100) not null,
    operation varchar(30) not null,
    userid varchar(30) not null,
    hostname varchar(30) not null,
    fecha date not null

);



create trigger tr_auditotia_proyecto_insert
    before insert
    on proyecto
    for each row
    begin
        insert into audit_proyectos(nombre_proy_anterior, nombre_proy_posterior, tipo_proy_anterior, tipo_proy_posterior, operation, userid, hostname, fecha)
            select 'No existe valor previo - insert', new.nombreProy, 'No existe valor previo - insert', new.tipoProy, 'INSERT',user(), @@hostname, now();
    end;


create trigger tr_auditotia_proyecto_update
    before update
    on proyecto
    for each row
    begin
        insert into audit_proyectos(nombre_proy_anterior, nombre_proy_posterior, tipo_proy_anterior, tipo_proy_posterior, operation, userid, hostname, fecha)
            select old.nombreProy, new.nombreProy, old.tipoProy, new.tipoProy, 'UPDATE',user(), @@hostname, now();
    end;


create trigger tr_auditotia_proyecto_delete
    before delete
    on proyecto
    for each row
    begin
        insert into audit_proyectos(nombre_proy_anterior, nombre_proy_posterior, tipo_proy_anterior, tipo_proy_posterior, operation, userid, hostname, fecha)
            select old.nombreProy , 'No existe valor posterior - DELETE', old.tipoProy, 'No existe valor posterior - DELETE', 'DELETE',user(), @@hostname, now();
    end;


insert into proyecto(id_proy, nombreProy, tipoProy) VALUES (5,'Proyecto Fisica', 'Implementacion');

select * from proyecto;

select * from audit_proyectos;

create view reporte_proyecto as

select concat(per.nombre, ' ', per.apellido) as Fullname, concat(proy.nombreProy, ': ', proy.tipoProy) as Desc_Proyecto, dep.nombre as Departamento,
(case
    when dep.nombre = 'La Paz' then 'LPZ'
    when dep.nombre = 'Cochabamba' then 'CBB'
    when dep.nombre = 'El Alto' then 'EAT'
    end) as codigo_dep


from persona as per
inner join departamento as dep on per.id_dep = dep.id_dep
inner join detalle_proyecto as deta on deta.id_per = per.id_per
inner join proyecto as proy on proy.id_proy = deta.id_proy;


select *
from departamento;

select *
from reporte_proyecto;



create or replace trigger tr_validacion
    before insert
    on proyecto
    for each row
    begin
        declare dia_semana text default dayname(current_date);
        declare mes text default monthname(current_date);


        if new.tipoProy = 'Forestacion' and dia_semana = 'Wednesday' and mes = 'June' then
            signal sqlstate  '45000' set message_text = 'No se admite inserciones del tipo FORESTACION';
        end if;

    end;

insert into proyecto(id_proy, nombreProy, tipoProy) values (6, 'Proyecto 3', 'Forestacion');

insert into proyecto(id_proy, nombreProy, tipoProy) values (10, 'Proyecto 3', 'Educacion');

select * from proyecto;

select monthname(current_date);

create or replace function diccionario_dia_semana(dia varchar(15))
returns text
begin
    declare resp text default '';
    case dia
        when 'Monday' then set resp = 'Lunes';
        when 'Tuesday' then set resp = 'Martes';
        when 'Wednesday' then set resp = 'Miercoles';
        when 'Thursday' then set resp = 'Jueves';
        when 'Friday' then set resp = 'Viernes';
        when 'Saturday' then set resp = 'Sabado';
        when 'Sunday' then set resp = 'Domingo';

        else
        set resp = 'No es un dia';
    end case;

    return resp;
end;

select diccionario_dia_semana('June') as Dia;
