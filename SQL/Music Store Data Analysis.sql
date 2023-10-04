/*	Question Set 1 */

/* Q1: Who is the senior most employee based on job title? */

SELECT TOP 1 title, first_name AS First_Name, last_name As Last_Name
FROM [dbo].[Music-employee]
ORDER BY levels DESC;

/* Q2: Which countries have the most Invoices? */

SELECT COUNT(*) AS c, billing_country 
FROM [dbo].[Music-invoice]
GROUP BY billing_country
ORDER BY c DESC;


/* Q3: What are top 3 values of total invoice? */

SELECT Top 3 total 
FROM [dbo].[Music-invoice]
ORDER BY total DESC;


/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

SELECT TOP 1 billing_city,SUM(total) AS InvoiceTotal
FROM [dbo].[Music-invoice]
GROUP BY billing_city
ORDER BY InvoiceTotal DESC;



/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

SELECT Top 1
    [dbo].[Music-customer].customer_id,[dbo].[Music-customer].first_name,[dbo].[Music-customer].last_name,total_spending
FROM [dbo].[Music-customer]
JOIN (SELECT [dbo].[Music-invoice].customer_id, SUM([dbo].[Music-invoice].total) AS total_spending
    FROM [dbo].[Music-invoice]
    GROUP BY [dbo].[Music-invoice].customer_id) AS customer_spending
ON [dbo].[Music-customer].customer_id = customer_spending.customer_id
ORDER BY total_spending DESC;


/* Question Set 2*/

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

SELECT DISTINCT email AS Email,first_name AS First_Name, last_name As Last_Name
FROM [dbo].[Music-customer]
JOIN [dbo].[Music-invoice] ON [dbo].[Music-customer].customer_id = [dbo].[Music-invoice].customer_id
JOIN [dbo].[Music-invoice_line] ON [dbo].[Music-invoice].invoice_id = [dbo].[Music-invoice_line].invoice_id
WHERE track_id IN(
	SELECT track_id FROM [dbo].[Music-track]
	JOIN [dbo].[Music-genre] ON [dbo].[Music-track].genre_id = [dbo].[Music-genre].genre_id
	WHERE [dbo].[Music-genre].name LIKE 'Rock'
)
ORDER BY email;


/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

SELECT TOP 10 [dbo].[artist].artist_id, [dbo].[artist].artist_name, COUNT([dbo].[artist].artist_id) AS number_of_songs
FROM [dbo].[Music-track]
JOIN [dbo].[album] ON [dbo].[album].album_id = [dbo].[Music-track].album_id
JOIN [dbo].[artist] ON [dbo].[artist].artist_id = [dbo].[album].artist_id
JOIN [dbo].[Music-genre] ON [dbo].[Music-genre].genre_id = [dbo].[Music-track].genre_id
WHERE [dbo].[Music-genre].name LIKE 'Rock'
GROUP BY [dbo].[artist].artist_id, [dbo].[artist].artist_name
ORDER BY number_of_songs DESC;


/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT track_name,milliseconds
FROM [dbo].[Music-track]
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM [dbo].[Music-track])
ORDER BY milliseconds DESC;


/* Question Set 3*/

/* Q1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent */

WITH best_selling_artist AS (
	SELECT TOP 1 [dbo].[artist].artist_id, [dbo].[artist].artist_name, SUM([dbo].[Music-invoice_line].unit_price * [dbo].[Music-invoice_line].quantity) AS total_sales
	FROM [dbo].[Music-invoice_line]
	JOIN [dbo].[Music-track] ON [dbo].[Music-track].track_id = [dbo].[Music-invoice_line].track_id
	JOIN [dbo].[album] ON [dbo].[album].album_id = [dbo].[Music-track].album_id
	JOIN [dbo].[artist] ON [dbo].[artist].artist_id = [dbo].[album].artist_id
	GROUP BY [dbo].[artist].artist_id, [dbo].[artist].artist_name
	ORDER BY total_sales DESC
)
SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name, SUM(il.unit_price * il.quantity) AS amount_spent
FROM [dbo].[Music-invoice] i
JOIN [dbo].[Music-customer] c ON c.customer_id = i.customer_id
JOIN [dbo].[Music-invoice_line] il ON il.invoice_id = i.invoice_id
JOIN [dbo].[Music-track] t ON t.track_id = il.track_id
JOIN [dbo].[album] alb ON alb.album_id = t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, bsa.artist_name
ORDER BY amount_spent DESC;


/* Q2: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres. */

WITH popular_genre AS 
(
    SELECT 
        COUNT([dbo].[Music-invoice_line].quantity) AS purchases, 
        [dbo].[Music-customer].country, 
        [dbo].[Music-genre].name AS genre_name, 
        [dbo].[Music-genre].genre_id, 
        ROW_NUMBER() OVER(PARTITION BY [dbo].[Music-customer].country ORDER BY COUNT([dbo].[Music-invoice_line].quantity) DESC) AS RowNo 
    FROM [dbo].[Music-invoice_line] 
    JOIN [dbo].[Music-invoice] ON [dbo].[Music-invoice].invoice_id = [dbo].[Music-invoice_line].invoice_id
    JOIN [dbo].[Music-customer] ON [dbo].[Music-customer].customer_id = [dbo].[Music-invoice].customer_id
    JOIN [dbo].[Music-track] ON [dbo].[Music-track].track_id = [dbo].[Music-invoice_line].track_id
    JOIN [dbo].[Music-genre] ON [dbo].[Music-genre].genre_id = [dbo].[Music-track].genre_id
    GROUP BY [dbo].[Music-customer].country, [dbo].[Music-genre].name, [dbo].[Music-genre].genre_id
)
SELECT * 
FROM popular_genre 
WHERE RowNo <= 1
ORDER BY country ASC, purchases DESC;

/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

WITH Customer_with_country AS (
    SELECT 
        [dbo].[Music-customer].customer_id,
        first_name,
        last_name,
        billing_country,
        SUM(total) AS total_spending,
        ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY SUM(total) DESC) AS RowNo 
    FROM [dbo].[Music-invoice]
    JOIN [dbo].[Music-customer] ON [dbo].[Music-customer].customer_id = [dbo].[Music-invoice].customer_id
    GROUP BY [dbo].[Music-customer].customer_id, first_name, last_name, billing_country
)
SELECT * 
FROM Customer_with_country 
WHERE RowNo <= 1
ORDER BY billing_country ASC, total_spending DESC;
