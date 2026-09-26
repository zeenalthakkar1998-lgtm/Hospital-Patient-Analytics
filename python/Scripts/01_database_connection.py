# sqlite3 allows Python to connect to and work with SQLite databases.
from ast import For
import sqlite3
connection = sqlite3.connect("database/Joins_sql.db")
print ("database connected successfully")
cursor= connection.cursor()
cursor.execute('SELECT * FROM Patients')
patients = cursor.fetchall()


def classify_patients(patients, young_max=30, adult_max=50):
    young_adult_count= 0
    adult_count=0
    older_adult_count=0

    for patient in patients: 
        print (f"Patient Name: {patient[1]}, Age: {patient[2]}")

        if  patient[2]<=30:
            print('Young adult')
            young_adult_count += 1
        elif patient[2]<=50:
            print('Adult')
            adult_count += 1
        else:
            print ('Older adult')
            older_adult_count += 1
    return young_adult_count, adult_count, older_adult_count 

young, adult, older = classify_patients(patients)

print("Young adults:", young)
print("Adults:", adult)
print("Older adults:", older)

for patient in patients:
    print (f"Patient id: {patient[0]}, Patient name: {patient[1]}, Age:{patient[2]}")

cursor.execute ('SELECT * FROM Patients WHERE Age>30')
Patients_above_30= cursor.fetchall()

for patient in Patients_above_30:
    print (f"Patient_id:{patient[0]}, Patient_name:{patient[1]}, Age:{patient[2]}")

minimum_age = 60
maximum_age= 80
cursor.execute(
    "SELECT * FROM Patients WHERE Age > ? AND Age < ?",
    (minimum_age, maximum_age)
)

filtered_patients = cursor.fetchall()

for patient in filtered_patients:
    print(f"patient_id:{patient[0]}, patient_name:{patient[1]}, age:{patient[2]}")

def get_patients_by_age_range (minimum_age, maximum_age):
    cursor.execute(
        "SELECT * FROM Patients WHERE Age > ? AND Age < ?",
        (minimum_age, maximum_age)
    )
    patient_in_range=  cursor.fetchall()
    return patient_in_range

age_range_patients = get_patients_by_age_range(60, 80) 

for patient in age_range_patients:
    print(f"Patient_name: {patient[1]}, Age: {patient[2]}")

print(len(age_range_patients))

print (f"Number of patients in this age group:{len(age_range_patients)}")

total_age=0
for patient in age_range_patients:
    total_age +=patient[2]


if len(age_range_patients)>0:
    average_age= total_age/len(age_range_patients)
    print (f"average age of patients in this age group: {average_age}")
else:
    print("No patients in this age group to calculate average age.")