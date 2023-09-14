
CREATE TABLE PAYS (
    Code_pays CHAR(2),
    Nom_pays VARCHAR(50),
    No_Negociant NUMERIC(4),
    CONSTRAINT PK_CodePays PRIMARY KEY(Code_Pays),
);



CREATE TABLE NEGOCIANT (
    No_Negociant NUMERIC(4) NOT NULL,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    NoRue NUMERIC(3),
    Rue VARCHAR(50),
    Cpostal NUMERIC(5),
    Ville VARCHAR(100),
    noTel CHAR(10),
    email VARCHAR(100) CHECK(email like '%@%'),
    Code_pays CHAR(2),
    CONSTRAINT PK_Negociant PRIMARY KEY(No_Negociant),
    CONSTRAINT FK_Negociant_CodePays
        FOREIGN KEY (Code_pays)
        REFERENCES PAYS(Code_pays),
);


ALTER TABLE PAYS
ADD CONSTRAINT FK_No_Negociant FOREIGN KEY(No_Negociant) REFERENCES NEGOCIANT(No_Negociant);

CREATE TABLE FABRICANT (
    No_Fabricant NUMERIC(4) NOT NULL,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    NoRue NUMERIC(3),
    Rue VARCHAR(50),
    Cpostal NUMERIC(5),
    Ville VARCHAR(100),
    noTel CHAR(10),
    email VARCHAR(100) CHECK(email like '%@%') ,
    Code_pays CHAR(2),
    CONSTRAINT PK_Fabricant PRIMARY KEY(No_Fabricant),
    CONSTRAINT FK_Fabricant_CodePays
        FOREIGN KEY (Code_pays)
        REFERENCES PAYS(Code_pays),
);


CREATE TABLE NEGOCIATION(
No_negociation     NUMERIC(6),
Date_negociation   date,
Duree                        NUMERIC(3),
Description              varchar(200),
No_negociant         NUMERIC(4),
No_fabricant           NUMERIC(4),
CONSTRAINT PK_Negociation PRIMARY KEY(No_negociation),

CONSTRAINT FK_Negociation_NoNegociant 
    FOREIGN KEY(No_negociant) REFERENCES NEGOCIANT(No_Negociant),

CONSTRAINT FK_Negociation_NoFabricant
    FOREIGN KEY(No_fabricant) REFERENCES FABRICANT(No_Fabricant),

);

CREATE TABLE SALAIRE(
No_salaire   NUMERIC(6),
valeur_salaire  NUMERIC(6,2),
date_salaire   DATE,
No_negociant    NUMERIC(4),

CONSTRAINT PK_Salaire PRIMARY KEY(No_salaire),

CONSTRAINT FK_SALAIRE_NoNegociant 
    FOREIGN KEY(No_negociant) REFERENCES NEGOCIANT(No_Negociant),
);


CREATE TABLE POURCENTAGE (
No_pourcentage     NUMERIC(6),
valeur_pourcentage  NUMERIC(4,2) NOT NULL CHECK (valeur_pourcentage>0 AND valeur_pourcentage <=100),
date_pourcentage   DATE,
No_negociant    NUMERIC(4),
CONSTRAINT PK_Pourcentage PRIMARY KEY(No_pourcentage),

CONSTRAINT FK_POURCENTAGE_NoNegociant 
    FOREIGN KEY(No_negociant) REFERENCES NEGOCIANT(No_Negociant),

);



CREATE TABLE ACHAT (
    No_achat NUMERIC(6) NOT NULL,
    Date_achat DATE,
    Date_limite_livr DATE ,
    No_Negociant NUMERIC(4),
    CONSTRAINT FK_ACHAT_NoNegociant
        FOREIGN KEY (No_Negociant)
        REFERENCES NEGOCIANT(No_Negociant),

    CONSTRAINT PK_Achat  PRIMARY KEY (No_Achat),

    CONSTRAINT Check_Dates CHECK(Date_limite_livr>Date_achat)
);

CREATE TABLE CATEGORIE(
No_categorie  NUMERIC(3),
Nom_categorie       varchar(50),
No_cat_superieur   NUMERIC(3),  

CONSTRAINT FK_Categorie_NoCatSup
        FOREIGN KEY (No_cat_superieur)
        REFERENCES CATEGORIE(No_Categorie), 

CONSTRAINT PK_Categorie  PRIMARY KEY (No_Categorie),


);

CREATE TABLE PRODUIT (
    Code_produit CHAR(8) ,
    No_Fabricant NUMERIC(4),
    Nom_produit VARCHAR(30),
    Couleur CHAR(3),
    PrixHT NUMERIC(8,2) CHECK(PrixHT<=5000),
    No_Categorie NUMERIC(3),


    CONSTRAINT FK_Produit_NoFabricant
        FOREIGN KEY (No_Fabricant)
        REFERENCES FABRICANT(No_Fabricant),

    CONSTRAINT FK_Produit_NoCategorie
        FOREIGN KEY (No_Categorie)
        REFERENCES CATEGORIE(No_Categorie), 


    CONSTRAINT PK_Code_Produit  PRIMARY KEY (Code_Produit),
);

CREATE TABLE LIVRAISON (
No_Livraison           NUMERIC(6),
Date_livraison        date,
Nbj_retard              NUMERIC(3),
Nb_nonconforme  NUMERIC(3),
Code_produit         char(8),  


    CONSTRAINT PK_Livraison  PRIMARY KEY (No_Livraison),

    CONSTRAINT FK_Livraison_CodeProduit
        FOREIGN KEY (Code_produit)
        REFERENCES PRODUIT(Code_produit),



);

CREATE TABLE VENTES (
    Annee numeric(4),
    Mois numeric(2),
    Code_produit CHAR(8),
    Quantite_ventes numeric(4),


    CONSTRAINT fk_ventes_CodeProduit
        FOREIGN KEY (Code_produit)
        REFERENCES PRODUIT(Code_produit),


    CONSTRAINT PK_Ventes PRIMARY KEY (Annee, Mois,Code_produit),

);

CREATE TABLE DETAIL_ACHAT (
    No_achat NUMERIC(6),
    Code_produit CHAR(8),
    Quantite_achat  NUMERIC(6) CHECK(Quantite_achat > 0),


    CONSTRAINT fk_detail_achat_achat
        FOREIGN KEY (No_achat)
        REFERENCES ACHAT(No_achat),


    CONSTRAINT fk_detail_achat_produit
        FOREIGN KEY (Code_produit)
        REFERENCES PRODUIT(Code_produit),


    CONSTRAINT PK_detail_achat PRIMARY KEY (No_achat, Code_produit),
);




CREATE INDEX I_Nom_Nego ON NEGOCIANT(Nom);
CREATE INDEX I_Prenom_Nego ON NEGOCIANT(Prenom);

CREATE INDEX I_Achat_Nego ON ACHAT(No_Negociant);

CREATE INDEX I_Nom_Fabri ON FABRICANT(Nom);
CREATE INDEX I_Prenom_Fabri ON FABRICANT(Prenom);
CREATE INDEX I_CodePays_Fabri ON FABRICANT(Code_Pays);


CREATE INDEX I_Nom_Produit ON PRODUIT(nom_produit);
CREATE INDEX I_NoFabricant_Produit ON PRODUIT(No_Fabricant);
