-- 11.	What are the numbers of nuclear weapons in military bases in 2023 in countries with the most number of retired nuclear weapons in 2023?
# finding nuclear weapons in military bases for countries with most nuclear weapons retired
SELECT WSI.entity, WSI.nuclear_weapons_stockpile, WI.nuclear_weapons_retired
FROM nuclear_weapons.`warhead-stockpiles-lines` WSI
INNER JOIN
(SELECT entity, nuclear_weapons_retired FROM nuclear_weapons.`warhead-inventories`
WHERE year=2023 AND nuclear_weapons_retired<>0
ORDER BY nuclear_weapons_retired DESC) WI
ON WSI.entity=WI.entity
WHERE WSI.year=2023;