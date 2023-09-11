-- 6. What is the total percentage of world area and world population shared by the countries performing most nuclear weapons tests in history?
with popu_ext as (select *, round(100*area/(select sum(area) as total_area from nuclear_weapons.`population-2020`)) as area_per from nuclear_weapons.`population-2020`)

select PE.country, avg(PE.population), avg(PE.area_per) as area_percentage 
from popu_ext as PE
join nuclear_weapons.`country-borders` CB on CB.country_name=PE.country
-- join weapons_tests WT on WT.code=CB.country_code
-- where WT.nuclear_weapons_tests>0
group by country;