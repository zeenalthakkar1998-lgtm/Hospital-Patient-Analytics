# sqlite3 allows Python to connect to and work with SQLite databases.
import sqlite3
connection = sqlite3.connect("database/Joins_sql.db")
print ("database connected successfully")
cursor= connection.cursor()
cursor.execute('SELECT * FROM Patients WHERE Age>40')
patients = cursor.fetchall()

for patient in patients: 
    print (patient)

