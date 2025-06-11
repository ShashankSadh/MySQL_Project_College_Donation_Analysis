Create database Donation;
use Donation;
show tables;
Select * from gift;
Select * from college;

-- Total Gift Amounts by College City

SELECT 
    c.City, SUM(g.Gift_Amount) AS Total_Gift_Amount
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
GROUP BY c.City;

-- Average Gift Amount by College

SELECT 
    c.College, AVG(g.Gift_Amount) AS Average_Gift_Amount
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
GROUP BY c.College;


-- Number of Gifts and Total Amount by Allocation Subcategory

SELECT 
    g.Allocation_Subcategory,
    COUNT(*) AS Number_of_Gifts,
    SUM(g.Gift_Amount) AS Total_Gift_Amount
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
GROUP BY g.Allocation_Subcategory;


-- Gifts and Their Corresponding College City

SELECT 
    g.Gift_Date, g.Gift_Amount, c.City
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
ORDER BY g.Gift_Date;


-- Gifts and Colleges with Specific Major

SELECT 
    g.Major, c.College, SUM(g.Gift_Amount) AS Total_Gift_Amount
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    g.Major = 'Psychology'
GROUP BY g.Major , c.College;


-- Total Gifts and College City for Specific Year of Graduation

SELECT 
    c.Year_of_Graduation,
    c.City,
    SUM(g.Gift_Amount) AS Total_Gift_Amount
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    c.Year_of_Graduation = 2010
GROUP BY c.Year_of_Graduation , c.City;

-- Find the total amount of scholarships given to each college:

SELECT 
    c.College, SUM(g.Gift_Amount) AS Total_Scholarships
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    g.Gift_Allocation = 'Scholarship'
GROUP BY c.College;


-- Get the average amount of endowment gifts received by each college:

SELECT 
    c.College, AVG(g.Gift_Amount) AS Avg_Endowment
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    g.Gift_Allocation = 'Endowment'
GROUP BY c.College;

-- List all gifts made to the College of Engineering, along with the city and year of graduation of each prospect:

SELECT 
    g.Gift_Amount, g.Gift_Date, c.City, c.Year_of_Graduation
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    c.College = 'College of Engineering';

-- Find the total amount of campus resource gifts for each college:

SELECT 
    c.College, SUM(g.Gift_Amount) AS Total_Campus_Resource
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    g.Gift_Allocation = 'Campus Resource'
GROUP BY c.College;

-- Get the list of colleges that received endowment gifts in 2010:

SELECT DISTINCT
    c.College
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    g.Gift_Allocation = 'Endowment'
        AND g.Gift_Date LIKE '2010%';

-- Find the maximum scholarship amount received by each college:

SELECT 
    c.College, MAX(g.Gift_Amount) AS Max_Scholarship
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    g.Gift_Allocation = 'Scholarship'
GROUP BY c.College;


-- List the total gift amount for each college based on gift type:

SELECT 
    c.College,
    g.Gift_Allocation,
    SUM(g.Gift_Amount) AS Total_Amount
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
GROUP BY c.College , g.Gift_Allocation;


-- Retrieve the gifts given by alumni (Prospect_IDs from the college table with 'College of Business'):

SELECT 
    g.Gift_Amount, g.Gift_Date, g.Allocation_Subcategory
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    c.College = 'College of Business';


-- Find the number of scholarships given by year for the College of Arts and Sciences:

SELECT 
    EXTRACT(YEAR FROM TO_DATE(g.Gift_Date, 'DD-MM-YYYY')) AS Year,
    COUNT(*) AS Num_Scholarships
FROM
    gift g
        JOIN
    college c ON g.Prospect_ID = c.Prospect_ID
WHERE
    c.College = 'College of Arts and Sciences'
        AND g.Gift_Allocation = 'Scholarship'
GROUP BY EXTRACT(YEAR FROM TO_DATE(g.Gift_Date, 'DD-MM-YYYY'));

