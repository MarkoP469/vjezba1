drop database if exists zupanijaopcina;
create database zupanijaopcina;
use zupanijaopcina;
create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    zupan int
);

create table opcina(
    sifra int not null primary key auto_increment,
    zupanija int,
    naziv varchar(50)
);
alter table opcina add foreign key (zupanija) references zupanija(sifra);