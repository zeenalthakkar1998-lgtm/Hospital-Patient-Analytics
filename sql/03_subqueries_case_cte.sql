-- ============================================
-- SUBQUERIES
-- ============================================
-- Example 1: Patients older than the average age

SELECT
    patient_name,
    age
FROM Patients
WHERE age >
(
    SELECT AVG(age)
    FROM Patients
); 
--What we do is, the required value after "Age >" is replaced by the query that will give that value as an output 

--First find one piece of information
           ↓
--Use that information in another query

-- ============================================
-- SUBQUERIES
-- ============================================

-- Pattern 1: Subquery returning a single value

SELECT patient_name, age
FROM Patients
WHERE age >
(
    SELECT AVG(age)
    FROM Patients
);

------------------------------------------------

-- Pattern 2: Subquery returning multiple values

SELECT *
FROM Patients
WHERE patient_id IN
(
    SELECT patient_id
    FROM Appointments
);

-- Pattern 3: NOT IN

SELECT *
FROM Patients
WHERE patient_id NOT IN
(
    SELECT patient_id
    FROM Appointments
);

------------------------------------------------

-- Same problem solved using LEFT JOIN

SELECT *
FROM Patients
LEFT JOIN Appointments
ON Patients.patient_id = Appointments.patient_id
WHERE Appointments.appointment_id IS NULL;

--"Show all patients older than the average patient age."
SELECT * FROM Patients WHERE Age>(SELECT AVG(Age) FROM Patients)

--"Show the patient name and appointment ID."
SELECT Patients.patient_name, Appointments.appointment_id FROM Patients INNER JOIN Appointments ON patients.patient_id=Appointments.patient_id 

-- ============================================
-- CASE
-- ============================================

-- CASE is SQL's version of an IF-ELSE statement.
-- It is used to create a new column in the query result based on one or more conditions.

-- IMPORTANT:
-- CASE does NOT create a new column in the actual table.
-- The new column exists only in the output of the query.

-- Think of CASE like this:
--
-- IF condition 1
--     THEN result 1
-- ELSE IF condition 2
--     THEN result 2
-- ELSE
--     result 3
--
-- SQL converts this into:
--
-- CASE
--     WHEN condition1 THEN result1
--     WHEN condition2 THEN result2
--     ELSE result3
-- END

-- General Syntax:

-- SELECT column_name,
-- CASE
--     WHEN condition1 THEN result1
--     WHEN condition2 THEN result2
--     ELSE result3
-- END AS new_column_name
-- FROM table_name;

SELECT * FROM PATIENTS 


--"Show the patient name and classify each patient based on age."

SELECT patient_name,
CASE 
	WHEN Age<35 THEN 'Young'
	WHEN Age>35 AND Age<46 THEN 'ADULT'
	ELSE 'Senior'
	END AS Age_category
FROM Patients;

--"Classify patients based on age priority."

SELECT patient_name, age,
CASE 
	WHEN Age<35 THEN 'YOUNG'
	WHEN Age>=35 AND Age<=45 THEN 'ADULT'
	ELSE 'SENIOR'
	END AS patient_priority
FROM Patients

SELECT *,
CASE 
	WHEN appointment_id<5003 THEN 'Old Appointment'
	WHEN appointment_id>=5003 THEN 'Recent Appointment'
	END AS Appointments_listing
FROM Appointments

--"Give patient age and name, with name of the doctor and categorize patients acc. to age, WHERE less than 30 is young, 30-50 is adult and above 50 is senior"
--(will have to use JOIN and CASE both)

SELECT patients.patient_name, patients.age, Doctors.doctor_name, 
CASE 
	WHEN Patients.age<30 THEN 'Young'
	WHEN Patients.age>=30 AND Patients.age<=50 THEN 'Adult'
	ELSE 'Senior'
	END AS Age_category
FROM Appointments INNER JOIN Patients ON Patients.patient_id=Appointments.patient_id INNER JOIN Doctors ON Doctors.doctor_id=Appointments.doctor_id

-- ============================================
-- CASE + JOIN
-- ============================================

-- CASE can be combined with JOINs to create
-- dynamic reports from multiple tables.

-- The CASE statement is written inside the
-- SELECT clause.

-- General Pattern:

SELECT
    column1,
    column2,

    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE result3
    END AS new_column

FROM table1
INNER JOIN table2
ON table1.id = table2.id;

-- ============================================
-- CTE (COMMON TABLE EXPRESSION)
-- ============================================

-- A CTE creates a temporary named result from a query,
-- which can then be used by another query.

-- A CTE does NOT create a permanent table in the database.
-- It exists only while that SQL statement is being executed.

-- Think:
-- Original Table
--      ↓
-- Run a query
--      ↓
-- Give the result a temporary name (CTE)
--      ↓
-- Run another query using that CTE


-- ============================================
-- BASIC CTE SYNTAX
-- ============================================

WITH CTE_Name AS
(
    SELECT columns
    FROM table_name
    WHERE condition
)

SELECT *
FROM CTE_Name;


-- ============================================
-- EXAMPLE 1: SIMPLE CTE
-- ============================================

-- Create a CTE containing patients older than 40.

WITH Older_Patients AS
(
    SELECT *
    FROM Patients
    WHERE age > 40
)

SELECT *
FROM Older_Patients;


-- IMPORTANT:
-- Only the query that DEFINES the CTE goes inside parentheses.
-- The main query that USES the CTE does not need parentheses.


-- ============================================
-- EXAMPLE 2: FILTERING A CTE
-- ============================================

-- First select patients aged 30 or above.
-- Then, from that result, show only patients younger than 50.

WITH Adult_Patients AS
(
    SELECT *
    FROM Patients
    WHERE age >= 30
)

SELECT *
FROM Adult_Patients
WHERE age < 50;


-- Mental model:
-- Patients
--      ↓
-- CTE filters age >= 30
--      ↓
-- Adult_Patients
--      ↓
-- Main query filters age < 50
--      ↓
-- Final Result


-- ============================================
-- EXAMPLE 3: CTE + JOIN
-- ============================================

-- First create a CTE containing patients aged 30 or above.
-- Then show those patients along with their appointment IDs.

WITH Older_Patients AS
(
    SELECT *
    FROM Patients
    WHERE age >= 30
)

SELECT
    Older_Patients.patient_name,
    Older_Patients.age,
    Appointments.appointment_id
FROM Older_Patients
INNER JOIN Appointments
    ON Appointments.patient_id = Older_Patients.patient_id;


-- IMPORTANT:
-- Once the CTE is created, the main query can use the CTE
-- like a table.

-- Instead of:
-- FROM Patients

-- We can use:
-- FROM Older_Patients


-- ============================================
-- CTE + AGGREGATE FUNCTIONS
-- ============================================

-- CTEs can also contain calculations such as:
-- COUNT(), AVG(), SUM(), MIN(), MAX(), GROUP BY, etc.

-- Example:
-- Count the number of appointments for each patient,
-- then show only patients with more than one appointment.

WITH Appointment_Counts AS
(
    SELECT
        patient_id,
        COUNT(appointment_id) AS appointment_count
    FROM Appointments
    GROUP BY patient_id
)

SELECT *
FROM Appointment_Counts
WHERE appointment_count > 1;


-- ============================================
-- KEY CTE RULES
-- ============================================

-- 1. WITH starts the CTE.
-- 2. Give the CTE a meaningful name.
-- 3. AS is followed by the query inside parentheses.
-- 4. The CTE produces a temporary NAMED RESULT, not a permanent table.
-- 5. The main query can query or JOIN that named result.
-- 6. The CTE exists only for the SQL statement that immediately follows it.
-- 7. CTEs are useful for breaking complicated queries into smaller,
--    easier-to-read steps.

-- Simple way to remember:
-- CTE = Create a temporary named result → then query that result.

--Show the names of patients who have more than one appointment, along with their appointment count.

WITH Appointments_counts AS
(SELECT patient_id, COUNT (appointment_id) AS Appointment_count FROM Appointments GROUP BY patient_id)
SELECT Appointments_counts.patient_id, Patients.patient_name, Appointment_count FROM Appointments_counts INNER JOIN Patients ON patients.patient_id=Appointments_counts.patient_id WHERE Appointment_count>1 

--Create a CTE called Senior_Patients containing patients older than 45. Then use the CTE to display only their patient_name and age.
WITH Senior_patients AS
(SELECT * FROM patients WHERE Age>45)
SELECT patient_name, age FROM Senior_patients
