-- What are the nuclear weapons statuses and numbers of nuclear weapons tests performed by countries bordering the countries involved in cold war (USA and Russia) in the latest year?
with x as 
(select cbp.country_name, cbp.country_border_name, cbp.nuclear_weapons_status,
wt.nuclear_weapons_tests, wt.year from
(select cb.country_name, cb.country_border_name, cp.nuclear_weapons_status, cp.year
from nuclear_weapons.`country-borders` cb
inner join nuclear_weapons.`country-position` cp
on cb.country_border_name = cp.entity
where cb.country_name IN ('Russian Federation', 'United States of America')) cbp
inner join nuclear_weapons.`weapons-tests` wt
on cbp.country_border_name = wt.entity and cbp.year=wt.year)

select * from x
where year in (
select max(year) from x
);
