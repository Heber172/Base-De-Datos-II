CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autor (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  nacionalidad VARCHAR(50),
  fecha_nacimiento DATE
);

CREATE TABLE usuario (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE,
  direccion VARCHAR(100)
);

CREATE TABLE libro (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  isbn VARCHAR(20),
  fecha_publicacion DATE,
  autor_id INTEGER,
  FOREIGN KEY (autor_id) REFERENCES autor(id)
);

CREATE TABLE prestamo (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  libro_id INTEGER REFERENCES libro(id) ON DELETE CASCADE,
  usuario_id INTEGER REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE categoria (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE libro_categoria (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  libro_id INTEGER REFERENCES libro(id) ON DELETE CASCADE,
  categoria_id INTEGER REFERENCES categoria(id) ON DELETE CASCADE
);


INSERT INTO autor (nombre, nacionalidad, fecha_nacimiento) VALUES
('Gabriel Garcia Marquez', 'Colombiano', '1927-03-06'),
('Mario Vargas Llosa', 'Peruano', '1936-03-28'),
('Pablo Neruda', 'Chileno', '1904-07-12'),
('Octavio Paz', 'Mexicano', '1914-03-31'),
('Jorge Luis Borges', 'Argentino', '1899-08-24');


INSERT INTO libro (titulo, isbn, fecha_publicacion, autor_id) VALUES
('Cien años de soledad', '978-0307474728', '1967-05-30', 1),
('La ciudad y los perros', '978-8466333867', '1962-10-10', 2),
('Veinte poemas de amor y una canción desesperada', '978-0307477927', '1924-08-14', 3),
('El laberinto de la soledad', '978-9681603011', '1950-01-01', 4),
('El Aleph', '978-0307950901', '1949-06-30', 5);


INSERT INTO usuario (nombre, email, fecha_nacimiento, direccion) VALUES
('Juan Perez', 'juan.perez@gmail.com', '1985-06-20', 'Calle Falsa 123'),
('Maria Rodriguez', 'maria.rodriguez@hotmail.com', '1990-03-15', 'Av. Siempreviva 456'),
('Pedro Gomez', 'pedro.gomez@yahoo.com', '1982-12-10', 'Calle 7ma 789'),
('Laura Sanchez', 'laura.sanchez@gmail.com', '1995-07-22', 'Av. Primavera 234'),
('Jorge Fernandez', 'jorge.fernandez@gmail.com', '1988-04-18', 'Calle Real 567');


INSERT INTO prestamo (fecha_inicio, fecha_fin, libro_id, usuario_id) VALUES
('2022-01-01', '2022-01-15', 1, 1),
('2022-01-03', '2022-01-18', 2, 2),
('2022-01-05', '2022-01-20', 3, 3),
('2022-01-07', '2022-01-22', 4, 4),
('2022-01-09', '2022-01-24', 5, 5);


INSERT INTO categoria (nombre) VALUES
('Novela'),
('Poesía'),
('Ensayo'),
('Ciencia Ficción'),
('Historia');


INSERT INTO libro_categoria (libro_id, categoria_id) VALUES (1, 1),
                                                            (1, 3),
                                                            (2, 1),
                                                            (2, 5),
                                                            (3, 2),
                                                            (4, 3),
                                                            (5, 4);



ALTER TABLE libro ADD COLUMN paginas integer default  20;

select *
from libro_categoria;


ALTER TABLE libro ADD COLUMN editorial varchar(50) default  'Don Bosco';


#mostrar todos los libros de los autores de nacionalidad argentino
create  view libros_argentinos as
select au.nombre, au.nacionalidad , li.titulo
from libro as li
inner join autor as au on li.autor_id = au.id
where au.nacionalidad = 'Argentino';



#Mostrar los libros de la categoria CIENCIA FICCION
create view libros_ciencia_ficcion as
select li.titulo as LIBRO, cat.nombre as CATEGORIA
from libro as li
inner join libro_categoria as caL on li.id = caL.libro_id
inner join categoria as cat on caL.categoria_id = cat.id
where cat.nombre = 'ciencia ficcion';



create view Contenid_Book AS
select li.titulo as Title_Book, li.editorial AS Editorial_Book, li.paginas as Page_Book, (
    case
        when li.paginas > 0 and li.paginas <=30 then 'Contenido Basico'
        when li.paginas > 30 and li.paginas <=80 then 'Contenido Mediano'
        when li.paginas > 80 and li.paginas <= 150 then 'Contenido Seperior'
        else 'Contenido Avanzado'
    end
    ) as Type_Contenid_Book
from libro as li;


select COUNT(C.Type_Contenid_Book)
FROM Contenid_Book AS C
WHERE C.Type_Contenid_Book = 'CONTENIDO Mediano';




#TITULO, EDUTORIAL, CATEGORIA,  AUTOR NACIONALIDAD
alter VIEW Book_User as
    select concat(lib.titulo , ' - ' , lib.editorial , ' - ' , cat.nombre) as Book_Detail, concat(au.nombre,' - ', au.nacionalidad) as Autor_Detail
        from libro as lib
        inner join libro_categoria as libCa on lib.id = libCa.libro_id
        inner join categoria as cat on cat.id = libCa.categoria_id
        inner join autor as au on au.id = lib.autor_id
    where au.nacionalidad = 'Boliviano' or au.nacionalidad = 'Argentino';




#
select bo.Book_Detail, (
    case
        when bo.Book_Detail like '%NOVA%' then 'En venta'

        else 'En proceso'
    end
    ) as Promocion
from book_user as bo