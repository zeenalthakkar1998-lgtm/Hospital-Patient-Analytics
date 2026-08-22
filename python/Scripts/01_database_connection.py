# sqlite3 allows Python to connect to and work with SQLite databases.
from ast import For
import sqlite3
connection = sqlite3.connect("database/Joins_sql.db")
print ("database connected successfully")
cursor= connection.cursor()
cursor.execute('SELECT * FROM Patients')
patients = cursor.fetchall()

for patient in patients: 
    print (f"Patient Name: {patient[1]}, Age: {patient[2]}")

    if patient[2]>20 and patient[2]<30:
        print('above 20')
    elif patient[2]>50:
        print('above 50)')
    else:
        print ('Normal age')
