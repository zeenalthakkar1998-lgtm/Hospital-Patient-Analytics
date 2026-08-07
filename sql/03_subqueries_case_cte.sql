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