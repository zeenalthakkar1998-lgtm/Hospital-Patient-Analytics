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