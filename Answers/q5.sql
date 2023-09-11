-- 5. What are the continents with the lowest population and lowest urban population in 2020?
select CC.continent, sum(population) as total_population, sum(urban_population) as total_urban_population
from nuclear_weapons.`country-continent` CC
join nuclear_weapons.`population-2020` P20 on  CC.country=P20.country
group by CC.continent
order by sum(population), sum(urban_population);