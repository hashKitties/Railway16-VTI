USE adventureworks;

-- Excercise 1:
-- Question 1:
SELECT 
    `Name`
FROM
    product
WHERE
    ProductSubcategoryID IN (SELECT 
            ProductSubcategoryID
        FROM
            productsubcategory
        WHERE
            `Name` = 'Saddles');
            
-- Question 2:
SELECT 
    `Name`
FROM
    product
WHERE
    ProductSubcategoryID IN (SELECT 
            ProductSubcategoryID
        FROM
            productsubcategory
        WHERE
            `Name` LIKE ('Bo%'));

-- Question 3:
SELECT 
    `Name`, ListPrice, ProductSubcategoryID
FROM
    product
WHERE
    ProductSubcategoryID = 3
GROUP BY `Name`
HAVING ListPrice = (
	SELECT 
        MIN(ListPrice)
    FROM
        product
    WHERE
        ProductSubcategoryID = 3);
 
-- Excercise 2:
-- Question 1:

SELECT 
    c.`Name` AS Country, t.`Name` AS Province
FROM
    countryregion c
        JOIN
    stateprovince t ON c.CountryRegionCode = t.CountryRegionCode;

-- Question 2:
SELECT 
    c.`Name` AS Country, t.`Name` AS Province
FROM
    countryregion c
        JOIN
    stateprovince t ON c.CountryRegionCode = t.CountryRegionCode
WHERE c.`Name` IN ('Canada','Germany')
ORDER BY Country, Province;

-- Question 3:
SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    soh.SalesPersonID AS SalesPersonID,
    sp.SalesPersonID AS BusinessEntityID,
    sp.Bonus,
    sp.SalesYTD
FROM
    salesorderheader soh
        JOIN
    salesperson sp ON soh.OnlineOrderFlag = 0
        AND soh.SalesPersonID = sp.SalesPersonID;

-- Question 4:
SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    e.Title AS JobTitle,
    sp.Bonus,
    sp.SalesYTD
FROM
    salesorderheader soh
        JOIN
    salesperson sp ON soh.OnlineOrderFlag = 0
        AND soh.SalesPersonID = sp.SalesPersonID
	JOIN employee e
		ON sp.SalesPersonID = e.EmployeeID;

