SELECT DISTINCT LEFT(FirstName, 1)
    FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
GROUP BY LEFT(FirstName,1)
--ORDER BY LEFT(FirstName,1)

