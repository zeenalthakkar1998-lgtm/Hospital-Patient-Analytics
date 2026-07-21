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
