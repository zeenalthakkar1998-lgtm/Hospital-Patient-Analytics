--count total patient records
SELECT COUNT(*) FROM healthcare_dataset;

-- Display patient names
SELECT Name FROM healthcare_dataset;

-- Display patient names and ages
SELECT Name, Age FROM healthcare_dataset;

-- Display all columns
SELECT * FROM healthcare_dataset;

-- Count number of patients suffering from Asthma 
SELECT Count(*) FROM healthcare_dataset WHERE `Medical Condition`='Asthma';

--Enlist name and age of female patients 
SELECT Name, Age FROM healthcare_dataset WHERE Gender='Female';

--Get me information about female patients suffering from cancer
SELECT * FROM healthcare_dataset WHERE Gender='Female' AND `Medical Condition`='Cancer';

--Name and blood type of females suffering from diabetes
SELECT Name, `Blood type` FROM healthcare_dataset WHERE Gender='Female' AND `Medical condition`='Diabetes';

--Age of the male patients having obesity
SELECT Age FROM healthcare_dataset WHERE Gender='Male' AND `Medical condition`='Obesity';

--Find female patients older than 40
SELECT * FROM healthcare_dataset WHERE Gender='Female' AND Age>40;

-- =========================================================
-- TOPIC : OR and ORDER BY
-- =========================================================

/*
OR Operator
-----------
The OR operator returns rows if at least ONE condition is TRUE.

Syntax:
SELECT *
FROM table_name
WHERE condition1
   OR condition2;

Example:
Display patients suffering from Diabetes or Cancer.
*/

SELECT *
FROM healthcare_dataset
WHERE `Medical Condition` = 'Diabetes'
   OR `Medical Condition` = 'Cancer';


/*
Important:
When AND and OR are used together,
SQL evaluates AND before OR.

Use parentheses () to make your intended logic clear.

Example:
WHERE Gender = 'Female'
  AND (
        `Medical Condition` = 'Diabetes'
        OR `Medical Condition` = 'Cancer'
      );
*/


/*
ORDER BY
---------
Used to sort records.

ASC  -> Ascending (Smallest to Largest, A to Z)
DESC -> Descending (Largest to Smallest, Z to A)

Examples:
*/

-- Oldest to Youngest
SELECT *
FROM healthcare_dataset
ORDER BY Age DESC;

-- Youngest to Oldest
SELECT *
FROM healthcare_dataset
ORDER BY Age ASC;

-- Sort by Gender, then by Age (oldest first within each Gender)
SELECT *
FROM healthcare_dataset
ORDER BY Gender ASC,
         Age DESC;
		 
-- Display only first 10 patients 
SELECT * FROM healthcare_dataset LIMIT 10;

--Display only first five patients Name
SELECT Name FROM healthcare_dataset LIMIT 5;

--Find the 5 oldest patients
SELECT * FROM healthcare_dataset ORDER BY AGE DESC LIMIT 5

--Show 10 youngest patients 
SELECT Name,  Age FROM healthcare_dataset ORDER BY Age ASC LIMIT 10

--Display the first five patients who have diabetes 
SELECT * FROM healthcare_dataset WHERE `Medical condition`='Diabetes' LIMIT 5

--Name and Age of 10youngest female patients 
SELECT Name, Age FROM healthcare_dataset WHERE Gender='Female' ORDER BY Age ASC LIMIT 10

--Show me the first 3 patients with cancer, sorted from oldest to  youngest
SELECT * FROM healthcare_dataset WHERE `Medical condition`='Cancer' ORDER BY Age DESC LIMIT 3

/*Distinct 
Used to retrieve unique value from the columns
SELECT DISTINCT Column FROM database 
*/

--How many different blood groups do we have in our patient database 
SELECT DISTINCT `Blood type` FROM healthcare_dataset

--Display all unique medical conditions
SELECT DISTINCT `Medical Condition` FROM healthcare_dataset

--Display all unique insurance providers 
SELECT DISTINCT `Insurance Provider` FROM healthcare_dataset

--List of insurance providers in alphabetical order  
SELECT DISTINCT `Insurance Provider` FROM healthcare_dataset ORDER BY `Insurance Provider`

--Which insurance provider have diabetic patients 
SELECT DISTINCT `Insurance Provider` FROM healthcare_dataset WHERE `Medical Condition`='Diabetes'

--Dispplay all unique hospitals that treated cancer 
SELECT DISTINCT Hospital FROM healthcare_dataset WHERE `Medical Condition`='Cancer'
