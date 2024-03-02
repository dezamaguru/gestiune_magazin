# gestiune_magazin

Acest proiect are ca scop gestionarea activitatii unui magazin care se ocupa cu 
comercializarea jocurilor de societate. Proiectul tine evidenta managementului intern al
magazinului, incluzand gestionarea angajatilor, a stocurilor si a furnizorilor, a clientilor si a 
comenzilor plasate in incinta magazinului de catre acestia.
Tabelele prezinta urmatoarele atribute:
FUNCTII: id_functie constraint pk_functie primary key; denumire_functie; 
ANGAJATI: id_angajat constraint pk_angajat primary key; nume; prenume; telefon; 
data_angajare; salariu; id_functie;
id_functie_pk foreign key (id_functie) references Functii(id_functie)
CLIENTI: id_client constraint pk_client primary key; nume_client; prenume_c; telefon; adresa;
COMENZI: id_comanda constraint pk_comanda primary key; id_produs; data_comanda; 
id_cllient; mod_plata; stare_comanda; id_angajat;
fk_angajat foreign key(id_angajat) references Angajati(id_angajat)
fk_client foreign key(id_client) references Clienti(id_client)
constraint fk_produs foreign key(id_produs) references Produse(id_produs)
STOC: id_stoc constraint pk_stoc primary key; cantitate; id_produs; id_furnizor;
id_produs_fk foreign key(id_produs) references Produse(id_produs)
id_furnizor_fk foreign key(id_furnizor) references Furnizori(id_furnizor)
PRODUSE: id_produs constraint pk_produs primary key; denumire_produs; categorie; pret;
FURNIZORI: id_furnizor constraint pk_furnizor primary key; denumire_furnizor, localitate; 
cantitate_comandata;

