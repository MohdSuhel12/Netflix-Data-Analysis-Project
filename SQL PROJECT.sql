create database netflix_db;
use netflix_db;
show tables;
Select * from netflix_customers;
Select count(*) from netflix_customers;
Select count(*) as Active_customers from netflix_customers where account_status='Active';
Select Subscription_plan,count(*) as customers from netflix_customers group by Subscription_plan order by customers desc;
Select Subscription_plan,sum(customer_Revenue) as Revenue from netflix_customers group by Subscription_plan order by Revenue desc;
Select Genre,count(*) as Views from netflix_customers group by Genre order by Views desc;
Select Country,count(*) as Customers from netflix_customers group by Country order by Customers desc;
Select Device,count(*) as Users from netflix_customers group by Device order by Users desc;
Select Subscription_plan,Round(AVG(Watch_Hours),2) As Avg_Watch_Hours from netflix_customers group by Subscription_plan;
Select Customer_Name,Customer_Revenue from netflix_customers order by Customer_Revenue DESC Limit 10;
Select Content_Type,count(*) As Total from  netflix_customers group by Content_Type;
SELECT TRIM(Content_Type) AS Content_Type,
       COUNT(*) AS Total
FROM netflix_customers
GROUP BY TRIM(Content_Type);
UPDATE netflix_customers
SET Content_Type = TRIM(Content_Type);
SELECT DISTINCT Content_Type
FROM netflix_customers;
UPDATE netflix_customers
SET Content_Type = TRIM(
    REPLACE(Content_Type, CHAR(160), ' ')
);
UPDATE netflix_customers
SET Content_Type = TRIM(
    REPLACE(
        REPLACE(Content_Type, CHAR(160), ' '),
        CHAR(9), ' '
    )
);
SET SQL_SAFE_UPDATES = 0;
UPDATE netflix_customers
SET Content_Type = TRIM(
    REPLACE(Content_Type, CHAR(160), ' ')
);
SELECT
    Content_Type,
    HEX(Content_Type) AS Hex_Value
FROM netflix_customers;
SELECT
    TRIM(
        BOTH ' ' FROM
        REPLACE(
            REPLACE(Content_Type, CHAR(160), ' '),
            CHAR(9), ' '
        )
    ) AS Content_Type,
    COUNT(*) AS Total
FROM netflix_customers
GROUP BY 1;
SELECT
    TRIM(Content_Type) AS Content_Type,
    COUNT(*) AS Total
FROM netflix_customers
GROUP BY TRIM(Content_Type);
SELECT
    TRIM(Content_Type) AS Content_Type,
    COUNT(*) AS Total,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_customers),
        2
    ) AS Percentage
FROM netflix_customers
GROUP BY TRIM(Content_Type);
SELECT
    TRIM(Content_Type) AS Content_Type,
    COUNT(*) AS Total
FROM netflix_customers
GROUP BY TRIM(Content_Type)
ORDER BY Total DESC;
SELECT
    Genre,
    COUNT(*) AS Total_Content
FROM netflix_customers
GROUP BY Genre
ORDER BY Total_Content DESC;
SELECT
    Genre,
    ROUND(AVG(Avg_Rating),2) AS Avg_Rating
FROM netflix_customers
GROUP BY Genre
ORDER BY Avg_Rating DESC;
Select Account_Status,Count(*) As Customers from netflix_customers group by Account_Status;
