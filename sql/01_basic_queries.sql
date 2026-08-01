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

/*Count 
Used to summarize data by counting how many records match the condition*/

--Count the number of all patients 
SELECT COUNT(*) FROM healthcare_dataset

--Count Diabetic patients 
SELECT COUNT(*) FROM healthcare_dataset WHERE `Medical Condition`='Diabetes'

--Count Cancer patients 
SELECT COUNT (*) FROM healthcare_dataset WHERE `Medical Condition`='Cancer'

--Count the number of patients admitted as Emergency 
SELECT COUNT (*) FROM healthcare_dataset WHERE `Admission Type`='Emergency'

/*COUNT(Column)
Example: Count the number of doctors 
SELECT COUNT('Doctor') FROM healthcare_dataset*/

SELECT COUNT ('Doctor') FROM healthcare_dataset
/*It will count the number of rows filled in Doctor column. Suppose if any row is not filled, it wont be considered in count*/

/*COUNT(DISTINCT Column)*/

--Count the number of different doctors 
SELECT DISTINCT Doctor FROM healthcare_dataset
SELECT COUNT(DISTINCT Doctor) FROM healthcare_dataset

--Count the number of distinct hospitals
SELECT COUNT(DISTINCT Hospital) FROM healthcare_dataset

--Count the number of distinct insurance provider
SELECT COUNT(DISTINCT `Insurance Provider`) FROM healthcare_dataset

/*GROUP BY
Learn how to group rows and perform
-- aggregate calculations on each group.*/

--How many patients belong to each medical condition
SELECT `Medical Condition`, COUNT(*) FROM healthcare_dataset GROUP BY `Medical condition`

--Count patients admitted under each admission types 
SELECT `Admission type`, COUNT(*) FROM healthcare_dataset GROUP BY `Admission type`

--Count patients treated in each hospital 
SELECT `Hospital`, COUNT(*) FROM healthcare_dataset GROUP BY `Hospital`

SELECT COUNT(DISTINCT `Hospital`) FROM healthcare_dataset

--Show the number of patients for each Medical Condition, sorted from highest to lowest.
SELECT `Medical Condition`, COUNT(*) FROM healthcare_dataset GROUP BY `Medical Condition` ORDER BY COUNT(*)DESC

--Show the number of patients for each Hospital, sorted from highest to lowest.
SELECT `Hospital`, COUNT(*) FROM healthcare_dataset GROUP BY `Hospital` ORDER BY COUNT(*) DESC

--Show the number of patients for each Admission Type, sorted from highest to lowest.
SELECT `Admission type`, COUNT(*) FROM healthcare_dataset GROUP BY `Admission type` ORDER BY COUNT(*) DESC

/*HAVING
--Learn how to filter grouped data using the HAVING clause.
Here, WHERE cant be used as it comes before GROUP BY and thus enters HAVING
HAVING can use COUNT but WHERE cannot*/

--Show hospitals that treated more than 20 patients.
SELECT `Hospital`, COUNT(*) FROM healthcare_dataset GROUP BY `Hospital` HAVING COUNT(*)>20

--Show medical conditions having more than 9300 patients.
SELECT `Medical condition`, COUNT(*) FROM healthcare_dataset GROUP BY `Medical Condition` HAVING COUNT(*)>9300

--Show hospitals having more than 30 patients, sorted from highest to lowest.
SELECT `Hospital`, COUNT(*) FROM healthcare_dataset GROUP BY`Hospital` HAVING COUNT(*)>30 ORDER BY COUNT(*) DESC

--Show admission types having more than 18,500 patients.
SELECT `Admission type`, COUNT(*) FROM healthcare_dataset GROUP BY `Admission type` HAVING COUNT(*)>18500

/*Mini Challange project:*/
--List 10 oldest patients 
SELECT * FROM healthcare_dataset ORDER BY `Age` DESC LIMIT 10

--Show all distinct insurance providers.
SELECT DISTINCT `Insurance provider` FROM healthcare_dataset

--Count the total number of patients.

--Count how many patients have Diabetes.
SELECT COUNT(*) FROM healthcare_dataset WHERE `Medical condition`='Diabetes'

--Show the number of patients in each Medical Condition.
SELECT `Medical condition`, COUNT(*) FROM healthcare_dataset GROUP BY `Medical Condition`

--Show only those Medical Conditions that have more than 9200 patients
SELECT `Medical condition`, COUNT (*) FROM healthcare_dataset GROUP BY `Medical condition` HAVING COUNT(*)>9200

--Show the number of patients admitted under each Admission Type, sorted from highest to lowest.
SELECT `Admission type`, COUNT(*) FROM healthcare_dataset GROUP BY `Admission type` ORDER BY COUNT(*) DESC

--List all patients who:
--have Cancer OR Diabetes
--and are older than 60
--sorted by Age from oldest to youngest.
SELECT * FROM healthcare_dataset WHERE (`Medical condition`='Cancer' OR `Medical condition`='Diabetes') AND AGE>60 ORDER BY AGE DESC

--Find the top 5 hospitals with the highest number of patients.
SELECT `Hospital`, COUNT (*) FROM healthcare_dataset GROUP BY `Hospital` ORDER BY COUNT(*) DESC LIMIT 5

--Show the top 3 Medical Conditions with the highest number of patients, but only include conditions having more than 9200 patients 
SELECT `Medical condition`, COUNT(*) FROM healthcare_dataset GROUP BY `Medical Condition` HAVING COUNT(*)>9200 ORDER BY COUNT(*) DESC LIMIT 3

/*AGGREGATE FUNCTIONS

Aggregate functions perform calculations on multiple rows and return a single value.
Common Aggregate Functions:
1. COUNT()
2. SUM()
3. AVG()
4. MAX()
5. MIN()*/

--COUNT TOTAL NUMBER OF PATIENTS 
SELECT COUNT(*) FROM healthcare_dataset

--Count only patients with diabetes 
SELECT COUNT(*) FROM healthcare_dataset WHERE `Medical condition`='Diabetes'

--Find the total billing amount of all patients.
SELECT SUM(`Billing Amount`) FROM healthcare_dataset

--Find the total billing amount of Cancer patients.
SELECT SUM(`Billing Amount`) FROM healthcare_dataset  WHERE `Medical Condition`='Cancer'

--Average age of all patients 
SELECT AVG(`Age`) FROM healthcare_dataset

--Averagee billing amount
SELECT AVG(`Billing amount`)  FROM healthcare_dataset

--Find the highest billing amount
SELECT Name,MAX(`Billing amount`) FROM healthcare_dataset

--Find total billing amount of patients with arthritiss
SELECT SUM(`Billing amount`) FROM healthcare_dataset WHERE `Medical condition`= 'Arthritis'