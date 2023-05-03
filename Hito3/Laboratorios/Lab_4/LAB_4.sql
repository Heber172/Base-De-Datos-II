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
   SET cadena_tota = concat(cad1, cad2);

    if strcmp(cad1, cad2) and char_length(cadena_tota) > 15 then
        set resp = 'VALIDO';
    ELSE
        SET resp = 'NO VALIDO';
    end if;

    RETURN resp;
end;

SELECT VALIDAR_CAD_('1234567891234561', '1234567891234561');


#.................................... SUBSTRING .......................................

#Contando desde la izquierda

#Opcion 1 con ' , '
select substr('DBAII 2023 Unifranz', 7,4);
select substr('Hola', 3);

#Opcion 2 con FROM y FOR
select  substr('DBAII 2023 Unifranz' from 7 for 4);

#Contando desde la derecha
select substr('DBAII 2023 Unifranz' from -13);
select substr('DBAII 2023 Unifranz' from -13 for 4);
select substr('DBAII 2023 Unifranz' from -1 for 4);

#Buscar una palabra con LOCATE
#SELECT LOCATE('palabraParaBuscar', 'CADENA')
select locate('2023','Base de Datos II, gestion 2023 Unifranz');


select locate('2023','Base de Datos II, gestion 2023 Unifranz 2023', 28);


create function buscar(cad text, buscar text)
returns text
begin
    declare resp text default '';
    declare locate integer default 0;

    set locate = (select locate(buscar, cad));

    if locate > 0 then
        set resp = concat('Si existe: ', locate);
    else
        set resp = 'No existe';
    end if;

    return resp;

end;

select buscar('6993499LP', 'LP');

create or replace function bucle(limite integer)
returns text
begin
    declare resp text default '';
    declare cont integer default 0;

    WHILE CONT <= limite DO
        if cont%2 = 0 then
            SET resp = CONCAT (resp, cont , ',');
        end if;

            SET cont = cont +1 ;
    END WHILE;

    return resp;
end;

select bucle(20);





SELECT LENGTH('JAJAJAJJAJAJAJA') - LENGTH(REPLACE('JAJAJAJJAJAJAJA', 'A', '')) AS count_of_a;



create or replace function bucle_cadena(cadena text, lim integer)
returns text
begin
    declare resp text default '';
    declare cont integer default 1;

    while lim > 0 do
        set resp = concat(resp, cadena);

        set lim = lim -1;
    end while;

    return resp;
end;

select bucle_cadena('dbaii ', 3);






CREATE or replace FUNCTION cuenta_caracter(palabra VARCHAR(50), letra CHAR)
RETURNS text
BEGIN

  DECLARE posicion INT DEFAULT 1;
  DECLARE count INT DEFAULT 0;
  DECLARE resp text default '';

  if locate(letra, palabra) > 0 then
    WHILE posicion <= CHAR_LENGTH(palabra) DO

        IF SUBSTR(palabra, posicion, 1) = letra THEN
          SET count = count + 1;
        END IF;

        SET posicion = posicion + 1;

    END WHILE;

    set resp = concat('La letra ',letra, ' se repite: ', count);

  else
      set resp = 'La letra no existe';
  end if;


 RETURN resp;
END;



select cuenta_caracter('DBA II - 2023', 'D');





CREATE or replace FUNCTION cuenta_vocales(palabra text)
RETURNS text
BEGIN

  DECLARE posicion INT DEFAULT 1;
  DECLARE count INT DEFAULT 0;
  DECLARE resp text default '';


    WHILE posicion <= CHAR_LENGTH(palabra) DO

        IF SUBSTR(palabra, posicion, 1) = 'a' OR SUBSTR(palabra, posicion, 1) = 'e' or SUBSTR(palabra, posicion, 1) = 'i' or SUBSTR(palabra, posicion, 1) = 'o' or SUBSTR(palabra, posicion, 1) = 'u' then
            set count = count +1;
        end if;

        SET posicion = posicion + 1;

    END WHILE;

    set resp = concat('Cantidad de vocales: ', count);

 RETURN resp;

END;

select cuenta_vocales('DBA II 2023');


create OR REPLACE function cuenta_palabras(cadena text)
returns text
begin
    DECLARE posicion INT DEFAULT 1;
  DECLARE count INT DEFAULT 1;
  DECLARE resp text default '';


    WHILE posicion <= CHAR_LENGTH(cadena) DO

        IF SUBSTR(cadena, posicion, 1) = ' ' then
            set count = count + 1;
        end if;

        SET posicion = posicion + 1;

    END WHILE;

    set resp = concat('Cantidad de vocales: ', count);

 RETURN resp;
end;

select cuenta_palabras('DBA II');




create OR REPLACE function cadena_ap(cadena text)
returns text
begin
    DECLARE posicion INT DEFAULT locate(' ', cadena);

    RETURN substr(cadena, posicion);
end;


SELECT cadena_ap('heber mollericona')





#.......................CHAR_LENGTH O LENGTH...................................................................................

#char_length cuenta la cantidad de letras que tiene una palabra
#EJEMPLO: 'HOLA' tiene 4 letras

#.............................................................................................................................





#........................SUBSTRING............................................................................................

#substring es para cortar la palabra en cierta posicion
#SUBSTRING(palabra_cadena, posicion donde comienza a cortar,  la cantidad de letras que cortara);
#EJEMPLO: substring('HOLA', 3, 1)  nos da la letra ....L.....

#.............................................................................................................................





#.......................STRCAMP...............................................................................................

#strcmp  sirve para comparar dos palabras
#EJEMPLO: strcmp('HOLA', 'HOLA') son iguales y nos retorna ...........0...........
#si no son iguales retorna      1        y      -1
#....................strcmp(primera_cad   ,   segunda_cad);

#...........................................................................................................





#,,,,,,,,,,,,,,,,,,,,,,,,,,LOCATE,,,,,,,,,,,,,,,,,,,,..............................................................

#locate sirve para buscar una palabra
#nos retorna la posicion donde comienza la palabra
#EJEMPLO:  locate('palabra_buscar', 'cadena_donde_buscar')
#EJEMPLO 2: mandando una posicion
#locate('palabra_buscar', 'cadena', posicion_NUMERO);

#.............................................................................................................


