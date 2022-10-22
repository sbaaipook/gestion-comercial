#-- 1
SELECT * 
FROM `client`;
#-- 2
SELECT * 
FROM `produit`;
#-- 3
SELECT `numClient` as `Numero client`,`villeClient` as `Ville client`
FROM `client`;
#-- 4
SELECT `numClient` as `Numero`,`raisonSocial` as `Raison Social`, `telephone`
FROM `client`;
#-- 5
SELECT *
FROM `client`
WHERE `numClient` = 15;
#-- 6
SELECT * 
FROM `client` 
ORDER BY `raisonSocial` DESC;
#--7
SELECT * 
FROM `client`
ORDER BY `raisonSocial` DESC,`villeClient` ASC;
#-- 8
SELECT * 
FROM `client` 
WHERE `raisonSocial` LIKE 'S%';
#-- 9
SELECT * 
FROM `client` 
WHERE `raisonSocial` LIKE '%E';
#-- 10
SELECT * 
FROM `client` 
WHERE `raisonSocial` LIKE 'A%E';
#-- 11
SELECT * 
FROM `client` 
WHERE `raisonSocial` LIKE 'A%'
OR `raisonSocial` LIKE '%E';
#-- 12
SELECT *
FROM `client`
WHERE `villeClient` IN ('Casablanca','Ouarzazate','Rabat');
#-- 13
SELECT *
FROM `produit`
WHERE `prixUnitaire` = 300;
#-- 14
SELECT *
FROM `produit`
WHERE `prixUnitaire` < 300;
#-- 15
SELECT *
FROM `produit`
WHERE `prixUnitaire` BETWEEN 300 AND 5000;
#--16
SELECT * 
FROM `produit` 
WHERE `disponible` IS true
#-- 17
SELECT * 
FROM `produit` 
WHERE `disponible` IS NOT true
AND `prixUnitaire` > 300;
#-- 18
SELECT *
FROM `commande`
WHERE `dateCommande` = date('2016-01-11');
#-- 19
SELECT * 
FROM `commande` 
WHERE `dateCommande` > date('2016-01-11');
#-- 20
#01/02/2016 et 31/03/2016.
SELECT *
FROM `commande`
WHERE `dateCommande` BETWEEN date('2021-01-01') AND date('2021-12-31');
#--21
SELECT *
FROM `commande`
WHERE `dateCommande` = CURDATE();
#-- 22
SELECT *
FROM `commande`
WHERE year(`dateCommande`) = year(curdate());
#-- 23
SELECT *
FROM `commande`
WHERE month(`dateCommande`) = month('0000-07-00');
#-- 24
SELECT *, (`prixUnitaire`*`qteStockee`) as `Prix de Stock`
FROM `produit`;
#--25
SELECT *,((prixUnitaire*0.2) + prixUnitaire) AS `Prix TTC` 
FROM produit;
#-- 26
SELECT DISTINCT `villeClient` 
FROM `client`;
#-- 27
SELECT DISTINCT cl.*
FROM `client` cl
JOIN `commande` co
ON cl.numClient = co.numClient

SELECT cl.* ,co.numCommande
FROM `client` cl
JOIN `commande` co
ON cl.numClient = co.numClient
GROUP BY cl.numClient

#-- 28
SELECT DISTINCT p.* 
FROM `produit` p
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` c
ON c.numCommande = d.numCommande
#-- 29
SELECT co.*
FROM `commande` co
JOIN `client` cl
ON co.numClient = cl.numClient
WHERE cl.numClient = 15;
#-- 30
SELECT p.*
FROM `produit` p
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` co 
ON d.numCommande = co.numCommande
WHERE co.numCommande = 5;
#-- 31
#2022-03-06
SELECT p.*,co.dateCommande
FROM `produit` p 
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` co
ON co.numCommande = d.numCommande
WHERE co.dateCommande = date('2020-09-19');
#-- 32
SELECT p.nomProduit,cl.villeClient as `Ville client`
FROM `produit` p
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` co
ON co.numCommande = d.numCommande
JOIN `client` cl
ON cl.numClient = co.numClient
WHERE cl.villeClient = 'Madrid' #Ouarzazate
GROUP BY p.nomProduit
#-- 33
SELECT p.*
FROM `produit` p
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` co
ON d.numCommande = co.numCommande
JOIN `client` cl
ON cl.numClient = co.numClient
WHERE cl.numClient = 15;
#-- 34
SELECT COUNT(*) as `Nombre des clients`
FROM `client`;
#-- 35
SELECT COUNT(*) as `Nombre des clients`
FROM `client`
WHERE `villeClient` = 'Agadir'; #Berlin
#-- 36
SELECT COUNT(*) as `Nombre des produit disponible`
FROM `produit`
WHERE `disponible` IS true;
#-- 37
SELECT COUNT(*) as `Nombre des produit disponible`
FROM `produit`
WHERE `disponible` IS NOT true;
#-- 38
SELECT MAX(produit.prixUnitaire) as `Grand prix`
FROM `produit`;
#-- 39
SELECT MIN(produit.prixUnitaire) as `Petit prix`
FROM `produit`;
#-- 40
SELECT AVG(produit.prixUnitaire) as `Moyenne des prix`
FROM `produit`;
#--41
SELECT SUM(produit.prixUnitaire) as `Somme des prix`
FROM `produit`
#--42
-- DELIMITER //
-- CREATE PROCEDURE nombreCommande(IN numClient int,OUT total int)
-- BEGIN
-- 	SELECT COUNT(co.*) INTO total
--   FROM `commande` co
--   JOIN `client` cl
--   ON co.numClient = cl.numClient
--   WHERE cl.numClient = numClient;
-- END //

CALL nombreCommande(1,@total);
SELECT @total as `Nombre commande`;
#-- 43
SELECT cl.*,COUNT(co.numCommande) as `Nombre commande`
FROM `client` cl 
JOIN `commande` co
ON cl.numClient = co.numClient
GROUP BY co.numClient
HAVING COUNT(co.numCommande) > 2;
#-- 44
SELECT cl.raisonSocial, COUNT(p.refProduit) AS `Nombre  produit`
FROM produit p 
JOIN details_commande d 
ON p.refProduit = d.refProduit 
JOIN commande co 
ON co.numCommande = d.numCommande 
JOIN client cl 
ON co.numClient = cl.numClient
GROUP BY cl.raisonSocial
#-- 45
SELECT cl.* 
FROM `client` cl
LEFT JOIN `commande` co
ON cl.numClient = co.numClient
WHERE co.numClient IS null;
#-- 46
SELECT p.* 
FROM `produit` p
LEFT JOIN `details_commande` d
ON p.refProduit = d.refProduit
WHERE d.refProduit IS null
#-- 47
SELECT produit.qteStockee 
FROM `produit`;
#-- 48
SELECT co.numCommande,SUM(p.prixUnitaire) as `Montant`
FROM `commande` co
JOIN `details_commande` d
ON co.numCommande = d.numCommande
JOIN `produit` p
ON d.refProduit = p.refProduit
GROUP BY co.numCommande
HAVING SUM(p.prixUnitaire);
#-- 49
DELIMITER //
CREATE FUNCTION urf_checkStock (stock int)
RETURNS VARCHAR(50)
BEGIN
	DECLARE msg VARCHAR(50);
	IF stock < 10 THEN
		SET msg = 'Besoin en réapprovisionnement';
	ELSE 
		SET msg = 'quantité Suffisante';
	END IF;
	RETURN msg;
END //

SELECT urf_checkStock(qteStockee) as `Message`
FROM `produit`;
#--50
SELECT co.*
FROM `commande` co
JOIN `client` cl
ON co.numClient = cl.numClient
WHERE cl.villeClient = 'Zagora' #Madrid
#-- 51
SELECT co.*,cl.villeClient
FROM `commande` co 
JOIN `client` cl
ON co.numClient = cl.numClient
#-- 53
SELECT client.villeClient,client.adresseClient
FROM `client`
