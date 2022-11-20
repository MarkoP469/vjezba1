drop database if exists edunovajp27;
create database edunovajp27;
use edunovajp27;
create table zaposlenik(
    sifra int  not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    placa decimal(18,2),
    nadredeni int 
    );

alter table zaposlenik  (nadredeni) references zaposlenik(sifra);