--count total patient records
SELECT COUNT(*) FROM healthcare_dataset

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
SELECT * FROM healthcare_dataset WHERE Gendder='Female' AND `Medical Condition`='Cancer';

--Name and blood type of females suffering from diabetes
SELECT Name, `Blood type` FROM healthcare_dataset WHERE Gender='Female' AND `Medical condition`='Diabetes';

--Findout age of the male patients having obesity
-SELECT Age FROM healthcare_dataset WHERE Gender='Male' AND `Medical condition`='Obesity';

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