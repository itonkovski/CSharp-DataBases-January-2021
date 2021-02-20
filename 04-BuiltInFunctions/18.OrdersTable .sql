SELECT ProductName, OrderDate,
    DATEADD(DAY, 3, OrderDate) AS [Pay Due],
    DATEADD(MONTH, 1, OrderDate) AS [Delivery Due]
    FROM Orders

--DATEADD(DAY, 1, '2017/08/25') AS DateAdd;
--DATEADD(YEAR, 1, '2017/08/25') AS DateAdd;