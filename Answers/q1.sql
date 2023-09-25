-- What are the total areas of bordering countries per area of all the countries in the world?
select x.country_name, x.area as border_countries_area, cast(x.area as float)/y.area*100 as border_countries_area_percentage from
(select cbp.country_name, sum(cbp.area) as area from
(select cb.country_name, cb.country_border_name, p.area from nuclear_weapons.`country-borders` cb
inner join nuclear_weapons.`population-2020` p
on cb.country_border_name = p.country) cbp
group by cbp.country_name) x, (select sum(area) as area from nuclear_weapons.`population-2020`) y
order by country_name;