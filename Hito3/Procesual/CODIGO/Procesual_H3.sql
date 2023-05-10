

create database Hito3_Procesual;

use Hito3_Procesual;

create table estudiantes(
    id_est integer auto_increment primary key,
    nombres varchar(50) not null,
    apellido varchar(50) not null,
    edad integer not null,
    fono integer not null,
    email varchar(100) not null,
    direccion varchar(100) not null,
    genero varchar(10) not null
);

create table materias(
    id_mat integer auto_increment primary key,
    nombre_mat varchar(100) not null,
    cod_mat varchar(100) not null
);

create table inscripcion(
    id_ins integer auto_increment primary key ,
    semestre varchar(20) not null,
    gestion integer not null,
    id_est integer not null,
    id_mat integer not null,

    foreign key (id_est) references estudiantes(id_est),
    foreign key (id_mat) references materias(id_mat)
);

insert into estudiantes(nombres, apellido, edad, fono, email, direccion, genero) VALUES ('Miguel', 'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'AV. 6 de Agosto', 'masculino'),
                                                                                        ('Sandra', 'Mavir Uria', 25,2832116, 'sandra@gamil.com', 'Av. 6 de Agosto', 'femenino'),
                                                                                        ('Joel', 'Adubiri Mondar', 30,2832117, 'joel@gamil.com', 'Av. 6 de Agosto', 'masculino'),
                                                                                        ('Andrea', 'Arias Ballesteros', 21,2832118, 'andrea@gamil.com', 'Av. 6 de Agosto', 'femenino'),
                                                                                        ('Santos', 'Montes Valenzuela', 24,2832119, 'santos@gamil.com', 'Av. 6 de Agosto', 'masculino');

insert into materias(nombre_mat, cod_mat) values ('Introduccion a la Arquitectura', 'ARQ-101'),
                                                 ('Urbanismo y Diseno', 'ARQ-102'),
                                                 ('Dibujo y Pintura Arquitectonico', 'ARQ-103'),
                                                 ('Matematicas discretas', 'ARQ-104'),
                                                 ('Fisica Basica', 'ARQ-105');

insert into inscripcion(semestre, gestion, id_est, id_mat) values ('1er Semestre', 2018,1,1),
                                                                  ('2do Semestre', 2018,1,2),
                                                                  ('1er Semestre', 2019,2,4),
                                                                  ('2do Semestre', 2019,2,3),
                                                                  ('2do Semestre', 2020,3,3),
                                                                  ('3ro Semestre', 2020,3,1),
                                                                  ('4to Semestre', 2021,4,4),
                                                                  ('5to Semestre', 2021,5,5);




#........................................................................................................

create or replace function fibonaci(limite int)
returns text
begin
    declare cont int default 0;
    declare numero int default 1;
    declare numFibo int default 0;
    declare resp text default '';

    while cont < limite do
        set resp = concat(resp, numFibo, ' - ');

        set numero = numFibo + numero;
        set numFibo = numero - numFibo;

        set cont = cont+1;
    end while;
    return resp;
end;

select fibonaci(8);



#........................................................................................................

set @limit = 13;

create function fibonacci_var_global()
returns text
begin
    declare numero integer default 1;
    declare fibo integer default 0;
    declare cont int default 0;
    declare resp text default '';

    while cont < @limit do
        set resp = concat(resp, fibo, ' - ');

        set numero = numero + fibo;
        set fibo = numero - fibo;

        set cont = cont+1;
    end while;

    return resp;
end;

select fibonacci_var_global();

#........................................................................................................

create function edad_minima()
returns int
begin
    declare obt_edad int default 0;

    set obt_edad = ( select min(est.edad)
    from estudiantes as est);

    return obt_edad;

end;

set @edadMinima_limite = edad_minima();

create or replace function numero_Par_Impar()
returns text
begin
    declare cont integer default 0;
    declare resp text default '';

    if @edadMinima_limite%2 = 0 then

        while cont < @edadMinima_limite do
            set resp = concat(resp, cont, ', ');

            set cont = cont + 2;
        end while;
    else
        while @edadMinima_limite >= 0 do

            set resp = concat(resp, @edadMinima_limite, ', ');
            set @edadMinima_limite = @edadMinima_limite - 2;

        end while;
    end if;
    return resp;
end;

select numero_Par_Impar();

select*
from estudiantes;


#........................................................................................................

create or replace function contar_Vocales(cadena text)
returns text
begin
    declare resp text default '';
    declare a, e, i, o, u integer  default 0;
    declare posicion integer default 1;
    declare substring text default '';

    while posicion <= char_length(cadena) do

        set substring = substring(cadena, posicion, 1);

        if substring = 'a' then
            set a = a+1;
        end if;
        if substring = 'e' then
            set e = e+1;
        end if;
        if substring = 'i' then
            set i = i+1;
        end if;
        if substring = 'o' then
            set o = o+1;
        end if;
        if substring = 'u' then
            set u = u+1;
        end if;

        set posicion = posicion+1;


    end while;
    set resp = concat('a: ', a, ', e: ', e, ', i: ', i,', o: ', o, ', u: ', u);

    return resp;
end;

select contar_Vocales('taller de base de datos');

#........................................................................................................

create function identificar_(credit_number int)
returns text
begin
    declare resp text default '';

    case
        when credit_number > 50000 then set resp = 'PLATINIUM';
        when credit_number >= 10000 and credit_number <= 50000 then set resp =  'GOLD';
        when credit_number < 10000 then set resp = 'SILVER';
    end case;

    return resp;
end;

select identificar_(5200000);


#........................................................................................................

create or replace function eliminar_vocales(cad_1 varchar(20), cad_2 varchar(20))
returns text
begin
    declare pos_cad1, pos_cad2 int default 0;
    declare cad1_sin_voc, cad2_sin_voc, substri text default '';
    declare elim text default '';
    declare resp text default '';

    while (pos_cad1 <= char_length(cad_1)) do
        set substri = substr(cad_1, pos_cad1, 1);

        if substri = 'a' or substri = 'e' or substri = 'i' or substri = 'o' or substri = 'u' then
            set elim = substri;
        else
            set cad1_sin_voc = concat(cad1_sin_voc, substri);
        end if;
        SET pos_cad1 = pos_cad1+1;
    end while;

     while (pos_cad2 <= char_length(cad_2)) do
        set substri = substr(cad_2, pos_cad2, 1);

        if substri = 'a' or substri = 'e' or substri = 'i' or substri = 'o' or substri = 'u' then
            set elim = substri;
        else
            set cad2_sin_voc = concat(cad2_sin_voc, substri);
        end if;
        SET pos_cad2 = pos_cad2+1;
    end while;
    set resp = concat(cad1_sin_voc, '- ', cad2_sin_voc);

    return resp;
end;


select eliminar_vocales('TALLER DBA II', 'GESTION 2023');

#........................................................................................................

create or replace function reducir_cadena(cadena text)
returns  text
begin
    declare resp text default '';
    declare posicion int default 0;
    declare cad_substr text default '';
    declare tam int default 0;

    set posicion = char_length(cadena);
    repeat

        set cad_substr = subStr(cadena, -posicion, posicion);

        set resp = concat(resp, cad_substr, ', ');

        set posicion = posicion-1;

    until posicion = 0 end repeat;

    return resp;
end;


select reducir_cadena('dbaii');


select substr('cadwna', -5)