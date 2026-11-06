SELECT TOP (1000) [EmpID]
      ,[Age]
      ,[AgeGroup]
      ,[Attrition]
      ,[BusinessTravel]
      ,[DailyRate]
      ,[Department]
      ,[DistanceFromHome(KM)]
      ,[Education]
      ,[EducationField]
      ,[EmployeeCount]
      ,[EmployeeNumber]
      ,[EnvironmentSatisfaction]
      ,[Gender]
      ,[JobInvolvement]
      ,[JobLevel]
      ,[JobRole]
      ,[JobSatisfaction]
      ,[MaritalStatus]
      ,[MonthlyIncome]
      ,[SalarySlab]
      ,[HourlyRate]
      ,[NumCompaniesWorked]
      ,[Over18]
      ,[OverTime]
      ,[SalaryHike %]
      ,[PerformanceRating]
      ,[RelationshipSatisfaction]
      ,[StandardWorkingHours]
      ,[StockOptionLevel]
      ,[TotalExperience(Years)]
      ,[TrainingsLastYear]
      ,[WorkLifeBalance]
      ,[YearsatCompany]
      ,[YearsinCurrentRole]
      ,[YearsSincePromotion]
      ,[YearsWithCurrManager]
  FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
  1)---Total Employess...
  Select count(*)as Total_Employees
   FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
---used COUNT(*) to count all employee records in the HR Analytics table and determine the total number of employees.

2)---Total Employees by Attrition..
Select Attrition, count(*)as Employee_count
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
group by Attrition;
--Yes -> Employee left the company
--No -> Employee stayed with the company
--I used GROUP BY Attrition to separate employees into Yes and No categories 
--COUNT(*) to calculate the number of employees in each category.

3)---Attrition Rate of Employees...
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
        / COUNT(*),
        2
    ) AS Attrition_Rate
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$'];
--Attrition = 'Yes' -> identifies employees who left.
--SUM(CASE WHEN) -> counts those employees.
--COUNT(*) -> counts all employees.
--* 100 -> converts it into a percentage.
--ROUND(, 2) -> keeps 2 decimal places.
---calculated attrition rate by dividing the number of employees who left by the total employee count and multiplying it by 100.

4) --Attrition Count....
Select count(*)as Attrition_count
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
where Attrition='Yes';
--COUNT(*) = How many
--WHERE Attrition = 'Yes' = Which employees
--used the WHERE clause to filter employees who left the organization and COUNT(*) to calculate the total attrition count.

5) ---Department-wise Employee Count...
Select Department,count(*)as Employee_count
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
group by Department
order by Employee_count desc;
--used GROUP BY Department to calculate department-wise employee count 
-- ORDER BY DESC to identify departments with the highest number of employees.
--Desc -> highest -> Lowest
--Asc -> Lowest -> highest

6)---Department-wise attrition....
Select Department,count(*)as Total_Employees,
sum(case when attrition = 'Yes' then 1 else 0 end) as attrition_count,
round
     (100.0*sum(case when attrition = 'yes' then 1 else 0 end )/count(*),2
     )as Attrition_Rate
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
group by Department
order by Attrition_Rate desc;
--SUM = Counts employees who left
--GROUP BY Department =	Performs the calculation separately for each department.
--ORDER BY Attrition_Rate DESC = Shows highest attrition rate first.

7)---Attrition by Age Group...
select AgeGroup,count(*)as Total_Employees,
sum(case when Attrition = 'Yes' then 1 else 0 end)as Attirtion_Rate
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
group by AgeGroup
order by AgeGroup;
--GROUP BY AgeGroup ->	Creates a separate group for each age group
---ORDER BY AgeGroup ->	Sorts the age groups in ascending order
--Group employees by age group, count the total employees and count how many employees left in each age group.
--1 =  employee left
--0 =  employee stayed

8) --Gender-wise Attrition...
SELECT 
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Attrition_Rate
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
GROUP BY Gender
ORDER BY Attrition_Rate DESC;
--Attrition Rate = Attrition Count ÷ Total Employees × 100
--gender-wise attrition analysis to compare employee turnover across genders using total employee count, 
--attrition count, and attrition rate.

9)---Overtime-wise Attrition
SELECT 
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Attrition_Rate
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;
--Yes -> doing overtime
--No -> not doing overtime
--Analyzed Attrition based on overtime on who work overtime and who don't..

10)---Salary wise Attriton..
SELECT 
    SalarySlab,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Attrition_Rate
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
GROUP BY SalarySlab
ORDER BY Attrition_Rate DESC;
--performed salary-wise attrition analysis to identify whether employee turnover varies across different salary groups.
--calculated total employees, attrition count, and attrition rate for each salary slab.
--Attrition Count = Number of employees who left the company.
--Attrition Rate = Percentage of employees who left compared with the total employees.
--Count = Number
--Rate = Percentage

11)--Education wise Attrition
SELECT 
    EducationField,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Attrition_Rate
FROM [dataanalystcourse].[dbo].['HR_Analytics-4$']
GROUP BY EducationField
ORDER BY Attrition_Rate DESC;
--analyzed Education Field on attrition count and Attrition Rate ..





