CREATE DATABASE Gestion_Comercial;
USE Gestion_Comercial;
CREATE TABLE client (
    numClient INT(11)  AUTO_INCREMENT ,
    raisonSocial VARCHAR(10) NOT NULL,
    adresseClient VARCHAR(50) NOT NULL,
    villeClient VARCHAR(20) NOT NULL,
    telephone VARCHAR(15) UNIQUE NOT NULL,
    PRIMARY KEY(numClient)
);

CREATE TABLE commande(
    numCommande INT(11) AUTO_INCREMENT, 
    numClient INT(11) NOT NULL,
    dateCommande DATE NOT NULL,
    CONSTRAINT fk_num_client FOREIGN KEY(numClient) REFERENCES client(numClient),
    PRIMARY KEY(numCommande)
);

CREATE TABLE produit(
    refProduit VARCHAR(20) PRIMARY KEY,
    nomProduit VARCHAR(20) NOT NULL,
    prixUnitaire FLOAT(4) NOT NULL,
    qteStockee INT(11) NOT NULL,
    disponible BOOLEAN NOT NULL
);

CREATE TABLE details_commande(
    numCommande INT(11),
    refProduit VARCHAR(20),
    qteCommandee INT(11) NOT NULL,
    CONSTRAINT fk_num_commande FOREIGN KEY(numCommande) REFERENCES commande(numCommande),
    CONSTRAINT fk_ref_produit FOREIGN KEY(refProduit) REFERENCES produit(refProduit),
    PRIMARY KEY(numCommande,refProduit)
);

#---------------------------------------------------------------------------------------------| Remplir les champs du client |---------------------------------------------------------------------------------------------

insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('ARHC', '4415 Merrick Hill', 'Agadir', '0666186824');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('MACQW', '645 Sunbrook Park', 'Boujdour', '0764742545');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('TLP', '4131 Hanover Crossing', 'Agadir', '0745022597');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('ACH', '81671 Burrows Park', 'Casablanca', '0617924003');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('EQR', '73927 Loeprich Court', 'Casablanca', '0609747660');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('JAZZ', '6 Caliangt Point', 'Casablanca', '0614485269');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('FIG', '7729 Parkside Parkway', 'Agadir', '0684054738');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('DEX', '578 Warrior Trail', 'Casablanca', '0702923268');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('WGO', '43207 Longview Court', 'Casablanca', '0641881813');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('CHTR', '8617 Rowland Center', 'Ouarzazate', '0663194227');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('BNY', '2503 Goodland Alley', 'Marrakech', '0678297587');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('TRHC', '008 David Trail', 'Ouarzazate', '0666892894');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('NOV', '4 Logan Plaza', 'Ouarzazate', '0712105813');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('IDLB', '5 2nd Park', 'Ouarzazate', '0729220928');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('PERI', '2834 Jenifer Circle', 'Casablanca', '0618246884');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('CBM', '6 Marcy Terrace', 'Ouarzazate', '0603408347');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('VBTX', '629 Autumn Leaf Court', 'Ouarzazate', '0649173849');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('RMBS', '89 Pawling Plaza', 'Marrakech', '0618616199');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('UFPI', '451 Merry Junction', 'Ouarzazate', '0714539853');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('HBIO', '1 Sundown Circle', 'Zagora', '0692930580');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('KLMO', '2 Rainblue choco', 'Rabat', '0682650550');
insert into client (raisonSocial, adresseClient, villeClient, telephone) values ('AXE', '1 Fleurssun Kenz', 'Rabat', '0602730581');

#---------------------------------------------------------------------------------------------|Remplir les champs du produit |---------------------------------------------------------------------------------------------

insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF1', 'Capon - Breast, Double, Wing On', 5000, 92, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF2', 'Assorted Desserts', 430, 98, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF3', 'Glass - Wine, Plastic, Clear 5 Oz', 650, 70, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF4', 'Cheese - Brick With Onion', 4000, 91, true);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF5', 'Sea Bass - Fillets', 9000, 77, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF6', 'Extract - Raspberry', 799, 87, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF7', 'Compound - Passion Fruit', 1200,36, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF8', 'Wine - Red, Colio Cabernet', 395, 15, true);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF9', 'Onions - Red Pearl', 2300, 53, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF10', 'Pasta - Penne, Rigate, Dry', 400, 96, true);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF11', 'Bread - Calabrese Baguette', 2500, 57, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF12', 'Pastry - Apple Muffins - Mini', 50, 278, true);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF13', 'Chocolate Bar - Reese Pieces', 700, 367, true);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF14', 'Nut - Peanut, Roasted', 100, 84, true);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF15', 'Sage Ground Wiberg',200, 88, true);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF16', 'Liners - Baking Cups', 5500, 55, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF17', 'Spinach - Spinach Leaf', 304, 680, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF18', 'Bread - Raisin Walnut Pull', 8000, 65, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF19', 'Shrimp - Baby, Cold Water', 2880, 459, false);
insert into produit (refProduit, nomProduit, prixUnitaire, qteStockee, disponible) values ('REF20', 'Thyme - Dried', 4790, 351, true);

#---------------------------------------------------------------------------------------------| Remplir les champs du commande |--------------------------------------------------------------------------------------------

insert into commande (numCommande, numClient, dateCommande) values (1,4, '2022-01-26');
insert into commande (numCommande, numClient, dateCommande) values (2,1, '2021-09-12');
insert into commande (numCommande, numClient, dateCommande) values (3,4, '2022-05-19');
insert into commande (numCommande, numClient, dateCommande) values (4,20, '2022-04-13');
insert into commande (numCommande, numClient, dateCommande) values (5,5, '2022-08-05');
insert into commande (numCommande, numClient, dateCommande) values (6,1, '2022-08-18');
insert into commande (numCommande, numClient, dateCommande) values (7,1, '2022-07-28');
insert into commande (numCommande, numClient, dateCommande) values (8,6, '2021-12-09');
insert into commande (numCommande, numClient, dateCommande) values (9,18, '2021-09-22');
insert into commande (numCommande, numClient, dateCommande) values (10,17, '2021-12-04');
insert into commande (numCommande, numClient, dateCommande) values (11,16, '2022-07-15');
insert into commande (numCommande, numClient, dateCommande) values (12,15, '2022-07-15');
insert into commande (numCommande, numClient, dateCommande) values (13,14, '2021-09-27');
insert into commande (numCommande, numClient, dateCommande) values (14,13, '2022-09-18');
insert into commande (numCommande, numClient, dateCommande) values (15,12, '2022-02-05');
insert into commande (numCommande, numClient, dateCommande) values (16,11, '2022-01-14');
insert into commande (numCommande, numClient, dateCommande) values (17,10, '2022-02-05');
insert into commande (numCommande, numClient, dateCommande) values (18,9, '2022-01-13');
insert into commande (numCommande, numClient, dateCommande) values (19,8, '2022-01-17');
insert into commande (numCommande, numClient, dateCommande) values (20,7, '2022-02-22');
insert into commande (numCommande, numClient, dateCommande) values (21,6, '2022-01-27');
insert into commande (numCommande, numClient, dateCommande) values (22,5, '2021-10-20');
insert into commande (numCommande, numClient, dateCommande) values (23,4, '2022-02-03');
insert into commande (numCommande, numClient, dateCommande) values (24,3, '2022-03-29');
insert into commande (numCommande, numClient, dateCommande) values (25,2, '2021-10-01');
insert into commande (numCommande, numClient, dateCommande) values (26,1, '2021-11-14');
insert into commande (numCommande, numClient, dateCommande) values (27,20, '2022-05-30');
insert into commande (numCommande, numClient, dateCommande) values (28,19, '2022-08-28');
insert into commande (numCommande, numClient, dateCommande) values (29,15, '2022-02-02');
insert into commande (numCommande, numClient, dateCommande) values (30,10, '2022-08-20');
insert into commande (numCommande, numClient, dateCommande) values (31,3, '2022-09-02');
insert into commande (numCommande, numClient, dateCommande) values (32,20, '2021-09-20');
insert into commande (numCommande, numClient, dateCommande) values (33,18, '2021-11-08');
insert into commande (numCommande, numClient, dateCommande) values (34,17, '2022-07-09');
insert into commande (numCommande, numClient, dateCommande) values (35,16, '2021-08-21');
insert into commande (numCommande, numClient, dateCommande) values (36,14, '2022-04-16');
insert into commande (numCommande, numClient, dateCommande) values (37,5, '2022-02-04');
insert into commande (numCommande, numClient, dateCommande) values (38,4, '2022-04-07');
insert into commande (numCommande, numClient, dateCommande) values (39,2, '2021-09-04');
insert into commande (numCommande, numClient, dateCommande) values (40,20, '2022-05-24');
insert into commande (numCommande, numClient, dateCommande) values (41,18, '2022-05-18');
insert into commande (numCommande, numClient, dateCommande) values (42,16, '2021-10-03');
insert into commande (numCommande, numClient, dateCommande) values (43,11, '2021-12-13');
insert into commande (numCommande, numClient, dateCommande) values (44,1, '2022-10-13');
insert into commande (numCommande, numClient, dateCommande) values (45,13, '2022-09-14');
insert into commande (numCommande, numClient, dateCommande) values (46,2, '2021-12-28');
insert into commande (numCommande,  numClient,dateCommande) values (47,9, '2022-03-23');
insert into commande (numCommande, numClient, dateCommande) values (48,9, '2022-08-04');
insert into commande (numCommande,  numClient,dateCommande) values (49,8, '2021-12-18');
insert into commande (numCommande, numClient, dateCommande) values (50,7, '2021-12-31');
insert into commande (numCommande,  numClient,dateCommande) values (51,7, '2021-11-07');
insert into commande (numCommande, numClient, dateCommande) values (52,7, '2022-08-21');
insert into commande (numCommande,  numClient,dateCommande) values (53,8, '2022-05-25');
insert into commande (numCommande,  numClient,dateCommande) values (54,16, '2022-05-01');
insert into commande (numCommande,  numClient,dateCommande) values (55,20, '2022-08-05');
insert into commande (numCommande,  numClient,dateCommande) values (56,17, '2021-12-29');
insert into commande (numCommande,  numClient,dateCommande) values (57,4, '2022-03-18');
insert into commande (numCommande,numClient, dateCommande) values (58,3, '2022-04-14');
insert into commande (numCommande,  numClient,dateCommande) values (59,9, '2022-03-16');
insert into commande (numCommande, numClient, dateCommande) values (60,12, '2021-12-22');
insert into commande (numCommande,  numClient,dateCommande) values (61,15, '2022-01-03');
insert into commande (numCommande,  numClient,dateCommande) values (62,17, '2022-03-17');
insert into commande (numCommande, numClient, dateCommande) values (63,19, '2022-03-02');
insert into commande (numCommande,  numClient,dateCommande) values (64,14, '2021-12-07');
insert into commande (numCommande,  numClient,dateCommande) values (65,12, '2022-10-09');
insert into commande (numCommande, numClient, dateCommande) values (66,15, '2022-03-06');
insert into commande (numCommande,  numClient,dateCommande) values (67,20, '2022-07-20');
insert into commande (numCommande,  numClient,dateCommande) values (68,18, '2021-12-05');
insert into commande (numCommande,  numClient,dateCommande) values (69,18, '2021-10-07');
insert into commande (numCommande,  numClient,dateCommande) values (70,10, '2022-03-13');
insert into commande (numCommande,  numClient,dateCommande) values (71,11, '2022-04-25');
insert into commande (numCommande,  numClient,dateCommande) values (72,12, '2022-06-27');
insert into commande (numCommande,  numClient,dateCommande) values (73,13, '2022-09-13');
insert into commande (numCommande,  numClient,dateCommande) values (74,16, '2022-10-08');
insert into commande (numCommande, numClient, dateCommande) values (75,4, '2022-03-11');
insert into commande (numCommande,  numClient,dateCommande) values (76,1, '2021-09-08');
insert into commande (numCommande, numClient, dateCommande) values (77,1, '2021-09-04');
insert into commande (numCommande, numClient, dateCommande) values (78,5, '2022-03-11');
insert into commande (numCommande, numClient, dateCommande) values (79,3, '2022-08-27');
insert into commande (numCommande, numClient, dateCommande) values (80,5, '2022-06-10');
insert into commande (numCommande, numClient, dateCommande) values (81,6, '2021-11-26');
insert into commande (numCommande, numClient, dateCommande) values (82,16, '2022-02-07');
insert into commande (numCommande, numClient, dateCommande) values (83,17, '2022-09-29');
insert into commande (numCommande, numClient, dateCommande) values (84,18, '2021-12-14');
insert into commande (numCommande, numClient, dateCommande) values (85,19, '2022-06-07');
insert into commande (numCommande, numClient, dateCommande) values (86,20, '2022-01-20');
insert into commande (numCommande, numClient, dateCommande) values (87,12, '2021-08-26');
insert into commande (numCommande,  numClient,dateCommande) values (88,2, '2022-06-20');
insert into commande (numCommande,  numClient,dateCommande) values (89,3, '2022-08-15');
insert into commande (numCommande,  numClient,dateCommande) values (90,2, '2021-09-30');
insert into commande (numCommande, numClient, dateCommande) values (91,1, '2022-01-06');
insert into commande (numCommande, numClient, dateCommande) values (92,1, '2021-12-24');
insert into commande (numCommande, numClient, dateCommande) values (93,2, '2021-10-25');
insert into commande (numCommande,  numClient,dateCommande) values (94,16, '2022-02-03');
insert into commande (numCommande,  numClient,dateCommande) values (95,17, '2022-05-22');
insert into commande (numCommande,  numClient,dateCommande) values (96,18, '2022-02-25');
insert into commande (numCommande, numClient, dateCommande) values (97,16, '2022-09-20');
insert into commande (numCommande, numClient, dateCommande) values (98,20, '2021-09-22');
insert into commande (numCommande,  numClient,dateCommande) values (99,19, '2021-12-26');
insert into commande (numCommande,  numClient,dateCommande) values (100,5, '2022-04-18');


#--------------------------------------------------------------------------------------------| Remplir les champs du details_commande |---------------------------------------------------------------------------------------------

insert into details_commande (numCommande,refProduit,qteCommandee) values (1 ,'REF2' ,5);
insert into details_commande (numCommande,refProduit,qteCommandee) values (14 ,'REF1' ,3);
insert into details_commande (numCommande,refProduit,qteCommandee) values (33 ,'REF5' ,15);
insert into details_commande (numCommande,refProduit,qteCommandee) values (12 ,'REF20' ,1);
insert into details_commande (numCommande,refProduit,qteCommandee) values (17 ,'REF4' ,15);
insert into details_commande (numCommande,refProduit,qteCommandee) values (100 ,'REF2' ,6);
insert into details_commande (numCommande,refProduit,qteCommandee) values (10 ,'REF1' ,7);
insert into details_commande (numCommande,refProduit,qteCommandee) values (66 ,'REF3' ,51);
insert into details_commande (numCommande,refProduit,qteCommandee) values (1 ,'REF4' ,12);
insert into details_commande (numCommande,refProduit,qteCommandee) values (1 ,'REF16' ,5);
insert into details_commande (numCommande,refProduit,qteCommandee) values (11 ,'REF20' ,30);
insert into details_commande (numCommande,refProduit,qteCommandee) values (1 ,'REF18' ,55);
insert into details_commande (numCommande,refProduit,qteCommandee) values (79 ,'REF15' ,10);
insert into details_commande (numCommande,refProduit,qteCommandee) values (54 ,'REF6' ,11);
insert into details_commande (numCommande,refProduit,qteCommandee) values (12 ,'REF5' ,2);
insert into details_commande (numCommande,refProduit,qteCommandee) values (100 ,'REF3' ,8);
insert into details_commande (numCommande,refProduit,qteCommandee) values (35 ,'REF4' ,54);
insert into details_commande (numCommande,refProduit,qteCommandee) values (2 ,'REF1' ,9);
insert into details_commande (numCommande,refProduit,qteCommandee) values (5 ,'REF6' ,6);
insert into details_commande (numCommande,refProduit,qteCommandee) values (6 ,'REF13' ,55);
insert into details_commande (numCommande,refProduit,qteCommandee) values (9 ,'REF12' ,12);
insert into details_commande (numCommande,refProduit,qteCommandee) values (16 ,'REF15' ,2);
insert into details_commande (numCommande,refProduit,qteCommandee) values (18 ,'REF18' ,3);
insert into details_commande (numCommande,refProduit,qteCommandee) values (30 ,'REF19' ,7);
insert into details_commande (numCommande,refProduit,qteCommandee) values (99 ,'REF11' ,43);
insert into details_commande (numCommande,refProduit,qteCommandee) values (98 ,'REF2' ,4);
insert into details_commande (numCommande,refProduit,qteCommandee) values (96 ,'REF1' ,22);
insert into details_commande (numCommande,refProduit,qteCommandee) values (88 ,'REF3' ,7);
insert into details_commande (numCommande,refProduit,qteCommandee) values (67 ,'REF5' ,10);
insert into details_commande (numCommande,refProduit,qteCommandee) values (53,'REF1' ,5);
insert into details_commande (numCommande,refProduit,qteCommandee) values (44 ,'REF2' ,6);
insert into details_commande (numCommande,refProduit,qteCommandee) values (23 ,'REF3' ,45);
insert into details_commande (numCommande,refProduit,qteCommandee) values (13 ,'REF4' ,8);
insert into details_commande (numCommande,refProduit,qteCommandee) values (95 ,'REF6' ,5);
insert into details_commande (numCommande,refProduit,qteCommandee) values (87 ,'REF5' ,51);
insert into details_commande (numCommande,refProduit,qteCommandee) values (75 ,'REF7' ,34);
insert into details_commande (numCommande,refProduit,qteCommandee) values (2 ,'REF3' ,4);
insert into details_commande (numCommande,refProduit,qteCommandee) values (3 ,'REF7' ,3);
insert into details_commande (numCommande,refProduit,qteCommandee) values (4 ,'REF6' ,12);
insert into details_commande (numCommande,refProduit,qteCommandee) values (5 ,'REF20' ,5);
insert into details_commande (numCommande,refProduit,qteCommandee) values (6 ,'REF6' ,6);
insert into details_commande (numCommande,refProduit,qteCommandee) values (7 ,'REF9' ,20);
insert into details_commande (numCommande,refProduit,qteCommandee) values (8 ,'REF7' ,34);
insert into details_commande (numCommande,refProduit,qteCommandee) values (10 ,'REF5' ,4);
insert into details_commande (numCommande,refProduit,qteCommandee) values (9 ,'REF19' ,3);
