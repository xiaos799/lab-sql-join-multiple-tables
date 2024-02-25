use sakila;

#1 Write a query to display for each store its store ID, city, and country.
select * from store; #store_id, address_id
select * from address; #address_id, city_id
select * from city; #city_id, city, country_id
select * from country; #country_id, country

select store_id, city, country from store
join address using (address_id)
join city using (city_id)
join country using (country_id);


#2 Write a query to display how much business, in dollars, each store brought in.
select * from staff;
select * from payment;

select store_id, sum(amount) from staff
join payment using (staff_id)
group by store_id;


#3 What is the average running time of films by category?
select * from film;
select * from film_category;
select * from category;

select name, avg(length) from film 
join film_category using (film_id)
join category using (category_id)
group by name;


#4 Which film categories are longest?
select name, avg(length) as mean_length from film 
join film_category using (film_id)
join category using (category_id)
group by name
order by mean_length desc limit 1;


#5 Display the most frequently rented movies in descending order.
select * from rental;
select * from inventory;

select title, count(rental_id) frequency from film 
join inventory using (film_id)
join rental using (inventory_id)
group by title
order by frequency desc limit 1;


#6 List the top five genres in gross revenue in descending order.
select * from payment; #rental_id, amount 
select * from rental; #rental_id, inventory_id
select * from inventory; # inventory_id, film_id
select * from film_category; #film_id, category_id
select * from category; #category_id, name

select sum(amount) as revenue, name
from payment join rental using (rental_id)
join inventory using (inventory_id)
join film_category using (film_id)
join category using (category_id)
group by name
order by revenue desc limit 5;


#7 Is "Academy Dinosaur" available for rent from Store 1?
select * from film where title = 'Academy Dinosaur'; #film_id =1
select * from film;
select * from inventory;

select count(inventory_id) inventory from inventory
join film using (film_id)
where title = 'Academy Dinosaur' and store_id = 1;



