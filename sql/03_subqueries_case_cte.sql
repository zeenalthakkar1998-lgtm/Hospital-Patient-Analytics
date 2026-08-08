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
