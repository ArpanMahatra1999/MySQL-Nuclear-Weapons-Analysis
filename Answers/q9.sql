-- 9.	Which are the years with the most nuclear weapons possessing countries in the world?
# years and number of countries possessing nuclear weapons
CREATE VIEW possessors AS
SELECT year, count(*) AS countries FROM nuclear_weapons.`country-position`
WHERE nuclear_weapons_status=3
GROUP BY year;

# years with maximum possessors of nuclear weapons
SELECT * FROM possessors
WHERE countries=(
SELECT max(countries) from possessors
);