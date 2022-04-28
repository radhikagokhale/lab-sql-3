-- 1. How many distinct (different) actors' last names are there?
select distinct(last_name) 
from actor ;
-- 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
select distinct(language_id )
from film;
-- 3. How many movies were released with `"PG-13"` rating?
select count(rating) as num_of_pg_13_movies
from film
where rating = 'PG-13';
-- 4. Get 10 the longest movies from 2006.
select title, length 
from film
where release_year = '2006'
order by length desc
limit 10;
-- 5. How many days has been the company operating (check `DATEDIFF()` function)?
select datediff(max(last_update), min(payment_date)) as total_days
from payment;

-- 6. Show rental info with additional columns month and weekday. Get 20.
select *, date_format(rental_date, '%M') as month 
        ,date_format(rental_date, '%W') as weekday
from rental
limit 20;
-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
select *, date_format(rental_date, '%M') as month 
        ,date_format(rental_date, '%W') as weekday,
case
when date_format(rental_date, '%w') = 6 then 'weekend'
when date_format(rental_date, '%w') = 7 then 'weekend'
else 'workday'
end as day_of_week
from rental;
-- 8. How many rentals were in the last month of activity?
select count(rental_id) as rental_last_month
from rental
where rental_date > date_add(last_update, interval -1 month);
