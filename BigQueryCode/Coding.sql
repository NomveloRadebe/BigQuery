SELECT * FROM `practical-3-retail-sales.practical_retailsales.Data` LIMIT 1000;

--Question 01
SELECT *
FROM `practical-3-retail-sales.practical_retailsales.Data`
WHERE Date BETWEEN '2023-01-01' AND '2023-12-31';

--Question 02
SELECT *
FROM `practical-3-retail-sales.practical_retailsales.Data`
WHERE `Total Amount` > (
    SELECT ROUND(AVG(`Total Amount`), 1)
    FROM `practical-3-retail-sales.practical_retailsales.Data`
);

--Question 3
SELECT SUM(`Total Amount`) AS total_revenue
FROM `practical-3-retail-sales.practical_retailsales.Data`

--Question 04
SELECT DISTINCT(`Product Category`) 
FROM `practical-3-retail-sales.practical_retailsales.Data`

--Question 05
SELECT 
  `Product Category`,
  SUM(Quantity) AS `total_quantity_sold`
FROM `practical-3-retail-sales.practical_retailsales.Data`
GROUP BY `Product Category`
ORDER BY `total_quantity_sold` DESC;

--Question 06
SELECT `Customer ID`, Age,
CASE 
WHEN Age <30 THEN 'Youth'
WHEN Age BETWEEN 30 and 59 THEN 'Adult'
WHEN Age>= 60 THEN'Senior'
END AS `Age Group`
FROM `practical-3-retail-sales.practical_retailsales.Data`;

--Question 07
SELECT Gender,
      COUNT (`Transaction ID`) AS TOTAL_QUANTITY
FROM `practical-3-retail-sales.practical_retailsales.Data`
WHERE `Total Amount` > 500
GROUP BY Gender;

--Question 08
SELECT `Product Category`,
      SUM (`Total Amount`) AS Total_Revenue
FROM `practical-3-retail-sales.practical_retailsales.Data`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;


--Question 09
SELECT `Transaction ID`, `Price per unit`,
CASE
  WHEN `Price per Unit`< 50 THEN 'Cheap'
   WHEN `Price per Unit`BETWEEN 50 AND 200 THEN 'Moderate'
   WHEN `Price per Unit`> 200 THEN 'Expensive' 
   END AS ` Unit Cost Category`
   FROM `practical-3-retail-sales.practical_retailsales.Data`;

   --Question 10 
   SELECT `Customer ID`, Age, `Total Amount`,
CASE
  WHEN `Total Amount` >1000 THEN 'High'
  ELSE 'Low'
  END AS Spending_Level
  FROM `bright-tv-493010.Retail.retail_sales`
  WHERE Age >=40;
