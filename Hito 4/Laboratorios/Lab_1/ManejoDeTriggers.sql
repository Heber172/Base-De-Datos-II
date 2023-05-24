
create database hito4_2023;

use hito4_2023;

create table numeros(
    numero bigint primary key not null,
    cuadrado bigint ,
    cubo bigint,
    raiz_cuadrada real
);

insert into numeros(numero) values(2);

select * from numeros;

#elevado_n
select power(3,3);


#raiz caudrada
select sqrt(4);

create or replace trigger tr_completa_datos
    before insert  #new
    on numeros
    for each row
    begin
        declare valor_cuadrado bigint;
        declare valor_cubo bigint;
        declare valor_raiz real;

        set valor_cuadrado = power(NEW.numero, 2);
        set valor_cubo = power(NEW.numero,3);
        set valor_raiz = sqrt(NEW.numero);

        set NEW.cuadrado = valor_cuadrado;
        set NEW.cubo = valor_cubo;
        set NEW.raiz_cuadrada = valor_raiz;


    end;

insert into numeros (numero) values(3);


select * from numeros;

show triggers;

truncate table numeros;

alter table numeros add column suma_total real;


create or replace trigger tr_completa_datos_v2
    before insert  #new
    on numeros
    for each row
    begin
        declare valor_cuadrado bigint;
        declare valor_cubo bigint;
        declare valor_raiz real;
        declare valor_numero bigint default new.numero;

        set valor_cuadrado = power(NEW.numero, 2);
        set valor_cubo = power(NEW.numero,3);
        set valor_raiz = sqrt(NEW.numero);

        set NEW.cuadrado = valor_cuadrado;
        set NEW.cubo = valor_cubo;
        set NEW.raiz_cuadrada = valor_raiz;

        set new.suma_total = valor_raiz + valor_cubo + valor_cuadrado + valor_numero;

    end;

#-----------------------------------------------------------------------------------------------------------------------
create table usuarios(
    id_usr int auto_increment primary key not null,
    nombres varchar(30) not null,
    apellidos varchar(50) not null,
    edad int  not null,
    correo varchar(100) not null,
    password varchar(100)
    );

create or replace trigger new_password
    before insert
    on usuarios
    for each row
    begin
        declare cad_nom varchar(100) default substr(new.nombres, 1, 2);
        declare cad_ape varchar(100) default substr(new.apellidos, 1 ,2);

        set new.password = lower(concat(cad_nom, cad_ape, new.edad));
    end;
#añadir NEW, eliminar OLD, actualizar NEW & OLD
insert into usuarios(nombres, apellidos, edad, correo) values ('Heber', 'Miranda', 19, 'heber@gmail.com');
insert into usuarios(nombres, apellidos, edad, correo) values ('Danner', 'Mamani', 20, 'danner@gmail.com');

select *from usuarios;

drop trigger new_password;


#------------------------------------------------------------------------------------------------------------------------

#no se puede modificar un trgistro desde un trugger
#cuando se esta insertando

create or replace trigger genera_password_after
    after insert
    on usuarios
    for each row
    begin
        update usuarios set password = concat(substr(nombres,1,2), substr(apellidos, 1, 2) , edad)
        where id_usr = last_insert_id();
    end;


insert into usuarios(nombres, apellidos, edad, correo) values ('Juan', 'Alanoca', 29, 'juan@gmail.com');
#------------------------------------------------------------------------------------------------------------------------

