create database libreria;

use libreria;

create table categoria(
    category_id integer auto_increment primary key not null,
    name varchar(50) not null
);


create table publishers(
    publishers_id integer auto_increment primary key not null,
    name varchar(50) not null
);


create table books(
    book_id integer auto_increment primary key not null,
    title varchar(50) not null,
    isbn varchar(50) not null,
    published_date date not null,
    description varchar(100) not null,
    category_id integer not null,
    publishers_id integer not null,

    foreign key(category_id) references categoria(category_id),
    foreign key(publishers_id) references publishers(publishers_id)

);
