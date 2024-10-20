USE Academy2

SELECT Surname AS [Theacher's Surname], Salary, Premium, 
Premium/(Salary/100) AS [Premium/Salary Percent], 
Salary/((Salary+Premium)/100) AS [Salary/All Sum Percent]
FROM Teachers