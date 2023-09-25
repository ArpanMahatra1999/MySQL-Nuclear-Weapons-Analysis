-- Which are the continent names that tested none of the nuclear weapons in history and numbers of countries in those continents?
select ccwt.continent from
(select cc.country, cc.continent, wt.total_tests from nuclear_weapons.`country-continent` cc
left join (SELECT entity, sum(nuclear_weapons_tests) as total_tests FROM nuclear_weapons.`weapons-tests`
group by entity) wt
on cc.country = wt.entity) ccwt
where ccwt.continent != 'continent'
group by ccwt.continent
having sum(ccwt.total_tests) is NULL;