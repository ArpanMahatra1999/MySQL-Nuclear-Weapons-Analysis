-- 10.	What are the average population densities of countries with and with no zero nuclear weapons status in 2020?
# finding average population density of countries with and without 0 status of nuclear weapons in 2020
SELECT status, AVG(density) AS average_density FROM
(SELECT P0.density AS density, P0.country AS country, 0 AS status FROM nuclear_weapons.`population-2020` P0
INNER JOIN
(SELECT entity, nuclear_weapons_status FROM nuclear_weapons.`country-position`
WHERE year=2020 AND nuclear_weapons_status=0) CP0
ON P0.country=CP0.entity
UNION
SELECT PN0.density AS density, PN0.country AS country, 1 AS status FROM nuclear_weapons.`population-2020` PN0
INNER JOIN
(SELECT entity, nuclear_weapons_status FROM nuclear_weapons.`country-position`
WHERE year=2020 AND nuclear_weapons_status<>0) CPN0
ON PN0.country=CPN0.entity) X
GROUP BY status;