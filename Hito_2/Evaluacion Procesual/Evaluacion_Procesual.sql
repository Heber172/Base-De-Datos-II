create database Tienda_de_ventas;

use Tienda_de_ventas;

create table Cliente(
    id_cliente integer auto_increment PRIMARY KEY ,
    fullname varchar(50) not null,
    lastname varchar(50) not null,
    edad integer not null,
    domicilio varchar(100) not null
);

create table Pedido (
    id_pedido integer auto_increment primary key,
    articulo varchar(50) not null,
    costo varchar(50) not null,
    fecha datetime not null
);

create table DEATALLE_pedido(
    id_detalle_pedido integer auto_increment primary key,
     id_cliente integer not null,
     id_pedido integer  not null,

     foreign key (id_cliente) references Cliente(id_cliente),
     foreign key (id_pedido) references Pedido(id_pedido)
);

INSERT INTO Cliente ( fullname, lastname, edad, domicilio)
VALUES ( 'Juan Perez', 'Perez', 25, 'Calle 123, Ciudad'),
       ( 'Maria Lopez', 'Lopez', 30, 'Avenida 456, Ciudad'),
       ( 'Pedro Ramirez', 'Ramirez', 40, 'Calle 789, Ciudad'),
       ( 'Ana Garcia', 'Garcia', 20, 'Avenida 012, Ciudad');

-- Agregar datos a la tabla Pedido
INSERT INTO Pedido ( articulo, costo, fecha)
VALUES ( 'Libro', 150.00, '2022-03-25'),
       ( 'Computadora', 1200.00, '2022-03-26'),
       ( 'Celular', 800.00, '2022-03-27'),
       ( 'Tablet', 500.00, '2022-03-28');

-- Agregar datos a la tabla Registro
INSERT INTO DEATALLE_pedido ( id_cliente, id_pedido)
VALUES ( 1, 2),
       ( 2, 4),
       ( 3, 1),
       ( 4, 3);


select c.fullname, ped.articulo, ped.costo
    from pedido as ped
inner join DEATALLE_pedido r on ped.id_pedido = r.id_pedido
inner join cliente c on r.id_cliente = c.id_cliente
where ped.costo between 100 and 600;



select*
from cliente;
select *
from pedido;
################################################################3

CREATE DATABASE tareaHito2;

USE tareaHito2;


create table estudiantes(
    id_est integer auto_increment primary key not null,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    edad integer  not null,

    gestion integer  not null,
    fono integer not null,
    email varchar(100) not null,
    direccion varchar(100) not null,
    sexo varchar(10) not null
);

create table materias(
    id_mat integer auto_increment primary key  not null,
    nombre_mat varchar(100) not null,
    cod_mat varchar(100) not null
);

create table inscripcion(
    id_ins integer auto_increment primary key  not null,
    semestre varchar(20) not null,
    gestion integer  not null,
    id_est integer not null,
    id_mat integer  not null,

    foreign key (id_mat) references materias (id_mat),
    foreign key (id_est) references estudiantes(id_est)

);



INSERT INTO estudiantes (nombres, apellidos,gestion, edad, fono, email,direccion, sexo) VALUES ('Miguel', 'Gonzales Veliz',2022 ,20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino'),
                                                                                        ('Sandra', 'Mavir Uria', 2022,25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino'),
                                                                                        ('Joel', 'Adubiri Mondar', 2022,30, 2832117, 'joel@gmail.com', '6 de Agosto', 'masculino'),
                                                                                        ('Andrea', 'Arias Ballesteros',2022, 21, 2832118,  'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino'),
                                                                                        ('Santos', 'Montes Valenzuela', 2022,24, 2832119,  'santos@gmail.com', 'Av. 6 de Agosto', 'masculino');

INSERT INTO materias (nombre_mat, cod_mat)
VALUES ('Introduccion a la Arquitectura', 'ARQ-101'),
('Urbanismo y Diseno', 'ARQ-102'),
('Dibujo y Pintura Arquitectonico', 'ARQ-103'),
('Matematica discreta', 'ARQ-104'),
('Fisica Basica', 'ARQ-105');

INSERT INTO inscripcion (id_est, id_mat, semestre, gestion)
VALUES (1, 1, '1er Semestre', 2018),
(1, 2, '2do Semestre', 2018),
(2, 4, '1er Semestre', 2019),
(2, 3, '2do Semestre', 2019),
(3, 3, '2do Semestre', 2020),
(3, 1, '3er Semestre', 2020),
(4, 4, '4to Semestre', 2021),
(5, 5, '5to Semestre', 2021);





select *
from estudiantes;





# Mostrar los nombres y apellidos de los estudiantes inscritos en la materia ARQ-105, adicionalmente mostrar el nombre de la materia.
    # Deberá de crear una función que reciba dos parámetros y esta
    # función deberá ser utilizada en la cláusula WHERE.

use tareaHito2

select es.id_est, es.nombres, es.apellidos, mat.nombre_mat, mat.cod_mat
    from estudiantes as es
inner join inscripcion as ins on es.id_est = ins.id_est
inner join materias as mat on ins.id_mat = mat.id_mat

where validar_materia(mat.cod_mat, 'ARQ-104') = true;

create or replace function  validar_materia(cod_mat varchar(20), cod varchar(20))
returns bool
begin
    declare resp bool DEFAULT false;

    if cod_mat = cod then
        set resp = true;
    end if;

    return resp;
end;



# Crear una función que permita obtener el promedio de las edades del género masculino o femenino de los estudiantes inscritos en la asignatura ARQ-104.
    # La función recibe como parámetro el género y el código de materia.

create function Promedio_Edad (genero varchar(10), cod varchar(10))
returns varchar(100)
begin
    declare respuesta varchar(200) ;
    set respuesta = (select concat('El promedio es: ', avg(es.edad)) as PROMEDIO
        from estudiantes as es
    inner join inscripcion as ins on es.id_est = ins.id_est
    inner join materias mat on ins.id_mat = mat.id_mat
    where es.sexo = genero and mat.cod_mat = cod);

    return respuesta;
end;


select Promedio_Edad('Masculino', 'ARQ-101');



#
# La vista deberá llamarse ARQUITECTURA_DIA_LIBRE
# El dia viernes tendrán libre los estudiantes de la carrera de ARQUITECTURA debido a su aniversario
    # Este permiso es solo para aquellos estudiantes inscritos en el año 2021.
    # La vista deberá tener los siguientes campos.
        # 1. Nombres y apellidos concatenados = FULLNAME
        # 2. La edad del estudiante = EDAD
        # 3. El año de inscripción = GESTION
        # 4. Generar una columna de nombre DIA_LIBRE
        # a. Si tiene libre mostrar LIBRE
        # b. Caso contrario mostrar NO LIBRE

create view ARQUITECTURA_DIA_LIBRE as
select concat(est.nombres, ' ', est.apellidos) as Fullname, concat(est.edad) as Edad,concat( i.gestion) as Gestion, concat(
    case
        when i.gestion = 2021 then 'Libre'
        else 'No libre'
    end
    ) as Dia_Libre
    from estudiantes as est
inner join inscripcion i on est.id_est = i.id_est;





select *
from ARQUITECTURA_DIA_LIBRE;





# Agregar una tabla cualquiera al modelo de base de datos.
    #  Después generar una vista que maneje las 4 tablas
    #  La vista deberá llamarse PARALELO_DBA_I


CREATE TABLE Horarios (
   id_horario INT AUTO_INCREMENT PRIMARY KEY,
   dia VARCHAR(20) NOT NULL,
   hora_inicio TIME NOT NULL,
   hora_fin TIME NOT NULL,
   aula VARCHAR(20) NOT NULL,
   id_mat INT NOT NULL,
   FOREIGN KEY (id_mat) REFERENCES materias(id_mat)
);

INSERT INTO Horarios (dia , hora_inicio, hora_fin, aula, id_mat)
VALUES ( 'Jueves', '07:30:00', '10:00:00', '408', 5),
       ('Miércoles', '10:00:00', '12:00:00', '318', 2),
       ('Viernes', '14:00:00', '16:00:00', '214', 3),
       ('Martes', '16:00:00', '18:00:00', '208', 4);


SELECT *
from ARQUITECTURA_DIA_LIBRE;


create view PARALELO_DBA_I as
select CONCAT(est.nombres, ' ', est.apellidos) as Fullname, mat.nombre_mat as Materia ,CONCAT(Hor.dia, ' ', Hor.hora_inicio, ' - ', Hor.hora_fin, '   Aula: ', Hor.aula ) as Horario
from estudiantes AS est
inner join inscripcion as ins on est.id_est = ins.id_est
inner join materias as mat on ins.id_mat = mat.id_mat
inner join Horarios as Hor on mat.id_mat = Hor.id_mat
where est.sexo = 'Masculino' and Hor.dia = 'Lunes';


select*
from PARALELO_DBA_I

# where mat.cod_mat = 'ARQ-103';











