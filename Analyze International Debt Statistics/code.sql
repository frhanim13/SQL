
-- num_distinct_countries 
select 
count(distinct country_name) as  total_distinct_countries

from international_debt

-- highest_debt_country 

select 
country_name,
sum(debt) as total_debt

from international_debt
group by country_name
order by total_debt desc
limit 5

-- lowestt_debt_country 

select 
country_name,
sum(debt) as total_debt

from international_debt
group by country_name
order by total_debt asc
limit 5








