create database webProducts
use webProducts

create table products(
Id int,
Name varchar(50),
Category varchar(50),
Price int,
Date varchar(50)
);

insert into products (Id, Name, Category, Price, Date) values ('1','Kellogs', 'Cereal', 3000, 'dosmil');
insert into products (Id, Name, Category, Price, Date) values ('2','Oreo', 'Galletas', 2500, '12/9/22');
insert into products (Id, Name, Category, Price, Date) values ('3','Pasta Dental', 'Higiene', 1300, '11/9/22');

select * from products;

/*Borrar un registro*/
delete from products where Id = 2 and Name = 'Oreo';

/*Update un user*/
update products set Name = 'Trijuelas' where Id = 1