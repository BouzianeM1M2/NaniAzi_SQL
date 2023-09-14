INSERT INTO PAYS(Code_pays, Nom_pays)
VALUES ('FR','France'),('ES','Espagne'),('VN','Vietnam'),('AN','ANGLETERRE');

INSERT INTO FABRICANT (No_Fabricant, Nom, Prenom, NoRue, Rue, Cpostal, Ville, noTel, email, Code_pays) VALUES
(100, 'Lermite', 'Bernard', 10, 'Rue de la Moula', 75001, 'Paris', '0123456789', 'lb@email.com', 'FR'),
(200, 'Tupac', 'Shakur', 123, 'Barber Street', 90001, 'Los Angeles', '9876543210', 'ts@email.com', 'AN'),
(300, 'Edmin', 'Son', 56, 'Chin Hi Hoa', 10000, 'Hanoi', '0241378956', 'es@email.com', 'VN'),
(400, 'Gianni', 'Infantino', 79, 'Avenida de Madrid', 28001, 'Madrid', '3456127890', 'gi@email.com', 'ES');


INSERT INTO NEGOCIANT (No_Negociant, Nom, Prenom, NoRue, Rue, Cpostal, Ville, noTel, email, Code_pays)
VALUES (1, 'Stock', 'Michel', 192, 'Rue des Fabricant', 75001, 'Paris', '0123456789', 'michel.stock@example.com', 'FR'),
(2, 'Yaya', 'Toure', 123, 'Rue des boulanger', 75002, 'Paris', '0123456781', 'yt@example.com', 'FR'),
(3, 'Riyad', 'Mahrez', 212, 'Rue des pinpon', 75003, 'Paris', '9876543211', 'rm@example.com', 'FR');


UPDATE PAYS SET No_negociant= 1 Where Code_pays = 'FR';
UPDATE PAYS SET No_negociant= 2 Where Code_pays = 'ES';
UPDATE PAYS SET No_negociant= 3 Where Code_pays = 'VN';
UPDATE PAYS SET No_negociant= 1 Where Code_pays = 'AN';

INSERT INTO SALAIRE VALUES (3,9000,'20/03/2023',2),(1,5500,'20/03/2023',3),(2,2500,'20/01/2020',1);


INSERT INTO CATEGORIE (No_Categorie, Nom_categorie, No_cat_superieur) VALUES
(101, 'Electronique', NULL),
(102, 'Vêtements', NULL),
(103, 'Accessoires', NULL),
(104, 'Maison & Jardin', NULL),
(105, 'Sport & Loisirs', NULL),
(106, 'Beauté & Santé', NULL),
(107, 'Jouets & Enfants', NULL),
(108, 'Automobile & Motos', NULL),
(109, 'Ordinateurs & Bureau', NULL);


INSERT INTO NEGOCIATION VALUES(1,'20/03/2023',1,'TEST NEGOCIATION',1,400),(2,'01/01/2020',2,'TEST NEGO 2',1, 300);


INSERT INTO PRODUIT (Code_produit, No_Fabricant, Nom_produit, Couleur, PrixHT, No_Categorie) VALUES
('P0010',200,'Test_Soie','BLU',5.00,101),
('P0001', 100, 'Produit_1', 'BLU', 10.00, 101),
('P0002', 100, 'Produit_2', 'RED', 12.50, 102),
('P0003', 200, 'Produit_3', 'GRN', 14.99, 103),

-- plus de 50 Euro
('P0004', 300, 'Produit_4', 'YEL', 55.00, 104),
('P0005', 300, 'Produit_5', 'BLK', 75.00, 105),
('P0006', 400, 'Produit_6', 'WHT', 100.00, 106),

-- 15 et 50 Euro


('P0007', 400, 'Produit_7', 'BRN', 25.00, 107),
('P0008', 200, 'Produit_8', 'PNK', 30.00, 108),
('P0009', 100, 'Produit_9', 'GRY', 45.00, 109);


INSERT INTO ACHAT VALUES (1,'01/01/2020','01/01/2023',1),(2,'01/01/2019','10/01/2025',1),(3,'01/01/2024','10/01/2025',1);

INSERT INTO DETAIL_ACHAT VALUES (1,'P0004',1),(2,'P0008',2);

INSERT INTO VENTES VALUES (2022,04,'P0002',4999),(2022,04,'P0008',2000),(2023,04,'P0007',2000),(2022,04,'P0009',2000),(2023,01,'P0001',2),(2023,02,'P0001',2);