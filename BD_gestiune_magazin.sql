CREATE SEQUENCE seq_functii
MINVALUE 1
START WITH 100
INCREMENT BY 1
CACHE 20;
create table Functii(
id_functie number(4) constraint pk_functie primary key,
Denumire_functie varchar2(30) not null
);

CREATE SEQUENCE seq_angajati
MINVALUE 1
START WITH 200
INCREMENT BY 1
CACHE 20;
create table Angajati(
id_angajat number(4) constraint pk_angajat primary key, 
Nume varchar2(20) not null,
Prenume varchar2(20) not null,
Telefon number(10),
Data_angajare date,
Salariu number(4),
id_functie number(4)
);
alter table Angajati
add id_functie number(4);
alter table Angajati
add constraint id_functie_pk foreign key (id_functie) references Functii(id_functie); 
alter table Angajati
add id_manager number(4);

CREATE SEQUENCE seq_clienti
MINVALUE 1
START WITH 300
INCREMENT BY 1
CACHE 20;
create table Clienti(
id_client number(4) constraint pk_client primary key,
Nume_client varchar2(20),
Prenume_client varchar2(20),
Telefon number(10),
Adresa varchar2(30)
); 

CREATE SEQUENCE seq_produse
MINVALUE 1
START WITH 400
INCREMENT BY 1
CACHE 20;
create table Produse(
id_produs number(4) constraint pk_produs primary key,
Denumire_produs varchar2(50),
Categorie varchar2(20),
Pret number(4,2)
);
alter table Produse
modify (pret number (6,2));

CREATE SEQUENCE seq_furnizori
MINVALUE 1
START WITH 500
INCREMENT BY 1
CACHE 20;
create table Furnizori(
id_furnizor number(4) constraint pk_furnizor primary key,
Denumire_furnizor varchar2(20),
Localitate varchar2(15),
Cantitate_comandata number(4)
);

CREATE SEQUENCE seq_stoc
MINVALUE 1
START WITH 600
INCREMENT BY 1
CACHE 20;
create table Stoc(
id_stoc number(4) constraint pk_stoc primary key,
Cantitate number(4),
id_produs number(4),
id_furnizor number(4)
);
alter table Stoc
add constraint id_produs_fk foreign key(id_produs) references Produse(id_produs);
alter table Stoc 
add constraint id_furnizor_fk foreign key(id_furnizor) references Furnizori(id_furnizor);

CREATE SEQUENCE seq_comenzi
MINVALUE 1
START WITH 700
INCREMENT BY 1
CACHE 20;
create table Comenzi(
id_comanda number(3) constraint pk_comanda primary key,
id_produs number(4),
Data_comanda date,
id_client number(4),
Mod_plata varchar2(15),
Stare_comanda varchar2(15)
);
alter table Comenzi
add id_angajat number(4);
alter table Comenzi
add constraint fk_angajat foreign key(id_angajat) references Angajati(id_angajat);
alter table Comenzi
add constraint fk_client foreign key(id_client) references Clienti(id_client);
alter table Comenzi
add constraint fk_produs foreign key(id_produs) references Produse(id_produs); 

insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Administrator');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Manager');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Marketing Manager');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Social Media Manager');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Contabil');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Lucrator comercial');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Casier');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Responsabil marfa');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Ingrijitoare');
insert into Functii(id_functie,denumire_functie)
values(seq_functii.nextval,'Paznic');

insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Bolo?escu','Andreea','0722687569','05.April.2020','9000','100');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Mihai','Valentin','0729087569','10.April.2019','6000','104');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Gheorghe','Mihai','0745895348','06.November,2018','7000','101');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Petcu','George','0708457500','05.March.2019','7000','101');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Bunea','Alin','0766892135','28.May.2018','7000','102');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Croitoru','Mirel','0756458956','21.January.2020','7000','103');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Vasile','Dragos','0724652355','04.April.2018','5000','105');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Popescu','Mirela','0725633546','01.January.2020','5000','105');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Zota','Elena','0722456653','17.May.2020','4000','106');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Burada','Andreea','0745665348','29.July.2019','4000','106');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Pocovnicu','Robert','072752969','16.September.2020','5000','107');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Vasile','Ionut','0734931856','25.February.2018','5000','107');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Mircea','Alexandru','0731652489','20.October.2017','3300','108');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.extval,'Boncu','Ramona','07316425720','15.October.2019','3300','108');
insert into Angajati(id_angajat, nume, prenume, telefon, data_angajare, salariu, id_functie)
values(seq_angajati.nextval,'Teraru','Gheorghe','0731265473','13.July.2022','4000','109');
update Angajati
set id_manager = 1 where id_functie in (104,101,102);
update Angajati
set id_manager = 2 where id_angajat = 205;
update Angajati
set id_manager = 3 where id_angajat in (206,208,210,212,214);
update Angajati
set id_manager = 4 where id_angajat in (207,209,211,213); 

insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Ion','Andrei','0746537896','Strada Mircea Eliade nr 3 ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Voinea','Marius','0724568799','Strada Vergului nr 1 ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Popa','Radu','0745668976','Bulevardul Oltenitei nr 301 ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Ciobanu','Madalina','0764889645','Strada 1Mai nr 2 ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Ganea','Georgiana','0735468931','Strada Chisinaului ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Anghel','Ion','0746531235','Strada Bacovia nr 5 ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Buzatu','Alexandra','0766532846','Strada Crisul Alb nr 5 ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Voicu','Geanina','0744689635','Strada Armatei nr 7 ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Ionescu','Mihai','0745689731','Strada Revolutiei ');
insert into Clienti(id_client,nume_client,prenume_client,telefon,adresa)
values(seq_clienti.nextval,'Pampurea','Roxana','0732196705','Strada Curmita nr 10 ');

insert into Produse(id_produs, Denumire_produs, Categorie, Pret)
values(seq_produse.nextval, 'Pandemic Iberia', 'strategie', '309');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Catan Histories: Merchants of Europe', 'strategie', '259.60');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Exploding Kittens (Pink Edition)', 'petrecere', '122.55');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Povesti intunecate', 'petrecere', '49');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Sequence - Harry Potter', 'familie', '113.05');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Minecraft Builders & Biomes ', 'familie', '249');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Electronic Labyrinth', 'abstracte', '239');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Taluva', 'abstracte', '189.99');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Heavy Steam', 'razboi', '359');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Risk Godstorm', 'razboi', '189');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Combat Commander: Europe', 'razboi', '433.99');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Joc de Inteligenta Huzzle Cast Planet Diff 4', 'huzzle', '73.99');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Joc de Inteligenta Huzzle Cast Key', 'huzzle', '73.99');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Lord of the Rings The Card Game The Two Towers ', 'joc de carti', '389.99');
insert into Produse(id_produs, denumire_produs, categorie, pret)
values(seq_produse.nextval, 'Game of Thrones Tarot', 'joc de carti', '109'); 

insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'Intscope Distrib','Oradea','10');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'Didacta ','Brasov','6');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'GG Games','Timisoara','20');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'FF15','Borsa','3');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'Tom & Rino','Constanta','9');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'WP Distributor ','Cluj-Napoca','43');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'Casual CC ','Iasi','10');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'GLHF Distrib','Ploiesti','22');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'Far & far','Arad','7');
insert into Furnizori(id_furnizor,denumire_furnizor,localitate,cantitate_comandata)
values(seq_furnizori.nextval,'Space ginos','Sibiu','3'); 

insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'50','415','509');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'63','410','505');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'16','402','508');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'20','403','506');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'37','404','510');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'19','405','501');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'40','406','502');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'6','407','501');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'54','408','509');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'28','409','508');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'13','410','510');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'55','411','507');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'30','412','504');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'36','413','502');
insert into Stoc(id_stoc,cantitate,id_produs,id_furnizor)
values(seq_stoc.nextval,'14','414','503');

insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'408','04.October.2023','301','Cash','Finalizata','207');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'406','05.October.2023','302','Cash','Finalizata','208');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'412','09.November.2023','303','Plata online','Finalizata','210');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'414','15.November.2023','304','Cash','Finalizata','209');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'401','16.November.2023','305','Cash','Finalizata','210');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'403','19.November.2023','306','Plata online','Finalizata','210');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'411','25.November.2023','307','Plata online','Finalizata','208');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'401','30.November.2023','308','Plata online','Finalizata','209');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'405','12.December.2023','309','Cash','Finalizata','209');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'410','15.December.2023','310','Plata online','Finalizata','208');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'408','23.December.2023','302','Cash','Finalizata','208');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'413','26.December.2023','303','Plata online','In curs','207');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'401','31.December.2023','302','Cash','In curs','209');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'407','2.January.2023','309','Plata online','In curs','207');
insert into 
Comenzi(id_comanda,id_produs,data_comanda,id_client,mod_plata,stare_comanda,id_angajat)
values(seq_comenzi.nextval,'402','6.January.2023','305','Cash','In curs','208');

