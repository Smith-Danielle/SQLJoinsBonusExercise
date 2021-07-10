-- What is the total revenue from on sale products sold? 
/*SELECT P.OnSale AS Sale, SUM(S.Quantity * S.PricePerUnit) AS Revenue
FROM bestbuy.products AS P INNER JOIN bestbuy.sales AS S
ON P.ProductID = S.ProductID
WHERE P.OnSale = 1
GROUP BY P.OnSale;*/

-- What is the total revenue from games? *
/*SELECT C.Name AS Category, SUM(S.Quantity * S.PricePerUnit) AS Revenue
FROM bestbuy.sales AS S INNER JOIN bestbuy.products AS P
ON S.ProductID = P.ProductID
INNER JOIN bestbuy.categories AS C
ON P.CategoryID = C.CategoryID
WHERE C.Name = 'Games'
GROUP BY C.Name;*/

-- What is the total quantity of games sold? *
/*SELECT C.Name AS Category, SUM(S.Quantity) AS TotalSold
FROM bestbuy.sales AS S INNER JOIN bestbuy.products AS P
ON S.ProductID = P.ProductID
INNER JOIN bestbuy.categories AS C
ON P.CategoryID = C.CategoryID
WHERE C.Name = 'Games'
GROUP BY C.Name;*/

-- How many products have no sales? *
/*SELECT P.Name AS Product, S.Quantity AS QuantitySold
FROM bestbuy.products AS P LEFT JOIN bestbuy.sales AS S
ON P.ProductID = S.ProductID
WHERE S.Quantity IS NULL;*/

-- What is the average rating for game reviews? 
-- No game reviews
/*SELECT AVG(R.Rating) AS AvgRating, C.Name AS Category
FROM bestbuy.reviews AS R INNER JOIN bestbuy.products AS P
ON R.ProductID = P.ProductID 
INNER JOIN bestbuy.categories AS C
ON P.CategoryID = C.CategoryID
WHERE C.Name = 'Game'
GROUP BY R.Rating;*/

-- Which category has the 2nd most sales (by quantity)? 
/*SELECT C.Name AS Category, SUM(S.Quantity) AS QuantitySold
FROM bestbuy.sales AS S INNER JOIN bestbuy.products AS P
ON S.ProductID = P.ProductID
INNER JOIN bestbuy.categories AS C
ON P.CategoryID = C.CategoryID
GROUP BY C.Name
ORDER BY QuantitySold DESC
LIMIT 1, 1;*/

-- How many unique products were sold during 2015 with a price greater than 50? *
/*SELECT P.Name AS Products, SUM(S.Quantity) AS Quantity
FROM bestbuy.products AS P INNER JOIN bestbuy.sales AS S
ON P.ProductID = S.ProductID
WHERE S.Date >= '2015-01-01' AND S.Date <= '2015-12-31' AND S.PricePerUnit > 50
GROUP BY P.Name;*/

-- Which department has the lowest revenue? *
/*SELECT D.Name AS Department, SUM(S.Quantity * S.PricePerUnit) AS Revenue
FROM bestbuy.departments AS D INNER JOIN bestbuy.categories AS C
ON D.DepartmentID = C.DepartmentID INNER JOIN bestbuy.products AS P
ON C.CategoryID = P.CategoryID INNER JOIN bestbuy.sales AS S
ON P.ProductID = S.ProductID
GROUP BY D.Name
ORDER BY Revenue
LIMIT 1;*/

-- What is the first name of the employee with the most sales of small electronics (by revenue)?
/*SELECT E.FirstName AS FirstName, SUM(S.Quantity * S.PricePerUnit) AS Revenue, D.Name AS Department
FROM bestbuy.employees AS E INNER JOIN bestbuy.sales AS S
ON E.EmployeeID = S.EmployeeID INNER JOIN bestbuy.products AS P
ON S.ProductID = P.ProductID INNER JOIN bestbuy.categories AS C
ON P.CategoryID = C.CategoryID INNER JOIN bestbuy.departments AS D
WHERE D.Name = 'Small Electronics'
GROUP BY E.FirstName
ORDER BY Revenue DESC
LIMIT 1;*/
