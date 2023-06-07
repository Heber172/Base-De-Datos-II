
create database procesual_h4_dbaii;

use procesual_h4_dbaii;

create table departamento(
    id_dep int auto_increment primary key ,
    nombre varchar(100) not null
);
insert into departamento(nombre) values('La Paz'), ('Oruro'), ('Cochabamba');



create table proyecto(
    id_proy integer auto_increment primary key ,
    nombreProy varchar(100) not null ,
    tipoProy varchar(100) not null
);
insert into proyecto(nombreProy, tipoProy) values('Proyecto 1', 'Investigacion'),
                                                 ('Proyecto 2', 'Educacion');

create table provincia(
    id_prov integer auto_increment primary key ,
    nombre varchar(100) not null,
    id_dep int not null,

    foreign key (id_dep) references departamento(id_dep)
);
insert into provincia(nombre, id_dep) VALUES ('Los Andes', 1),
                                             ('Caracas', 2);

create table persona(
    id_per int auto_increment primary key ,
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
insert into persona(nombre, apellido, fecha_nac, edad, email, genero, id_dep, id_prov) values ('Heber', 'Mollericona', '2003-11-02',19,'heber@gmail.com','M',1,1),
                                                                                              ('Dnner', 'Mamani', '2000-10-15',22,'danner@gmail.com','M',2,2),
                                                                                              ('Ana', 'Lefonzo', '2003-02-20',20,'ana@gmail.com','F',1,1);

create table detalle_proyecto(
    id_detalle int auto_increment primary key ,
    id_per integer not null ,
    id_proy int not null,

    foreign key(id_per) references persona(id_per),
    foreign key (id_proy) references proyecto(id_proy)
);
insert into detalle_proyecto(id_per, id_proy) values(1,1),
                                                    (2,2),
                                                    (3,2);

create function fibonacci(limite integer)
returns text
begin
    declare resp text default '';
    declare numero integer default 1;
    declare numeroFibo integer default 0;
    declare cont integer default 0;

    while(cont < limite) do
        set resp = concat(resp, numeroFibo, ' ,');

        set numero = numero +  numeroFibo;
        set numeroFibo = numero - numeroFibo;

        set cont = cont+1;

    end while;
        return resp;

end;

select fibonacci(10);

create or replace function sumar_fibonacci(limite integer)
returns integer
begin
    declare cadena text default  fibonacci(limite);
    declare suma integer default 0;
    declare pos_coma integer;

    while char_length(cadena) > 0 do

        set pos_coma = locate(',' , cadena);

        if pos_coma = 0 then
            set suma = suma + cast(cadena as integer);
            set cadena = '';
        else
            set suma = suma + cast(substring(cadena, 1, pos_coma - 1) as integer);
            set cadena = substring(cadena, pos_coma + 2);
        end if;
    end while;

    return suma;
end;


select sumar_fibonacci(12);

#'0, 1, 1, 2, 3, 5, 8, 13, 21, 34, '

select substring('heber',1,2);

create view per_proyecto_2000 as
select concat(per.nombre, ' ', per.apellido) as Nombre, per.edad, per.fecha_nac,proy.nombreProy
    from persona as per
inner join detalle_proyecto as detPed on per.id_per = detPed.id_per
inner join proyecto as proy on proy.id_proy = detPed.id_proy
inner join departamento as dep on dep.id_dep = per.id_dep
where per.fecha_nac = '2000-10-15' and dep.nombre = 'Oruro';


select * from proyecto;


alter table proyecto add column estado varchar(100);

create trigger tr_estado_proyecto
    before  insert
    on proyecto
    for each row
    begin

        if new.tipoProy = 'Educacion' or new.tipoProy = 'FORESTACION' or new.tipoProy = 'CULTURA' then
            set new.estado = 'ACTIVO';
        ELSE
            set new.estado = 'INACTIVO';
        end if;

    end;

insert into proyecto(nombreProy, tipoProy) VALUES ('Proyecto 4', 'FORESTACION');

create trigger tr_estado_proyecto_update
    before update
    on proyecto
    for each row
    begin
         if new.tipoProy = 'Educacion' or new.tipoProy = 'FORESTACION' or new.tipoProy = 'CULTURA' then
            set new.estado = 'ACTIVO';
        ELSE
            set new.estado = 'INACTIVO';
        end if;
    end;

create trigger tr_calulaEdad
    before insert
    on persona
    for each row
    begin
        set new.edad = timestampdiff(year, new.fecha_nac, curdate());
    end;

insert into persona(nombre, apellido, fecha_nac, email, genero, id_dep, id_prov) values('Camila', 'Chura', '2004-10-12','camila@gmail.com','F',1,1);

select *
from persona;

create table copiaPersona(
     nombre varchar(100) not null,
    apellido varchar(100) not null,
    fecha_nac date not null,
    edad int not null,
    email varchar(100) not null,
    genero char not null,
    id_dep int not null,
    id_prov int not null
);

create trigger tr_copiaPersona
    before insert
    on persona
    for each row
    begin
        insert into copiaPersona(nombre, apellido, fecha_nac, edad, email, genero, id_dep, id_prov) select new.nombre, new.apellido, new.fecha_nac, new.edad, new.email, new.genero, new.id_dep, new.id_prov;
    end;


insert into persona(nombre, apellido, fecha_nac, email, genero, id_dep, id_prov) values('Daniel', 'Mamani', '1999-01-25','daniel@gmail.com', 'M', 2,2);

select * from copiaPersona;


create view manejo_de_proyectos as
select concat(per.nombre, ' ', per.apellido) as NombresApellido, per.edad as Edad, dep.nombre as Departamento, provi.nombre as Provincia, proy.nombreProy as Proyecto, proy.tipoProy AS TipoProyecto
    from persona as per
inner join provincia as provi on per.id_prov = provi.id_prov
inner join departamento as dep on per.id_dep = dep.id_dep
inner join detalle_proyecto as deta on deta.id_per = per.id_per
inner join proyecto as proy on proy.id_proy = deta.id_proy

where year(per.fecha_nac)= 2003 and dep.nombre = 'La Paz';


select *
from manejo_de_proyectos;