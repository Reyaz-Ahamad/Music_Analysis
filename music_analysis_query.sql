
-- 1. Who is the senior most employee based on job title? 

select * from employee
order by levels desc
limit 1;

select * from employee
where employee_id='9';



-- Which countries have the most Invoices? 


select * from invoice


select billing_country,count(*) from invoice
group by billing_country 
order by billing_country desc
limit 1


	
-- What are top 3 values of total invoice? 

	
select total from invoice
order by total desc
	limit 3



	
-- Which city has the best customers? We would like to throw a promotional Music 
-- Festival in the city we made the most money. Write a query that returns one city that 
-- has the highest sum of invoice totals. Return both the city name & sum of all invoice 
-- totals 

select * from invoice

select billing_city , sum(total) as total_sum from invoice
group by billing_city
order by total_sum desc
limit 1



-- Who is the best customer? The customer who has spent the most money will be 
-- declared the best customer. Write a query that returns the person who has spent the 
-- most money 


select customer.customer_id , customer.first_name, customer.last_name, sum(total)as total 
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1



--  Write query to return the email, first name, last name, & Genre of all Rock Music 
-- listeners. Return your list ordered alphabetically by email starting with A 

select * from customer
 
select * from genre

select first_name, last_name, email, name from customer
join genre on customer_id = genre_id


-- Let's invite the artists who have written the most rock music in our dataset. Write a 
-- query that returns the Artist name and total track count of the top 10 rock bands 

--join multiple columns in single 

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


-- Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the 
-- longest songs listed first 


select name, milliseconds from track
	where milliseconds > (select avg(milliseconds) from track)
	order by milliseconds desc



-- Find how much amount spent by each customer on artists? Write a query to show
-- customer name, artist name and total spent

	
select
    customer.first_name,
    customer.last_name,
    artist.name as artist_name,
    sum(invoice_line.unit_price * quantity) as total_spent
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join album on track.album_id = album.album_id
join artist on album.artist_id = artist.artist_id
group by customer.first_name, customer.last_name, artist.name
order by customer.first_name, customer.last_name, artist.name;



-- We want to find out the most popular music Genre for each country. We determine the 
-- most popular genre as the genre with the highest amount of purchases. Write a query 
-- that returns each country along with the top Genre. For countries where the maximum 
-- number of purchases is shared return all Genres


select employee.first_name,
       customer.state 
from employee
join customer on employee.employee_id = customer.customer_id;

