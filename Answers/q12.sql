-- 12.	What are the average HDI and average GDP per capita of the countries possessing and not possessing nuclear weapons in 2021?
# create view for countries possessing and not possessing nuclear weapons in 2021
CREATE VIEW possessors AS (SELECT entity, 1 AS status FROM nuclear_weapons.`country-position`
WHERE year=2021 AND nuclear_weapons_status=3
UNION
SELECT entity, 0 AS status FROM nuclear_weapons.`country-position`
WHERE year=2021 AND nuclear_weapons_status<>3);

# create view for countries with HDI data in 2021
CREATE VIEW hgh AS
(SELECT entity, CAST(HDI AS FLOAT) AS HDI
FROM nuclear_weapons.`hdi-and-gdp-per-capita`
WHERE HDI<>0.0 AND year=2021);

# create view for countries with GDP per capita data in 2021
CREATE VIEW hgg AS
(SELECT entity, CAST(`GDP per capita (USD)` AS FLOAT) AS GDP_per_capita
FROM nuclear_weapons.`hdi-and-gdp-per-capita`
WHERE `GDP per capita (USD)`<>0.0 AND year=2021);

# find average HDI and average GDP per capita for possessors and non-possessors of nuclear weapons in 2021
SELECT PH.status, PH.avg_HDI, PG.avg_GDP_per_capita FROM
(SELECT P.status, AVG(H.HDI) AS avg_HDI FROM possessors P
INNER JOIN hgh H
GROUP BY P.status) PH
INNER JOIN
(SELECT P.status, AVG(G.GDP_per_capita) AS avg_GDP_per_capita FROM possessors P
INNER JOIN hgg G
GROUP BY P.status) PG
ON PH.status=PG.status;