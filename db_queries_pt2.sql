--
-- Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
--
SELECT `ospite_id`, `ospiti`.`name`, `ospiti`.`lastname`, COUNT(`ospite_id`) AS `total_guest_bookings` 
FROM `prenotazioni_has_ospiti` 
INNER JOIN `ospiti` 
ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id` 
GROUP BY `ospite_id` 
HAVING COUNT(`ospite_id`) > 2;

--
-- Stampare tutti gli ospiti per ogni prenotazione
--
SELECT `ospite_id`, `ospiti`.`name`, `ospiti`.`lastname`, `prenotazioni_has_ospiti`.`prenotazione_id` 
FROM `prenotazioni_has_ospiti` 
INNER JOIN `ospiti` 
ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id`

--
-- Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018
--
SELECT `name`, `lastname`, `pagamenti`.`price`, `prenotazioni`.`created_at`
FROM `paganti`
INNER JOIN `pagamenti`
ON `paganti`.`id` = `pagamenti`.`pagante_id`
INNER JOIN `prenotazioni`
ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
HAVING `prenotazioni`.`created_at` BETWEEN '2018-05-01' AND '2018-05-31';

--
-- Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano
--
SELECT SUM(`pagamenti`.`price`) AS `pagamenti_primo_piano`
FROM `prenotazioni`
INNER JOIN `stanze`
ON `stanze`.`id` = `prenotazioni`.`stanza_id` AND  `stanze`.`floor` = 1
INNER JOIN `pagamenti`
ON `pagamenti`.`prenotazione_id` = `prenotazioni`.`id`

--
-- Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate)
--

--
-- Conta gli ospiti raggruppandoli per anno di nascita
-- 
SELECT COUNT(`id`) AS `numero_nati`, YEAR(`date_of_birth`) AS `yob`
FROM `ospiti`
GROUP BY `yob_ospiti`

--
-- Somma i prezzi dei pagamenti raggruppandoli per status
--
SELECT SUM(`price`) 
FROM `pagamenti` 
GROUP BY `status`

--
-- Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni?
--
SELECT `ospite_id`, COUNT(`prenotazione_id`) AS `numero_prenotazioni`
FROM `prenotazioni_has_ospiti`
GROUP BY `ospite_id`  
ORDER BY `numero_prenotazioni` DESC
LIMIT 1
