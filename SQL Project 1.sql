--                     ***************************************
-- 						   🥰🥳	 WELCOME TO Project 1   🥳🥰
-- 					   ***************************************

/*1. Create new schema as ecommerce*/

CREATE DATABASE ecommerce;



/*2. Import .csv file users_data into MySQL
(right click on ecommerce schema -> Table Data import Wizard -> Give path of the file -> Next -> choose options : Create a new table , select delete if exist -> next -> next)

users_data.csv file succesfully imported in ecommerce Schema
*/


/*3. Run SQL command to see the structure of table*/

USE ecommerce;

DESC users_data;

SELECT 
    *
FROM
    users_data;



/* 4. Run SQL command to select first 100 rows of the database */

SELECT 
    *
FROM
    users_data
LIMIT 100;



/* 5. How many distinct values exist in table for field country and language */

SELECT 
    COUNT(DISTINCT country) Country,
    COUNT(DISTINCT language) Language
FROM
    users_data;




/* 6. Check whether male users are having maximum followers or female users. */

SELECT 
    gender, MAX(socialNbFollowers) Max_Followers
FROM
    users_data
GROUP BY gender;



/* 7. Calculate the total users those
a- Uses Profile Picture in their Profile
b- Uses Application for Ecommerce platform
c- Uses Android app
d- Uses ios app
*/

-- Uses Profile Picture in their Profile
SELECT COUNT(hasProfilePicture) FROM users_data WHERE hasProfilePicture = 'True';

-- Uses Application for Ecommerce platform
SELECT COUNT(*) FROM users_data WHERE hasAnyApp = 'True';

-- Uses Android app
SELECT COUNT(hasAndroidApp) FROM users_data WHERE hasAndroidApp = 'True';

-- Uses ios app
SELECT COUNT(hasIosApp) FROM users_data WHERE hasIosApp = 'True';

 


/* 8. Calculate the total number of buyers for each country and sort the result
in descending order of total number of buyers. (Hint: consider only
those users having at least 1 product bought.) */

SELECT 
    country, COUNT(productsBought)
FROM
    users_data
WHERE
    productsBought != 0
GROUP BY country
ORDER BY COUNT(productsBought) DESC;




/* 9. Calculate the total number of sellers for each country and sort the
result in ascending order of total number of sellers.
(Hint: consider only those users having at least 1 product sold.) */


SELECT DISTINCT
    country, COUNT(productsSold)
FROM
    users_data
WHERE
    productsSold != 0
GROUP BY country
ORDER BY COUNT(productsSold);




/* 10. Display name of top 10 countries having maximum products pass rate. */

SELECT DISTINCT
    country, MAX(productsPassRate)
FROM
    users_data
GROUP BY country
ORDER BY MAX(productsPassRate) DESC
LIMIT 10;




/* 11. Calculate the number of users on an ecommerce platform for different
language choices. */

SELECT 
    COUNT(language), language
FROM
    users_data
GROUP BY language;




/* 12. Check the choice of female users about putting the product in a
wishlist or to like socially on an ecommerce platform.
(Hint: use UNION to answer this question.) */


SELECT 
    COUNT(productsWished)
FROM
    users_data
WHERE
    (gender = 'F' AND productsWished > 0) 
UNION SELECT 
    COUNT(socialProductsLiked)
FROM
    users_data
WHERE
    (gender = 'F' AND socialProductsLiked > 0);



 

/* 13. Check the choice of male users about being seller or buyer.
(Hint: use UNION to solve this question.) */

SELECT 
    COUNT(productsBought)
FROM
    users_data
WHERE
    (gender = 'M' AND productsBought > 0) 
UNION SELECT 
    COUNT(productsSold)
FROM
    users_data
WHERE
    (gender = 'M' AND productsSold > 0);




/* 14. Which country is having maximum number of buyers? */

SELECT 
    country, COUNT(productsBought)
FROM
    users_data
GROUP BY country
ORDER BY COUNT(productsBought) DESC;



/* 15. List the name of 10 countries having zero number of sellers. */

SELECT 
    country, SUM(productsSold) sellers
FROM
    users_data
GROUP BY country
ORDER BY SUM(productsSold)
LIMIT 10;




/* 16. Display record of top 110 users who have used ecommerce
platform recently. */


SELECT 
    *
FROM
    users_data
ORDER BY daysSinceLastLogin
LIMIT 110;




/* 17 Calculate the number of female users those who have not logged in
since last 100 days. */

SELECT 
    COUNT(gender) Female
FROM
    users_data
WHERE
    gender = 'F'
        AND daysSinceLastLogin > 100;




/* 18. Display the number of female users of each country at
ecommerce platform. */


SELECT 
    country, COUNT(gender) Female
FROM
    users_data
WHERE
    gender = 'F' AND hasAnyApp = 'True'
GROUP BY country;




/* 19. Display the number of male users of each country at
ecommerce platform. */

SELECT 
    country, COUNT(gender) Male
FROM
    users_data
WHERE
    gender = 'M' AND hasAnyApp = 'True'
GROUP BY country;



 

/* 20. Calculate the average number of products sold and bought on
ecommerce platform by male users for each country. */

SELECT 
    AVG(productsSold) Products_Sold,
    AVG(productsBought) Products_Bought
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;

--                                    🤩  Thank You  🤩 