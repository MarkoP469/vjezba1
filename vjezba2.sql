

# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Marko\Desktop\jp27\zadatci\vjezba2.sql

drop database if exists vjezba2;
create database vjezba2 default charset utf8;
use vjezba2;

create table brat (
    sifra int not null primary key auto_increment,
    suknja varchar(47) null,
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

create table neprijatelj (
    sifra int not null primary key auto_increment,
    majica varchar(32) null,
    haljina varchar(43) not null,
    lipa decimal(16,8) null,
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11) null,
    cura int null
);

create table zarucnica (
    sifra int not null primary key auto_increment,
    narukvica int null,
    bojakose varchar(37) not null,
    novcica decimal (15,9) null,
    lipa decimal (15,8) not null,
    indiferentno bit not null
);

create table decko_zarucnica (
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

create table decko (
    sifra int not null primary key auto_increment,
    indiferentno bit null,
    vesta varchar(34),
    asocijalno bit not null
);

create table cura (
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38) null,
    narukvica int null,
    introvertno bit null,
    majica varchar(40) not null,
    decko int null
);

create table svekar (
    sifra int not null primary key auto_increment,
    silfrizura varchar(48) null,
    ogrlica int not null,
    asocijalno bit not null
);

create table prijatelj (
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37) null,
    treciputa datetime not null,
    ekstroventno bit not null,
    prviputa datetime null,
    svekar int not null
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table cura add foreign key (decko) references decko(sifra);

alter table decko_zarucnica add foreign key(decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

alter table prijatelj add foreign key (svekar) references svekar(sifra);


insert into neprijatelj (majica,lipa,kuna,sifra)
values  ('puma',12.22,99.99,1),
        ('nike',2.33,299.99,2),
        ('adidas',123.33,11.22,3);
        

insert into decko (vesta)
values  ('plava'),
        ('XXL'),
        ('vunena');

insert into cura (haljina,drugiputa,narukvica)
values  ('kratka','1990-02-02',1),
        ('ljetna','1991-03-12',2),
        ('plava','1992-04-10',3);

insert into zarucnica (bojakose)
values  ('plavusa'),
        ('smeda'),
        ('garavusa');

insert into decko_zarucnica (decko,zarucnica)
values  (1,1),
        (2,2),
        (3,3);

# 2/2
insert into svekar (sifra)
values (1);
select * from prijatelj;
insert into prijatelj (treciputa,svekar)
values ('1990-01-01',1);
update prijatelj set treciputa='2020-04-30'
where sifra is not null;

# 2/3

select * from neprijatelj;
select * from brat;
insert into brat (ogrlica,neprijatelj)
values  (13,1),
		(14,2),
		(15,3);
delete from brat 
where ogrlica !=14;

# 2/4

select suknja from cura
where drugiputa is null;

# 2/5

select f.novcica, a.neprijatelj, b.haljina desc
from brat a
inner join neprijatelj b on a.neprijatelj = b.sifra 
inner join cura c on b.cura = c.sifra 
inner join decko d on c.decko = d.sifra 
inner join decko_zarucnica e on e.decko = d.sifra 
inner join zarucnica f on e.zarucnica = f.sifra 
c.drugiputa is not null and d.vesta like '%ba%';

# 2/6

select a.vesta , a.asocijalno 
from decko a
left join decko_zarucnica b on a.sifra =b.decko 
where b.sifra is null ;