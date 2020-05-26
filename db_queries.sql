-- 
-- Seleziona tutti gli ospiti che sono stati identificati con la carta di identità
--
SELECT * 
FROM `ospiti` 
WHERE `document_type` = 'CI';

--
-- Seleziona tutti gli ospiti che sono nati dopo il 1988
--
SELECT * 
FROM `ospiti` 
WHERE `date_of_birth` > '1988-12-01';

--
-- Seleziona tutti gli ospiti che hanno più di 20 anni (al momento dell’esecuzione della query)
--
SELECT * 
FROM `ospiti` 
WHERE YEAR(CURDATE()) - YEAR(`date_of_birth`) > '20';

--
-- Seleziona tutti gli ospiti il cui nome inizia con la D
-- 
SELECT * FROM `ospiti` WHERE `name` LIKE 'D%';

--
-- Calcola il totale degli ordini accepted
--
SELECT SUM(`price`) 
AS 'total' 
FROM `pagamenti` 
WHERE `status` = 'accepted';

--
-- Qual è il prezzo massimo pagato?
--
SELECT MAX(`price`) 
AS 'highest_price' 
FROM `pagamenti`
WHERE `status` = 'accepted';

--
-- Seleziona gli ospiti riconosciuti con patente e nati nel 1975
--
SELECT * 
FROM `ospiti` 
WHERE `document_type` = 'Driver License' 
AND YEAR(`date_of_birth`) = '1975';

--
-- Quanti posti letto ha l’hotel in totale?
--
SELECT SUM(`beds`) 
FROM `stanze` 
AS `total_beds`;
