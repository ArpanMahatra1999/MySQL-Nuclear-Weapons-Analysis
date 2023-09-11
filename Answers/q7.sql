-- 7.	What are the net migrants in 2020 for the top 10 countries with most nuclear weapons tests in any single year? 
select country,  avg(WT.nuclear_weapons_tests), avg(net_migrants)
from nuclear_weapons.`population-2020` P20
join (select * from nuclear_weapons.`weapons-tests` where year<2000) WT on WT.entity=P20.country
group by country
order by avg(WT.nuclear_weapons_tests) desc 
limit 10;
