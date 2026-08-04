-- ==========================================================
-- Hospital Patient Analytics Project
-- Author   : Zeenal Kirtikumar Thakkar
-- Module   : 02 - SQL JOINS
-- Database : SQLite
-- ==========================================================

-- Topics Covered
-- □ INNER JOIN
-- □ LEFT JOIN
-- □ RIGHT JOIN
-- □ FULL OUTER JOIN (Concept)
-- □ SELF JOIN (Concept)

-- ==========================================================

--Primary key is the column that uniquely identifies in the table.
--A Foreign Key is a column that refers to the Primary Key of another table.
--FROM= Which table to start with

CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    patient_name TEXT,
    age INTEGER);
	
CREATE TABLE Doctors (
    doctor_id INTEGER PRIMARY KEY,
    doctor_name TEXT,
    specialty TEXT
);
	
CREATE TABLE Appointments (
    appointment_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    doctor_id INTEGER
);

INSERT INTO Patients (patient_id, patient_name, age)
VALUES
    (101, 'John', 45),
    (102, 'Alice', 30),
    (103, 'David', 52);
	
INSERT INTO Doctors (doctor_id, doctor_name, specialty)
VALUES
    (1, 'Dr. Shah', 'Cardiology'),
    (2, 'Dr. Patel', 'Neurology'),
    (3, 'Dr. Mehta', 'Orthopedics');
	
INSERT INTO Appointments (appointment_id, patient_id, doctor_id)
VALUES
    (5001, 101, 1),
    (5002, 102, 2),
    (5003, 103, 1),
    (5004, 101, 3);

    
/*FOR INNER JOINS:
SELECT (Whatever column you are asked to show..for example you need patient name which is in patients table, you put it like SELECT patients.patient_name)
FROM (whichever table is the connecting point for the rest.)
INNER JOIN (which table you what to connect or get information from)
ON (What is the primary key? like an id or something that connects the tables)*/

SELECT * FROM Appointments;
SELECT * FROM Appointments INNER JOIN doctors ON appointments.doctor_id=Doctors.doctor_id;
SELECT * FROM Appointments INNER JOIN doctors ON appointments.doctor_id=Doctors.doctor_id INNER JOIN Patients  ON Appointments.patient_id=Patients.patient_id;

--Tell us which patient has appointment with which doctor and what's their speciality?
SELECT patients.patient_name, doctors.doctor_name, doctors.specialty 
FROM Appointments INNER JOIN doctors ON doctors.doctor_id=Appointments.doctor_id 
INNER JOIN Patients ON patients.patient_id=Appointments.patient_id;

/*LEFT JOIN:
it says Keep every row from the left table. If there is a matching row on the right, attach it. If not, still keep the left row.

LEFT JOIN keeps every row from the table written immediately after FROM.*/

SELECT * FROM Patients LEFT JOIN Appointments ON Appointments.patient_id=Patients.patient_id

INSERT INTO Patients (patient_id, patient_name, age)
VALUES (104, 'Riya', 29);

SELECT * FROM Patients LEFT JOIN Appointments ON Patients.patient_id=appointments.patient_id

DELETE FROM Patients WHERE patient_id=5

/*Objective: Show every patient, even if they don't have an appointment.
Question:
Write a query that displays:
Patient Name
Appointment ID

Requirements:

Start from the correct table.
Use LEFT JOIN.*/

SELECT Patients.patient_name, Appointments.appointment_id FROM Patients LEFT JOIN Appointments ON Patients.patient_id=Appointments.patient_id

/*The hospital receptionist wants to see:

Patient Name
Appointment ID
Doctor ID (REMEMBER, DOCTOR ID AND APPOINTMENT ARE BOTH MENTIONED IN APPOINTMENT TABLE*/


/*"Show me every patient. If they have an appointment, also show the doctor's name."*/

SELECT * FROM Patients LEFT JOIN Appointments ON Patients.patient_id=Appointments.patient_id LEFT JOIN Doctors ON doctors.doctor_id=Appointments.doctor_id

SELECT Patients.patient_name, appointments.appointment_id FROM Patients INNER JOIN Appointments ON appointments.patient_id=patients.patient_id

SELECT * FROM Patients LEFT JOIN Appointments ON appointments.patient_id=patients.patient_id

SELECT patients.patient_name, doctors.doctor_name FROM Appointments LEFT JOIN patients ON patients.patient_id=appointments.patient_id LEFT JOIN doctors ON doctors.doctor_id=appointments.doctor_id

SELECT doctors.doctor_name, patients.patient_name FROM Doctors LEFT JOIN Appointments ON appointments.doctor_id=doctors.doctor_id LEFT JOIN Patients ON appointments.patient_id=patients.patient_id

/*IMPORTANT CONCEPT*/
/*Find patients who do not have an appointment.*/
SELECT * FROM Patients LEFT JOIN Appointments ON appointments.patient_id=Patients.patient_id WHERE Appointments.appointment_id IS NULL