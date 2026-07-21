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


