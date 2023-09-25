-- What are the total nuclear weapons deployed strategically, deployed non-strategically, reserved and retired per year on average?
select year, sum(nuclear_weapons_depl_strat), sum(nuclear_weapons_depl_nonstrat),
sum(nuclear_weapons_reserve_nondepl), sum(nuclear_weapons_retired)
from nuclear_weapons.`warhead-inventories`
group by year;