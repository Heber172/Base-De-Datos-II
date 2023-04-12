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

select numeros_naturales_v2(10)



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

