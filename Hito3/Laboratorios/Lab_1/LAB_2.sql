create database hito3_2023;

use hito3_2023;

set @usuario = 'ADMIN';

create or replace function variable()
     returns TEXT
     begin

         return @usuario;
    end;


select variable();

set @HITO_3 = 'ADMIN';

create OR REPLACE FUNCTION verificar()
returns VARCHAR(50)
begin
    declare respuesta varchar(50);

    CASE
        WHEN @HITO_3 = 'ADMIN' THEN SET respuesta = 'Usuario ADMIN';
        ELSE
            SET respuesta = 'Usuario INVITADO';
    END CASE ;

    RETURN respuesta;

end;


SELECT verificar();

## generar numeros naturales
create  function numeros_naturales(limite integer)
returns TEXT
begin
    declare cont integer default 1;
    declare resp text default '';

    while cont <= limite do
        set resp =  concat(resp, cont, ',');
        set  cont = cont+1;

    end while;

    return resp;
end;

select numeros_naturales(11);


create or replace function numeros_naturales_v2(limite integer)
returns TEXT
begin
    declare cont integer default 2;
    declare resp text default '';

    while cont <= limite do
        set resp =  concat(resp, cont, ',');
        set cont =  cont+2;

    end while;

    return resp;
end;

select numeros_naturales_v2(10);



create or replace  function numeros_naturales_v3(limite integer)
returns TEXT
begin
    declare cont integer default 1;
    declare pares integer default 2;
    declare impar integer default  1;
    declare resp text default '';

    while cont <= limite do

        if cont%2 = 1 then
            set resp =  concat(resp, pares, ',');
            set  pares =pares+2;

        else
             set resp =  concat(resp, impar, ',');
             set  impar = impar+2;
        end if;

        set cont = cont+1;
    end while;

    return resp;
end;

select numeros_naturales_v3(10);




# DO WHILE

create or replace function manejo_de_reperat(x integer )
returns text
begin
    declare str text default '';
    declare A varchar(10) default 'AA';
    declare B varchar(10) default 'BB';

    repeat

        if x%2 = 0 then
            set str = concat(str, x, ' - ', A, ' - ');
        else

            set str = concat(str, x, '- ', B, ' - ');
        end if;

        set x= x-1;

    until x<=0 end repeat;


    return str;
end;

select manejo_de_reperat(10);


#..........................................................................
# LOOP



CREATE OR REPLACE FUNCTION manejo_de_loop(x int)
returns text
begin
    declare str text default '';


        DBAII: LOOP

            if x > 0 then
                leave DBAII;
            end if;


            set str = concat(str, x, ', ');

            set x = x+1;

            iterate DBAII;
        end loop;

    return str;
END;

SELECT manejo_de_loop(-10);






CREATE OR REPLACE FUNCTION manejo_de_loop_V2(x int)
returns text
begin
    declare str text default '';

    declare A varchar(10) default 'AA';
    declare B varchar(10) default 'BB';


        DBAII: LOOP

            if x < 0 then
                leave DBAII;
            end if;

             if x%2 = 0 then
            set str = concat(str, x, ' - ', A, ' - ');
        else

            set str = concat(str, x, '- ', B, ' - ');
        end if;

            set x = x-1;

            iterate DBAII;
        end loop;

    return str;
END;

select manejo_de_loop_V2(10);


#---------- -------------------------- ---------------------------
create function tipo(credit_number integer)
returns text
begin
    declare resp text default '';

    if credit_number > 50000 then
        set resp = 'PLATINIUM';
    end if;

    IF credit_number >= 10000 and credit_number <= 50000 then
        set resp = 'GOLD';
    end if;

    if credit_number < 10000 then
        set resp = 'SILVER';
    end if;

    RETURN resp;

end;

SELECT tipo(50000);

#uso del charlength
#NOS PERMITE SABER CUANTOS CARACTERES TIENE UNA PALABRA
#DBAII = 5
#select char_length('DBAII')

select char_length(' DBAII 2023 ');

CREATE FUNCTION valida_length_7(password text)
returns text
begin

    declare resp text default '';
    if char_length(password) > 7 then
        set resp = 'PASSED';
    else
        set resp = 'FAILED';
    end if;

    RETURN resp;

end;

SELECT valida_length_7('12345678');


#Comparacion de cadenas
#El objetivo es saber si dos cadenas son iguales
#DBAII = DBAII ? TRUE

select strcmp('DBAiiiI', 'dbAii');

create OR REPLACE function cadena(cad1 text, cad2 text)
returns text
begin
    declare resp text default '';

    if STRCMP(cad1, cad2) = 0 then
        set resp = 'IGUALES';
    ELSE
        SET resp = 'DISTINTAS';
    end if;

    RETURN resp;
end;

SELECT cadena('CAD', 'CAD');


CREATE FUNCTION VALIDAR_CAD_(cad1 text, cad2 text)
returns text
begin
    declare resp text default '';
    declare cadena_tota text default '';
    cadena_tota = concat(cad1, cad2);

    if strcmp(cad1, cad2) and char_length(cadena_tota) > 15 then
        set resp = 'VALIDO';
    ELSE
        SET resp = 'NO VALIDO';
    end if;

    RETURN resp;
end;