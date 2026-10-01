# sqlite3 allows Python to connect to and work with SQLite databases.
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
        

        if patient[2] <= young_max:
            young_adult_count += 1

        elif patient[2] <= adult_max:
            adult_count += 1

        else:
            older_adult_count += 1
    return young_adult_count, adult_count, older_adult_count 

young, adult, older = classify_patients(patients)

print("Young adults:", young)
print("Adults:", adult)
print("Older adults:", older)

def get_patients_by_age_range (minimum_age, maximum_age):
    cursor.execute(
        "SELECT * FROM Patients WHERE Age > ? AND Age < ?",
        (minimum_age, maximum_age)
    )
    patient_in_range=  cursor.fetchall()
    return patient_in_range

age_range_patients = get_patients_by_age_range(20, 60) 

for patient in age_range_patients:
    print(f"Patient_name: {patient[1]}, Age: {patient[2]}")


print (f"Number of patients in this age group: {len(age_range_patients)}")

def calculate_average_age(patients):
    total_age= 0

    for patient in patients:
        total_age += patient[2]

    if len(patients) >0:
        average_age= total_age/ len(patients)
        return average_age
    else:
        return "No patients to calculate average age" 

average_age_in_range = calculate_average_age(age_range_patients)

print(f"Average age of patients in this age group: {average_age_in_range}")

oldest_age=0
oldest_patient=None
for patient in patients:
    if patient[2]>oldest_age:
        oldest_age= patient[2]
        oldest_patient=patient

print(f"Oldest patient: {oldest_patient[1]}, Age: {oldest_patient[2]}")

connection.close()
