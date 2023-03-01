create database EMPRESA;

USE EMPRESA;



CREATE TABLE empresa(
    empresa_id integer auto_increment primary key not null,
    nombre_emp varchar(50) not null,
    NIT integer not null
);
insert into empresa(nombre_emp, NIT) values('UNIFRANZ', 123544), ('PIL', 4569812);


create table empleado(
    empleado_id integer auto_increment primary key not null,
    nombre varchar(50) not null,
    apellidos varchar(60) not null,
    edad integer not null,
    area varchar(100) not null,
    ci integer not null,
    empresa_id integer not null,
    area_id integer not null,

    foreign key (empresa_id) references empresa(empresa_id),
    foreign key (area_id) references area(area_id)
);
insert into empleado( nombre, apellidos, edad, ci,area ,empresa_id, area_id) values('Juan', 'Mamani', 26, 212452 )


create table area(
    area_id integer auto_increment primary key  not null,
    areas varchar(50) not null,
    empresa_id integer not null,

    foreign key (empresa_id) references empresa(empresa_id)
);

INSERT INTO area(areas, empresa_id) values('DOCENTE', 1),
                                          ('SEGURIDAD', 1),
                                          ('telecomunicaciones', 2),
                                          ('eléctrica', 2),
                                          ('LIMPIEZA', 1);




create table horario(
    id_hr integer auto_increment primary key key not null,
    hrs varchar(50) not null
);